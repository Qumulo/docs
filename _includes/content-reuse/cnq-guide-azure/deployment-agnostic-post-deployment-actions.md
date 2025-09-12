<a id="perform-post-deployment-actions"></a>
## Step 3: Performing Post-Deployment Actions
This section describes the common actions you can perform on a {{site.cnqShort}} cluster after deploying it.

<a id="adding-node-to-existing-cluster"></a>
### Adding Nodes to an Existing Cluster
{% include important.html content="To add nodes to an existing cluster, the total node count must be greater than that of the current deployment." %}

1. {{site.cnq.changeQnodeCountAzure}} to a new value.
1. {{site.cnq.runTFapply}}
1. {{site.cnq.reviewExecPlan}}

   Terraform changes resources according to the execution plan and displays an additional primary (static) IP for the new node. For example:

   ```
   qumulo_primary_ips = tolist([
     "{{site.exampleIP1}}",
     "{{site.exampleIP2}}",
     "{{site.exampleIP3}}",
     "{{site.exampleIP4}}",
     "{{site.exampleIP5}}"
   ])
   ```
{% capture verifyProvis %}To ensure that the Provisioner shuts down automatically, review the `last-run-status` parameter {{site.cnq.azureAppConfig}}.{% endcapture %}
1. {{verifyProvis}}
1. {{site.cnq.logIntoWebUI}}

<a id="removing-node-from-existing-cluster"></a>
### Removing Nodes from an Existing Cluster
Removing nodes from an existing cluster is a two-step process in which you remove the nodes from your cluster's quorum and then tidy up the Azure resources for the removed nodes.

#### Step 1: Remove Nodes from the Cluster's Quorum
{% include important.html content="You must perform this step while the cluster is running." %}

1. Edit the `terraform.tfvars` file and set the value of `q_target_node_count` to a lower number of nodes.

1. {{site.cnq.runTFapply}}

1. Review the nodes to be removed and then enter `yes`.

   Terraform removes the nodes and displays:

   * Your deployment's unique name

   * The remaining primary (static) IP addresses for your Qumulo cluster

   * The Qumulo Core Web UI endpoint

   For example:

   ```
   deployment_unique_name = "{{site.cnq.deploymentUniqueNameExampleAzure}}"
   qumulo_cluster_uuid = "12345678-1234-1234-1234-123456789012"
   qumulo_primary_ips = tolist([
     "{{site.exampleIP1}}",
     "{{site.exampleIP2}}",
     "{{site.exampleIP3}}"
   ])
   qumulo_private_url_node1 = "https://{{site.exampleIP1}}"
   ```

#### Step 2: Tidy Up Azure Resources for Removed Nodes
1. Edit the `terraform.tfvars` file:

   1. Set the value of the `q_node_count` variable to a lower number of nodes in the cluster.

   1. Set the value of the `q_target_node_count` to `null`.

1. {{site.cnq.runTFapply}}

1. Review the resources to be removed and then enter `yes`.

1. {{site.cnq.logIntoWebUI}}

   Terraform tidies up the resources for removed nodes and displays:
   
   * Your deployment's unique name

   * The remaining primary (static) IP addresses for your Qumulo cluster

   * The Qumulo Core Web UI endpoint

   For example:

   ```
   deployment_unique_name = "{{site.cnq.deploymentUniqueNameExampleAzure}}"
   qumulo_cluster_uuid = "12345678-1234-1234-1234-123456789012"
   qumulo_primary_ips = [
     "{{site.exampleIP1}}",
     "{{site.exampleIP2}}"
   ]
   qumulo_private_url_node1 = "https://{{site.exampleIP1}}"
   ```

<a id="increasing-soft-capacity-limit-existing-cluster"></a>
### Increasing the Soft Capacity Limit for an Existing Cluster
Increasing the soft capacity limit for an existing cluster is a two-step process in which you configure new persistent storage parameters and then configure new compute and cache deployment parameters.

#### Step 1: Set New Persistent Storage Parameters
1. Edit the `terraform.tfvars` file in the `persistent-storage` directory and set the `q_cluster_soft_capacity_limit` variable to a higher value.
1. {{site.cnq.runTFapply}}

   {{site.cnq.reviewExecPlan}}

   Terraform creates new storage accounts as necessary and displays:

   * The names of the created storage accounts

   * Your persistent storage resource group's unique name

   * The new soft capacity limit

   For example:

   ```
   Outputs:

   persistent_storage_accounts = [
     "{{site.exampleStorageAccountName1}}",
     "{{site.exampleStorageAccountName2}}",
     "{{site.exampleStorageAccountName3}}",
     "{{site.exampleStorageAccountName4}}",
   ]
   persistent_storage_resource_group = "{{site.cnq.persistentStorageResourceGroupAzure}}"
   ...
   soft_capacity_limit = "1000 TB"
   ```

#### Step 2: Update Existing Compute and Cache Resource Deployment
1. Navigate to the root directory of the `azure-terraform-cnq-<x.y>` repository.
1. {{site.cnq.runTFapplyWithFile}}

   {{site.cnq.reviewExecPlan}}

   Terraform updates the necessary roles and storage account policies, adds storage accounts to the persistent storage list for the cluster, increases the soft capacity limit, and displays the `Apply complete!` message.

   When the Provisioner shuts down automatically, this process is complete.

