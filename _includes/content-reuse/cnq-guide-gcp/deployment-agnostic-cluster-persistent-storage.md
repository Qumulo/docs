<a id="deploy-persistent-storage"></a>
## Step 1: Deploying Cluster Persistent Storage
This section explains how to deploy the GCS buckets that act as persistent storage for your Qumulo cluster.

### Part 1: Prepare the Required Files
Before you can deploy the persistent storage for your cluster, you must download and prepare the required files.

1. {{site.cnq.logIntoNexus}} and click **Downloads > {{site.cnq.nexusDropDown}}**.

1. On the **GCP** tab, in the **Download the required files** section, select the Qumulo Core version that you want to deploy and then download the corresponding Terraform configuration and Debian or RPM package.

1. In a new or existing GCS bucket, within your chosen prefix, create the `qumulo-core-install` directory.

1. Within this directory, create another directory with the Qumulo Core version as its name. For example:

   ```
    gs://my-gcs-bucket-name/my-prefix/qumulo-core-install/7.6.0
   ```

   {% capture newVer %}{{site.cnq.qCoreVerTip}}{% endcapture %}
   {% include tip.html content=newVer %}

1. {{site.cnq.copyDebAndConfig}}

1. Copy `qumulo-terraform-gcp-<x.y>.zip` to your Terraform environment and then decompress the file.

### Part 2: Configure the Persistent Storage
1. Navigate to the `persistent-storage` directory.

1. Edit the `provider.tf` file:

   * To store the Terraform state remotely, add the name of a GCS bucket to the section that begins with `backend "gcp" {`.

   * To store the Terraform state locally, comment out the section that begins with `backend "gcp" {` and uncomment the section that contains `backend = "local"`.

     {% capture noLocal %}{{site.cnq.dontRecommendLocalState}}{% endcapture %}
     {% include important.html content=noLocal %}

1. Run the `terraform init` command.

   Terraform prepares the environment and displays the message `Terraform has been successfully initialized!`

1. Edit the `terraform.tfvars` file.

   * Specify the `deployment_name` and the correct `gcp_region` for your cluster's persistent storage.
        
   * Set the `soft_capacity_limit` to `500` (or higher).

     {% include note.html content="This value specifies the initial capacity limit of your Qumulo clusters (in TB). It is possible to increase this limit at any time." %}

### Part 3: Create the Necessary Resources
1. To authenticate to your GCP account, use the `gcloud` CLI.

1. {{site.cnq.runTFapply}}
  
1. {{site.cnq.reviewExecPlan}}

   Terraform creates resources according to the execution plan and displays:

   * The names of the created GCS buckets
        
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
   deployment_unique_name = "{{site.cnq.deploymentUniqueNameExampleGCP}}"
   ```
