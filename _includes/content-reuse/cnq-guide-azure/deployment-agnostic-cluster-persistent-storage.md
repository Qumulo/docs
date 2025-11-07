## Step 1: Deploying Cluster Persistent Storage {#deploy-persistent-storage}
This section explains how to deploy the storage accounts that act as persistent storage for your Qumulo cluster.

### Part 1: Prepare the Required Files
Before you can deploy the persistent storage for your cluster, you must download and prepare the required files.

1. Log in to Nexus and click **Downloads > {{site.cnq.nexusDropDown}}**.

1. On the **Azure** tab and, in the **Download the required files** section, select the Qumulo Core version that you want to deploy and then download the corresponding Terraform configuration, Debian package.

1. In a storage account named `qumulo`, create the `images` directory. Within this directory, create another directory with the Qumulo Core version as its name. For example:

   ```
   my-storage-account/qumulo/images/7.2.3.2
   ```

   {% capture newVer %}{{site.cnq.qCoreVerTip}}{% endcapture %}
   {% include tip.html content=newVer %}

1. {{site.cnq.copyDebAndConfig}}

1. Copy `azure-terraform-cnq-<x.y>.zip` to your Terraform environment and decompress the file.

### Part 2: Configure the Persistent Storage
1. Navigate to the `persistent-storage` directory.

1. Edit the `provider.tf` file:

   * To store the Terraform state remotely, add the storage account details to the section that begins with `backend "azurerm" {`.

   * To store the Terraform state locally, comment out the section that begins with `backend "azurerm" {` and uncomment the section that contains `backend = "local"`.

     {% include important.html content="We don’t recommend storing the Terraform state locally for production deployments." %}

1. Run the `terraform init` command.

   Terraform prepares the environment and displays the message `Terraform has been successfully initialized!`

1. Edit the `terraform.tfvars` file.

   1. Specify the `deployment_name`, the `az_subscription_id`, and the correct `az_location` for your cluster's persistent storage.

   1. Specify the `az_subnet_name`, `az_vnet_name`, and the `az_vnet_rg` (resource group) for your Virtual Network.

   1. Set the `soft_capacity_limit` to `500` (or higher).

      {% include note.html content="This value specifies the initial capacity limit of your Qumulo clusters (in TB). It is possible to increase this limit at any time." %}

   1. {{site.azure.advancedAZresourceName}}     

### Part 3: Create the Necessary Resources
1. To authenticate to your Azure account, use the `az` CLI.

1. Run the `terraform apply` command.
  
1. {{site.cnq.reviewExecPlan}}

   Terraform creates resources according to the execution plan and displays:

   * The names of the created persistent storage accounts
 
   * Your persistent storage resource group's unique name

   For example:
      
   ```
   persistent_storage_accounts = tolist([
     "{{site.exampleStorageAccountName1}}",
     "{{site.exampleStorageAccountName2}}",
     "{{site.exampleStorageAccountName3}}",
     "{{site.exampleStorageAccountName4}}",
   ])
   persistent_storage_resource_group = "{{site.cnq.persistentStorageResourceGroupAzure}}"
   ```
