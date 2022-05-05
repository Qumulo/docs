---
title: "Qumulo on HPE Apollo 4200 Gen9 Getting Started Guide"
summary: "This section explains how to prepare HPE Apollo 4200 Gen9 nodes for creating a Qumulo Core cluster."
permalink: platforms/hpe-apollo-4200-gen9/getting-started-guide.html
sidebar: platforms_sidebar
keywords: getting started guide, quick reference, HPE, Apollo 4200 Gen9, verify node, field verification tool, FVT, intelligent provisioning
---

This section explains how to prepare HPE Apollo 4200 Gen9 nodes for creating a Qumulo Core cluster. This guide is for system administrators, professional service providers, and colleagues in your organization who are responsible for installing and configuring server hardware. For more information, see [HPE Apollo 4200 Gen9 - Server Document List](https://support.hpe.com/hpesc/public/docDisplay?docLocale=en_US&docId=c05058024).


## Prerequisites
* The latest Qumulo-certified HPE service pack installed on your nodes. For more information, contact [Qumulo Care](https://care.qumulo.com/hc/en-us/articles/115008409408).
* The [Qumulo Core USB Drive Installer](https://care.qumulo.com/hc/en-us/articles/360034690034)


## Step 1: Verify Your Node
1. Shut down your node and connect a display, a keyboard, and a mouse to it.

1. Plug the Qumulo Core USB Drive Installer into an available USB port on the node and then press the power button.

   {% include image.html alt="To power on the node, press the power button." file="hpe-front-power.png" %}

1. On the **HPE ProLiant** boot screen, do one of the following:

   * If the **Boot Mode: Legacy BIOS** message appears, skip the rest of this section and continue to [boot by using the Qumulo Core USB Drive Installer](#step-2-boot-by-using-the-qumulo-core-usb-drive-installer).

   * If the **Boot Mode: Legacy BIOS** message doesn't appear, press **F9**.

1. On the **System Utilities** page, click **System Configuration > BIOS/Platform Configuration (RBSU) > Boot Options**.

1. On the **Boot Options** page, set **Boot Mode** to **Legacy BIOS Mode**, and then press **F10**.

1. Press **Esc** until you return to the main page.

1. Click **Reboot the System**.


## Step 2: Boot by Using the Qumulo Core USB Drive Installer

1. On the **HPE ProLiant** boot screen, press **F11**.

   {% include note.html content="The **Boot Menu** page might take a few minutes to appear." %}

1. On the **Boot Menu** page, to boot into the **Legacy BIOS One-Time Boot Menu**, press **Enter**.

1. In the blue dialog box, to confirm, press **Enter**.

1. From the **Default Boot Override Options** menu, select **2) One Time Boot to USB DriveKey**.

   The platform name appears.

1. Do one of the following:

   * For an encrypted installation, select **2) no, continue install in Secure mode** and then press **Enter**.

   * For an unencrypted installation, select **1) SET HBA MODE, set SmartArrays in HBA mode, destroy all data, reboot node** and then press **Enter**.

     After the node reboots automatically, repeat the steps in this section to boot by using the USB Drive Installer and then select **continue, install in NonSecure Mode** and then press **Enter**.
     

## Step 3: Run the Field Verification Tool (FVT)

{% include caution.html content="If your node contains any live data, *don't* run the FVT." %}

1. On the main menu, select **1) FVT, Enter FVT sub menu**.

1. To update the node components to required versions, choose **1) FLASH, Flash components to required versions**.

1. On the main menu, to continue with the test, select **1) FVT, Enter FVT sub menu**.

1. On the **===FIELD VERIFICATION TOOL===** page, to verify the node configuration, select **2) VERIFY, verify node configuration**.

