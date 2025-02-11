<a id="deploy-persistent-storage"></a>
## Step 1: Deploying Cluster Persistent Storage
This section explains how to deploy the Azure Storage Accounts that act as persistent storage for your Qumulo cluster.

1. Log in to Nexus and click **Downloads > {{site.cnq.nexusDropDown}}**.

1. On the **Azure** tab and, in the **Download the required files** section, select the Qumulo Core version that you want to deploy and then download the corresponding Terraform configuration, Debian package, and host configuration file.

1. In an Azure Storage Account Container named `qumulo`, create the `images` directory. Within this directory, create another directory with the Qumulo Core version as its name. The following is an example path:

   ```
   my-storage-account/qumulo/images/7.2.3.2
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
     
      * (Optional) Specify an existing `advanced_az_resource_group_name`.

   1. Use the `az` CLI to authenticate to your Azure account.

   1. Run the `terraform apply` command.
  
      {{site.cnq.tfDispExecPlan}}

   1. {{site.cnq.reviewExecPlan}}

      Terraform creates resources according the execution plan and displays:

      * The names of the created persistent storage accounts
 
      * Your persistent storage resource group's unique name

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
      ```
