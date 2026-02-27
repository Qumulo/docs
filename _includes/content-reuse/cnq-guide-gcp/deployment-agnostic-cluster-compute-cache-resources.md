## Step 2: Deploying Cluster Compute and Cache Resources {#deploy-cluster-compute-and-cache-resources}
This section explains how to deploy compute and cache resources for a Qumulo cluster by using a Ubuntu image and the Qumulo Core `.deb` installer.

### Recommendations
{% include important.html content="We strongly recommend reviewing the following recommendations before beginning this process." %}

* Provisioning completes successfully when the Provisioner shuts down automatically. If the Provisioner doesn't shut down, the provisioning cycle has failed and you must troubleshoot it. {{site.cnq.monitorGCPProvisioner}}

* The first variable in the example configuration files in the `qumulo-terraform-gcp` repository is `deployment_name`. To help avoid conflicts between resource labels and other deployment components, {{site.cnq.deploymentUniqueName}}

* If you plan to deploy multiple Qumulo clusters, give the `q_cluster_name` variable a unique name for each cluster.

{% comment %}
* We recommend forwarding DNS queries to [Qumulo Authoritative DNS (QDNS)](../network-configuration/configuring-authoritative-dns.html). For multi-zone deployments, specify a value for `q_cluster_fqdn`. Qumulo Core uses this variable to forward DNS requests to your cluster, where Qumulo Core resolves DNS for your floating IP addresses.
{% endcomment %}

### Part 1: To Deploy the Cluster Compute and Cache Resources
1. Edit the `provider.tf` file:  

   * To store the Terraform state remotely, add the name of a GCS bucket to the sections that begin with `backend "gcp" {` and `data "terraform_remote_state" "persistent_storage" {`.

   * To store the Terraform state locally, comment the sections that begin with `backend "gcp" {` and `data "terraform_remote_state" "persistent_storage" {` and uncomment the section that contains `backend = "local"`.
   
     {% capture noLocal %}{{site.cnq.dontRecommendLocalState}}{% endcapture %}  
     {% include important.html content=noLocal %}

1. Navigate to the `qumulo-terraform-gcp-<x.y>/compute` directory and then run the `terraform init` command.

   Terraform prepares the environment and displays the message `Terraform has been successfully initialized!`

1. Edit the `terraform.tfvars` file and specify the values for all variables.

   For more information, see `README.pdf` in `qumulo-terraform-gcp-<x.y>.zip`.

1. {{site.cnq.runTFapply}}

1. {{site.cnq.reviewExecPlan}}

   Terraform creates resources according to the execution plan and displays:

   * Your deployment's unique name
  
   * The names of the created GCS buckets
     
   * The floating IP addresses for your Qumulo cluster
     
     {% include note.html content="You must specify the floating IP addresses in your `terraform.tfvars` file explicitly." %}
 
   * The primary (static) IP addresses for your Qumulo cluster
     
   * The Qumulo Core Web UI endpoint
   
   For example:
   
   ```
   deployment_unique_name = "{{site.cnq.deploymentUniqueNameExampleGCP}}"
   ...
   persistent_storage_bucket_names = tolist([
     "{{site.exampleBucketName1}}",
     "{{site.exampleBucketName2}}",
     "{{site.exampleBucketName3}}",
     ...
     "{{site.exampleBucketNameNoNumber}}16",
   ])
   qumulo_floating_ips = tolist([
     "{{site.exampleIP42}}",
     "{{site.exampleIP84}}",
     ...
   ])
   ...
   qumulo_primary_ips = tolist([
     "{{site.exampleIP5}}",
     "{{site.exampleIP6}}",
     "{{site.exampleIP7}}"
   ])
   ...
   qumulo_private_url_node1 = "https://{{site.exampleEndpointIP5}}"
   ```

### Part 2: To Mount the Qumulo File System

1. To log in to your cluster's Web UI, use the endpoint from the Terraform output and the username and password that you have configured.

   {% include important.html content="If you change the administrative password for your cluster by using the Qumulo Core Web UI, `qq` CLI, or REST API after deployment, you must update your password in GCP Secrets Manager." %}

   You can use the Qumulo Core Web UI to create and manage [NFS exports](../nfs/creating-nfs-export.html), [SMB shares](../smb/creating-smb-share.html), [snapshots](../snapshots/managing-snapshots.html), and [continuous replication relationships](../replicating-data/creating-managing-continuous-replication-relationship.html). You can also [join your cluster to Active Directory](../authentication-qumulo-core/configuring-ad.html), [configure LDAP](../authentication-qumulo-core/configuring-ldap.html), and [perform many other operations](../).

1. Mount your Qumulo file system by using NFS or SMB and your cluster's DNS name or IP address.
