---
title: "Getting Started with Qumulo on HPE Apollo 4200 Gen9"
summary: "This section explains how to prepare HPE Apollo 4200 Gen9 nodes for creating a Qumulo Core cluster. This guide is for system administrators, professional service providers, and colleagues in your organization who are responsible for installing and configuring server hardware. For more information, see <a href='https://support.hpe.com/hpesc/public/docDisplay?docLocale=en_US&amp;docId=c05058024'>HPE Apollo 4200 Gen 9 Server - Document List</a>."
permalink: /hardware-guide/hpe-apollo-4200-gen9/getting-started.html
redirect_from:
  - /hardware/hpe-apollo-4200-gen9/getting-started.html
sidebar: hardware_guide_sidebar
keywords: getting started guide, quick reference, HPE, Apollo 4200 Gen9, verify node, field verification tool, FVT, intelligent provisioning
---

## Prerequisites
[Qumulo Core USB Drive Installer](https://care.qumulo.com/hc/en-us/articles/360034690034)


## Step 1: Verify Your Node
1. Shut down your node and connect a display, a keyboard, and a mouse to it.

1. Plug the Qumulo Core USB Drive Installer into an available USB port on the node and then press the power button.

   {% include image.html alt="To power on the node, press the power button." file="hpe-front-power.png" %}

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

     a. Select **1) SET ENCRYPTION, set SmartArrays in RAID mode, destroy all data, reboot node**.

     b. After the node reboots, select **1) CONFIGURE ENCRYPTION, Set up encryption, input new keys**.

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
