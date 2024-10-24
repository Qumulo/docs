<a id="deploy-persistent-storage"></a>
## Step 1: Deploying Cluster Persistent Storage
This section explains how to deploy the Azure Storage Accounts that act as persistent storage for your Qumulo cluster.

{% include important.html content="Your Azure Storage Account Container must have hierarchical spaces enabled." %}

1. Log in to Nexus and click **Downloads > {{site.cnq.nexusDropDown}}**.

1. Click the **Azure** tab and, in the **Download the required files** section, select the Qumulo Core version that you want to deploy and then download the corresponding Terraform configuration, Debian package, and host configuration file.

1. In an Azure Storage Account Container create the `qumulo-core-install` directory. Within this directory, create another directory with the Qumulo Core version as its name. The following is an example path:

   ```
   my-storage_account/my-prefix/qumulo-core-install/7.2.3.1
   ```

   {% capture newVer %}{{site.cnq.qCoreVerTip}}{% endcapture %}
   {% include tip.html content=newVer %}

1. {{site.cnq.copyDebAndConfig}}

1. Copy `azure-terraform-cnq-<x.y>.zip` to your Terraform environment and decompress it.

1. Navigate to the `persistent-storage` directory and take the following steps:

   1. Run the `terraform init` command.

      Terraform prepares the environment and displays the message `Terraform has been successfully initialized!`

   1. Review the `terraform.tfvars` file.

      * Specify the `deployment_name` and the correct `az_subscription_id` for your cluster's persistent storage.

      * Specify the correct `az_location` for your cluster's persistent storage.

      * Leave the `soft_capacity_limit` at `1000`.

   1. Use the `az` CLI to authenticate to your Azure account.

   1. Run the `terraform apply` command.
  
      {{site.cnq.tfDispExecPlan}}

   1. {{site.cnq.reviewExecPlan}}

      Terraform creates resources according the execution plan and displays:

      * The `Apply complete!` message with a count of added resources

      * The names of the created Storage Accounts

      * Your deployment's unique name

      For example:

      ```
      Apply complete! Resources: 15 added, 0 changed, 0 destroyed.

      Outputs:

      bucket_names = [
        "{{site.exampleStorageAccountName1}}",
        "{{site.exampleStorageAccountName2}}",
        "{{site.exampleStorageAccountName3}}",
        "{{site.exampleStorageAccountName4}}",
      ]
      deployment_unique_name = "{{site.cnq.deploymentUniqueNameExample}}"
      ...
      ```

      {% include tip.html content="You will need the `deployment_unique_name` value to deploy your cluster." %}
