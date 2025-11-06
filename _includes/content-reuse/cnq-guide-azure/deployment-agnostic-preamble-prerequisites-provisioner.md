For an overview of {{site.azure.cnqAzureShort}}, its prerequisites, and limits, see [How Cloud Native Qumulo Works](how-cloud-native-qumulo-works.html).

The {{page.varRepoLink}} contains comprehensive Terraform configurations that let you deploy storage accounts and then create a {{site.cnqShort}} cluster with 3 to 24 instances and have fully elastic compute and capacity.

## Prerequisites
This section explains the prerequisites to deploying {{site.azure.cnqAzureShort}}.

* To allow your Qumulo instance to report metrics to Qumulo, your Azure Virtual Network must have outbound Internet connectivity through a NAT gateway or a firewall. Your instance shares no file data during this process.

  {{site.data.alerts.important}}
  Connectivity to the following endpoints is required for a successful deployment of a Qumulo instance and quorum formation:
  <ul>
    <li><code>api.missionq.qumulo.com</code></li>
    <li><code>api.nexus.qumulo.com</code></li>
  </ul>
  {{site.data.alerts.end}}

* Before you configure your Terraform environment, you must sign in to the `az` CLI.

* Ensure that your Azure subscription includes the `Reader` and `Contributor` role assignments.

* For scenarios in which your {{site.cnqShort}} cluster must run in a secure environment, you must make the following changes in the `terraform.tfvars` file before deploying your cluster's persistent storage:

  * Set the `disable_public_network_access` variable to `true`

  * Specify the values for the `privatelink_blob_dns_zone_resource_group_name` and `privatelink_blob_dns_zone_virtual_link_name` variables

### How the {{site.cnqShort}} Provisioner Works {#how-the-provisioner-works}
The {{site.cnqShort}} Provisioner is an Azure Compute instance that configures your Qumulo cluster and any additional Azure environment requirements.

The Provisioner stores all necessary state information {{site.cnq.azureAppConfig}} and shuts down automatically when it completes its tasks.
