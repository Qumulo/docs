<a id="deploy-cluster-compute-and-cache-resources"></a>
## Step 2: Deploying Cluster Compute and Cache Resources
This section explains how to deploy compute and cache resources for a Qumulo cluster by using a Ubuntu AMI and the Qumulo Core `.deb` installer.

{{site.data.alerts.important}}
<ul>
{% if page.deployment == "cfn" %}
  <li>Only when the CloudFormation stack finishes running should you begin to monitor the AWS Parameter Store for the <code>last-ran-status</code> value for the provisioning instance. Until the provisioning instance shuts down automatically, the provisoning process isn't complete and the Qumulo cluster isn't yet functional.</li>  
{% elsif page.deployment == "tf" %}
  <li>Provisioning completes successfully when the provisioning instance shuts down automatically. If the provisioning instance doesn't shut down, the provisioning cycle has failed and must be troubleshooted. {{site.cnq.monitorProvisionerStatus}}</li>
  <li>The first variable in the example configuration files in the <code>aws-terraform-cnq</code> repository is <code>deployment_name</code>. To help avoid conflicts between Network Load Balancers (NLBs), resource groups, cross-region CloudWatch views, and other deployment components, Terraform ignores the <code>deployment_name</code> value and any changes to it. Terraform generates the additional <code>deployment_unique_name</code> variable; appends a random, 11-digit alphanumeric value to it; and then tags all future resources with this variable, which never changes during subsequent Terraform deployments.</li>
{% endif %}  
  <li>If you plan to deploy multiple Qumulo clusters, give the <code>q_cluster_name</code> variable a unique name for each cluster.</li>
  <li>(Optional) If you use Amazon Route 53 <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/hosted-zones-private.html">private hosted zones</a>, give the <code>q_fqdn_name</code> variable a unique name for each cluster</li>
  <li>Familiarize yourself with <a href="#how-the-provisioner-works">how the {{site.aws.cnqAWSshort}} Provisioner works</a> and don't interfere with its operation.</li>
</ul>
{{site.data.alerts.end}}

1. Configure your VPC to use the gateway VPC endpoint for S3.

   {% include important.html content="It isn't possible to deploy your cluster without a gateway." %}

{% if page.deployment == "tf" %}
1. Navigate to the `aws-terraform-cnq` directory.

1. Choose `config-standard.tfvars` or `config-advanced.tfvars` and fill in the values for all required variables. For more information, see `readme.pdf` in `aws-terraform-cnq.zip`.
{% elsif page.deployment == "cfn" %}
1. Log in to the [AWS CloudFormation console](https://console.aws.amazon.com/cloudformation/home).

1. On the **Stacks** page, in the upper right, click **Create stack > With new resources (standard)**.

1. On the **Create stack** page, in the **Specify template** section, click **Amazon S3 URL**, enter the URL to `cnq-standard-template.yaml`, and then click **Next**.

1. On the **Specify stack details** page, enter the **Stack name** and review the information in the **Parameters** section, and then click **Next**.

1. On the **Configure stack options** page, click **Next**.

1. On the **Review and create** page, click **Submit**.

   CloudFormation creates S3 buckets and their stack.
{% endif %}

1. To log in to your cluster's Web UI, use the IP address from the {% if page.deployment == "tf" %}Terraform output{% elsif page.deployment == "cfn" %}top-level stack output{% endif %} as the endpoint and the username and password that you have configured during deployment as the credentials.

   {% include important.html content="If you change the administrative password for your cluster by using the Qumulo Web UI, `qq` CLI, or REST API after deployment, you must add your new password to AWS Secrets Manager." %}

   You can use the Web UI to create and manage [NFS exports](../nfs/creating-nfs-export.html), [SMB shares](../smb/creating-smb-share.html), [snapshots](../snapshots/managing-snapshots.html), and [continuous replication relationships](../replicating-data/creating-managing-continuous-replication-relationship.html) You can also [join your cluster to Active Directory](https://care.qumulo.com/s/article/Join-your-Qumulo-Cluster-to-Active-Directory), [configure LDAP](../authentication-qumulo-core/configuring-ldap.html), and [perform many other operations](../).

1. Mount your Qumulo file system by using NFS or SMB and your cluster's DNS name or IP address.

   {% include tip.html content="You can configure DNS names with a Route 53 private hosted zone by using a template." %}
