---
title: "Getting Started with Qumulo on HPE Alletra 4140"
summary: "This section explains how to prepare HPE Alletra 4140 nodes for creating a Qumulo cluster. This guide is for system administrators, professional service providers, and colleagues in your organization who are responsible for installing and configuring server hardware."
permalink: /hardware-guide/hpe-alletra-4140/getting-started.html
sidebar: hardware_guide_sidebar
platform: all4140
---

{% capture seeMore %}For information about installing your node and replacing hardware components, see [{{site.all4140}} System Maintenance and Service Guide](https://support.hpe.com/hpesc/public/docDisplay?docId=sd00003806en_us&docLocale=en_US) and [{{site.all4140}} Setup and Installation Guide](https://support.hpe.com/hpesc/public/docDisplay?docId=sd00003805en_us&docLocale=en_US in the HPE documentation.){% endcapture %}
{% include tip.html content=seeMore %}

## Prerequisites
{{site.xrefUSBinstaller}}

## Step 1: Verify Your Node

{% include content-reuse/platform-agnostic-verify-node-preamble.md %}

## Step 2: Boot by Using the Qumulo Core USB Drive Installer

1. When the node powers on and begins to boot, on the **HPE Alletra** screen, press **F11**.

   {% include note.html content="The **Boot Menu** page might take a few minutes to appear." %}

1. On the **Boot Menu** page, to perform a one-time boot, do one of the following:

   * If the **Legacy BIOS One-Time Boot Menu** option is available, click it.

   * If the **Legacy BIOS One-Time Boot Menu** option is unavailable, click **Generic USB Boot**.

1. In the **Question** dialog box, click **OK**.

   {% include note.html content="The **Default Boot Override Options** page might take a few minutes to appear." %}

1. In the **Default Boot Override Options** menu, select **2) One Time Boot to USB DriveKey**.

   The Qumulo Core Installation begins.

## Step 3: Create and Configure Your Cluster

{% include content-reuse/create-configure-cluster.md %}
