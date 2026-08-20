---
title: "Deploying Cloud Native Qumulo on AWS with the Qumulo Terraform Provider"
summary: "This section explains how to deploy Cloud Native Qumulo (CNQ) on AWS by preparing your infrastructure, environment, and authentication; deploying and configuring your Qumulo cluster; mounting the Qumulo file system; and performing post-deployment actions such as adding and removing nodes"
permalink: /cloud-native-aws-administrator-guide/getting-started/terraform.html
redirect_from:
  - /aws-administrator-guide/getting-started/terraform.html
  - /aws-administrator-guide/getting-started/deploying-instance-terraform.html
sidebar: cloud_native_aws_administrator_guide_sidebar
---

For an overview of {{site.aws.cnqAWSshort}}, its prerequisites, and limits, see [How Cloud Native Qumulo Works](how-cloud-native-qumulo-works.html).

## Prerequisites {#prerequisites}
This section explains the prerequisites to deploying {{site.aws.cnqAWSshort}}.

### Qumulo Core
* **Deployment Version:** This deployment requires Qumulo Core 7.9.2 (or higher), which includes the required Ubuntu kernel and software upgrades and fixes.

  {% include tip.html content="To deploy the latest release, leave the `cluster_version` variable empty." %}

* **Metrics:** To allow your Qumulo cluster to report metrics to Qumulo, your AWS VPC must have outbound Internet connectivity through a [NAT gateway](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html) or a firewall. Your cluster shares no file data during this process.

  {{site.data.alerts.important}}
  Connectivity to the following endpoints is required to successfully deploy a Qumulo cluster and form a quorum:
  <ul>
    <li><code>api.missionq.qumulo.com</code></li>
    <li><code>api.nexus.qumulo.com</code></li>
  </ul>
  {{site.data.alerts.end}}

