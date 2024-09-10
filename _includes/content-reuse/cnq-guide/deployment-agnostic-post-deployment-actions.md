<a id="perform-post-deployment-actions"></a>
## Step 3: Performing Post-Deployment Actions
This section describes the common actions you can perform on a {{site.cnqShort}} cluster after deploying it.

<a id="adding-node-to-existing-cluster"></a>
### Adding a Node to an Existing Cluster
{% include important.html content="To add a node to an existing cluster, the total node count must be greater than that of the current deployment." %}

{% if page.deployment == "tf" %}
1. {{site.cnq.changeQnodeCount}} to a new value.
1. {{site.cnq.runTFapply}}
{% elsif page.deployment == "cfn" %}
1. {{site.cnq.logIntoCFN}}
1. {{site.cnq.cfnUpdateStackComputeCache}}
1. {{site.cnq.cfnUseExistingTemplate}}
1. On the **Specify stack details** page, enter a new value for **Node Count** and then click **Next**.
1. {{site.cnq.cfnConfigureStackOptions}}
1. {{site.cnq.cfnRollbackOnFailure}}
{% endif %}
{% capture verifyProvis %}To ensure that the Provisioner shut downs automatically, review the `/qumulo/{% if page.deployment == "tf" %}my-deployment-name{% elsif page.deployment == "cfn" %}my-stack-name{% endif %}/last-run-status` parameter in the AWS Parameter Store.{% endcapture %}
1. {{verifyProvis}}
1. {{site.cnq.logIntoWebUI}}

<a id="removing-node-from-existing-cluster"></a>
### Removing a Node from an Existing Cluster
Removing a node from an existing cluster is a two-step process. First, you remove the node from the cluster's quorum. Next, you tidy up your AWS resources.

#### Step 1: Remove the Node from the Cluster's Quorum
You must perform this step while the cluster is running.

1. Copy the `remove-nodes.sh` script from the `utilities` directory to an AWS Linux 2 AMI running in your VPC.

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
   
1. When prompted, confirm  the nodes' removal.
1. {{site.cnq.logIntoWebUI}}

#### Step 2: Tidy Up Your AWS Resources
{% if page.deployment == "tf" %}
1. {{site.cnq.changeQnodeCount}} to a lower value (for example, 4).
1. {{site.cnq.runTFapply}}
1. {{site.cnq.monitorProvisionerStatus}}
{% elsif page.deployment == "cfn" %}
1. {{site.cnq.cfnUpdateStackComputeCache}}
1. {{site.cnq.cfnUseExistingTemplate}}
1. On the **Specify stack details** page, enter a lower value for **Node Count** (for example, 4) and then click **Next**.
1. {{site.cnq.cfnConfigureStackOptions}}
1. {{site.cnq.cfnRollbackOnFailure}}
{% endif %}

   The node and the infrastructure associated with the node are removed.

1. {{site.cnq.logIntoWebUI}}

<a id="changing-ec2-instance-type-for-existing-cluster"></a>
### Changing the EC2 Instance Type for an Existing Cluster
Changing the EC2 instance type is a three-step process. First, you create a new deployment in a new {% if page.deployment == "tf" %}Terraform workspace{% elsif page.deployment == "cfn" %}CloudFormation stack{% endif %} (this process ensures that the required instances are available) and join the new instances to a quorum. Next, you clean up your S3 bucket policies. Finally, you remove the existing instances.

{% include important.html content="To avoid a number of potential issues, you must perform this _cluster replacement procedure_ as a two-quorum event. For example, if you stop the existing instances by using the AWS Management Console and change the instance types, two quorum events occur _for each node_ and the read and write cache isn't optimized for the instance type. Moreover, your system might experience resource constraints before you can change the type of every instance." %}

