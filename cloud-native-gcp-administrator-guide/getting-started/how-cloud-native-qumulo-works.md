---
title: "How Cloud Native Qumulo on GCP Works"
summary: "This section explains the main functionality of Cloud Native Qumulo on GCP (CNQ), shows the reference architecture, and lists the known limits. In addition, it provides an overview of deployment, post-deployment actions, and deployment optimization."
permalink: /cloud-native-gcp-administrator-guide/getting-started/how-cloud-native-qumulo-works.html
sidebar: cloud_native_gcp_administrator_guide_sidebar
---

## What is Cloud Native Qumulo on GCP?
{{site.gcp.cnqGCPshort}} is a self-managed Virtual Private Cloud (VPC) deployment that provisions Google Compute Engine (GCE) instances and uses Google Cloud Platform (GCP) infrastructure for a Qumulo file system, which allows the disaggregation of persistent storage from compute resources. You can deploy {{site.gcp.cnqGCPshort}} by using [Terraform](terraform.html). 

{{site.gcp.cnqGCPshort}} provides the same multi-protocol support, interfaces, and functionality as Qumulo on premises.


## Reference Architecture
{% capture cnqArchi %}{{site.gcp.cnqGCPlong}} Architecture Diagram{% endcapture %}
{% include shared_image.html alt=cnqArchi file="shared-images/admin-guides/getting-started/cloud-native-qumulo-on-gcp-architecture.png" url="/images/shared-images/admin-guides/getting-started/cloud-native-qumulo-on-gcp-architecture.png" %}


## Deploying {{site.gcp.cnqGCPshort}}
This section outlines the process of configuring and deploying {{site.gcp.cnqGCPshort}}.

1. Create persistent storage by using Google Cloud Storage (GCS) buckets.  

1. Deploy cluster compute and cache resources by using GCE instances and HyperDisk volumes.

1. Perform post-deployment actions.

1. Optimize your deployment.


## {{site.gcp.cnqGCPshort}} Limit
This section lists the {{site.gcp.cnqGCPshort}} limits.

**24-Node Clusters (Terraform):** Although the {{site.cnqLong}} architecture can scale to a high number of nodes, Terraform deployments of {{site.gcp.cnqGCPshort}} are limited to a maximum of 24 nodes.

For more information, {{site.contactQumuloCare}}.
