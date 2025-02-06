<a id="perform-post-deployment-actions"></a>
## Step 3: Performing Post-Deployment Actions
This section describes the common actions you can perform on a {{site.cnqShort}} cluster after deploying it.

<a id="adding-node-to-existing-cluster"></a>
### Adding a Node to an Existing Cluster
{% include important.html content="To add a node to an existing cluster, the total node count must be greater than that of the current deployment." %}

{% if page.deployment == "tf" %}
1. {{site.cnq.changeQnodeCount}} to a new value.
1. {{site.cnq.runTFapplyWithFile}}
1. {{site.cnq.tfDispExecPlan}}

   {{site.cnq.reviewExecPlan}}
   
   Terraform changes resources according the execution plan and displays an additional primary (static) IP for the new node. For example:

   ```
   qumulo_primary_ips = [
     "{{site.exampleIP0}}",
     "{{site.exampleIP1}}",
     "{{site.exampleIP2}}",
     "{{site.exampleIP3}}",
     "{{site.exampleIP4}}"   
   ]
   ```   
{% elsif page.deployment == "cfn" %}
1. {{site.cnq.logIntoCFN}}
1. {{site.cnq.cfnUpdateStackComputeCache}}
1. {{site.cnq.cfnUseExistingTemplate}}
1. On the **Specify stack details** page, enter a new value for **Number of Qumulo EC2 instances** and then click **Next**.
1. {{site.cnq.cfnRollbackOnFailure}}
1. On the **Review &lt;my-stack-name&gt;** page, click **Submit**.

   CloudFormation creates resources for the stack and displays the **CREATE_COMPLETE** status for each resource.
{% endif %}
{% capture verifyProvis %}To ensure that the Provisioner shut downs automatically, monitor the `/qumulo/{% if page.deployment == "tf" %}my-deployment-name{% elsif page.deployment == "cfn" %}my-stack-name{% endif %}/last-run-status` parameter for the Provisioner. {{site.cnq.paramStore}}{% endcapture %}
1. {{verifyProvis}}
1. {{site.cnq.logIntoWebUI}}

<a id="removing-node-from-existing-cluster"></a>
### Removing a Node from an Existing Cluster
Removing a node from an existing cluster is a two-step process:

1. Remove the node from your cluster's quorum.
1. Tidy up the AWS resources for the removed nodes.

#### Step 1: Remove the Node from the Cluster's Quorum
You must perform this step while the cluster is running.

1. Copy the `remove-nodes.sh` script from the {% if page.deployment == "tf" %}`aws-terraform-cnq-<x.y>/utilities`{% elsif page.deployment == "cfn" %}`aws-cloudformation-cnq-<x.y>/utilities`{% endif %} directory to a machine running in your VPC that has the AWS CLI tools installed (for example, an Amazon Linux 2 AMI).

   {{site.data.alerts.tip}}
   <ul>
     <li>To make the script executable, run the <code>chmod +x remove-nodes.sh</code> command.</li>
     <li>To see a list of required parameters, run <code>remove-nodes.sh</code></li>
   </ul>
   {{site.data.alerts.end}}

1. Run the `remove-nodes.sh` script and specify the AWS region, the unique deployment name, the current node count, and the final node count.

   In the following example, we reduce a cluster from 6 to 4 nodes.

   ```bash
   ./remove-nodes.sh \
     --region us-west-2 \
     --qstackname my-unique-deployment-name \
     --currentnodecount 6 \
     --finalnodecount 4
   ```
   
1. Review the nodes to be removed and then enter `y`.

1. Enter the administrator password for your cluster.

   The script removes the nodes and displays:

   * Confirmation that your cluster formed a new quorum

   * Confirmation that the new quorum is active
  
   * The new total number of nodes in the quorum
  
   * The EC2 identifiers for the removed nodes
  
   * The endpoint for your cluster's Web UI
  
   ```
   {"monitor_uri": "/v1/node/state"}
        --Waiting for new quorum
        --New quorum formed
        --Quorum is ACTIVE
        --Validating quorum
        --4 Nodes in Quorum
        --REMOVED: EC2 ID={{site.exampleEC2id1}} >> Qumulo node_id=5
        --REMOVED: EC2 ID={{site.exampleEC2id2}} >> Qumulo node_id=6
   **Verify the cluster is healthy in the Qumulo UI at https://{{site.exampleEndpointIP0}}
   ...
   ```

