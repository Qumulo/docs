---
title: "Deploying Cloud Native Qumulo on Azure with the Qumulo Terraform Provider"
summary: "This section explains how to deploy Cloud Native Qumulo (CNQ) on Azure by creating the persistent storage and the cluster compute and cache resources by using Terraform. It also provides recommendations for Terraform deployments and information about post-deployment actions."
permalink: /cloud-native-azure-administrator-guide/getting-started/terraform.html
sidebar: cloud_native_azure_administrator_guide_sidebar
---

For an overview of {{site.azure.cnqAzureShort}}, its prerequisites, and limits, see [How Cloud Native Qumulo Works](how-cloud-native-qumulo-works.html).

## Prerequisites {#prerequisites}
This section explains the prerequisites to deploying {{site.azure.cnqAzureShort}}.

### Qumulo Core
* **Deployment Version:** This deployment path requires Qumulo Core 7.9.2 (or higher).

  {% include tip.html content="To deploy the latest release, leave the Qumulo Core version unset. Otherwise, specify 7.9.2 (or higher)." %}

* **Metrics:** To allow your Qumulo cluster to report metrics to Qumulo, your virtual network must have outbound Internet connectivity through a [NAT gateway](https://learn.microsoft.com/en-us/azure/nat-gateway/nat-overview) or a firewall. Your cluster shares no file data during this process.

  {{site.data.alerts.important}}
  Connectivity to the following endpoints is required for a successful deployment of a Qumulo instance and quorum formation:
  <ul>
    <li><code>api.missionq.qumulo.com</code></li>
    <li><code>api.nexus.qumulo.com</code></li>
  </ul>
  {{site.data.alerts.end}}

### Azure
* **Virtual Network:** You must have an existing virtual network and subnet with the [service endpoints](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-service-endpoints-overview) `Microsoft.Storage` and `Microsoft.KeyVault` enabled on the cluster subnet. The Terraform configuration checks for both endpoints and fails before creating anything if either is missing.

  {% include important.html content="Size the subnet for one address per node, one for the Provisioner VM, one per floating IP, and the five addresses Azure reserves in every subnet." %}

* **Region:** Your region requires enough [vCPU quota](https://learn.microsoft.com/en-us/azure/quotas/per-vm-quota-requests) in the L-series VM family you select for your node count, plus quota in the Provisioner VM's family.

  {% include tip.html content="Because a quota shortage looks identical to a capacity shortage, check **Usage + quotas** before you deploy." %}

### Tools and authentication
* Install the following tools:
  * Terraform 1.11 (or higher)
  * Git CLI
  * Azure CLI

* Before you configure your Terraform environment, run the `az login` command.

  {% include note.html content="The Qumulo provider doesn't read the subscription from the Azure CLI context, so you also set the subscription ID explicitly in `terraform.tfvars`." %}

  {{site.data.alerts.important}}
  The principal that runs Terraform needs three roles:
  <ul>
    <li><b>Contributor</b> on the subscription or the target resource group</li>
    <li><b>User Access Administrator</b> on the target resource group</li>
    <li><b>Key Vault Administrator</b> on the target resource group</li>
  </ul>
  <p>Contributor alone is refused by the provider's preflight check, which needs <code>Microsoft.Authorization/roleAssignments/write</code> for the Provisioner and node identities. Key Vault Administrator supplies the Key Vault data-plane actions the provider uses to store the admin password (<code>secrets/setSecret</code>) and to register the storage accounts with the vault (<code>storageaccounts/set</code>); no management-plane role, Owner included, carries those. A custom role that combines <code>Microsoft.Authorization/roleAssignments/write</code> with the data action <code>Microsoft.KeyVault/vaults/*</code> also works.</p>
  <p><code>deletion_protection</code> (on by default) additionally needs <code>Microsoft.Authorization/locks/*</code> (<a href="https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/lock-resources">management locks</a>), and <code>floating_ip_count</code> (3 by default) needs <code>Microsoft.Network/virtualNetworks/CheckIPAddressAvailability/action</code> on the virtual network plus <code>Microsoft.Authorization/roleDefinitions/write</code> at subscription scope, because the provider creates a custom subnet-join role for the node identities.</p>
  <p>To keep the deploying principal at Contributor, pre-create the identities and pass <code>cluster_node_identity_id</code> and <code>provisioner_identity_id</code>; the provider then creates no role assignments.</p>
  {{site.data.alerts.end}}

### Working with the qumulo-terraform-azure Repository
{{site.data.alerts.note}}
Qumulo is moving {{site.cnqShort}} deployments from the downloadable Terraform bundles to the <a href="https://qumulo.github.io/terraform-provider-qumulo-cloud/">Qumulo Terraform provider</a>, and the <code>qumulo-terraform-azure</code> repository, which uses the provider, is the path this section documents. If you deployed {{site.cnqShort}} previously with the <code>azure-terraform-cnq-&lt;x.y&gt;.zip</code> provisioning scripts, the provider changes three things:
<ul>
  <li>One Terraform workspace instead of two: persistent storage and compute deploy together, with no cross-workspace remote state to configure.</li>
  <li>Nothing to download from Qumulo Nexus: no Terraform bundle, and no Qumulo Core installer to stage in a storage account.</li>
  <li>Day-2 operations are one variable change and one apply: node add and remove, capacity increases, and VM size changes need no multi-stage sequences, and cluster replacement needs no second workspace.</li>
</ul>
Existing clusters keep working and can be brought under the provider later. For more information, see the <a href="https://qumulo.github.io/terraform-provider-qumulo-cloud/import-guide/">Import Guide</a> in the Qumulo Terraform provider documentation.
{{site.data.alerts.end}}

The [qumulo-terraform-azure](https://github.com/Qumulo/qumulo-terraform-azure) repository contains Terraform configurations that let you deploy the resource group, storage accounts, managed identities, and the compute cluster, with 1 or 3&ndash;24 nodes. Together these form the {{site.cnqShort}} cluster, which has fully elastic compute and capacity.

This Terraform uses the [Qumulo Terraform provider](https://qumulo.github.io/terraform-provider-qumulo-cloud/), which greatly simplifies Terraform operations by ensuring that:
* Persistent storage and compute deploy together in a single Terraform workspace
* Node add and remove, capacity changes, and VM size changes are single-variable operations with a single `terraform apply` command

For the full list of arguments, see the [qumulo_filesystem_azure resource reference](https://qumulo.github.io/terraform-provider-qumulo-cloud/resources/qumulo_filesystem_azure/) in the Qumulo Terraform provider documentation.

### Working with the terraform apply Command
This section explains the most common scenarios that cause the `terraform init` and `terraform apply` commands to fail.

<table>
  <thead>
    <tr>
      <th>Symptom</th>
      <th>Potential Resolution</th>
    </tr>
</thead>
<tbody>
  <tr>
    <td>The <code>terraform init</code> command can't reach the provider registry</td>
    <td>Allow outbound HTTPS to <code>qumulo-terraform-registry.s3.us-east-1.amazonaws.com</code>.</td>
  </tr>
  <tr>
    <td>The plan fails with <code>Subnet ... is missing required service endpoints</code></td>
    <td>The cluster subnet lacks the <code>Microsoft.Storage</code> or <code>Microsoft.KeyVault</code> service endpoint. <a href="https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-service-endpoints-overview">Enable both</a> and rerun.</td>
  </tr>
  <tr>
    <td>The apply is refused for a missing <code>roleAssignments/write</code> permission, or fails a few minutes in with a <code>403 ForbiddenByRbac</code> on <code>setSecret</code> or <code>storageaccounts/set</code></td>
    <td>The principal lacks one of the three roles in <a href="#prerequisites">Prerequisites</a>. Add it on the resource group and rerun; the partial deployment is already removed.</td>
  </tr>
  <tr>
    <td>The apply warns <code>Unable to ensure subnet-join custom role</code>, or the <code>terraform destroy</code> command ends with a <code>403</code> on <code>roleDefinitions/delete</code></td>
    <td>User Access Administrator is scoped below the subscription. Grant it there, or clear the leftover state with the <code>terraform state rm</code> command.</td>
  </tr>
  <tr>
    <td>A create is refused with <code>RequestDisallowedByPolicy</code></td>
    <td>An Azure Policy initiative (commonly required tags) applies. Pre-create the resource group with those tags and pass them in <code>tags</code>.</td>
  </tr>
  <tr>
    <td>The apply waits a long time on VM capacity</td>
    <td>This is normal behavior. For more information, see <a href="#create-the-necessary-resources">Create the Necessary Resources</a>.</td>
  </tr>
</tbody>
</table>

{{site.data.alerts.tip}}
For anything else, {{ site.contactQumuloCare }} and include the following items with your request:
<ul>
  <li>Your deployment's unique name</li>
  <li>The region</li>
  <li>Your Terraform version</li>
  <li>The repository commit</li>
  <li>The Provisioner log from Log Analytics</li>
</ul>
{{site.data.alerts.end}}

### Working with the Provisioner {#how-the-provisioner-works}
The Provisioner is a temporary Azure VM (`Standard_B2s` by default, Ubuntu 22.04) that configures your Qumulo cluster. Terraform launches it during cluster creation, scaling, and node replacement, and deletes it when the operation completes, so nothing is left running between operations. Cluster node VMs run with managed identities that the provider grants Virtual Machine Contributor and Network Contributor on the resource group. The Provisioner's admin user is `adminuser`; cluster node VMs use `qumulo`. For more information, see [SSH Access](https://qumulo.github.io/terraform-provider-qumulo-cloud/ssh-access/) in the Qumulo Terraform provider documentation.

To monitor the Provisioner's status, watch the Terraform operations in your terminal, or read the `last-run-status` key in the App Configuration store named `<deployment_unique_name>-deployment`. For example:

```bash
az appconfig kv show -n <deployment_unique_name>-deployment --key last-run-status --auth-mode key --query value -o tsv
```

The sequence for a new cluster is:
* `Initializing create operation`
* `BOOTED. Checking connectivity.`
* `BOOTED. MQ reachable for metrics.`
* `BOOTED. Internet UP.`
* `Qumulo Nexus reachable at api.nexus.qumulo.com.`
* `Checking quorum state and boot status`
* `Forming first quorum and configuring cluster`
* `PROVISIONING COMPLETE`

#### Viewing the Provisioner Log {#viewing-the-provisioner-log}
The Provisioner's full log (`/var/log/cloud-init-output.log`) is shipped by the Azure Monitor Agent to the Log Analytics workspace `<deployment_unique_name>-logs`, table `QumuloProvisioner_CL`, with 30-day retention. Because the Provisioner VM is deleted after each operation, this workspace is the only place the log survives afterward.

The `provisioner_log_url` output of the `terraform apply` command is a direct link to the Log Analytics workspace that holds this deployment's Provisioner log. For example:

```
https://portal.azure.com/#resource/subscriptions/<subscription_id>/resourceGroups/<resource_group_unique_name>/providers/Microsoft.OperationalInsights/workspaces/<deployment_unique_name>-logs/logs
```

{% include note.html content="When `azure_environment` is set to `usgovernment`, the link uses `portal.azure.us` rather than `portal.azure.com`." %}

To view the log:

1. Run the `terraform output provisioner_log_url` command and open the link, or copy the link from the Terraform output after the apply.

1. The Azure portal opens the workspace's **Logs** blade. If the **Queries hub** gallery appears first, this is normal and isn't an error. To close the gallery, click the **X** control in the upper right.

1. In the KQL query editor, paste the following query:

   ```
   QumuloProvisioner_CL
   | order by TimeGenerated asc
   | project TimeGenerated, RawData
   ```

1. Click **Run** or press Shift+Enter.

   The results grid shows one row for each log line. To expand truncated text, click a row. To get the full transcript in one file, click **Export > Export to CSV** at the top of the grid.

{% include tip.html content="To skip the portal entirely, run `tools/get-provisioner-log.sh` (or `tools/get-provisioner-log.ps1` on Windows) from the deployment directory. The script runs the same query by using the Azure CLI and writes the result to a local `.txt` file. This is useful if you would rather not use the portal UI, or for scripted log collection." %}


## Part 1: Deploying Your Qumulo Cluster {#deploy-your-qumulo-cluster}
This section explains how to deploy the storage accounts that act as persistent storage for your Qumulo cluster, together with the cluster's compute resources, in a single Terraform deployment. Prepare the required files, configure the deployment, and then create the resources.

### Step 1: Prepare the Required Files {#prepare-the-required-files}
{% include note.html content="There is no Terraform configuration to download from Qumulo Nexus and no Qumulo Core installer to stage in a storage account. Terraform downloads the Qumulo Terraform provider from Qumulo's registry, and the provider installs Qumulo Core on the nodes. By default the nodes and the Provisioner run Ubuntu; set `marketplace_image` or `custom_image_id` to use RHEL or a hardened image instead." %}

1. To clone the `qumulo-terraform-azure` repository and change into it, run the following commands.

   ```bash
   git clone https://github.com/Qumulo/qumulo-terraform-azure.git
   cd qumulo-terraform-azure
   ```

1. To understand the deployment variables, review the `terraform.tfvars` and `README` files. The `examples` directory holds complete configurations for a standard deployment, a hardened production deployment (multi-AZ, restricted client networks, deletion protection, private networking, and a longer create timeout), Azure Government, RHEL images, and Private Link.

### Step 2: Configure the Deployment {#configure-the-deployment}
1. Create a storage account and container for the Terraform state, then edit the `backend.tf` file and specify their names. For example:

   ```bash
   az group create -n my-tfstate-rg -l eastus2
   az storage account create -n mytfstatestorage -g my-tfstate-rg -l eastus2 \
     --sku Standard_LRS --allow-shared-key-access false
   az storage container create -n tf-state --account-name mytfstatestorage --auth-mode login
   ```

   ```
   terraform {
     backend "azurerm" {
       resource_group_name  = "my-tfstate-rg"
       storage_account_name = "mytfstatestorage"
       container_name       = "tf-state"
       key                  = "cnq/terraform.tfstate"
       use_azuread_auth     = true
     }
   }
   ```

   For more information, see the [azurerm backend](https://developer.hashicorp.com/terraform/language/backend/azurerm) documentation.

   {{site.data.alerts.important}}
   <ul>
     <li>We don't recommend making further changes to this part of the configuration.</li>
     <li>We don't recommend storing the Terraform state locally for production deployments. Enable soft delete and blob versioning on the state storage account, and use a storage account dedicated to Terraform state.</li>
     <li>The shipped <code>backend.tf</code> file authenticates to the container with Microsoft Entra ID (<code>use_azuread_auth = true</code>), so the principal that runs Terraform needs <b>Storage Blob Data Contributor</b> on the container.</li>
     <li>To use local state instead, comment out the whole <code>terraform</code> block.</li>
   </ul>
   {{site.data.alerts.end}}

1. Run the `terraform init` command.

   Terraform prepares the environment, downloads the Qumulo provider from Qumulo's registry, verifies its GPG-signed checksums, and displays the message `Terraform has been successfully initialized!`

   {% include note.html content="The `terraform init` command reports the Qumulo provider as self-signed. This is expected for providers hosted outside `registry.terraform.io` and doesn't indicate a security issue; Terraform still performs full signature and checksum verification. For more information, see [Installation and Trust](https://qumulo.github.io/terraform-provider-qumulo-cloud/installation-trust/) in the Qumulo Terraform provider documentation." %}

1. Edit the `terraform.tfvars` file and specify the values for your deployment. At a minimum:

   * **Subscription and Environment:** Specify the `azure_subscription_id`, and set `azure_environment` to `public` or `usgovernment`.

   * **Basic Details:** Specify the `deployment_name` (2&ndash;15 characters, lowercase letters, digits, and interior hyphens), the `resource_group_name`, and the correct `location` for your cluster. The provider creates the resource group if it doesn't exist.

     {% include important.html content="Don't share the resource group with other VMs." %}

   * **Networking:** Specify the `subnet_id` as the full Azure resource ID of the cluster subnet.

     * **Multi-AZ (Availability Zones) Deployment:** Also set `availability_zones` (for example `["1", "2", "3"]`) and `storage_replication_type = "ZRS"`.

     * **Single-Zone Deployment:** Omit `availability_zones` and use `LRS` for a single-zone deployment or a region without zones.

   * **Cluster Configuration:** Specify the `vm_type` and the `node_count`. Valid counts are 1, or 3&ndash;24; 2 is never valid. Only L-series storage-optimized sizes are supported, for example `Standard_L8s_v4`.

     {% include note.html content="A multi-AZ deployment needs at least 3 nodes and can't use 4, so set `node_count` to 3, or to 5 or more, when you set `availability_zones`." %}

   * **Floating IP Addresses:** Leave `floating_ip_count` at 3, the repository default, or set it to a value from 3 to 100 for your client count. To deploy without floating IP addresses, set it to 0.

   * **Soft Capacity Limit:** If you aren't using the default, set the `soft_capacity_limit_tb` (50&ndash;10,000). This value specifies the initial capacity limit of your Qumulo cluster (in TB).

     {% include note.html content="It is possible to increase this limit at any time, but not to decrease it." %}

   * **Cluster / Active Directory Name:** Specify a `cluster_name` (2&ndash;15 characters). This is also the Active Directory machine name.

   * **Product Type and Storage Class:** Set `cluster_product_type` to `HOT` or `COLD`. Leave `storage_class` unset for the provider default, or set it to `STANDARD` or `INTELLIGENT_TIERING` (`HOT` only). Both are immutable after creation.

   * **Client Access:** Leave `allow_cidrs` unset to allow the cluster subnet, or specify the client and management ranges that may reach the cluster. If you need SSH access to the nodes, set `ssh_public_key_path` to the path of a public key file.

   * **Qumulo Core Version:** `cluster_version`

     * **Specific Release:** Specify `7.9.2` (or higher)

     * **Latest Release:** Don't enter a value

1. Specify the administrator password in `admin_pwd_or_keyvault_secret_id`, either as the resource ID of an [Azure Key Vault secret](https://learn.microsoft.com/en-us/azure/key-vault/secrets/about-secrets) (`/subscriptions/.../vaults/<vault>/secrets/<secret>`) or as plain text. The password must be 8&ndash;72 characters and include at least three of: a lowercase letter, an uppercase letter, a number, and a special character.

   {{site.data.alerts.important}}
   <ul>
     <li>The system treats the administrator password as sensitive and write-only: It never writes it to the Terraform state.</li>
     <li>Use the Key Vault secret reference rather than a plain-text password, so that your secret store stays the single source of truth. Terraform reads the current version of the secret on every apply and resupplies it to the provider for operations that authenticate to the cluster, such as scaling and VM size changes. If you change the password on the cluster later, update the Key Vault secret to match before the next apply.</li>
   </ul>
   {{site.data.alerts.end}}

### Step 3: Create the Necessary Resources {#create-the-necessary-resources}
{% include note.html content="The repository sets a 30-minute timeout for create, update, and delete through `provider_timeout_minutes`. When VM capacity for your L-series size is unavailable, the provider keeps retrying in the region and zones you configured; it doesn't move the deployment to a different zone or region on its own. To relocate, change `availability_zones` or `location` and run the apply again, which replaces the cluster. You can also raise `provider_create_timeout_minutes` and let the provider keep retrying." %}

1. To authenticate to your Azure subscription, use the `az login` command.

1. {{site.cnq.runTFapply}}

1. {{site.cnq.reviewExecPlan}}

   Terraform creates resources according to the execution plan and displays:

   * Your cluster's name and UUID

   * Your deployment's unique name

   * The endpoint IP addresses for your Qumulo cluster (floating IP addresses when configured, otherwise the primary IP addresses)

   * The primary (static) IP addresses

   * The Qumulo Core Web UI endpoint

   * The link to the Provisioner log in Log Analytics

   For example:
   ```
   cluster_name = "CNQ-HOT"
   cluster_uuid = "{{site.exampleUUID41}}"
   deployment_unique_name = "{{site.cnq.deploymentUniqueNameExampleAzureTF}}"
   endpoint_ips = tolist([
     "{{site.exampleIP1}}",
     "{{site.exampleIP2}}",
     "{{site.exampleIP3}}",
   ])
   endpoints = {
     "api" = "https://{{site.exampleIP1}}:8000"
     "nfs" = "{{site.exampleIP1}}:/"
     "smb" = "\\\\{{site.exampleIP1}}\\<SMB Share Name>"
     "web_ui" = "https://{{site.exampleIP1}}"
   }
   primary_ips = tolist([
     "{{site.exampleIP5}}",
     "{{site.exampleIP6}}",
     "{{site.exampleIP7}}",
   ])
   provisioner_log_url = "https://portal.azure.com/#resource/subscriptions/..."
   resource_group_unique_name = "rg-qumulo"
   soft_capacity_limit_tb = 100
   ```

   {% include note.html content="Terraform escapes backslashes when it prints string values, so the SMB endpoint appears with doubled backslashes. The path clients use is `\\<IP address>\<SMB Share Name>`." %}


## Part 2: Mounting the Qumulo File System {#mounting-the-qumulo-file-system}
1. To log in to your cluster's Web UI, use the `web_ui` endpoint from the Terraform output and the username `admin` with the password that you have configured.

   {{site.data.alerts.important}}
   <ul>
     <li>The administrator password is applied at cluster creation and is never written to the Terraform state.</li>
     <li>If you change the password by using the Qumulo Core Web UI, <code>qq</code> CLI, or REST API after deployment, update the Key Vault secret (or the value in <code>terraform.tfvars</code>) to match. Terraform resupplies the password to the provider on every apply that authenticates to the cluster, and a mismatch fails that apply part-way through.</li>
   </ul>
   {{site.data.alerts.end}}

   You can use the Qumulo Core Web UI to create and manage the following:
   * [NFS exports](../nfs/creating-nfs-export.html)
   * [SMB shares](../smb/creating-smb-share.html)
   * [Snapshots](../snapshots/managing-snapshots.html)
   * [Continuous replication relationships](../replicating-data/creating-managing-continuous-replication-relationship.html)

   You can also [join your cluster to Active Directory](../authentication-qumulo-core/configuring-ad.html) and [configure LDAP](../authentication-qumulo-core/configuring-ldap.html).

1. Mount your Qumulo file system by using NFS or SMB and your cluster's DNS name or an IP address from the Terraform output.

   {% include note.html content="Clients must be inside a range listed in `allow_cidrs`, or inside the cluster subnet when `allow_cidrs` is unset." %}


## Part 3: Performing Post-Deployment Actions {#perform-post-deployment-actions}
This section describes the common actions you can perform on a {{site.cnqShort}} cluster after deploying it: [adding nodes](#adding-node-to-existing-cluster), [removing nodes](#removing-node-from-existing-cluster), [increasing the soft capacity limit](#increasing-soft-capacity-limit-existing-cluster), [changing the VM size](#changing-the-vm-size), [upgrading Qumulo Core](#upgrading-qumulo-core), and [deleting a cluster](#deleting-existing-cluster). Each action is a variable change followed by a `terraform apply` command; there are no Terraform workspaces to manage and no multi-stage sequences.

{{site.data.alerts.important}}
<ul>
  <li>Leave <code>cluster_version</code> at the value you deployed with. The version is immutable after creation, and changing it fails the apply immediately, including after you upgrade Qumulo Core from the Web UI or the <code>qq</code> CLI.</li>
  <li>The provider matches the software version your cluster is already running for every node add and node replacement, so no day-2 operation needs the variable updated.</li>
</ul>
{{site.data.alerts.end}}

### Adding Nodes to an Existing CNQ on Azure Cluster {#adding-node-to-existing-cluster}
1. Edit the `terraform.tfvars` file and set `node_count` to a higher value.

1. {{site.cnq.runTFapply}}

1. Review the Terraform execution plan, confirm that it shows an in-place update, and then enter `yes`.

1. {{site.cnq.logIntoWebUI}}

Terraform adds the nodes to your cluster and displays the additional primary (static) IP addresses.

### Removing Nodes from an Existing CNQ on Azure Cluster {#removing-node-from-existing-cluster}
Removing nodes is a single Terraform operation. The separate quorum-removal (`q_target_node_count`) and resource-cleanup steps of the legacy bundle are now handled by the Qumulo Terraform provider.

{% include note.html content="You can't choose which node leaves. Lowering `node_count` removes the highest-numbered nodes, so taking a 4-node cluster to 3 removes node 4; there is no supported way to remove node 2 and keep node 4. To retire a specific node, replace the cluster instead." %}

1. Edit the `terraform.tfvars` file and set `node_count` to a lower value.

1. {{site.cnq.runTFapply}}

1. {{site.cnq.reviewExecPlan}}

### Increasing the Soft Capacity Limit for an Existing CNQ on Azure Cluster {#increasing-soft-capacity-limit-existing-cluster}
{{site.data.alerts.important}}
<ul>
  <li>One apply can raise the soft capacity limit by almost 5,000 TB: The increase must be under 5,000 TB, so an increase of 5,000 TB or more has to be applied in steps.</li>
  <li>The ceiling is 10,000 TB.</li>
  <li>It isn't possible to decrease the soft capacity limit.</li>
</ul>
{{site.data.alerts.end}}

1. Edit the `terraform.tfvars` file and set `soft_capacity_limit_tb` to a higher value.

1. {{site.cnq.runTFapply}}

1. {{site.cnq.reviewExecPlan}}

Terraform adds storage accounts as necessary, updates the role assignments and network rules, and increases the soft capacity limit.

### Changing the VM Size of Your CNQ on Azure Cluster {#changing-the-vm-size}
The Qumulo Terraform provider performs the replacement natively within the existing deployment. The cluster replacement procedure no longer requires a new Terraform workspace or the `q_replacement_cluster` and `q_existing_deployment_unique_name` variables.

{{site.data.alerts.important}}
<ul>
  <li>Changing the VM size, the availability zones, or the node image replaces cluster nodes.</li>
  <li>Don't resize the VMs in the Azure portal.</li>
</ul>
{{site.data.alerts.end}}

1. Edit the `terraform.tfvars` file and specify the new `vm_type`. To convert a single-AZ cluster to multi-AZ, set `availability_zones` in the same edit.

1. {{site.cnq.runTFapply}}

1. Review the Terraform execution plan carefully, and then enter `yes`.

### Upgrading Qumulo Core {#upgrading-qumulo-core}
Upgrading Qumulo Core isn't a Terraform operation. The deployed version is immutable in the Terraform configuration after creation. Upgrade from the Qumulo Core Web UI or with the `qq` CLI by following [Performing Upgrades](../upgrading-qumulo-core/performing-upgrades.html). Don't change `cluster_version` after the upgrade; it is immutable, and changing it fails the next apply immediately.

### Deleting an Existing CNQ on Azure Cluster {#deleting-existing-cluster}
{{site.data.alerts.caution}}
<ul>
  <li>When you no longer need your cluster, you must back up all important data on the cluster safely before deleting the cluster. Deleting the cluster deletes its compute and cache resources and its persistent storage.</li>
  <li>Until you disable deletion protection and apply this change, the <code>CanNotDelete</code> management locks refuse deletion from Terraform, the Azure portal, and the Azure CLI alike.</li>
</ul>
{{site.data.alerts.end}}

1. After you back up your data safely, edit your `terraform.tfvars` file and set `deletion_protection` to `false`.

1. Run the `terraform apply` command, review the Terraform execution plan, and then enter `yes`.

   Terraform removes the `CanNotDelete` management locks.

1. {{site.cnq.runTFdestroy}}

1. {{site.cnq.reviewExecPlan}}

   Terraform deletes all of your cluster's resources, including the persistent storage, and displays the `Destroy complete!` message with a count of destroyed resources.
