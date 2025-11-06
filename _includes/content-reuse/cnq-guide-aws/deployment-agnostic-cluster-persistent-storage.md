## Step 1: Deploying Cluster Persistent Storage {#deploy-persistent-storage}
This section explains how to deploy the S3 buckets that act as persistent storage for your Qumulo cluster.

### Part 1: Prepare the Required Files
Before you can deploy the persistent storage for your cluster, you must download and prepare the required files.

1. {{site.cnq.logIntoNexus}} and click **Downloads > {{site.cnq.nexusDropDown}}**.

1. On the **AWS** tab, in the **Download the required files** section, select the Qumulo Core version that you want to deploy and then download the corresponding {% if page.deployment == "cfn" %}CloudFormation template{% elsif page.deployment == "tf" %}Terraform configuration{% endif %} and Debian or RPM package.

1. In a new or existing S3 bucket, within your S3 bucket prefix, create the `qumulo-core-install` directory.

1. Within this directory, create another directory with the Qumulo Core version as its name. For example:

   ```
   my-s3-bucket-name/my-s3-bucket-prefix/qumulo-core-install/7.5.0
   ```

   {% capture newVer %}{{site.cnq.qCoreVerTip}}{% endcapture %}
   {% include tip.html content=newVer %}

1. {{site.cnq.copyDebAndConfig}}

{% if page.deployment == "cfn" %}
1. Decompress `aws-cloudformation-cnq-<x.y>.zip` locally and copy it to your S3 bucket prefix.
{% elsif page.deployment == "tf" %}
1. Copy `aws-terraform-cnq-<x.y>.zip` to your Terraform environment and then decompress the file.
{% endif %}

{% if page.deployment == "cfn" %}
1. Find the URL to `templates/persistent-storage.template.yaml`. For example:

   ```
   https://my-bucket.s3.us-west-2.amazonaws.com/my-s3-bucket-prefix/templates/persistent-storage.template.yaml
   ```

   {% capture newVer %}{{site.cnq.qCoreVerTip}}{% endcapture %}
   {% include tip.html content=newVer %}

### Part 2: Create the CloudFormation Stack {#create-cloudformation-stack}

1. {{site.cnq.logIntoCFN}}

1. On the **Stacks** page, in the upper right, click **Create stack > With new resources (standard)**.

1. On the **Create stack** page, in the **Specify template** section, click **Amazon S3 URL**, enter the URL to `persistent-storage.template.yaml`, and then click **Next**.

1. On the **Specify stack details** page, take the following steps:

   1. Enter a **Stack name**, for example `my-storage-stack`.
{: #persistent-storage-stack-name}

   1. For **S3 bucket name**, enter the name of the S3 bucket that you used to prepare your files.

   1. For **S3 key prefix**, enter your S3 bucket prefix.

   1. For **S3 bucket region**, enter the same AWS region as the one for your S3 bucket.
  
   1. Click **Next**.

1. On the **Configure stack options** page, read and accept the two acknowledgements, and then click **Next**.

1. On the **Review and create** page, click **Submit**.

   CloudFormation creates resources for the stack and displays the **CREATE_COMPLETE** status for each resource.
{% elsif page.deployment == "tf" %}
### Part 2: Configure the Persistent Storage
1. Navigate to the `persistent-storage` directory.

1. Edit the `provider.tf` file:

   * To store the Terraform state remotely, add the name of an S3 bucket to the section that begins with `backend "s3" {`.

   * To store the Terraform state locally, comment out the section that begins with `backend "s3" {` and uncomment the section that contains `backend = "local"`.

     {% capture noLocal %}{{site.cnq.dontRecommendLocalState}}{% endcapture %}
     {% include important.html content=noLocal %}

1. Run the `terraform init` command.

   Terraform prepares the environment and displays the message `Terraform has been successfully initialized!`

1. Edit the `terraform.tfvars` file.

   * Specify the `deployment_name` and the correct `aws_region` for your cluster's persistent storage.
        
   * Set the `soft_capacity_limit` to `500` (or higher).

     {% include note.html content="This value specifies the initial capacity limit of your Qumulo clusters (in TB). It is possible to increase this limit at any time." %}

### Part 3: Create the Necessary Resources
1. To authenticate to your AWS account, use the `aws` CLI.

1. {{site.cnq.runTFapply}}
  
1. {{site.cnq.reviewExecPlan}}

   Terraform creates resources according to the execution plan and displays:

   * The names of the created S3 buckets
        
   * Your deployment's unique name
     
   For example:
     
   ```
   persistent_storage_bucket_names = tolist([
     "{{site.exampleBucketName1}}",
     "{{site.exampleBucketName2}}",
     "{{site.exampleBucketName3}}",
     ...
     "{{site.exampleBucketNameNoNumber}}16"
   ])
   deployment_unique_name = "{{site.cnq.deploymentUniqueNameExampleAWS}}"
   ```
{% endif %}