1. {{site.cnq.logIntoWebUI}}

#### Step 2: Tidy Up AWS Resources for Removed Nodes
To avoid incurring additional costs, we recommend tidying up the AWS resources for the removed nodes.
{% if page.deployment == "tf" %}
1. Navigate to the `aws-terraform-cnq-<x.y>` directory.
1. {{site.cnq.changeQnodeCount}} to a lower value (for example, `4`).
1. {{site.cnq.runTFapplyWithFile}}

   {{site.cnq.reviewExecPlan}}
   
   Terraform removes the resources for the removed nodes according the execution plan and displays the primary (static) IP addresses for the remaining nodes. For example:

   ```
   qumulo_primary_ips = [
     "{{site.exampleIP0}}",
     "{{site.exampleIP1}}",
     "{{site.exampleIP2}}",
     "{{site.exampleIP3}}",
     "{{site.exampleIP4}}"   
   ]
   ```
{% elsif page.deployment == "cfn" %}
1. {{site.cnq.cfnUpdateStackComputeCache}}
1. {{site.cnq.cfnUseExistingTemplate}}
1. On the **Specify stack details** page, enter a lower value for **Number of Qumulo EC2 instances** (for example, `4`) and then click **Next**.
1. {{site.cnq.cfnRollbackOnFailure}}
1. On the **Review &lt;my-stack-name&gt;** page, click **Submit**.
{% endif %}

   The node and the infrastructure associated with the node are removed.

1. {{site.cnq.logIntoWebUI}}


<a id="increasing-soft-capacity-limit-existing-cluster"></a>
### Increasing the Soft Capacity Limit for an Existing Cluster
Increasing the soft capacity limit for an existing cluster is a two-step process:

1. Configure new persistent storage parameters.
2. Configure new compute and cache deployment parameters.

#### Step 1: Set New Persistent Storage Parameters
{% if page.deployment == "tf" %}
1. Edit the `terraform.tfvars` file in the `persistent-storage` directory and set the `soft_capacity_limit` variable to a higher value.
1. {{site.cnq.runTFapply}}

   {{site.cnq.reviewExecPlan}}

   {{site.cnq.tfCreatesNewBuckets}} and displays:

   * The `Apply complete!` message with a count of changed resources
     
   * The names of the created S3 buckets
     
   * Your deployment’s unique name
     
   * The new soft capacity limit

   ```
   Apply complete! Resources: 0 added, 1 changed, 0 destroyed.

   Outputs:

   bucket_names = [
     "{{site.exampleBucketName1}}",
     "{{site.exampleBucketName2}}",
     "{{site.exampleBucketName3}}",
     "{{site.exampleBucketName3}}",
   ]
   deployment_unique_name = "{{site.cnq.deploymentUniqueNameExampleAWS}}"
   ...
   soft_capacity_limit = "1000 TB"
   ```

#### Step 2: Update Existing Compute and Cache Resource Deployment
1. Navigate to the root directory of the `aws-terraform-cnq-<x.y>` repository.
1. {{site.cnq.runTFapplyWithFile}}

   {{site.cnq.reviewExecPlan}}

   Terraform updates the necessary IAM roles and S3 bucket policies, adds S3 buckets to the persistent storage list for the cluster, increases the soft capacity limit, and displays the `Apply complete!` message.
   
   When the Provisioner shuts down automatically, this process is complete.

{% elsif page.deployment == "cfn" %}
1. {{site.cnq.cfnUpdateStackPersistentStorage}}
1. {{site.cnq.cfnUseExistingTemplate}}
1. On the **Specify stack details** page, select a higher value for **Soft Capacity Limit** and then click **Next**.
1. {{site.cnq.cfnRollbackOnFailure}}
1. On the **Review &lt;my-stack-name&gt;** page, click **Submit**.

   CloudFormation updates resources for the stack and displays the **CREATE_COMPLETE** status for each resource.

