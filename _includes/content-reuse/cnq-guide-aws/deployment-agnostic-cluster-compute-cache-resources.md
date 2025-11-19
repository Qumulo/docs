## Step 2: Deploying Cluster Compute and Cache Resources {#deploy-cluster-compute-and-cache-resources}
This section explains how to deploy compute and cache resources for a Qumulo cluster by using a Ubuntu AMI and the Qumulo Core `.deb` installer.

### Recommendations
{% include important.html content="We strongly recommend reviewing the following recommendations before beginning this process." %}

{% if page.deployment == "cfn" %}
* Only when the CloudFormation stack finishes running can you begin to monitor the Provisioner. {{site.cnq.paramStore}} Until the Provisioner shuts down automatically, the provisioning process isn't complete and the Qumulo cluster isn't yet functional. 
{% elsif page.deployment == "tf" %}
* Provisioning completes successfully when the Provisioner shuts down automatically. If the Provisioner doesn't shut down, the provisioning cycle has failed and you must troubleshoot it. {{site.cnq.monitorProvisioner}}

* The first variable in the example configuration files in the `aws-terraform-cnq` repository is `deployment_name`. To help avoid conflicts between Network Load Balancers (NLBs), resource groups, cross-region CloudWatch views, and other deployment components, {{site.cnq.deploymentUniqueName}}
{% endif %}  

* If you plan to deploy multiple Qumulo clusters, give the `q_cluster_name` variable a unique name for each cluster.

* We recommend forwarding DNS queries to [Qumulo Authoritative DNS (QDNS)](../network-configuration/configuring-authoritative-dns.html). For a single-AZ deployment, to allow Qumulo Core to create an Amazon Route 53 outbound resolver, specify values for the `q_cluster_fqdn` and `second_private_subnet_id` variables. The resolver uses the `q_cluster_fqdn` variable to forward DNS requests to your cluster, where Qumulo Core resolves DNS for your floating IP addresses.

### Part 1: To Deploy the Cluster Compute and Cache Resources
1. Configure your VPC to use the gateway VPC endpoint for S3.

{% if page.deployment == "tf" %}
1. Edit the `provider.tf` file:

   * To store the Terraform state remotely, add the name of an S3 bucket to the sections that begin with `backend "s3" {` and `data "terraform_remote_state" "persistent_storage" {`.

   * To store the Terraform state locally, comment out the sections that begin with `backend "s3" {` and `data "terraform_remote_state" "persistent_storage" {` and uncomment the section that contains `backend = "local"`.

     {% capture noLocal %}{{site.cnq.dontRecommendLocalState}}{% endcapture %}
     {% include important.html content=noLocal %}

1. Navigate to the `aws-terraform-cnq-<x.y>` directory and then run the `terraform init` command.

   Terraform prepares the environment and displays the message `Terraform has been successfully initialized!`

1. Edit the `terraform.tfvars` file and specify the values for all variables.

   For more information, see `README.pdf` in `aws-terraform-cnq-<x.y>.zip`.

1. {{site.cnq.runTFapply}}

1. {{site.cnq.reviewExecPlan}}

   Terraform creates resources according to the execution plan and displays:  
   
   * Your deployment's unique name
  
   * The names of the created S3 buckets
     
   * The floating IP addresses for your Qumulo cluster

     {% include note.html content="You must specify the floating IP addresses in your `terraform.tfvars` file explicitly." %}   
  
   * The primary (static) IP addresses for your Qumulo cluster
     
   * The Qumulo Core Web UI endpoint
   
   For example:
   
   ```
   deployment_unique_name = "{{site.cnq.deploymentUniqueNameExampleAWS}}"
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

{% elsif page.deployment == "cfn" %}
1. In the S3 bucket that hosts your deployment files, find the URL to `templates/cnq-standard.template.yaml`. For example:

   ```
   https://my-bucket.s3.us-west-2.amazonaws.com/my-s3-bucket-prefix/templates/cnq-standard.template.yaml
   ```

1. Log in to the [AWS CloudFormation console](https://console.aws.amazon.com/cloudformation/home).

1. On the **Stacks** page, in the upper right, click **Create stack > With new resources (standard)**.

1. On the **Create stack** page, in the **Specify template** section, click **Amazon S3 URL**, enter the URL to `cnq-standard-template.yaml`, and then click **Next**.

1. On the **Specify stack details** page, take the following steps:

   1. In the **Provide a stack name** section, enter a **Stack name**, for example `my-compute-cache-stack`.
{: #compute-cache-stack-name}
   
   1. In the **Parameters** section, under **Cloud Native Qumulo**, take the following steps:

      1. For **S3 bucket name**, enter the name of the S3 bucket that you used to prepare your files

      1. For **S3 key prefix**, enter your S3 bucket prefix.
        
         {% capture tipSlash %}{{site.cnq.tipTrailingSlash}}{% endcapture %}
         {% include tip.html content=tipSlash %}

      1. For **S3 bucket region**, enter the same AWS region as the one for your S3 bucket.
  
      1. Select an **EC2 key pair**.

      1. For **Environment type**, select either **Dev** or **Prod**.

   1. Under **AWS network configuration**, take the following steps:

      1. Select a **VPC ID**.
     
      1. Enter **CIDR #1 for the Qumulo security group**.

      1. (Optional) Enter **CIDR #2 for the Qumulo security group**.
   
      1. Select the **Private subnet ID(s)**.

   1. Under **Qumulo file data platform configuration**, take the following steps:

      1. For the **Stack name from the persistent storage CloudFormation deployment**, enter [the name of the stack that you used to create your persistent storage](#persistent-storage-stack-name).

      1. For **Hot or Cold** cluster, select an S3 storage class.

      1. Select the **Qumulo EC2 instance type**.
     
      1. Enter the **Number of Qumulo EC2 instances**.

         This number determines the number of nodes in your Qumulo cluster.

      1. Enter the **Total number of Floating IPs for the Qumulo Cluster**.

         {% include tip.html content="If you intend to scale out your Qumulo cluster, enter 6 floating IP addresses for each EC2 instance." %}

      1. Enter the **Qumulo software version**, **Qumulo cluster name**, and the **Qumulo cluster administrator password**.
  
   1. Click **Next**.

1. On the **Configure stack options** page, read and accept the two acknowledgements, and then click **Next**.

1. On the **Review and create** page, click **Submit**.

   CloudFormation creates resources for the stack and displays the **CREATE_COMPLETE** status for each resource.
{% endif %}

### Part 2: To Mount the Qumulo File System

1. To log in to your cluster's Web UI, use the endpoint from the {% if page.deployment == "tf" %}Terraform output{% elsif page.deployment == "cfn" %}the **QumuloPrivateIP** key on the **Outputs** tab for this stack {% endif %} and the username and password that you have configured.

   {% include important.html content="If you change the administrative password for your cluster by using the Qumulo Core Web UI, `qq` CLI, or REST API after deployment, you must update your password in AWS Secrets Manager." %}

   You can use the Qumulo Core Web UI to create and manage [NFS exports](../nfs/creating-nfs-export.html), [SMB shares](../smb/creating-smb-share.html), [snapshots](../snapshots/managing-snapshots.html), and [continuous replication relationships](../replicating-data/creating-managing-continuous-replication-relationship.html) You can also [join your cluster to Active Directory](../authentication-qumulo-core/configuring-ad.html), [configure LDAP](../authentication-qumulo-core/configuring-ldap.html), and [perform many other operations](../).

1. Mount your Qumulo file system by using NFS or SMB and your cluster's DNS name or IP address.
