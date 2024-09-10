---
title: "How Cloud Native Qumulo on AWS Works"
summary: "This section explains the main functionality of Cloud Native Qumulo on AWS (CNQ), shows the reference architecture, and lists the known limits. In addition, it provides an overview of the two-phase deployment."
permalink: /aws-administrator-guide/getting-started/how-cloud-native-qumulo-works.html
sidebar: aws_administrator_guide_sidebar
---

## What is Cloud Native Qumulo on AWS?
{{site.aws.cnqAWSshort}} is a self-managed AWS VPC deployment that provisions EC2 instances and uses AWS infrastructure for a Qumulo file system, which allows the disaggregation of persistent storage from compute resources. You can deploy {{site.aws.cnqAWSshort}} by using [AWS CloudFormation](cloudformation.html) or [Terraform](terraform.html).

{{site.aws.cnqAWSshort}} provides the same multi-protocol support, interfaces, and functionality as Qumulo on premises.


## Reference Architecture
{% capture cnqArchi %}{{site.aws.cnqAWSlong}} Architecture Diagram{% endcapture %}
{% include shared_image.html alt=cnqArchi file="shared-images/admin-guides/getting-started/cloud-native-qumulo-on-aws-architecture.png" url="/images/shared-images/admin-guides/getting-started/cloud-native-qumulo-on-aws-architecture.png" %}


## Overview of Deploying {{site.aws.cnqAWSshort}}
This section outlines the process of configuring and deploying {{site.aws.cnqAWSshort}}.

1. Create persistent storage by using S3 buckets.

1. Deploy cluster compute and cache resources.

1. Perform post-deployment actions.

1. Optimize your deployment.


## {{site.aws.cnqAWSshort}} Limits
This section lists the {{site.aws.cnqAWSshort}} limits.

* **24-Node Clusters (CloudFormation):** Although the {{site.cnqLong}} architecture can scale to a high number of nodes, CloudFormation deployments of {{site.aws.cnqAWSshort}} are limited to a maximum of 24 nodes. For more information, {{site.contactQumuloCare}}.

* **Elastic Block Storage (EBS) gp3 EBS Volume Optimization:** When you use configurations with IOPS or throughput values greater than the defaults of 125 IOPS and 3000 MiB/s, you must ensure that your EBS volumes complete their optimization when you run performance tasks.

  {% include tip.html content="Because all volumes for a Qumulo cluster are tagged with the same deployment name, you can use the deployment name to filter volumes in the AWS Console." %}

* **Amazon S3 Bucket Warm-Up:** Because {{site.aws.cnqAWSshort}} uses S3 buckets for backing storage, the S3 buckets are subject to throttling prior to partition scale-up.
