## Step 2: Deploying Cluster Compute and Cache Resources {#deploy-cluster-compute-and-cache-resources}
This section explains how to deploy compute and cache resources for a Qumulo cluster by using a Ubuntu image and the Qumulo Core `.deb` installer.

### Recommendations
{% include important.html content="We strongly recommend reviewing the following recommendations before beginning this process." %}

* Provisioning completes successfully when the Provisioner shuts down automatically. If the Provisioner doesn't shut down, the provisioning cycle has failed and you must troubleshoot it.  To monitor the provisioner's status, you can watch the Terraform status posts in your terminal or {{site.cnq.azureAppConfig}}.

* The first variable in the example configuration files in the <code>azure-terraform-cnq</code> repository is <code>deployment_name</code>. To help avoid conflicts between resource groups and other deployment components, {{site.cnq.deploymentUniqueName}}

* If you plan to deploy multiple Qumulo clusters, give the <code>q_cluster_name</code> variable a unique name for each cluster.

* We recommend forwarding DNS queries to [Qumulo Authoritative DNS (QDNS)](../network-configuration/configuring-authoritative-dns.html). For a single-AZ deployment, to allow Qumulo Core to create an Amazon Route 53 outbound resolver, specify values for the `q_cluster_fqdn` and `second_private_subnet_id` variables. The resolver uses the `q_cluster_fqdn` variable to forward DNS requests to your cluster, where Qumulo Core resolves DNS for your floating IP addresses.

### Part 1: To Deploy the Cluster Compute and Cache Resources

1. To ensure that your Virtual Network subnet has the required service endpoints, take the following steps:

   1. In the Azure Portal, search for `Virtual networks` and then select your Virtual Network.

   1. On the left panel, click **Settings > Service endpoints**.

   1. On the **Service endpoints** page, ensure that the `Microsoft.KeyVault` and `Microsoft.Storage` service endpoints are added and enabled for the subnet where {{site.azure.cnqAzureShort}} is to be deployed.

   {% include important.html content="It isn't possible to deploy your cluster without these service endpoints." %}

1. Edit the `provider.tf` file:

   * To store the Terraform state remotely, add the name of an S3 bucket to the sections that begin with `backend "azurerm" {` and `data "terraform_remote_state" "persistent_storage" {`.

   * To store the Terraform state locally, comment out the sections that begin with `backend "azurerm" {` and `data "terraform_remote_state" "persistent_storage" {` and uncomment the section that contains `backend = "local"`.

     {% capture noLocal %}{{site.cnq.dontRecommendLocalState}}{% endcapture %}
     {% include important.html content=noLocal %}

1. Navigate to the `azure-terraform-cnq-<x.y>` directory and then run the `terraform init` command.

   Terraform prepares the environment and displays the message `Terraform has been successfully initialized!`

1. Edit the `terraform.tfvars` file and specify the values for all variables.

   {% capture advancedAZ %}{{site.azure.advancedAZresourceName}}{% endcapture %}
   {% include note.html content=advancedAZ %}

   For more information, see `README.pdf` in `azure-terraform-cnq-<x.y>.zip`.

1. {{site.cnq.runTFapply}}

1. {{site.cnq.reviewExecPlan}}

   Terraform creates resources according to the execution plan and displays:

   * Your deployment's unique name

   * The IP address for your Provisioner

   * The floating IP addresses for your Qumulo cluster
  
     {% include note.html content="You must specify the floating IP addresses in your `terraform.tfvars` file explicitly." %}

   * The primary (static) IP addresses for your Qumulo cluster

   * The Qumulo Core Web UI endpoint

   For example:

   ```
   deployment_unique_name = "{{site.cnq.deploymentUniqueNameExampleAzure}}"
   provisioner = {
     "provisioner_ip_address" = "{{site.exampleIP0}}"
     "qumulo_cluster_floating_ips" = tolist([
       "{{site.exampleIP42}}",
       "{{site.exampleIP84}}",
       ...
     ])
   }
   ...
   qumulo_primary_ips = tolist([
     "{{site.exampleIP1}}",
     "{{site.exampleIP2}}",
     "{{site.exampleIP3}}",
     "{{site.exampleIP4}}"
   ])
   ...
   qumulo_private_url_node1 = "https://{{site.exampleEndpointIP0}}"
   ```

### Part 2: To Mount the Qumulo File System

1. To log in to your cluster's Web UI, use the endpoint from the Terraform output as the endpoint and the username and password that you have configured during deployment as the credentials.

   {% capture appConfig %}If you change the administrative password for your cluster by using the Qumulo Core Web UI, `qq` CLI, or REST API after deployment, you must add your new password {{site.cnq.azureAppConfig}}.{% endcapture %}
   {% include important.html content=appConfig %}

   You can use the Qumulo Core Web UI to create and manage [NFS exports](../nfs/creating-nfs-export.html), [SMB shares](../smb/creating-smb-share.html), [snapshots](../snapshots/managing-snapshots.html), and [continuous replication relationships](../replicating-data/creating-managing-continuous-replication-relationship.html) You can also [join your cluster to Active Directory](https://care.qumulo.com/s/article/Join-your-Qumulo-Cluster-to-Active-Directory), [configure LDAP](../authentication-qumulo-core/configuring-ldap.html), and [perform many other operations](../).

1. Mount your Qumulo file system by using NFS or SMB and your cluster's DNS name or IP address.