### Changing the VM Instance Type of Your CNQ on Azure Cluster
You can change the VM instance type, node count, and convert your cluster from single-AZ to multi-AZ, or the other way around.

{{site.data.alerts.important}}
<ul>
  <li>To minimize potential availability interruptions, you must perform the <em>cluster replacement procedure</em> as a two-quorum event. For example, if you stop the existing VMs by using the Azure portal and change the VM instance types, two quorum events occur <em>for each node</em> and the read and write cache isn't optimized for the VM instance type.</li>
  <li>Performing the cluster replacement procedure ensures that the required VM instance types are available in advance.</li>
</ul>
{{site.data.alerts.end}}

Changing the VM instance type of your {{site.cnqShort}} on Azure cluster is a three-step process in which you create a new deployment in a new Terraform workspace and join the new VMs to a quorum, remove the existing VMs, and then clean up your storage account policies.

#### Step 1: Create a New Deployment in a New Terraform Workspace
1. To create a new Terraform workspace, run the `terraform workspace new my-new-workspace-name` command.
1. Edit the `terraform.tfvars` file:

   1. Specify the value for the `az_subnet_name` variable.

      {% include note.html content="For multi-AZ deployments, specify values as a comma-delimited list." %}

   1. Specify the value for the `q_vm_type` variable.
   1. Set the value of the `q_replacement_cluster` variable to `true`.
   1. Set the value of the `q_existing_deployment_unique_name` variable to the current deployment's name.
   1. (Optional) To change the number of nodes, specify the value for the `q_node_count` variable.

   {% include important.html content="Leave the other variables unchanged." %}

1. {{site.cnq.runTFapply}}

   {{site.cnq.reviewExecPlan}}

   Terraform creates resources according to the execution plan and displays:

   * Your deployment's unique name

   * New primary (static) IP addresses for your Qumulo cluster

   * The Qumulo Core Web UI endpoint

   For example:

   ```
   deployment_unique_name = "{{site.cnq.deploymentUniqueNameExampleAzure}}"
   qumulo_cluster_uuid = "87654321-4321-4321-4321-210987654321"
   qumulo_primary_ips = tolist([
     "{{site.exampleIP4}}",
     "{{site.exampleIP5}}",
     "{{site.exampleIP6}}",
     "{{site.exampleIP7}}"
   ])
   qumulo_private_url_node1 = "https://{{site.exampleIP4}}"
   ```

{% capture verifyProvis %}To ensure that the Provisioner shuts down automatically, review the `last-run-status` parameter {{site.cnq.azureAppConfig}}.{% endcapture %}
1. {{verifyProvis}}
1. {{site.cnq.logIntoWebUI}}

#### Step 2: Remove the Previous Deployment
1. To select the previous Terraform workspace (for example, `default`), run the `terraform workspace select default` command.
1. To ensure that the correct workspace is selected, run the `terraform workspace show` command.
1. {{site.cnq.runTFdestroy}}

   {{site.cnq.reviewExecPlan}}

   Terraform displays the `Destroy complete!` message with a count of destroyed resources.

   The previous deployment is deleted.

{% capture origPersStore %}The persistent storage deployment remains in its original Terraform workspace. You can perform the next cluster replacement procedure in the `default` workspace.{% endcapture %}
{% include note.html content=origPersStore %}

#### Step 3: Clean Up Storage Account Policies
1. To list your Terraform workspaces, run the `terraform workspace list` command.
1. To select your new Terraform workspace, run the `terraform workspace select <my-new-workspace-name>` command.
1. Edit the `terraform.tfvars` file and set the `q_replacement_cluster` variable to `false`.
1. {{site.cnq.runTFapply}} This ensures that the storage account policies have least privilege.

   {{site.cnq.reviewExecPlan}}

   Terraform displays the `Apply complete!` message with a count of destroyed resources.

<a id="deleting-existing-cluster"></a>
### Deleting an Existing Cluster
Deleting a cluster is a two-step process in which you delete your cluster's compute and cache resources and then delete your persistent storage.

{{site.data.alerts.caution}}
<ul>
  <li>When you no longer need your cluster, you must back up all important data on the cluster safely before deleting the cluster.</li>
  <li>When you delete your cluster's cache and computer resources, it isn't possible to access your persistent storage anymore.</li>
</ul>
{{site.data.alerts.end}}

#### Step 1: To Delete Your Cluster's Compute and Cache Resources
1. After you back up your data safely, edit your `terraform.tfvars` file and set the `term_protection` variable to `false`.
1. {{site.cnq.runTFapply}}

   {{site.cnq.reviewExecPlan}}

   Terraform displays the `Apply complete!` message with a count of changed resources.

1. {{site.cnq.runTFdestroy}}

   {{site.cnq.reviewExecPlan}}

   Terraform deletes all of your cluster's compute and cache resources and displays the `Destroy complete!` message and a count of destroyed resources.

#### Step 2: To Delete Your Cluster's Persistent Storage
1. Navigate to the `persistent-storage` directory.
1. Edit your `terraform.tfvars` file and set the `prevent_destroy` parameter to `false`.
1. {{site.cnq.runTFapply}}

   {{site.cnq.reviewExecPlan}}

   Terraform displays the `Apply complete!` message with a count of changed resources.

1. {{site.cnq.runTFdestroy}}

   {{site.cnq.reviewExecPlan}}

   Terraform deletes all of your cluster's persistent storage and displays the `Destroy complete!` message and a count of destroyed resources.
