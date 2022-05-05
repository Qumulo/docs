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

1. Select **Insert Media** and check the **boot on next reboot option** for the iso on the **virtual media page**.  {% include image.html alt="" file="virtual-media-page.png" %}

1. Reset the node and allow the install to complete.  {% include image.html alt="" file="hpe-intelligent-provisioning-update-page.png" %}

1. Reboot the node into the installer/FVT.

1. Once complete, return to **step 3** of the **RUN FIELD VERIFICATION TOOL** section to rerun FVT.

1. Type **2** or **VERIFY** and hit **ENTER** to check the node configuration. If all fields pass, you may now proceed to install Qumulo Core.

## Step 5: Install Qumulo Core by Using the USB Drive Installer

1. Power on the node or perform a reboot.

2. Press the **F11 key** to enter the **boot menu** on the **BIOS splash screen**.

3. Type **2** to continue with the install and boot from the USB Installer key.

4. Select **no** when asked to change between RAID and HBA modes to proceed to the **DESTROY ALL DATA** page.

5. Type **DESTROY ALL DATA** (case-sensitive) to perform a clean install of Qumulo Core on your cluster.

{{site.data.alerts.important}}
If you mistype <b>DESTROY ALL DATA</b> three times or type <b>no</b>, the installation will be aborted.
{{site.data.alerts.end}}

The node will automatically shut down once the installation of Qumulo Core is complete. At that time, remove the USB stick and press the power button to turn on the node. A successful install using the Qumulo Core USB Installer Key will boot the node to the End User Agreement page, the first step in creating a new cluster with Qumulo Core. Before you agree and continue, repeat the steps outlined above for each node that will be included in your Qumulo cluster.

## Step 6: Create and Configure Your Cluster

1. Review the End User License Agreement, check the box to agree and click **Submit.**

{% include image.html alt="" file="user-agreement.png" %}

1.  Name the cluster.
2.  Select the nodes for the cluster .
    -   If any nodes are missing, verify that the node is currently running and on the same network

{% include image.html alt="" file="setup-cluster.png" %}

{{site.data.alerts.note}}
The total capacity for the cluster is dynamically updated at the bottom of the page when selecting nodes.
{{site.data.alerts.end}}

{% include image.html alt="" file="capacity.png" %}

## Step 7: Configure the Cluster Protection Level

The recommended 2 or 3 drive protection level will be selected by default based on the cluster size and node type.

{% include image.html alt="" file="confirm-protection.png" %}

If **Customize Protection Level** is displayed, the option is available to increase the resilience of the system by selecting 3 drive protection. Keep in mind that selecting 3 drive protection will result in less capacity for the cluster.

{% include image.html alt="" file="recommended-protection.png" %}

{{site.data.alerts.note}}
The option for selecting the drive protection level is only available at cluster creation and cannot be changed after the fact.
{{site.data.alerts.end}}

## Step 8: Create a Password For Your Administrative Account

1.  Type in the password for your admin account.
2.  Retype the password to confirm.
3.  Click **Create Cluster.**

{% include image.html alt="" file="create-password.png" %}

To access the dashboard in the Qumulo Core UI remotely, use any node's IP address to connect via [web browser](https://care.qumulo.com/hc/en-us/articles/115013902267-Qumulo-Core-s-Web-UI-Browser-Compatability).

For additional guidance on cluster configuration and getting started, reference the [Qumulo Installation FAQ](https://care.qumulo.com/hc/en-us/articles/115008010087-Qumulo-Installation-FAQ) article for more details.