1. Review the verification results and consider the following before proceeding with a clean install of Qumulo Core.

   * **PASSED** messages indicate correct configuration. For example:

     ```
     === TEST: Drives in whitelist and proper slot : PASSED
     ```

     If all areas pass, continue to [install Qumulo Core by using the USB drive installer](#step-5-install-qumulo-core-by-using-the-usb-drive-installer).

   * **FAIL** messages don't indicate an unsuccessful flash command. For example:

     ```
     === TEST: SmartArray Slot 0 : FAILED
     ERROR: FW 4.52, Expected 6.30
     ```
   
     To resolve these issues, power-cycle the node to apply the most recent firmware changes.

   * If the Intelligent Provisioning Version area fails verification, continue to [flash the HPE Intelligent Provisioning Firmware](#step-4-optional-flash-the-hpe-intelligent-provisioning-firmware), and then return to this section and run the **VERIFY** command in the FVT.

     When all areas pass, continue to [install Qumulo Core by using the USB drive installer](#step-5-install-qumulo-core-by-using-the-usb-drive-installer).
   
   * You can ignore any **FAIL** messages about the boot order.


## Step 4: (Optional) Flash the HPE Intelligent Provisioning Firmware

{% include important.html content="Follow the steps in this section only if the Intelligent Provisioning Version area fails verification." %}

Use one of the following options to update the HPE Intelligent Provisioning firmware by using a USB drive or by using virtual media.


### Option 1: Update Firmware from System Utilities by Using a USB Drive

1. Download the [Intelligent Provisioning for Gen9 Servers](https://internal.support.hpe.com/connect/s/softwaredetails?language=en_US&softwareId=MTX_f6abd3e3803e4b2395eee361c3) image file.

1. Convert the `.iso` file to `.img` format.

1. Apply the image to a USB drive. For more information, see [USB Key Utility for Windows](https://support.hpe.com/connect/s/softwaredetails?language=en_US&softwareId=MTX_360731071b404454b454390208) on the HPE Support Center.

1. Insert the USB drive into the node.

1. To enter the boot menu, press **F11**.

1. Select **boot from USB stick**.

   The Intelligent Provisioning package updates your firmware.

1. When the upgrade is complete, press **Esc** until you return to the main page.

1. Reboot the node.


### Option 2: Update Firmware from System Utilities by Using Virtual Media

1. Download the [Intelligent Provisioning for Gen9 Servers](https://internal.support.hpe.com/connect/s/softwaredetails?language=en_US&softwareId=MTX_f6abd3e3803e4b2395eee361c3) image file.

1. Place the `.iso` file in a network location that your node can access.

1. On the **Virtual Media** page, click **boot on next reboot** and then click **Insert Media**.

1. Reboot the node.

   On the **Intelligent Provisioning Update ISO Version X.XX** page, the installation progress appears.

1. Reboot the node and [run the FVT](#step-3-run-the-field-verification-tool-fvt).

1. Select **2) VERIFY, verify node configuration**.

   If all areas pass, you can continue to install Qumulo Core.


## Step 5: Install Qumulo Core by Using the USB Drive Installer

Perform the following steps for every node in your cluster.

1. Power on or reboot your node.

1. To enter the boot menu, press **F11**.

1. To boot from the USB drive, select **2**.

1. When prompted to switch between RAID and HBA modes, select **no**.

1. To perform a clean installation of Qumulo Core on your node, type `DESTROY ALL DATA` (case-sensitive).

   {% include important.html content="If you mistype `DESTROY ALL DATA` three times or type `no`, the installation is aborted." %}

   When the installation is complete, the node shuts down automatically.

1. Remove the USB drive and power on the node.


## Step 6: Create and Configure Your Cluster

1. Review the **End User Agreement**, click **I agree to the End User Agreement**, and then click **Submit**.

1. Name your cluster.

1. On the **1. Set up cluster** page, select the nodes to add to your cluster.

   As you select nodes, the total capacity of your cluster is updated at the bottom of the page.

   {% include note.html content="If any nodes are missing, confirm that they are powered on and connected to the same network." %}

1. On the **2. Confirm cluster protection level** page, Qumulo Core selects the recommended 2- or 3-drive protection level based on your cluster size and node type.

1. If the **Customize Protection Level** option appears, you can increase your system resilience by selecting 3-drive protection.

   {{site.data.alerts.note}}
   <ul>
     <li>The option for selecting the drive protection level is available only at cluster creation time. You can't change it later.</li>
     <li>Using 3-drive protection reduces the total capacity of your cluster.</li>
   </ul>
   {{site.data.alerts.end}}

1. Enter the password for your administrative account.

1. Click **Create Cluster**.

1. To access the Qumulo Core Web UI, use any node's IP address to connect by using a web browser. For more information, see [Qumulo Core Web UI Browser Compatibility](https://care.qumulo.com/hc/en-us/articles/115013902267) in Qumulo Care.

For more information about configuring your cluster configuration and getting started with Qumulo Core, see [Qumulo Installation FAQ](https://care.qumulo.com/hc/en-us/articles/115008010087-Qumulo-Installation-FAQ) in Qumulo Care.
