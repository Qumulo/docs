---
title: "Qumulo on HPE Apollo 4200 Gen9 Getting Started Guide"
summary: "This guide is intended for system administrators, professional service providers, and colleagues in your organization who are responsible for installing and configuring server hardware."
permalink: platforms/hpe-apollo-4200-gen9/quick-start-guide.html
sidebar: platforms_sidebar
---
## In This Article

Outlines how to prepare HPE Apollo 4200 Gen9 nodes and create a cluster with Qumulo Core

## Requirements

-   HPE Apollo 4200 Gen9 hardware installed
-   Latest Qumulo-certified HPE service pack installed
    -   Contact [Qumulo Care](https://care.qumulo.com/hc/en-us/articles/115008409408-Contact-Qumulo-Care-) for details
-   [Qumulo Core USB Installer Key](https://care.qumulo.com/hc/en-us/articles/360034690034)

For additional details on the HPE Apollo 4200 Gen9 server, reference the [HPE Apollo 4200 Gen9 Server Document List](https://support.hpe.com/hpesc/public/docDisplay?docLocale=en_US&docId=c05058024) .

## Verify The Nodes

Shut down the node and connect it to a display, keyboard, and mouse.

Plug in the **Qumulo Core Installer USB key** to an available USB port.

Press the power button highlighted below to power the node on and wait for the machine’s **boot screen** to display.  {% include image.html alt="" file="hpe-front-pw.png" %}

Verify that the **Boot Mode** is set to **Legacy BIOS**.  {% include image.html alt="" file="hpe-boot-mode.png" %}

-   **If the Boot Mode is Legacy BIOS**, disregard the rest of the steps in this section and proceed to the **BOOT TO QUMULO CORE USB INSTALLER KEY** section.
-   **If the Boot Mode is not Legacy BIOS**, press **F9** to access the **System Utilities menu** and proceed with the subsequent steps.

Click through the **System Configuration** page to the **BIOS/Platform Configuration** (RBSU) page to the **Boot Options** page.

Set **Boot Mode** to **Legacy BIOS Mode** on the **Boot Options** page**.**

Press **F10** to save the change.

Press **Esc** until you return to the **main page**.

Select **Reboot the System**.

## Boot To The Qumulo Core Usb Installer Key

Press **F11** to access the **Boot Menu** when prompted at the **HPE ProLiant screen**. Note that this boot may take a few minutes.  {% include image.html alt="" file="hpe-f11-boot.png" %}

Press **ENTER** to boot into the **Legacy Bios One-Time Boot Menu**.  {% include image.html alt="" file="hpe-legacy-boot.png" %}

Press **ENTER** again to confirm.  {% include image.html alt="" file="hpe-enter-one-time-boot.png" %}

Select **Option 2** from the **Default Boot Override Options** to do a one-time boot to the Qumulo Core USB Installer key.  {% include image.html alt="" file="hpe-one-time-boot-options.png" %}

Select one of the following options to continue the install:  {% include image.html alt="" file="hpe-smartarray-mode.png" %}

-   For an **encrypted** install, select **option 2** and hit **ENTER**.
-   For a **non-encrypted** install, select **option 1** and hit **ENTER**. Once the node automatically reboots, repeat the steps in this section to boot to the USB Installer key. Once you return to the SmartArray Mode prompt, select the **continue, install in NonSecure Mode** option for the following boot.

## Run Field Verification Tool

{{site.data.alerts.important}}
**IMPORTANT! DO NOT run the following Field Verification Tool if any live data is present on the node.**
{{site.data.alerts.end}}

**Access the **Field Verification Tool (FVT) menu** by typing **1** or **FVT** and hit **ENTER**.  {% include image.html alt="" file="fvt-menu.png" %} **

**Flash the node components to the required versions by typing either **1** or **FLASH** and hit **ENTER**.  {% include image.html alt="" file="fvt-verify.png" %} **

**Type **1** or **FVT** on the **main menu** to continue with the test.  {% include image.html alt="" file="fvt-menu.png" %} **

**Type **2** or **VERIFY** and hit **ENTER** to check the node configuration.  {% include image.html alt="" file="fvt-flash.png" %} **

**Review the results and consider the following before proceeding with a clean install of Qumulo Core:**

-   **FAIL** messages reported from **VERIFY** are **not** indicative of an unsuccessful **FLASH** command and can be resolved with a power-cycle to reflect recent firmware changes.
-   **FAIL** messages on the boot order when running **VERIFY** can be ignored at this time.

### Fvt Pass Example

### Fvt_pass.Png

### Fvt Fail Example

{% include image.html alt="" file="fvt-fail.png" %}

-   **If all fields pass, you may skip the **FLASHING OF HPE INTELLIGENT PROVISIONING FIRMWARE** section and continue cluster configuration by following the steps outlined in the **INSTALL QUMULO CORE VIA THE USB KEY** section. **
-   **I**f the category for the Intelligent Provisioning Version returns **FAILED**, execute the steps in the **FLASHING OF HPE INTELLIGENT PROVISIONING FIRMWARE** section below.** **Once complete, return to **step 3 in this section** and run the **VERIFY** command for FVT. If all fields pass, you may continue to the **INSTALL QUMULO CORE VIA THE USB KEY** section.

## Flashing Of Hpe Intelligent Provisioning Firmware

{{site.data.alerts.important}}
**IMPORTANT! ONLY execute these instructions if the Intelligent Provisioning check in the FVT failed.**
{{site.data.alerts.end}}

The HPE Intelligent Provisioning firmware for the HPE Apollo 4200 has no method available to flash this component in the system. To acquire the firmware, download the binary file from [HPE Support Center](https://internal.support.hpe.com/hpsc/swd/public/detail?swItemId=MTX_f6abd3e3803e4b2395eee361c3) and follow the instructions below.

### Update Firmware From System Utilities Via A Usb Drive

Convert the iso file to img format.

Apply the file to a USB drive or iLO virtual media.

-   Reference the [USB Key Utility for Windows](https://support.hpe.com/hpesc/public/km/product/1008862658/Product?cc=us&lang=en#t=DriversandSoftware&sort=relevancy&layout=table) article from HPE Support Center for more information.

Attach the media to the server.

Press **F11** to enter the **boot menu**.

Select **boot from USB stick**, and allow the Intelligent provisioning package to update the firmware.

Once the upgrade is complete, press **ESC** to return to the **main menu** and reboot the system.

### Update Firmware From System Utilities Via Virtual Media

1.  Put the iso in an accessible location over the network for the node.
2.  Select **Insert Media** and check the **boot on next reboot option **for the iso on the **virtual media page**.  {% include image.html alt="" file="virtual-media-page.png" %}
3.  Reset the node and allow the install to complete.  {% include image.html alt="" file="hpe-intelligent-provisioning-update-page.png" %}
4.  Reboot the node into the installer/FVT.
5.  Once complete, return to **step 3** of the **RUN FIELD VERIFICATION TOOL** section to rerun FVT.
6.  Type **2** or **VERIFY** and hit **ENTER** to check the node configuration**. **If all fields pass, you may now proceed to install Qumulo Core.

## Install Qumulo Core Via The Usb Key

1.  Power on the node or perform a reboot.
2.  Press the **F11 key** to enter the **boot menu** on the **BIOS splash screen**.
3.  **Type 2 **to continue with the install and boot from the USB Installer key.
4.  Select **no** when asked to change between RAID and HBA modes to proceed to the **DESTROY ALL DATA** page.
5.  Type **DESTROY ALL DATA** (case-sensitive) to perform a clean install of Qumulo Core on your cluster.

{{site.data.alerts.important}}
**IMPORTANT!** If you mistype **DESTROY ALL DATA** three times or type **no**, the installation will be aborted.
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

## Additional Resources

[Qumulo Safety Instructions](https://care.qumulo.com/hc/en-us/articles/115007777308-Qumulo-Safety-Instructions)

[Create a Qumulo Core USB Installer Key](https://care.qumulo.com/hc/en-us/articles/360034690034?flash_digest=380f75faf095e1b66159321c4d3745cec64ba609)

[Create a Qumulo Cluster](https://care.qumulo.com/hc/en-us/articles/115014525587)

[HPE Apollo 4200 Gen9 Server Document List](https://support.hpe.com/hpesc/public/docDisplay?docLocale=en_US&docId=c05058024)

[Qumulo Installation FAQ](https://care.qumulo.com/hc/en-us/articles/115008010087-Qumulo-Installation-FAQ)
