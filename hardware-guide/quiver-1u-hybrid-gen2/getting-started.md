---
title: "Getting Started with Qumulo on Quiver 1U Hybrid Gen2"
summary: "This section explains how to prepare Quiver 1UH Gen 2 nodes for creating a Qumulo cluster."
permalink: /hardware-guide/quiver-1u-hybrid-gen2/getting-started.html
sidebar: hardware_guide_sidebar
keywords: getting_started_guide, quick_reference, Quiver_1U_Hybrid_Gen2, verify_node, field_verification_tool, FVT
---

## Step 1: Verify Your Node
{% include content-reuse/platform-agnostic-verify-node-preamble.md %}

   {% capture alt_tag %}Front Diagram of the {{site.q1uhg2Long}} Node{% endcapture %}
   {% include image.html alt=alt_tag file="quiver-1u-hybrid-gen2-front-diagram.png" url="images/quiver-1u-hybrid-gen2-front-diagram.png" %}


## Step 2: Boot by Using the Qumulo Core USB Drive Installer
1. When the node powers on and begins to boot, on the **QCT** screen, press **F11**.

   {% include note.html content="The boot setting is persistent: When you boot from a USB drive once, the node continues to boot from the USB drive. After you finish installing Qumulo Core, remove the USB drive from the node." %}

1. On the **Please select boot device:** screen, select your USB drive (usually labelled with `UEFI OS`) and boot into it.


## Step 3: Install Qumulo Core
{% include content-reuse/install-qumulo-core.md %}
   

## Step 4: Create and Configure Your Cluster
{% include content-reuse/create-configure-cluster.md %}
