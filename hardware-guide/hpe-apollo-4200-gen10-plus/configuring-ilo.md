---
title: "Configuring and Using Integrated Lights Out (iLO) on HPE Apollo 4200 Gen10 Plus Nodes"
summary: "This section explains how to configure and use Integrated Lights Out (iLO) on HPE Apollo 4200 Gen10 Plus nodes."
permalink: hardware-guide/hpe-apollo-4200-gen10-plus/configuring-ilo.html
sidebar: hardware_guide_sidebar
keywords: out-of-band management, out of band management, iLO, DHCP, network, networking, LAN, ipmitool
---

{% include important.html content="Access to the iLO port on a public LAN can have serious security implications because it can grant anyone with credentials direct access to your server's hardware and console. Follow security best practices when implementing iLO access." %}

## Prerequisites
To configure the iLO port, you must have root access to the client-facing network through SSH. For example, you can use the `sudo -s` command.

## How the iLO Port Works
{{site.a4200g10p}} nodes provide iLO support for out-of-band maintenance access even when the node is plugged in but powered off. The following diagram shows the location of the iLO port.

{% capture alt_tag %}The location of the iLO port on the {{site.a4200g10p}} node{% endcapture %}
{% include image.html alt=alt_tag file="hpe-gen10-ilo.png" %}

Your nodes receive DHCP address assignments by default. When you configure a node's iLO port, you can access the node by using the IP address (that the DHCP server assigns to the node) and a web browser that supports HTML5, Java, and .NET

{% capture content_tag %}{{site.splitIlo}}{% endcapture %}
{% include important.html content=content_tag %}

To access iLO configuration from the BIOS System Utilities menu, press **F9**. The default iLO username is `Administrator`. The password is printed on top of your node chassis.

{% include note.html content="The IMPI username and password are unrelated to your Qumulo administrative credentials." %}

{% include content-reuse/ilo-configuration-commands.md %}
