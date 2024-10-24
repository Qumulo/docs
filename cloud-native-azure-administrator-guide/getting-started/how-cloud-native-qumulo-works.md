---
title: "How Cloud Native Qumulo on Azure Works"
summary: "This section explains the main functionality of Cloud Native Qumulo on Azure (CNQ), shows the reference architecture, and lists the known limits. In addition, it provides an overview of the two-phase deployment, the post-deployment actions, and deployment optimization."
permalink: /cloud-native-azure-administrator-guide/getting-started/how-cloud-native-qumulo-works.html
sidebar: cloud_native_azure_administrator_guide_sidebar
---

## What is Cloud Native Qumulo on Azure?
{{site.azure.cnqAzureShort}} is a self-managed deployment that provisions Azure Compute instances and other infrastructure for a Qumulo file system, which allows the disaggregation of persistent storage from compute resources. You can deploy {{site.azure.cnqAzureShort}} by using [Terraform](terraform.html).

{{site.azure.cnqAzureShort}} provides the same multi-protocol support, interfaces, and functionality as Qumulo on premises.


## Reference Architecture
{% capture cnqArchi %}{{site.azure.cnqAzureLong}} Architecture Diagram{% endcapture %}
{% include shared_image.html alt=cnqArchi file="shared-images/admin-guides/getting-started/cloud-native-qumulo-on-azure-architecture.png" url="/images/shared-images/admin-guides/getting-started/cloud-native-qumulo-on-azure-architecture.png" %}


## Overview of Deploying {{site.azure.cnqAzureShort}}
This section outlines the process of configuring and deploying {{site.azure.cnqAzureShort}}.

1. Create persistent storage by using Azure Storage Accounts.

1. Deploy cluster compute and cache resources.

1. Perform post-deployment actions.

1. Optimize your deployment.


{% comment %}
## {{site.azure.cnqAzureShort}} Limits
This section lists the {{site.azure.cnqAzureShort}} limits.

* **XXX: TBD**
{% endcomment %}
