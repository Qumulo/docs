---
title: "Configuration Workflow for System Administrators who Manage a Qumulo Nexus Account and an Identity Provider (IdP)"
summary: "This configuration workflow explains how to enable single sign-on (SSO) for Qumulo Nexus from the perspective of a system administrator who manages both a Qumulo Nexus account and an Identity Provider (IdP)."
permalink: /qumulo-nexus-configuration-guide/enabling-sso-with-idp/system-administrator-configuration-workflow.html
sidebar: qumulo_nexus_configuration_guide_sidebar
persona: sysadmin
---

{% capture pp %}{{site.nexus.idpPP}}{% endcapture %}
{% include important.html content=pp %}

After the system administrator performs the initial configuration in Nexus, she must configure the IdP. Then, she can complete the SSO configuration in Nexus.

{% include content-reuse/nexus-guide/step-1-performing-initial-sso-configuration-in-nexus.md %}

{% include content-reuse/nexus-guide/step-2-configuring-identity-provider.md %}

{% include content-reuse/nexus-guide/step-3-performing-final-sso-configuration-in-nexus.md %}
