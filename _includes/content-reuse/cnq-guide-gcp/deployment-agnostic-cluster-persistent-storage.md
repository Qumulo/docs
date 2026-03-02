## Step 1: Deploying Cluster Persistent Storage {#deploy-persistent-storage}
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
To configure the persistent storage, you must specify storage configuration in the `backend.tf` and `terraform.tfvars` files.

1. Navigate to the `persistent-storage` directory and edit the `backend.tf` file:

   * To use remote storage, do the following:

     1. Set the `bucket` variable to the name of your GCS bucket.
        
     1. Set the `prefix` variable to the your GCS bucket prefix.

   * To use local storage, comment out the entire `terraform` section.

1. Edit the `terraform.tfvars` file:

   * To store the Terraform state remotely, do the following:

     1. Set the `tf_persistent_storage_backend_type` variable to `gcs`.

     1. Set the `tf_persistent_storage_backend_bucket` variable to the name of your GCS bucket.

     1. Set the `tf_persistent_storage_backend_prefix` variable to your GCS bucket prefix.

   * To store the Terraform state locally, set the `tf_persistent_storage_backend_type` variable to `local`.

     {% capture noLocal %}{{site.cnq.dontRecommendLocalState}}{% endcapture %}
     {% include important.html content=noLocal %}

1. Run the `terraform init` command.

   Terraform prepares the environment and displays the message `Terraform has been successfully initialized!`

1. Edit the `terraform.tfvars` file.

   1. Specify the `deployment_name` and the correct `gcp_region` for your cluster's persistent storage.
        
   1. Set the `soft_capacity_limit` to `500` (or higher).

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
