## Step 3: Performing Post-Deployment Actions {#perform-post-deployment-actions}
This section describes the common actions you can perform on a {{site.cnqShort}} cluster after deploying it.

### Adding Nodes to an Existing Cluster {#adding-node-to-existing-cluster}
{% include important.html content="To add nodes to an existing cluster, the total node count must be greater than that of the current deployment." %}

1. Edit the `terraform.tfvars` file.
   1. Specify the `q_node_count`.
   1. Set the `q_cluster_version` to the Qumulo Core version that your cluster is running.
1. {{site.cnq.runTFapply}}
1. {{site.cnq.reviewExecPlan}}
   
   Terraform displays an additional primary (static) IP for the new node. For example:

   ```
   qumulo_primary_ips = tolist([
     "{{site.exampleIP5}}",
     "{{site.exampleIP6}}",
     "{{site.exampleIP7}}",
     "{{site.exampleIP8}}",
     "{{site.exampleIP9}}"   
   ])
   ```   
{% capture verifyProvis %}{{site.cnq.monitorGCPProvisionerShutdown}} {{site.cnq.monitorGCPProvisioner}}{% endcapture %}
1. {{verifyProvis}}
1. {{site.cnq.logIntoWebUI}}

### Removing Nodes from an Existing Cluster {#removing-node-from-existing-cluster}
Removing nodes from an existing cluster is a two-step process in which you remove the nodes from your cluster's quorum and then tidy up the GCP resources for the removed nodes.

#### Step 1: Remove Nodes from the Cluster's Quorum

{% capture whileRunning %}{{site.cnq.performWhileRunning}}{% endcapture %}
{% include important.html content=whileRunning %}

1. Edit the `terraform.tfvars` file and set the value of `q_target_node_count` to a lower number of nodes.

1. {{site.cnq.runTFapply}}

1. Review the nodes to be removed and then enter `yes`.

   Terraform removes the nodes and displays:

   * Your deployment's unique name

   * The remaining GCS buckets for your Qumulo cluster

   * The primary (static) IP addresses for the node removed from your Qumulo cluster

   * The Qumulo Core Web UI endpoint
   
   For example:

   ```
   deployment_unique_name = "{{site.cnq.deploymentUniqueNameExampleGCP}}"
   ...
   persistent_storage_bucket_names = tolist([
     "{{site.exampleBucketName1}}",
     "{{site.exampleBucketName2}}",
     "{{site.exampleBucketName3}}",
     ...
     "{{site.exampleBucketNameNoNumber}}16"
   ])
   qumulo_floating_ips = tolist([
     "{{site.exampleIP42}}",
     "{{site.exampleIP84}}",
     ...
   ])
   ...
   qumulo_primary_ips_removed_nodes = "{{site.exampleIP24}}",
   ...
   qumulo_private_url_node1 = "https://{{site.exampleEndpointIP0}}"
   ```

#### Step 2: Tidy Up GCP Resources for Removed Nodes
1. Edit the `terraform.tfvars` file:

   1. Set the value of the `q_node_count` variable to a lower number of nodes.

   1. Set the value of the `q_target_node_count` to `null`.

1. {{site.cnq.runTFapply}}

1. Review the resources to be removed and then enter `yes`.

1. {{site.cnq.logIntoWebUI}}

   Terraform tidies up the resources for removed nodes and displays:
   
   * Your deployment's unique name

   * The remaining GCS buckets for your Qumulo cluster

   * The remaining floating IP addresses for your Qumulo cluster

   * The remaining primary (static) IP addresses for your Qumulo cluster

   * The Qumulo Core Web UI endpoint

   For example:

   ```
   deployment_unique_name = "{{site.cnq.deploymentUniqueNameExampleGCP}}"
   ...
   persistent_storage_bucket_names = tolist([
     "{{site.exampleBucketName1}}",
     "{{site.exampleBucketName2}}",
     "{{site.exampleBucketName3}}",
     ...
     "{{site.exampleBucketNameNoNumber}}16"
   ])
   qumulo_floating_ips = tolist([
     "{{site.exampleIP42}}",
     "{{site.exampleIP84}}",
     ...
   ])
   ...
   qumulo_primary_ips = tolist([
     "{{site.exampleIP4}}",
     "{{site.exampleIP5}}",
     "{{site.exampleIP6}}",
     "{{site.exampleIP7}}"
   ])
   ...
   qumulo_private_url_node1 = "https://{{site.exampleEndpointIP0}}"
   ```

### Increasing the Soft Capacity Limit for an Existing Cluster {#increasing-soft-capacity-limit-existing-cluster}
Increasing the soft capacity limit for an existing cluster is a two-step process in which you configure new persistent storage parameters and then configure new compute and cache deployment parameters.

