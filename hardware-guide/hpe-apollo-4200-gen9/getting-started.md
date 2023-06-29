---
title: "Getting Started with Qumulo on HPE Apollo 4200 Gen9"
summary: "This section explains how to prepare HPE Apollo 4200 Gen9 nodes for creating a Qumulo cluster. This guide is for system administrators, professional service providers, and colleagues in your organization who are responsible for installing and configuring server hardware."
permalink: /hardware-guide/hpe-apollo-4200-gen9/getting-started.html
redirect_from:
  - /hardware/hpe-apollo-4200-gen9/getting-started.html
sidebar: hardware_guide_sidebar
keywords: getting_started_guide, quick_reference, HPE, Apollo_4200_Gen9, verify_node, field_verification_tool, FVT, intelligent_provisioning
---

{% include content-reuse/hpe-apollo-4200-gen-9-90t-180t-288t-eops.md %}

## Prerequisites
{{site.xrefUSBinstaller}}

## Step 1: Verify Your Node
{% include content-reuse/platform-agnostic-verify-node-preamble.md %}

   {% capture alt_tag %}Front Diagram of the {{site.a4200g9}} Node{% endcapture %}
   {% include image.html alt=alt_tag file="hpe-front-power.png" %}

1. On the **HPE ProLiant** boot screen, do one of the following:

   * If the **Boot Mode: Legacy BIOS** message appears, skip the rest of this section and continue to [boot by using the Qumulo Core USB Drive Installer](#step-2-boot-by-using-the-qumulo-core-usb-drive-installer).

   * If the **Boot Mode: Legacy BIOS** message doesn't appear, press **F9**.

1. On the **System Utilities** page, click **System Configuration > BIOS/Platform Configuration (RBSU) > Boot Options**.

1. On the **Boot Options** page, set **Boot Mode** to **Legacy BIOS Mode** and then press **F10**.

1. Press **Esc** until you return to the main page.

1. Click **Reboot the System**.


## Step 2: Boot by Using the Qumulo Core USB Drive Installer

{% include caution.html content="If your node contains any live data, *don't* run the FVT." %}

1. On the **HPE ProLiant** boot screen, press **F11**.

   {% include note.html content="The **Boot Menu** page might take a few minutes to appear." %}

1. On the **Boot Menu** page, to boot into the **Legacy BIOS One-Time Boot Menu**, press **Enter**.

1. In the **Select ENTER to enter the Legacy BIOS One-Time Boot Menu or Esc to cancel.** dialog box, press **Enter**.

1. From the **Default Boot Override Options** menu, select **2) One Time Boot to USB DriveKey**.

   Wait for Qumulo Installer to load.

1. Select **[1] Factory reset (DESTROYS ALL DATA)** and when prompted type `DESTROY ALL DATA`.

   The platform name and SmartArray mode appear.

1. Configure the encryption on your node.

   * If the SmartArray mode is **Secure**, **RAID**, or **Encrypted**, select **2) no, continue install in Non-Secure mode**.

   * If the SmartArray mode is **Not Secure**, **HBA**, or **Unencrypted**, do the following:

     1. Select **1) SET ENCRYPTION, set SmartArrays in RAID mode, destroy all data, reboot node**.

     1. After the node reboots, select **1) CONFIGURE ENCRYPTION, Set up encryption, input new keys**.

        The rules for the cryptographic login password and master key appear.

     {% include caution.html content="To avoid data loss, save your credentials." %}
     

## Step 3: Run the Field Verification Tool (FVT)

1. Select **1) FVT, Enter FVT sub menu**.

1. To update the node components to required versions, choose **1) FLASH, Flash components to required versions**.

1. Do one of the following:

   * If the FVT verification passes, select **2) no, return to menu, run FVT to continue install**.

   * If the FVT flashes firmware, select **1) REBOOT, reboot node in 5 seconds** and the continue from step 2.


## Step 4: Install Qumulo Core by Using the USB Drive Installer

Perform the following steps on every node in your cluster.

1. In the FVT, select **2) no, continue install**.

   When the installation is complete, the node shuts down automatically.

1. Remove the USB drive and power on the node.


## Step 5: Create and Configure Your Cluster

{% include content-reuse/create-configure-cluster.md %}
