---
title: "Deploying Cloud Native Qumulo on GCP with Terraform"
summary: "This section explains how to deploy Cloud Native Qumulo (CNQ) on GCP by creating the persistent storage and the cluster compute and cache resources by using Terraform. It also provides recommendations for Terraform deployments and information about post-deployment actions and optimization."
permalink: /cloud-native-gcp-administrator-guide/getting-started/terraform.html
sidebar: cloud_native_gcp_administrator_guide_sidebar
varRepoLink: <code>gcp-terraform-cnq-&lt;x.y&gt;.zip</code> file (the version in the file name corresponds to the provisioning scripts, not to the version of Qumulo Core)
deployment: tf
---

{% include content-reuse/cnq-guide-gcp/deployment-agnostic-preamble-prerequisites-provisioner.md %}

{% include content-reuse/cnq-guide-gcp/deployment-agnostic-cluster-persistent-storage.md %}

{% include content-reuse/cnq-guide-gcp/deployment-agnostic-cluster-compute-cache-resources.md %}

{% include content-reuse/cnq-guide-gcp/deployment-agnostic-post-deployment-actions.md %}
