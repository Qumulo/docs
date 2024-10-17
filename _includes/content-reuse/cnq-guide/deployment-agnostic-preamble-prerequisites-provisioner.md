For an overview of {{site.aws.cnqAWSshort}}, its prerequisites, and limits, see [How Cloud Native Qumulo Works](how-cloud-native-qumulo-works.html).

The {{page.varRepoLink}} contains comprehensive {% if page.deployment == "tf" %}Terraform configurations{% elsif page.deployment == "cfn" %}CloudFormation templates{% endif %} that let you deploy S3 buckets and then create a {{site.cnqShort}} cluster with 4 to 24 instances that adhere to the [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/) and have fully elastic compute and capacity.

## Prerequisites
This section explains the prerequisites to deploying {{site.aws.cnqAWSshort}}.

* To allow your Qumulo instance to report metrics to Qumulo, your AWS VPC must have outbound Internet connectivity through a NAT gateway or a firewall. Your instance shares no file data during this process.

  {{site.data.alerts.important}}
  Connectivity to the following endpoints is required for a successful deployment of a Qumulo instance and quorum formation:
  <ul>
    <li><code>api.missionq.qumulo.com</code></li>
    <li><code>api.nexus.qumulo.com</code></li>
  </ul>
  {{site.data.alerts.end}}

* The following features require specific versions of Qumulo Core:

  <table>
    <thead>
      <tr>
        <th>Feature</th>
        <th>Minimum Qumulo Core Version</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <ul>
            <li>Adding S3 buckets to increase persistent storage capacity</li>
            <li>Increasing the soft capacity limit for an existing {{site.cnqShort}} cluster</li>
          </ul>
        </td>
        <td>7.2.1.1</td>
      </tr>      
      <tr>
        <td>
          <ul>
            <li><a href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/intelligent-tiering-overview.html">S3 Intelligent-Tiering storage class</a></li>
            <li><a href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage-class-intro.html#sc-dynamic-data-access">Infrequent Access S3 access tier</a></li>
          </ul>
        </td>
        <td>7.2.0.2</td>
      </tr>
      <tr>
        <td>
          Creating persistent storage
          {% capture sepDep %}You must create persistent storage by using a separate {% if page.deployment == "cfn" %}CloudFormation stack{% elsif page.deployment == "tf" %}Terraform deployment{% endif %} <em>before</em> you deploy the compute and cache resources for your cluster.{% endcapture %}
          {% include important.html content=sepDep %}
        </td>
        <td>7.1.3 with version 4.0 of the deployment scripts</td>
      </tr>
    </tbody>
  </table>
{% if page.deployment == "cfn" %}
* Before you configure your CloudFormation template, you must sign in to the AWS Management Console.
{% elsif page.deployment == "tf" %}
* Before you configure your Terraform environment, you must sign in to the AWS CLI.
{% endif %}

  A custom IAM role or user must include the following AWS services:

  <ul class="three-columns">
    <li><code>cloudformation:*</code></li>
    <li><code>ec2:*</code></li>
    <li><code>elasticloadbalancing:*</code></li>
    <li><code>iam:*</code></li>
    <li><code>kms:*</code></li>
    <li><code>lambda:*</code></li>
    <li><code>logs:*</code></li>
    <li><code>resource-groups:*</code></li>
    <li><code>route53:*</code></li>
    <li><code>s3:*</code></li>
    <li><code>secretsmanager:*</code></li>
    <li><code>sns:*</code></li>
    <li><code>ssm:*</code></li>
    <li><code>sts:*</code></li>
  </ul>
  
  {% include note.html content="Although the `AdministratorAccess` managed IAM policy provides sufficient permissions, your organization might use a custom policy with more restrictions." %}

<a id="how-the-provisioner-works"></a>
### How the {{site.cnqShort}} Provisioner Works
The {{site.cnqShort}} Provisioner is an m5.large EC2 instance that configures your Qumulo cluster and any additional AWS environment requirements.

{% if page.deployment == "cfn" %}{% capture dontDelete %}Don't delete the {{site.cnqShort}} Provisioner's EC2 instance. It is necessary for EC2 updates.{% endcapture %}{% include important.html content=dontDelete %}{% endif %}

The Provisioner stores all necessary state information in the AWS Parameter Store and shuts down automatically when it completes any of its following major tasks:

  <details>
    <summary>Click to expand</summary>
    <strong>Qumulo Cluster Configuration</strong>
    <ul>
      <li>Forms the first quorum with specific Hot or Cold parameters</li>
      <li>Adds nodes to the quorum (when expanding the cluster)</li>
      <li>Assigns floating IP addresses to nodes in the cluster</li>
      <li>Manages cluster replacement (new compute and cache resources) for changing instance sizes</li>
      <li>Manages the addition of S3 buckets and soft capacity limit increases</li>
      <li>Changes the administrative password</li>
    </ul>
    <strong>AWS Configuration</strong>
    <ul>
      <li>Checks for connectivity to Amazon S3</li>
      <li>Checks for the presence of an S3 Gateway in the VPC (this is required for provisioning)</li>
      <li>Checks that all S3 buckets are empty before forming quorum</li>
      <li>Checks for connectivity to the public Internet running a <code>curl</code> command against <code>api.missionq.qumulo.com/</code></li>
{% if page.deployment == "cfn" %}      <li>Assigns a policy to the top-level CloudFormation stack to protect the cluster during subsequent stack updates</li>{% endif %}      
      <li>Configures the throughput and IOPS for the EBS gp3 volume</li>
      <li>Tags EBS volumes with {% if page.deployment == "cfn" %}the stack name{% elsif page.deployment == "tf" %}<code>deployment_unique_name</code>{% endif %}  and volume type</li>
      <li>Tracks software versions, cluster IP addresses, instance IDs, and UUID in the AWS Parameter Store</li>
      <li>Tracks the <code>last-run-status</code> for the Provisioner in the Parameter Store</li>
{% if page.deployment == "cfn" %}      <li>Configures Termination Protection for the stack and the EC2 Instances</li>{% endif %}
    </ul>
  </details>