#### Step 1: Create a New Deployment in a New Terraform Workspace
{% if page.deployment == "tf" %}
1. To create a new Terraform workspace, run the `terraform workspace new my-new-workspace-name` command.
1. To initialize the workspace, run the `terraform init` command.
1. Use the existing deployment name or choose a new name.

   {% include note.html content="Regardless, Terraform assigns a unique name with an 11-digit alphanumeric suffix to your deployment." %}

1. Edit the `terraform.tfvars` file and take the following steps:

   1. Specify the value for the `q_instance_type` variable.
   1. Set the value of the `q_replacement_cluster` variable to `true`.
   1. Set the value of the `q_existing_deployment_unique_name` variable to the current deployment's name.
   1. (Optional) To change the number of nodes, specify the value for the `q_node_count` variable.

1. {{site.cnq.runTFapply}}
{% elsif page.deployment == "cfn" %}
1. {{site.cnq.logIntoCFN}}
1. On the **Stacks** page, in the upper right, click **Create stack > With new resources (standard)**.
1. On the **Create stack** page, in the **Specify template** section, click **Amazon S3 URL**, enter the URL to your CloudFormation template, and then click **Next**.
1. On the **Specify stack details** page, to use the same S3 buckets as before, enter _the same_ **Stack name** as the one you used for the [persistent storage](#deploy-persistent-storage) stack name and then review the information in the **Parameters** section:

   1. For **QReplacementCluster**, click **Yes**.
   1. For **QExistingDeploymentUniqueName**, enter the current stack name.
   1. For **QInstanceType**, enter the EC2 instance type.
   1. (Optional) To change the number of nodes, enter the **QNodeCount**
   1. Click **Next**.

1. On the **Configure stack options** page, click **Next**.

1. On the **Review and create** page, click **Submit**.
{% endif %}
1. {{verifyProvis}}
{% if page.deployment == "tf" %}1. To perform future node addition or removal operations, edit the `terraform.tfvars` file and set the `q_replacement_cluster` variable to `false`.{% endif %}
1. {{site.cnq.logIntoWebUI}}

#### Step 2: Remove the Existing Instances
{% if page.deployment == "tf" %}
1. To select the previous Terraform workspace (for example, `default`), run the `terraform workspace select <default>` command.
1. To ensure that the correct workspace is selected, run the `terraform output` command.
1. To delete the previous instance in its entirety, run the `terraform destroy` command.
{% elsif page.deployment == "cfn" %}
1. To delete the previous CloudFormation stack, on the <strong>Stacks</strong> page, select the stack name for your previous deployment and then, in the upper right, click <strong>Delete</strong>.
1. To ensure that the stack is deleted correctly, watch the deletion process.
{% endif %}

   The previous instances are deleted.

{% capture origPersStore %}The persistent storage deployment remains in its original {% if page.deployment == "tf" %}Terraform workspace{% elsif page.deployment == "cfn" %}CloudFormation stack{% endif %}. You can perform the next cluster replacement procedure in the original {% if page.deployment == "tf" %}Terraform workspace{% elsif page.deployment == "cfn" %}CloudFormation stack{% endif %}, and so on.{% endcapture %}
{% include note.html content=origPersStore %}

#### Step 3: Clean Up S3 Bucket Policies
{% if page.deployment == "tf" %}
1. To select the new Terraform workspace, run the `terraform workspace select <my-new-workspace-name>` command.
1. Edit the `terraform.tfvars` file and set the `q_replacement_cluster` variable to `false`.
1. {{site.cnq.runTFapply}}
   This ensures that the S3 bucket policies have least privilege.

{% elsif page.deployment == "cfn" %}
1. On the <strong>Stacks</strong> page, select the newly created stack and then, in the upper right, click <strong>Update</strong>.
1. {{site.cnq.cfnUseExistingTemplate}}
1. On the **Specify stack details** page, for **QReplacementCluster**, click **No**.
1. {{site.cnq.cfnConfigureStackOptions}}
1. {{site.cnq.cfnRollbackOnFailure}}
{% endif %}

<a id="increasing-soft-capacity-limit-existing-cluster"></a>
### Increasing the Soft Capacity Limit for an Existing Cluster
Increasing the soft capacity limit for an existing cluster is a two-step process. First, you set new persistent storage parameters. Next, you set new compute and cache deployment parameters.

#### Step 1: Set New Persistent Storage Parameters
{% if page.deployment == "tf" %}
1. Edit the `terraform.tfvars` file in the `persistent-storage` directory and set the `soft_capacity_limit` variable to a higher value.
1. {{site.cnq.runTFapply}}

   {{site.cnq.tfCreatesNewBuckets}}

#### Step 2: Update Existing Compute and Cache Resource Deployment
1. Navigate to the root directory of the `aws-terraform-cnq` repository.
1. {{site.cnq.runTFapply}}
{% elsif page.deployment == "cfn" %}
1. {{site.cnq.cfnUpdateStackPersistentStorage}}
1. {{site.cnq.cfnUseExistingTemplate}}
1. On the **Specify stack details** page, enter a higher value for **QSoftCapacityLimit** and then click **Next**.
1. {{site.cnq.cfnConfigureStackOptions}}
1. {{site.cnq.cfnRollbackOnFailure}}

   {{site.cnq.tfCreatesNewBuckets}}

#### Step 2: Update Existing Compute and Cache Resource Deployment
1. {{site.cnq.cfnUpdateStackComputeCache}}
1. {{site.cnq.cfnUseExistingTemplate}}
1. On the **Specify stack details** page click **Next**.
1. {{site.cnq.cfnConfigureStackOptions}}
1. {{site.cnq.cfnRollbackOnFailure}}
{% endif %}
   Terraform updates the necessary IAM roles and S3 bucket policies, adds S3 buckets to the persistent storage list for the cluster, and increases the soft capacity limit. When the Provisioner shuts down automatically, this process is complete.

<a id="deleting-existing-cluster"></a>
### Deleting an Existing Cluster
Deleting a cluster is a two-step process. First, you delete your {{site.cnqLong}} resources. Next you delete your persistent storage.

{{site.data.alerts.important}}
<ul>
  <li>When you no longer need your cluster, you must back up all important data on the cluster safely before deleting the cluster.</li>
  <li>When you delete your cluster's cache and computer resources, it isn't possible to access your persistent storage anymore.</li>
</ul>
{{site.data.alerts.end}}

{% if page.deployment == "cfn" %}
1. After you back up your data safely, [disable termination protection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-protect-stacks.html) for your CloudFormation stack.
1. To update your stack, do the following:
   1. On the **Stacks** page, select the existing stack and then, in the upper right, click **Update**.
   1. On the **Update stack** page, click **Use existing template** and then click **Next**.
   1. On the **Specify stack details** page, click **Next**.
   1. On the **Configure stack options** page, click **Next**.
   1. On the **Review &lt;my-stack-name&gt;** page, click **Rollback on failure** and then click **Submit**.
1. [Delete your CloudFormation stack](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cfn-console-delete-stack.html).
{% elsif page.deployment == "tf" %}
#### Step 1: To Delete Your Cluster's {{site.cnqLong}} Resources
1. After you back up your data safely, edit your `terraform.tfvars` file and set the `term_protection` variable to `false`.
1. {{site.cnq.runTFapply}}
1. {{site.cnq.runTFdestroy}}

   Terraform deletes all of your cluster's {{site.cnqShort}} resources.

#### Step 2: To Delete Your Cluster's Persistent Storage
1. Navigate to the `persistent-storage` directory.
1. Edit your `terraform.tfvars` file and set the `prevent_destroy` parameter to `false.
1. {{site.cnq.runTFapply}}
1. {{site.cnq.runTFdestroy}}

   Terraform deletes all of your cluster's persistent storage.
{% endif %}
