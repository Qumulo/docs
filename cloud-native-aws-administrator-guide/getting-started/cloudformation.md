---
title: "Deploying Cloud Native Qumulo on AWS with CloudFormation"
summary: "This section explains how to deploy Cloud Native Qumulo (CNQ) on AWS by creating the persistent storage and the cluster compute and cache resources with CloudFormation. It also provides information about post-deployment actions and optimization."
permalink: /aws-administrator-guide/getting-started/cloudformation.html
sidebar: aws_administrator_guide_sidebar
varRepoLink: <code>aws-cloudformation-cnq-&lt;x.y&gt;>.zip</code> file (the version in the file name corresponds to the provisioning scripts, not the version of Qumulo Core)
redirect_from:
  - /aws-administrator-guide/getting-started/deploying-instance-cloudformation.html
deployment: cfn
---

{% include content-reuse/cnq-guide/deployment-agnostic-preamble-prerequisites-provisioner.md %}

{% include content-reuse/cnq-guide/deployment-agnostic-cluster-persistent-storage.md %}

{% include content-reuse/cnq-guide/deployment-agnostic-cluster-compute-cache-resources.md %}

{% include content-reuse/cnq-guide/deployment-agnostic-post-deployment-actions.md %}
