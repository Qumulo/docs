---
title: "Deploying Cloud Native Qumulo on AWS with Terraform"
summary: "This section explains how to deploy Cloud Native Qumulo (CNQ) on AWS by creating the persistent storage and the cluster compute and cache resources with Terraform. It also provides recommendations for Terraform deployments and information about post-deployment actions and optimization."
permalink: /aws-administrator-guide/getting-started/terraform.html
sidebar: aws_administrator_guide_sidebar
varRepoLink: <code>aws-terraform-cnq-<X.Y>.zip</code> file (the version in the file name corresponds to the provisioning scripts, not the version of Qumulo Core)
redirect_from:
  - /aws-administrator-guide/getting-started/deploying-instance-terraform.html
deployment: tf
---

{% include content-reuse/cnq-guide/deployment-agnostic-preamble-prerequisites-provisioner.md %}

{% include content-reuse/cnq-guide/deployment-agnostic-cluster-persistent-storage.md %}

{% include content-reuse/cnq-guide/deployment-agnostic-cluster-compute-cache-resources.md %}

{% include content-reuse/cnq-guide/deployment-agnostic-post-deployment-actions.md %}
