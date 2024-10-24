---
title: "Deploying Cloud Native Qumulo on Azure with Terraform"
summary: "This section explains how to deploy Cloud Native Qumulo (CNQ) on Azure by creating the persistent storage and the cluster compute and cache resources with Terraform. It also provides recommendations for Terraform deployments and information about post-deployment actions and optimization."
permalink: /cloud-native-azure-administrator-guide/getting-started/terraform.html
sidebar: cloud_native_azure_administrator_guide_sidebar
varRepoLink: <code>azure-terraform-cnq-&lt;x.y&gt;.zip</code> file (the version in the file name corresponds to the provisioning scripts, not the version of Qumulo Core)
deployment: tf
---

{% include content-reuse/cnq-guide-azure/deployment-agnostic-preamble-prerequisites-provisioner.md %}

{% include content-reuse/cnq-guide-azure/deployment-agnostic-cluster-persistent-storage.md %}

{% include content-reuse/cnq-guide-azure/deployment-agnostic-cluster-compute-cache-resources.md %}

{% include content-reuse/cnq-guide-azure/deployment-agnostic-post-deployment-actions.md %}
