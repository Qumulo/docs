---
title: "Configuring and Using Integrated Lights Out (iLO) on HPE Apollo 4200 Gen10 Nodes"
summary: "This section explains how to configure and use Integrated Lights Out (iLO) on HPE Apollo 4200 Gen10 nodes."
permalink: /hardware-guide/hpe-apollo-4200-gen10/configuring-ilo.html
redirect_from:
  - /hardware/hpe-apollo-4200-gen10/configuring-ilo.html
sidebar: hardware_guide_sidebar
keywords: out-of-band_management, out_of_band_management, iLO, DHCP, network, networking, LAN, ipmitool, HPE_Apollo_4200_Gen10, HPE, Apollo, 4200_Gen10
---

{% include content-reuse/platform-agnostic-ilo-preamble.md %}

{% capture alt_tag %}The location of the iLO port on the {{site.a4200g10}} node{% endcapture %}
{% include image.html alt=alt_tag file="hpe-gen10-ilo.png" %}

{% include content-reuse/platform-agnostic-ilo-configuration.md iloUserGuide="* [HPE iLO 5 2.72 User Guide](https://support.hpe.com/hpesc/public/docDisplay?docId=a00105236en_us)" %}
