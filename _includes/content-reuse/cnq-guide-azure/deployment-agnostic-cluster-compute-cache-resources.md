<a id="deploy-cluster-compute-and-cache-resources"></a>
## Step 2: Deploying Cluster Compute and Cache Resources
This section explains how to deploy compute and cache resources for a Qumulo cluster by using a Ubuntu AMI and the Qumulo Core `.deb` installer.

{{site.data.alerts.important}}
<ul>
  <li>Provisioning completes successfully when the Provisioner shuts down automatically. If the Provisioner doesn't shut down, the provisioning cycle has failed and you must troubleshoot it.  To monitor the provisioner's status, you can watch the Terraform status posts in your terminal or {{site.cnq.azureAppConfig}}.</li>
  <li>The first variable in the example configuration files in the <code>azure-terraform-cnq</code> repository is <code>deployment_name</code>. To help avoid conflicts between resource groups and other deployment components, {{site.cnq.deploymentUniqueName}}.</li> 
  <li>If you plan to deploy multiple Qumulo clusters, give the <code>q_cluster_name</code> variable a unique name for each cluster.</li>
</ul>
{{site.data.alerts.end}}

1. To add service endpoints to your Virtual Network, take the following steps:

   1. In the Azure Portal, click **Virtual Network**.

   1. On the left panel, click **Settings > Service endpoints**.

   1. On the **Service endpoints** page, add the `Microsoft.KeyVault` and `Microsoft.Storage` service endpoints to your Virtual Network.

   {% include important.html content="It isn't possible to deploy your cluster without these endpoints." %}

1. Navigate to the `azure-terraform-cnq-<x.y>` directory and then run the `terraform init` command.

   Terraform prepares the environment and displays the message `Terraform has been successfully initialized!`

1. In `terraform.tfvars`, fill in the values for all variables.

   (Optional) Specify an existing `advanced_az_resource_group_name`.

   For more information, see `README.pdf` in `azure-terraform-cnq-<x.y>.zip`.

1. {{site.cnq.runTFapply}}

1. {{site.cnq.reviewExecPlan}}

   Terraform creates resources according the execution plan and displays:

   * Your deployment's unique name

   * The IP address for your Provisioner

   * The floating IP addresses for your Qumulo cluster
  
     {% include note.html content="You must specify the floating IP addresses in your `terraform.tfvars` file explicitly." %}

   * The primary (static) IP addresses for your Qumulo cluster

   * The Qumulo Core Web UI endpoint

   For example:

   ```
   Outputs:

   deployment_unique_name = "{{site.cnq.deploymentUniqueNameExampleAzure}}"
   provisioner = {
     "provisioner_ip_address" = "{{site.exampleIP0}}"
     "qumulo_cluster_floating_ips" = [
       "{{site.exampleIP42}}",
       "{{site.exampleIP84}}",
       ...
     ]
   }
   ...
   qumulo_primary_ips = [
     "{{site.exampleIP1}}",
     "{{site.exampleIP2}}",
     "{{site.exampleIP3}}",
     "{{site.exampleIP4}}"
   ]
   ...
   qumulo_private_url_node1 = "https://{{site.exampleEndpointIP0}}"
   ```

### To Mount the Qumulo File System

1. To log in to your cluster's Web UI, use the endpoint from the Terraform output as the endpoint and the username and password that you have configured during deployment as the credentials.

   {% capture appConfig %}If you change the administrative password for your cluster by using the Qumulo Core Web UI, `qq` CLI, or REST API after deployment, you must add your new password {{site.cnq.azureAppConfig}}.{% endcapture %}
   {% include important.html content=appConfig %}

   You can use the Qumulo Core Web UI to create and manage [NFS exports](../nfs/creating-nfs-export.html), [SMB shares](../smb/creating-smb-share.html), [snapshots](../snapshots/managing-snapshots.html), and [continuous replication relationships](../replicating-data/creating-managing-continuous-replication-relationship.html) You can also [join your cluster to Active Directory](https://care.qumulo.com/s/article/Join-your-Qumulo-Cluster-to-Active-Directory), [configure LDAP](../authentication-qumulo-core/configuring-ldap.html), and [perform many other operations](../).

1. Mount your Qumulo file system by using NFS or SMB and your cluster's DNS name or IP address.