1. {{site.cnq.logIntoWebUI}}

#### Step 2: Update Existing Compute and Cache Resource Deployment
1. {{site.cnq.cfnUpdateStackComputeCache}}
1. {{site.cnq.cfnUseExistingTemplate}}
1. On the **Specify stack details** page click **Next**.
1. {{site.cnq.cfnRollbackOnFailure}}
1. On the **Review &lt;my-stack-name&gt;** page, click **Submit**.

   CloudFormation updates resources for the stack and displays the **CREATE_COMPLETE** status for each resource.

   When the Provisioner shuts down automatically, this process is complete.
{% endif %}


### Scaling Your Existing CNQ on AWS Cluster
{% include important.html content="To minimize potential availability interruptions, you must perform this _cluster replacement procedure_ as a two-quorum event. For example, if you stop the existing EC2 instances by using the AWS Management Console and change the EC2 instance types, two quorum events occur _for each node_ and the read and write cache isn't optimized for the EC2 instance type." %}

You can scale an existing {{site.aws.cnqAWSshort}} cluster by changing the EC2 instance type. This is a three-step process:

1. Create a new deployment in a new {% if page.deployment == "tf" %}Terraform workspace{% elsif page.deployment == "cfn" %}CloudFormation stack{% endif %} and join the new EC2 instances to a quorum.
1. Remove the existing EC2 instances.
1. Clean up your S3 bucket policies.

{% if page.deployment == "tf" %}
#### Step 1: Create a New Deployment in a New Terraform Workspace
1. To create a new Terraform workspace, run the `terraform workspace new my-new-workspace-name` command.
1. To initialize the workspace, run the `terraform init` command.
1. Edit `config-standard.tfvars` or `config-advanced.tfvars`:

   1. Specify the value for the `q_instance_type` variable.
   1. Set the value of the `q_replacement_cluster` variable to `true`.
   1. Set the value of the `q_existing_deployment_unique_name` variable to the current deployment's name.
   1. (Optional) To change the number of nodes, specify the value for the `q_node_count` variable.

1. {{site.cnq.runTFapplyWithFile}}

   {{site.cnq.reviewExecPlan}}
   
   Terraform creates resources according the execution plan and displays:

   * The `Apply complete!` message with a count of added resources
      
   * Your deployment's unique name
  
   * The names of the created S3 buckets
     
   * The same floating IP addresses for your Qumulo cluster
     
   * New primary (static) IP addresses for your Qumulo cluster
     
   * The Qumulo Core Web UI endpoint

   ```
   Apply complete! Resources: 66 added, 0 changed, 0 destroyed.

   Outputs:

   cluster_provisioned = "Success"
   deployment_unique_name = "{{site.cnq.deploymentUniqueNameExampleAWS}}"
   ...
   persistent_storage_bucket_names = tolist([
     "{{site.exampleBucketName1}}",
     "{{site.exampleBucketName2}}",
     "{{site.exampleBucketName3}}",
     "{{site.exampleBucketName3}}",
   ])
   qumulo_floating_ips = [
     "{{site.exampleIP42}}",
     "{{site.exampleIP84}}",
     ...
   ]
   ...
   qumulo_primary_ips = [
     "{{site.exampleIP4}}",
     "{{site.exampleIP5}}",
     "{{site.exampleIP6}}",
     "{{site.exampleIP7}}"
   ]
   ...
   qumulo_private_url_node1 = "https://{{site.exampleEndpointIP0}}"
   ```
{% elsif page.deployment == "cfn" %}
#### Step 1: Create a New CloudFormation Stack
1. {{site.cnq.logIntoCFN}}

1. On the **Stacks** page, in the upper right, click **Create stack > With new resources (standard)**.

1. On the **Create stack** page, in the **Specify template** section, click **Amazon S3 URL**, enter the URL to your CloudFormation template, and then click **Next**.