### AWS
* **VPC:** Configure your VPC to use the [S3 gateway VPC endpoint](https://docs.aws.amazon.com/vpc/latest/privatelink/vpc-endpoints-s3.html), attached to the route table that serves your cluster subnet.

  {% include important.html content="It isn't possible to complete deployment without this configuration." %}

* **AWS Region:** Your Region must have a sufficient EC2 On-Demand vCPU quota for your node count and for a temporary Provisioner instance.

  {% include tip.html content="Because a quota shortage can look identical to a capacity shortage, we recommend checking your service quotas before beginning deployment." %}

### Tools and authentication
* Install the following tools:
  * Terraform 1.11 (or higher)
  * Git CLI
  * AWS CLI

* Authenticate to the AWS API

  {{site.data.alerts.important}}
  Unless you use the <code>AdministratorAccess</code> managed IAM policy for your user or role, your custom IAM role or user must include the following AWS services:
  <ul class="three-columns">
    <li><code>ec2:*</code></li>
    <li><code>elasticloadbalancing:*</code></li>
    <li><code>iam:*</code></li>
    <li><code>kms:*</code></li>
    <li><code>logs:*</code></li>
    <li><code>s3:*</code></li>
    <li><code>secretsmanager:*</code></li>
    <li><code>ssm:*</code></li>
    <li><code>sts:*</code></li>
  </ul>
  
  For role definitions and ready-to-use policy statements, see <a href="https://qumulo.github.io/terraform-provider-qumulo-cloud/aws-byo-iam/">AWS Bring Your Own IAM Roles</a> in the Qumulo Terraform Provider documentation.
  {{site.data.alerts.end}}

### Working with the Qumulo-terraform-aws Repository
{% include note.html content="Existing clusters that used the previous deployment provisioning remain operational. For information about migrating your cluster to the new Terraform deployment method, see the [Import Guide](https://qumulo.github.io/terraform-provider-qumulo-cloud/import-guide/) in the Qumulo Terraform Provider documentation." %}

The [Qumulo-terraform-aws](https://github.com/Qumulo/Qumulo-terraform-aws) repository contains Terraform configurations that let you deploy S3 buckets and a {{site.cnqShort}} cluster with 1 or 3&ndash;24 nodes that adhere to the [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/) and have fully elastic compute and capacity.

This deployment uses the [Qumulo Terraform Provider](https://qumulo.github.io/terraform-provider-qumulo-cloud/), which greatly simplifies Terraform operations by ensuring that:
* Persistent storage and compute deploy together in a single Terraform workspace
* Node operations use a single variable and a single `terraform apply` command

### Working With the terraform apply Command
This section explains the most common scenarios that cause the `terraform apply` command to fail.

<table>
  <thead>
    <tr>
      <th>Symptom</th>
      <th>Potential Resolution</th>
    </tr>
</thead>
<tbody>
  <tr>
    <td>The command waits for a long time for EC2 capacity</td>
    <td>This is normal behavior. For more information, see <a href="#create-the-necessary-resources">Create the Necessary Resources</a>.</td>
  </tr>  
  <tr>
    <td>The command fails early in the process with an S3 access error</td>
    <td>
      The cluster subnet has no S3 gateway VPC endpoint. <a href="https://docs.aws.amazon.com/vpc/latest/privatelink/vpc-endpoints-s3.html">Add a VPC endpoint</a> and then associate it with the subnet's route table.
      {% include note.html content="It isn't possible to use a NAT gateway in this scenario." %}
    </td>
  </tr>
  <tr>
    <td>The command fails completely and removes the resources that it has created</td>
    <td>This is expected cleanup behavior. To resolve the issue, inspect <a href="#working-with-the-provisioner">the Provisioner's</a> logs, make any changes, and then run the <code>terraform apply</code> command again.</td>
  </tr>
</tbody>
</table>

{{site.data.alerts.tip}}
If the <code>terraform apply</code> command fails for a reason not listed in this section, {{ site.contactQumuloCare }} and include the following items with your request:
<ul>
  <li>AWS Region</li>
  <li>Terraform version</li>
  <li><code>Qumulo-terraform-aws</code> repository release version</li>
  <li>Any relevant CloudWatch logs</li>
</ul>
{{site.data.alerts.end}}

### Working with the Provisioner {#working-with-the-provisioner}
The Provisioner is a temporary EC2 instance (`m5.xlarge` by default) that configures your Qumulo cluster. The Terraform Provider launches it during cluster creation, scaling, and node replacement operations, and stops it when an operation completes.

To monitor the Provisioner's status, watch the Terraform operations in your terminal or inspect the Provisioner's entries in your CloudWatch Logs, for your deployment's AWS Region.

{% include tip.html content="The logs remain available after the Provisioner terminates. To find the log group, filter for your deployment's unique name or use the link in the Terraform command's output." %}


## Part 1: Deploying Your Qumulo Cluster {#deploy-your-qumulo-cluster}
This section explains how to prepare the required files, configure your deployment, and create the resources necessary for your Qumulo cluster.

### Step 1: Prepare the Required Files {#prepare-the-required-files}
During the following process, Terraform downloads the Qumulo Terraform Provider from Qumulo's registry. Later, the Provider installs Qumulo Core on your cluster's nodes.

1. To clone the `Qumulo-terraform-aws` repository and check out a specific release, run the following commands.

   ```bash
   git clone https://github.com/Qumulo/Qumulo-terraform-aws.git
   cd Qumulo-terraform-aws
   git checkout {{site.cnq.tfVersion}}
   ```

1. To understand the deployment variables, review the `terraform.tfvars.example` and `README` files.

### Step 2: Configure the Deployment {#configure-the-deployment}
1. Edit the `backend.tf` file, add the name of an S3 bucket for the Terraform state, and specify the Region for the deployment. For example:

   ```
   terraform {
     backend "s3" {
       bucket               = "my-bucket-for-tf-state"
       key                  = "tf-state/cnq/terraform.tfstate"
       region               = "us-west-2"
       use_lockfile         = true
       workspace_key_prefix = "tf-state-workspace"
     }
   }
   ```

   {{site.data.alerts.important}}
   <ul>
     <li>We don't recommend making further changes to this part of the configuration.</li>
     <li>{{site.cnq.dontRecommendLocalState}}</li>
   </ul>
   {{site.data.alerts.end}}

1. Run the `terraform init` command.

   Terraform prepares the environment, downloads the Qumulo Terraform Provider from Qumulo's registry, verifies its GPG-signed checksums, and displays the message `Terraform has been successfully initialized!`

   {{site.data.alerts.note}}
   <ul>
     <li>The <code>terraform init</code> command reports that the Qumulo provider is self-signed. This is expected for providers hosted outside <code>registry.terraform.io</code> and isn't a security issue; Terraform still performs full signature and checksum verification. For more information, see <a target="_blank" href="https://qumulo.github.io/terraform-provider-qumulo-cloud/installation-trust/">Installation and Trust</a> in the Qumulo Terraform Provider documentation.</li>
     <li>If the <code>terraform init</code> command can't reach the Provider registry, allow outbound HTTPS to <code>qumulo-terraform-registry.s3.us-east-1.amazonaws.com</code>.</li>
   </ul>
   {{site.data.alerts.end}}

1. Edit the `terraform.tfvars` file and specify the following required values for your deployment:

   * **Basic Details:** `deployment_name`, `ec2_key_pair`, and the `region` for your cluster

   * **Networking:** `vpc_id` and `subnet_ids`

      * **Single-AZ (Availability Zone) Deployment:** Specify 1 private subnet
        
      * **Multi-AZ Deployment:** Specify 3 subnets, one for each AZ

   * **Cluster Configuration:** `instance_type` and `node_count` (1, or 3&ndash;24)

      {% include note.html content="A 4-node cluster can support only a single-AZ deployment." %}

   * **Soft Capacity Limit:** If you don't use the default limit, specify `soft_capacity_limit_tb` to set the initial capacity limit of your Qumulo cluster (in TB).

      {% include note.html content="It is possible to increase this limit at any time, but not to decrease it." %}

   * **Cluster / Active Directory Name:** `cluster_name`

   * **Qumulo Core Version:** `cluster_version`

     * **Specific Release:** Specify `7.9.2.1` (or higher)
       
     * **Latest Release:** Don't enter a value

1. Specify the administrator password. The password variable accepts a plain-text value or an AWS Secrets Manager ARN.

   {% capture sensPass %}The system treats the administrator password as sensitive: It never writes it to Terraform states and reads it anew for every Terraform run.{% endcapture %}
   {{site.data.alerts.important}}
   <ul>
     <li>{{ sensPass }}</li>
     <li>We strongly recommend passing a <a href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/create_secret.html">Secrets Manager ARN</a> by rotating the secret in your store and allowing the next Terraform run to pick it up. Because secret handling functionality is located outside the Provider, you can also source the password from a HashiCorp Vault or another pipeline-integrated secrets store.</li>
   </ul>
   {{site.data.alerts.end}}

### Step 3: Create the Necessary Resources {#create-the-necessary-resources}
{% include note.html content="If EC2 capacity is unavailable in your Availability Zone, you can select a different Availability Zone, deploy multi-AZ, or increase the create timeout and let the provider keep retrying." %}

1. To authenticate to your AWS account, use the `aws` CLI.

1. {{site.cnq.runTFapply}}

1. {{site.cnq.reviewExecPlan}}

   Terraform creates resources according to the execution plan and displays:

   * The names of the created S3 buckets

   * Your deployment's unique name

   * The floating IP addresses for your Qumulo cluster (single-AZ deployments)

   * The primary (static) IP addresses

   * The Qumulo Core Web UI endpoint

   For example:
   ```
   cluster_soft_capacity_limit_tb = 500
   cluster_uuid = "{{site.exampleUUID41}}"
   deployment_unique_name = "{{site.cnq.deploymentUniqueNameExampleAWS}}"
   endpoint_ips = tolist([
     "{{site.exampleIP1}}",
     "{{site.exampleIP2}}",
     "{{site.exampleIP3}}",
   ])
   endpoints = {
     "api" = "https://{{site.exampleIP1}}:8000"
     "nfs" = "{{site.exampleIP1}}:/<NFS Export Name>"
     "smb" = "\\\\{{site.exampleIP1}}\\<SMB Share Name>"
     "web_ui" = "https://{{site.exampleIP1}}"
   }
   primary_ips = tolist([
     "{{site.exampleIP5}}",
     "{{site.exampleIP6}}",
     "{{site.exampleIP7}}",
   ])
   provisioner_log = "https://us-west-2.console.aws.amazon.com/cloudwatch/..."
   ```


## Part 2: Mounting the Qumulo File System {#mounting-the-qumulo-file-system}
1. To log in to your cluster's Web UI, use the endpoint from the Terraform output and the username and password that you have configured.

   {{site.data.alerts.important}}
   <ul>
     <li>{{ sensPass }}</li>
     <li>If you change the administrator password by using the Qumulo Core Web UI, Qumulo REST API, or <code>qq</code> CLI after deployment, although Terraform configuration remains unaffected, we recommend keeping your secrets store up to date with your cluster's settings, so that future redeployments use the correct value.</li>
   </ul>
   {{site.data.alerts.end}}

   You can use the Qumulo Core Web UI to create and manage the following:
   * [NFS exports](../nfs/creating-nfs-export.html)
   * [SMB shares](../smb/creating-smb-share.html)
   * [Snapshots](../snapshots/managing-snapshots.html)
   * [Continuous replication relationships](../replicating-data/creating-managing-continuous-replication-relationship.html)
   
   You can also [join your cluster to Active Directory](../authentication-qumulo-core/configuring-ad.html) and [configure LDAP](../authentication-qumulo-core/configuring-ldap.html).

1. Mount your Qumulo file system by using NFS or SMB and your cluster's DNS name or an IP address from the Terraform output.

   
## Part 3: Performing Post-Deployment Actions {#part-3-perform-post-deployment-actions}
This section describes the common actions you can perform on a {{site.cnqShort}} cluster after deploying it: adding and removing nodes, increasing the soft capacity limit for a cluster, changing the EC2 instance type and deleting a cluster.

{{site.data.alerts.important}}
<ul>
  <li>After you create your Qumulo cluster, the deployed version (and the <code>cluster_version</code> variable) becomes immutable in the Terraform configuration. It isn't possible to upgrade Qumulo Core by changing this variable or by performing a Terraform operation.</li>
  <li>To upgrade Qumulo Core, use the Qumulo Core Web UI or the <code>qq</code> CLI. For more information, see <a href="../upgrading-qumulo-core/performing-upgrades.html">Performing Upgrades</a>.</li>
  <li>For all node addition and EC2 instance type change operations, the Qumulo Terraform Provider deploys the same Qumulo Core version as the one that your cluster is currently running.</li>
</ul>
{{site.data.alerts.end}}

### Adding Nodes to an Existing CNQ on AWS Cluster {#adding-node-to-existing-cluster}
1. Edit the `terraform.tfvars` file and set `node_count` to a higher value.

1. {{site.cnq.runTFapply}}

1. Review the Terraform execution plan, confirm that it shows an in-place update, and then enter `yes`.

Terraform adds the nodes to your cluster and displays the additional primary (static) IP addresses.

### Removing Nodes from an Existing CNQ on AWS Cluster {#removing-node-from-existing-cluster}
Removing nodes is a single Terraform operation. The Qumulo Terraform Provider handles the separate quorum removal and resource cleanup steps.

1. Edit the `terraform.tfvars` file and set `node_count` to a lower value.

1. {{site.cnq.runTFapply}}

1. {{site.cnq.reviewExecPlan}}

The specified nodes are removed from your cluster.

### Increasing the Soft Capacity Limit for an Existing CNQ on AWS Cluster {#increasing-soft-capacity-limit-existing-cluster}
{{site.data.alerts.important}}
<ul>
  <li>A single operation can increase the soft capacity limit by less than 5,000 TB.</li>
  <li>We recommend applying larger increases in incremental steps.</li>
  <li>It isn't possible to decrease the soft capacity limit.</li>
</ul>
{{site.data.alerts.end}}

1. Edit the `terraform.tfvars` file and set `soft_capacity_limit_tb` to a higher value.

1. {{site.cnq.runTFapply}}

1. {{site.cnq.reviewExecPlan}}

{{site.cnq.tfCreatesNewBuckets}}, updates the IAM roles and S3 bucket policies, and increases the soft capacity limit.

### Changing the EC2 Instance Type of a CNQ on AWS Cluster {#changing-the-ec2-instance-type}
The Qumulo Terraform Provider performs the replacement natively within the existing deployment.

{% include important.html content="Changing the EC2 instance type creates new instances of the specified type, joins them to the cluster quorum, then removes the existing instances." %}

1. Edit the `terraform.tfvars` file and specify the new `instance_type`.

1. {{site.cnq.runTFapply}}

1. Review the Terraform execution plan, and then enter `yes`.

### Deleting an Existing CNQ on AWS Cluster {#deleting-existing-cluster}
{{site.data.alerts.caution}}
<ul>
  <li>When you no longer need your cluster, you must back up all important data on the cluster safely before deleting the cluster. Deleting the cluster deletes its compute and cache resources and its persistent storage.</li>
  <li>The system won't run the <code>terraform destroy</code> command unless you disable deletion protection and then apply this change.</li>
</ul>
{{site.data.alerts.end}}

1. After you back up your data safely, edit your `terraform.tfvars` file and set the deletion protection variable to `false`.

1. Run the `terraform apply` command, review the Terraform execution plan, and then enter `yes`.

1. {{site.cnq.runTFdestroy}}

1. {{site.cnq.reviewExecPlan}}

   Terraform deletes all of your cluster's resources, including the persistent storage, and displays the `Destroy complete!` message with a count of destroyed resources.
