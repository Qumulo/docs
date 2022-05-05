---
title: "Qumulo on HPE Apollo 4200 Gen9 Getting Started Guide"
summary: "This section explains how to prepare HPE Apollo 4200 Gen9 nodes for creating a Qumulo Core cluster."
permalink: platforms/hpe-apollo-4200-gen9/getting-started-guide.html
sidebar: platforms_sidebar
keywords: getting started guide, quick reference, HPE, Apollo 4200 Gen9
---

This section explains how to prepare HPE Apollo 4200 Gen9 nodes for creating a Qumulo Core cluster. This guide is for system administrators, professional service providers, and colleagues in your organization who are responsible for installing and configuring server hardware. For more information, see [HPE Apollo 4200 Gen9 - Server Document List](https://support.hpe.com/hpesc/public/docDisplay?docLocale=en_US&docId=c05058024).

## Prerequisites
* The latest Qumulo-certified HPE service pack installed on your nodes. For more information, contact [Qumulo Care](https://care.qumulo.com/hc/en-us/articles/115008409408).
* The [Qumulo Core USB Drive Installer](https://care.qumulo.com/hc/en-us/articles/360034690034)


## Step 1: Verify Your Node
1. Shut down your node and connect a display, a keyboard, and a mouse to it.

1. Plug the Qumulo Core USB Drive Installer into an available USB port on the node.

1. Press the power button on the node..

   {% include image.html alt="To power on the node, press the power button." file="hpe-front-power.png" %}

1. On the **HPE ProLiant** boot screen, do one of the following:

   * If the **Boot Mode: Legacy BIOS** message appears, skip the rest of this section and continue to [boot by using the Qumulo Core USB Drive Installer](#step-2-boot-by-using-the-qumulo-core-usb-drive-installer).

   * If the **Boot Mode: Legacy BIOS** message doesn't appear, press **F9**.

1. On the **System Utilities** page, click **System Configuration > BIOS/Platform Configuration (RBSU) > Boot Options**.

1. On the **Boot Options** page, set **Boot Mode** to **Legacy BIOS Mode**.

1. To save the changes, press **F10**.

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

1. Review the verification results.

5. Review the results and consider the following before proceeding with a clean install of Qumulo Core:

   {{site.data.alerts.note}}
   <ul>
     <li>Any **FAIL** messages aren't indicative of an unsuccessful flash command. To resolve these issues, power-cycle the node to apply the most recent firmware changes.</li>
     <li>At this time, you can ignore any **FAIL** messages on the boot order.</li>
   </ul>
   {{site.data.alerts.end}}

### FVT Pass Example

{% include image.html alt="" file="fvt-pass.png" %}

### FVT Fail Example

{% include image.html alt="" file="fvt-fail.png" %}

-   If all fields pass, you may skip the **FLASHING OF HPE INTELLIGENT PROVISIONING FIRMWARE** section and continue cluster configuration by following the steps outlined in the **INSTALL QUMULO CORE VIA THE USB KEY** section.
-   If the category for the Intelligent Provisioning Version returns **FAILED**, execute the steps in the **FLASHING OF HPE INTELLIGENT PROVISIONING FIRMWARE** section below. Once complete, return to **step 3 in this section** and run the **VERIFY** command for FVT. If all fields pass, you may continue to the **INSTALL QUMULO CORE VIA THE USB KEY** section.

## Flashing Of HPE Intelligent Provisioning Firmware

{{site.data.alerts.important}}
ONLY execute these instructions if the Intelligent Provisioning check in the FVT failed.
{{site.data.alerts.end}}

The HPE Intelligent Provisioning firmware for the HPE Apollo 4200 has no method available to flash this component in the system. To acquire the firmware, download the binary file from [HPE Support Center](https://internal.support.hpe.com/hpsc/swd/public/detail?swItemId=MTX_f6abd3e3803e4b2395eee361c3) and follow the instructions below.

### Update Firmware From System Utilities Via A USB Drive

1. Convert the iso file to img format.

2. Apply the file to a USB drive or iLO virtual media.

    -   Reference the [USB Key Utility for Windows](https://support.hpe.com/hpesc/public/km/product/1008862658/Product?cc=us&lang=en#t=DriversandSoftware&sort=relevancy&layout=table) article from HPE Support Center for more information.

3. Attach the media to the server.

4. Press **F11** to enter the **boot menu**.

5. Select **boot from USB stick**, and allow the Intelligent provisioning package to update the firmware.

6. Once the upgrade is complete, press **ESC** to return to the **main menu** and reboot the system.

### Update Firmware From System Utilities Via Virtual Media

1.  Put the iso in an accessible location over the network for the node.
2.  Select **Insert Media** and check the **boot on next reboot option** for the iso on the **virtual media page**.  {% include image.html alt="" file="virtual-media-page.png" %}
3.  Reset the node and allow the install to complete.  {% include image.html alt="" file="hpe-intelligent-provisioning-update-page.png" %}
4.  Reboot the node into the installer/FVT.
5.  Once complete, return to **step 3** of the **RUN FIELD VERIFICATION TOOL** section to rerun FVT.
6.  Type **2** or **VERIFY** and hit **ENTER** to check the node configuration. If all fields pass, you may now proceed to install Qumulo Core.

## Install Qumulo Core Via The USB Key

1.  Power on the node or perform a reboot.
2.  Press the **F11 key** to enter the **boot menu** on the **BIOS splash screen**.
3.  Type **2** to continue with the install and boot from the USB Installer key.
4.  Select **no** when asked to change between RAID and HBA modes to proceed to the **DESTROY ALL DATA** page.
5.  Type **DESTROY ALL DATA** (case-sensitive) to perform a clean install of Qumulo Core on your cluster.

{{site.data.alerts.important}}
If you mistype <b>DESTROY ALL DATA</b> three times or type <b>no</b>, the installation will be aborted.
{{site.data.alerts.end}}

The node will automatically shut down once the installation of Qumulo Core is complete. At that time, remove the USB stick and press the power button to turn on the node. A successful install using the Qumulo Core USB Installer Key will boot the node to the End User Agreement page, the first step in creating a new cluster with Qumulo Core. Before you agree and continue, repeat the steps outlined above for each node that will be included in your Qumulo cluster.

## Create A Cluster

Review the End User License Agreement, check the box to agree and click **Submit.**

{% include image.html alt="" file="user-agreement.png" %}

### 1. Setup Cluster

1.  Name the cluster.
2.  Select the nodes for the cluster .
    -   If any nodes are missing, verify that the node is currently running and on the same network

{% include image.html alt="" file="setup-cluster.png" %}

{{site.data.alerts.note}}
The total capacity for the cluster is dynamically updated at the bottom of the page when selecting nodes.
{{site.data.alerts.end}}

{% include image.html alt="" file="capacity.png" %}

### 2. Confirm Cluster Protection Level

The recommended 2 or 3 drive protection level will be selected by default based on the cluster size and node type.

{% include image.html alt="" file="confirm-protection.png" %}

If **Customize Protection Level** is displayed, the option is available to increase the resilience of the system by selecting 3 drive protection. Keep in mind that selecting 3 drive protection will result in less capacity for the cluster.

{% include image.html alt="" file="recommended-protection.png" %}

{{site.data.alerts.note}}
The option for selecting the drive protection level is only available at cluster creation and cannot be changed after the fact.
{{site.data.alerts.end}}

### 3. Create A Password For Your Admin Account

1.  Type in the password for your admin account.
2.  Retype the password to confirm.
3.  Click **Create Cluster.**

{% include image.html alt="" file="create-password.png" %}

To access the dashboard in the Qumulo Core UI remotely, use any node's IP address to connect via [web browser](https://care.qumulo.com/hc/en-us/articles/115013902267-Qumulo-Core-s-Web-UI-Browser-Compatability).

For additional guidance on cluster configuration and getting started, reference the **[Qumulo Installation FAQ](https://care.qumulo.com/hc/en-us/articles/115008010087-Qumulo-Installation-FAQ)** article for more details.

## Resolution

You should now be able to successfully prepare the nodes for installing Qumulo Core and create a cluster on HPE Apollo 4200 Gen9 hardware
