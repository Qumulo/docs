---
title: "Configuration Workflow for Storage Administrators who Manage a Qumulo Nexus Account"
summary: "This configuration workflow explains how to enable single sign-on (SSO) for Qumulo Nexus from the perspective of a storage administrator who manages a Qumulo Nexus account and works together with a system administrator who manages your organization's identity provider (IdP)."
permalink: /qumulo-nexus-configuration-guide/authentication/enabling-sso-with-idp-storage-administrator-workflow.html
redirect_from:
  - /qumulo-nexus-configuration-guide/enabling-sso-with-idp/storage-administrator-configuration-workflow.html
sidebar: qumulo_nexus_configuration_guide_sidebar
persona: storage_administrator
---

After the storage administrator performs the initial configuration in Nexus, the system administrator configures the IdP. Then, the storage administrator completes the SSO configuration in Nexus.

{% include content-reuse/nexus-guide/step-1-performing-initial-sso-configuration-in-nexus.md %}

{% include content-reuse/nexus-guide/step-2-configuring-identity-provider.md %}

{% include content-reuse/nexus-guide/step-3-performing-final-sso-configuration-in-nexus.md %}