#### Step 1: Set New Persistent Storage Parameters
1. Edit the `terraform.tfvars` file in the `persistent-storage` directory and set the `soft_capacity_limit` variable to a higher value.
1. {{site.cnq.runTFapply}}

   {{site.cnq.reviewExecPlan}}

   {{site.cnq.tfCreatesNewGCSBuckets}} and displays:

   * The `Apply complete!` message with a count of changed resources
     
   * The names of the created GCS buckets
     
   * Your deployment’s unique name
     
   * The new soft capacity limit

   For example:

   ```
   Apply complete! Resources: 0 added, 1 changed, 0 destroyed.

   Outputs:

   persistent_storage_bucket_names = tolist([
     "{{site.exampleBucketName1}}",
     "{{site.exampleBucketName2}}",
     "{{site.exampleBucketName3}}",
     ...
     "{{site.exampleBucketNameNoNumber}}-16"
   ])
   deployment_unique_name = "{{site.cnq.deploymentUniqueNameExampleGCP}}"
   ...
   soft_capacity_limit = "1000 TB"
   ```

#### Step 2: Update Existing Compute and Cache Resource Deployment
1. Navigate to the root directory of the `qumulo-terraform-gcp-<x.y>` repository.
1. {{site.cnq.runTFapply}}

   {{site.cnq.reviewExecPlan}}

   Terraform updates the necessary IAM roles and GCS bucket policies, adds GCS buckets to the persistent storage list for the cluster, increases the soft capacity limit, and displays the `Apply complete!` message.
   
   When the Provisioner shuts down automatically, this process is complete.

### Changing the GCE Instance Type of Your CNQ on GCP Cluster
You can change the GCE instance type, node count, and to convert your cluster from single-zone to multi-zone, or the other way around.

{{site.data.alerts.important}}
<ul>
  <li>To minimize potential availability interruptions, you must perform the <em>cluster replacement procedure</em> as a two-quorum event. For example, if you stop the existing GCE instances by using the GCP Console and change the GCE instance types, two quorum events occur <em>for each node</em> and the read and write cache isn't optimized for the GCE instance type.</li>
  <li>Performing the cluster replacement procedure ensures that the required GCE instance types are available in advance.</li>
</ul>
{{site.data.alerts.end}}

Changing the GCE instance type of your {{site.gcp.cnqCNQshort}} cluster is a three-step process in which you create a new deployment in a new Terraform workspace and join the new GCE instances to a quorum, remove the existing GCE instances, and then clean up your GCS bucket policies.

#### Step 1: Create a New Deployment in a New Terraform Workspace
1. To create a new Terraform workspace, run the `terraform workspace new my-new-workspace-name` command.
1. Edit the `terraform.tfvars` file:

   1. Specify the value for the `gcp_subnet_name` variable.

   1. Specify the value for the `gcp_zones` variable.

      {% include note.html content="For multi-zone deployments, specify values as a comma-delimited list." %}

   1. Specify the value for the `q_instance_type` variable.

   1. Set the value of the `q_replacement_cluster` variable to `true`.

   1. Set the value of the `q_existing_deployment_unique_name` variable to the current deployment's name.

   1. (Optional) To change the number of nodes, specify the value for the `q_node_count` variable.

   {% include important.html content="Leave the other variables unchanged." %}

1. {{site.cnq.runTFapply}}

   {{site.cnq.reviewExecPlan}}
   
   Terraform creates resources according to the execution plan and displays:
      
   * Your deployment's unique name
  
   * The names of the created GCS buckets
     
   * The same floating IP addresses for your Qumulo cluster
     
   * New primary (static) IP addresses for your Qumulo cluster
     
   * The Qumulo Core Web UI endpoint

   For example:

   ```
   deployment_unique_name = "{{site.cnq.deploymentUniqueNameExampleGCP}}"
   ...
   persistent_storage_bucket_names = tolist([
     "{{site.exampleBucketName1}}",
     "{{site.exampleBucketName2}}",
     "{{site.exampleBucketName3}}",
     ...
     "{{site.exampleBucketNameNoNumber}}-16"
   ])
   qumulo_floating_ips = tolist([
     "{{site.exampleIP42}}",
     "{{site.exampleIP84}}",
     ...
   ])
   ...
   qumulo_primary_ips = tolist([
     "{{site.exampleIP4}}",
     "{{site.exampleIP5}}",
     "{{site.exampleIP6}}",
     "{{site.exampleIP7}}"
   ])
   ...
   qumulo_private_url_node1 = "https://{{site.exampleEndpointIP0}}"
   ```
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

#### Step 3: Clean Up GCS Bucket Policies
1. To list your Terraform workspaces, run the `terraform workspace list` command.
1. To select your new Terraform workspace, run the `terraform workspace select <my-new-workspace-name>` command.
1. Edit the `terraform.tfvars` file and set the `q_replacement_cluster` variable to `false`.
1. {{site.cnq.runTFapply}} This ensures that the GCS bucket policies have least privilege.

   {{site.cnq.reviewExecPlan}}

   Terraform displays the `Apply complete!` message with a count of destroyed resources.

### Deleting an Existing Cluster {#deleting-existing-cluster}
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
