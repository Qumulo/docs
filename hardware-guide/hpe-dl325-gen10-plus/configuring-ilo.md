---
title: "Configuring Integrated Lights Out (iLO) on HPE ProLiant DL325 Gen10 Plus Nodes"
summary: "This section explains how to configure Integrated Lights Out (iLO) on HPE ProLiant DL325 Gen10 Plus nodes."
permalink: /hardware-guide/hpe-dl325-gen10-plus/configuring-ilo.html
sidebar: hardware_guide_sidebar
keywords: out-of-band_management, out_of_band_management, iLO, DHCP, network, networking, LAN, ipmitool, HPE_ProLiant_DL325_Gen10_Plus, HPE, ProLiant, DL325
---

{% include content-reuse/platform-agnostic-ilo-preamble.md %}

{% capture alt_tag %}The location of the iLO port on the {{site.dl325g10p}} node{% endcapture %}
{% include image.html alt=alt_tag file="dl325-ilo.png" %}

{% include content-reuse/platform-agnostic-ilo-configuration.md iloUserGuide="* [HPE iLO 5 2.72 User Guide](https://support.hpe.com/hpesc/public/docDisplay?docId=a00105236en_us)" %}
