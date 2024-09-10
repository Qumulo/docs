<a id="deploy-persistent-storage"></a>
## Step 1: Deploying Cluster Persistent Storage
This section explains how to deploy the S3 buckets that act as persistent storage for your Qumulo cluster.
1. Log in to Nexus, click **Downloads > Deployment on AWS**, and then download the {% if page.deployment == "cfn" %}CloudFormation template{% elsif page.deployment == "tf" %}Terraform configuration{% endif %}, Debian package, and host configuration file.

1. {{site.cnq.createSubdirInS3bucket}}

   ```
   my-s3-bucket-name/my-s3-bucket-prefix/qumulo-core-install/7.2.3
   ```

   {% capture newVer %}{{site.cnq.qCoreVerTip}}{% endcapture %}
   {% include tip.html content=newVer %}

1. {{site.cnq.copyDebAndConfig}}

1. Copy {% if page.deployment == "cfn" %}`aws-cloudformation-cnq.zip` to the `my-s3-bucket-name/my-s3-bucket-prefix/aws-cloudformation-cnq` directory.{% elsif page.deployment == "tf" %}aws-terraform-cnq.zip` to your Terraform environment{% endif %} and decompress it.
{% if page.deployment == "cfn" %}
1. Clone the {{page.varRepoLink}} to an S3 bucket and find the URL to `templates/persistent-storage.template.yaml`. For example:

   ```
   https://my-bucket.s3.us-west-2.amazonaws.com/aws-cloudformation-cnq/templates/persistent-storage.template.yaml
   ```

   {% capture newVer %}{{site.cnq.qCoreVerTip}}{% endcapture %}
   {% include tip.html content=newVer %}

1. {{site.cnq.logIntoCFN}}

1. On the **Stacks** page, in the upper right, click **Create stack > With new resources (standard)**.

1. On the **Create stack** page, in the **Specify template** section, click **Amazon S3 URL**, enter the URL to `persistent-storage.template.yaml`, and then click **Next**.

1. On the **Specify stack details** page, enter the **Stack name** and review the information in the **Parameters** section:

   1. Enter the **S3 bucket Region**.

   1. Select the **Soft Capacity Limit for the subsequent CNQ deployment**.
  
   1. Click **Next**.

1. On the **Configure stack options** page, click **Next**.

1. On the **Review and create** page, click **Submit**.

   CloudFormation creates S3 buckets and their stack.
{% elsif page.deployment == "tf" %}
1. Navigate to the `aws-terraform-cnq` directory and then run the `terraform init` command.

1. Navigate to the `persistent-storage` directory and then take the following steps:

   1. Review the `terraform.tfvars` file.

      * Specify the correct `aws_region` for your cluster's persistent storage.
        
      * Enter the `soft_capacity_limit`.

   1. Run the `terraform apply` command.

      {% include tip.html content="Note the value for `deployment_unique_name` that Terraform outputs. You will need this value for deploying your cluster." %}

   Terraform creates each S3 bucket with a unique state for its deployment.
{% endif %}