1. On the **Specify stack details** page, take the following steps:

   1. In the **Provide a stack name** section, enter a **Stack name**, for example `my-compute-cache-replacement-stack`.
   
   1. In the **Parameters** section, under **Cloud Native Qumulo**, take the following steps:

      1. For **S3 bucket name**, enter [the name of the S3 bucket that you used to prepare your files](#prepare-required-files).

      1. For **S3 key prefix**, enter your S3 bucket prefix.

      1. For **S3 bucket region**, enter the same AWS region as the one for your S3 bucket.
  
      1. Select an **EC2 key pair**.

      1. For **Environment type**, select either **Dev** or **Prod**.

   1. Under **AWS network configuration**, take the following steps:

      1. Select a **VPC ID**.
     
      1. Enter **CIDR #1 for the Qumulo security group**.

      1. (Optional) Enter **CIDR #2 for the Qumulo security group**.
   
      1. Select the **Private subnet ID(s)**.

   1. Under **Qumulo file data platform configuration**, take the following steps:

      1. For the **Stack name from the persistent storage CloudFormation deployment**, enter [the name of the stack that you used to create your persistent storage](#persistent-storage-stack-name).

      1. For **Hot or Cold** cluster, select an S3 storage class.

      1. Select the **Qumulo EC2 instance type**.
     
      1. Enter the **Number of Qumulo EC2 instances**.

         This number determines the number of nodes in your Qumulo cluster.

      1. Enter the **Total number of Floating IPs for the Qumulo Cluster**.

         {% include tip.html content="If you intend to scale out your Qumulo cluster, enter 6 floating IP addresses for each EC2 instance." %}

      1. For **Replacement Cluster**, select **Yes**.

      1. For **Existing Deployment CloudFormation Stack Name**, enter the current stack name, for example, `my-compute-cache-stack`.

      1. Enter the **Qumulo software version**, **Qumulo cluster name**, and the **Qumulo cluster administrator password**.
  
   1. Click **Next**.

1. On the **Configure stack options** page, read and accept the two acknowledgements, and then click **Next**.

1. On the **Review and create** page, click **Submit**.
{% endif %}
1. {{verifyProvis}}
1. {{site.cnq.logIntoWebUI}}

{% if page.deployment == "tf" %}{% include note.html content="To perform future node addition or removal operations, edit the `config-standard.tfvars` or `config-advanced.tfvars` file and set the `q_replacement_cluster` variable to `false`." %}{% endif %}

#### Step 2: Remove the Existing EC2 Instances
{% if page.deployment == "tf" %}
1. To select the previous Terraform workspace (for example, `default`), run the `terraform workspace select default` command.
1. To ensure that the correct workspace is selected, run the `terraform workspace show` command.
1. {{site.cnq.runTFdestroyWithFile}}

   {{site.cnq.reviewExecPlan}}

   Terraform deletes resources according to the execution plan and displays the `Destroy complete!` message with a count of destroyed resources.
{% elsif page.deployment == "cfn" %}
1. To delete the previous CloudFormation stack, on the <strong>Stacks</strong> page, select the stack name for your previous deployment and then, in the upper right, click <strong>Stack actions &gt; Edit termination protection</strong>.
1. In the <strong>Edit termination protection for &lt;stack-name&gt;?</strong> dialog box, under <strong>Termination protection</strong>, click <strong>Deactivated</strong> and then click <strong>Save</strong>.
1. On the <strong>Stacks</strong> page, select the stack name for your previous deployment and then, in the upper right, click <strong>Delete</strong>.
1. In the <strong>Delete stack?</strong> dialog box, click <strong>Delete</strong>.
1. To ensure that the stack is deleted correctly, watch the deletion process.
{% endif %}

   The previous EC2 instances are deleted.

{% capture origPersStore %}The persistent storage deployment remains in its original {% if page.deployment == "tf" %}Terraform workspace{% elsif page.deployment == "cfn" %}CloudFormation stack{% endif %}. You can perform the next cluster replacement procedure in the {% if page.deployment == "tf" %}`default` workspace{% elsif page.deployment == "cfn" %}original CloudFormation stack{% endif %}.{% endcapture %}
{% include note.html content=origPersStore %}

#### Step 3: Clean Up S3 Bucket Policies
{% if page.deployment == "tf" %}
1. To list your Terraform workspaces, run the `terraform workspace list` command.
1. To select your new Terraform workspace, run the `terraform workspace select <my-new-workspace-name>` command.
1. Edit the `config-standard.tfvars` or `config-advanced.tfvars` file and set the `q_replacement_cluster` variable to `false`.
1. {{site.cnq.runTFapplyWithFile}} This ensures that the S3 bucket policies have least privilege.

   {{site.cnq.reviewExecPlan}}

   Terraform deletes resources according to the execution plan and displays the `Apply complete!` message with a count of destroyed resources.
{% elsif page.deployment == "cfn" %}
1. On the <strong>Stacks</strong> page, select the newly created stack and then, in the upper right, click <strong>Update</strong>.
1. {{site.cnq.cfnUseExistingTemplate}}
1. On the **Specify stack details** page, for **Replacement Cluster**, click **No**.
1. {{site.cnq.cfnRollbackOnFailure}}
1. On the **Review &lt;my-stack-name&gt;** page, click **Submit**.

   CloudFormation updates resources for the stack and displays the **CREATE_COMPLETE** status for each resource.
{% endif %}

<a id="deleting-existing-cluster"></a>
### Deleting an Existing Cluster
Deleting a cluster is a two-step process:

1. Delete your {{site.cnqLong}} resources.
1. Delete your persistent storage.

{{site.data.alerts.caution}}
<ul>
  <li>When you no longer need your cluster, you must back up all important data on the cluster safely before deleting the cluster.</li>
  <li>When you delete your cluster's cache and computer resources, it isn't possible to access your persistent storage anymore.</li>
</ul>
{{site.data.alerts.end}}

{% if page.deployment == "cfn" %}
1. Back up your data safely.
1. [Disable termination protection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-protect-stacks.html) for your CloudFormation stack.
1. To update your stack, do the following:
   1. On the **Stacks** page, select the existing stack and then, in the upper right, click **Update**.
   1. On the **Update stack** page, click **Use existing template** and then click **Next**.
   1. On the **Specify stack details** page, click **Next**.
   1. On the **Configure stack options** page, read and accept the two acknowledgements, and then click **Next**.
   1. On the **Review &lt;my-stack-name&gt;** page, click **Rollback on failure** and then click **Submit**.
1. [Delete your CloudFormation stack](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cfn-console-delete-stack.html).
{% elsif page.deployment == "tf" %}
#### Step 1: To Delete Your Cluster's {{site.cnqLong}} Resources
1. After you back up your data safely, edit your `config-standard.tfvars` or `config-advanced.tfvars` file and set the `term_protection` variable to `false`.
1. {{site.cnq.runTFapplyWithFile}}

   {{site.cnq.reviewExecPlan}}

   Terraform marks resources for deletion according to the execution plan and displays the `Apply complete!` message with a count of changed resources.
   
1. {{site.cnq.runTFdestroyWithFile}}

   {{site.cnq.reviewExecPlan}}

   Terraform deletes all of your cluster's {{site.cnqShort}} resources and displays the `Destroy complete!` message and a count of destroyed resources.

#### Step 2: To Delete Your Cluster's Persistent Storage
1. Navigate to the `persistent-storage` directory.
1. Edit your `terraform.tfvars` file and set the `prevent_destroy` parameter to `false`.
1. {{site.cnq.runTFapply}}

   {{site.cnq.reviewExecPlan}}

   Terraform marks resources for deletion according to the execution plan and displays the `Apply complete!` message with a count of changed resources.
   
1. {{site.cnq.runTFdestroy}}

   {{site.cnq.reviewExecPlan}}

   Terraform deletes all of your cluster's persistent storage and displays the `Destroy complete!` message and a count of destroyed resources.
{% endif %}
