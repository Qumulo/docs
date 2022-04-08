---
title: "Qumulo on HPE Proliant DL325 Gen10 Plus Getting Started Guide"
summary: "This guide is intended for system administrators, professional service providers, and colleagues in your organization who are responsible for installing and configuring server hardware."
permalink: platforms/hpe-dl325-gen10-plus/quick-start-guide.html
---
## In This Article

Outlines how to prepare HPE Proliant DL325 Gen10 Plus nodes and create a cluster with Qumulo Core

## Requirements

-   HPE Proliant DL325 Gen10 Plus hardware installed
-   Latest Qumulo-certified HPE service pack installed
    -   Contact [Qumulo Care](https://care.qumulo.com/hc/en-us/articles/115008409408-Contact-Qumulo-Care-) for details
-   [Qumulo Core USB Installer Key](https://care.qumulo.com/hc/en-us/articles/360034690034)

For additional details on the HPE Proliant DL325 Gen10 Plus server, reference the [HPE ProLiant DL325 Gen10 Plus Server Document List](https://support.hpe.com/hpesc/public/docDisplay?docLocale=en_US&docId=a00102298en_us).

## Technical Specifications

{% include image.html alt="DL325 data sheet" file="dl325-datasheet.png" %}

## Verify The Nodes

Shut down the node and connect it to a display, keyboard, and mouse.

Plug in the **Qumulo Core Installer USB key** to an available USB port.

Press the power button highlighted below to power the node on and wait for the machine’s **boot screen** to display.  {% include image.html alt="Front view of DL325 node" file="dl325-front.png" %}

Verify that the **Boot Mode** is set to **Legacy BIOS**.  {% include image.html alt="Boot mode identification screen" file="hpe-dl325-boot-mode.png" %}

-   **If the Boot Mode is EFI BIOS**, disregard the rest of the steps in this section and proceed to the **BOOT TO QUMULO CORE USB INSTALLER KEY** section.
-   **If the Boot Mode is not EFI BIOS**, press **F9** to access the **System Utilities menu** and proceed with the subsequent steps.

Click through the **System Configuration** page to the **BIOS/Platform Configuration** (RBSU) page and then to the **Boot Options** page.

Set **Boot Mode** to **EFI BIOS Mode** on the **Boot Options** page**.**

Press **F10** to save the change.

Press **Esc** until you return to the **main page**.

Select **Reboot the System**.

## Boot To The Qumulo Core Usb Installer Key

1.  Press **F11** to access the **Boot Menu** when prompted at the **HPE ProLiant** screen. Note that this boot may take a few minutes. {% include image.html alt="Boot menu prompt screen" file="hpe-dl325-f11.png" %}
2.  Select **Generic USB Boot** from the Boot Menu to do a one-time boot to the Qumulo Core USB Installer key. {% include image.html alt="Boot menu" file="dl325-boot-menu.png" %}

## Run The Qumulo Installer

**After rebooting, the Qumulo Installer runs automatically**

1.  **Choose option 1 when prompted. This will factory reset your node.  {% include image.html alt="Qumulo installer landing screen" file="dl325-installer.png" %} **
2.  **Confirm you want to proceed by typing DESTROY ALL DATA.  {% include image.html alt="Qumulo installer factory reset" file="dl325-destroy-data.png" %} **

**The Field Verification Tool (FVt) starts automatically once you confirm.   {% include image.html alt="Field verification tool start" file="dl325-fvt-start.png" %}**

**The test results display once it has concluded. Refer to the following sections for details on Pass and Fail scenarios.**

### Fvt Pass

{% include image.html alt="Field verification tool pass" file="dl325-fvt-pass.png" %}

If you see an **FVT passed!** message, proceed to the **Installing Qumulo Core** section later in this document. If **FAIL** messages are present, review the example below to determine the appropriate course.

### Fvt Fail Cases

**Fixable Issues during Install**

If the FVT fails and there are issues that are fixable, you will be prompted to select whether you wish to allow the FVT to auto-correct the detected issues depending on your install scenario.

{% include image.html alt="Field verification tool fail" file="dl325-fvt-fail.png" %}

Issues that can be auto-corrected include:

-   BIOS config
-   Drive firmware
-   NVMe sector size
-   NIC mode
-   NIC firmware
-   Boot order

When presented with this menu, select **option 1** to have the tool attempt to fix the issues. If the fixes are successful, the FVT will automatically reboot the node. Return to the **Boot To The Qumulo Core USB Installer Key** section earlier in this document to re-attempt verification and continue the install.

**Fixable Issues during Part Replacement**

In Qumulo Core 3.1.0 and higher, the FVT offers an option to automatically correct issues (such as a firmware upgrade) after a part replacement has been performed. In this case, select **option 2** to run FVT Flash for a part replacement. This will fix the issue and reboot into the FVT menu once more to proceed with the installation.

{% include image.html alt="Field verification tool part replacement flash" file="hpe-gen10-fvt-replacement.png" %}

**Non-Fixable Issues**

If the FVT is unable to automatically fix any failures detected, the  message “Not fixable issues were detected” will display after providing failure reasons.

Examples of non-fixable issues:

-   BIOS version
-   ILO version
-   NIC FW

{% include image.html alt="Field verification tool unfixable issue" file="hpe-gen10-fvt-fail-all.png" %}

Please reach out to [Qumulo Care](https://care.qumulo.com/hc/en-us/articles/115008409408-Contact-Qumulo-Care-) for additional troubleshooting options.

## Install Qumulo Core

Now that the server has verified it is ready to be configured, you can start to install Qumulo Core. Select option 1 when prompted to begin.

{% include image.html alt="Qumulo core installation" file="dl325-install-qumulo.png" %}

Once the installation is complete and the server reboots, continue on to create a cluster.

## Create A Cluster

Review the End User License Agreement, check the box to agree and click **Submit.**

{% include image.html alt="Qumulo core EULA" file="dl325-eula.png" %}

### 1. Setup Cluster

1.  Name the cluster.
2.  Select the nodes for the cluster.
    -   If any nodes are missing, verify that the node is currently running and on the same network

{% include image.html alt="Cluster creation screen" file="dl325-setup-cluster.png" %}

{{site.data.alerts.note}}
**NOTE**: The total capacity for the cluster is dynamically updated at the bottom of the page when selecting nodes.
{{site.data.alerts.end}}

{% include image.html alt="Capacity confirmation" file="capacity.png" %}

### 2. Confirm Cluster Protection Level

The recommended 2 or 3 drive protection level will be selected by default based on the cluster size and node type.

{% include image.html alt="Cluster protection level confirmation" file="confirm-protection.png" %}

If **Customize Protection Level** is displayed, the option is available to increase the resilience of the system by selecting 3 drive protection. Keep in mind that selecting 3 drive protection will result in less capacity for the cluster.

{% include image.html alt="Cluster protection level recommendation" file="recommended-protection.png" %}

{{site.data.alerts.note}}
**NOTE:** The option for selecting the drive protection level is only available at cluster creation and cannot be changed after the fact.
{{site.data.alerts.end}}

### 3. Create A Password For Your Admin Account

1.  Type in the password for your admin account.
2.  Retype the password to confirm.
3.  Click **Create Cluster.**

{% include image.html alt="Create password screen" file="create-password.png" %}

To access the dashboard in the Qumulo Core UI remotely, use any node's IP address to connect via [web browser](https://care.qumulo.com/hc/en-us/articles/115013902267-Qumulo-Core-s-Web-UI-Browser-Compatability).

For additional guidance on cluster configuration and getting started, reference the [Qumulo Installation FAQ](https://care.qumulo.com/hc/en-us/articles/115008010087-Qumulo-Installation-FAQ) article for more details.

**RESOLUTION**

You should now be able to successfully prepare the nodes for installing Qumulo Core and create a cluster on HPE ProLiant DL325 Gen10 Plus hardware

**ADDITIONAL RESOURCES**

[Qumulo Safety Instructions](https://care.qumulo.com/hc/en-us/articles/115007777308-Qumulo-Safety-Instructions)

[Create a Qumulo Core USB Installer Key](https://care.qumulo.com/hc/en-us/articles/360034690034?flash_digest=380f75faf095e1b66159321c4d3745cec64ba609)

[Create a Qumulo Cluster](https://care.qumulo.com/hc/en-us/articles/115014525587)

[Qumulo Installation FAQ](https://care.qumulo.com/hc/en-us/articles/115008010087-Qumulo-Installation-FAQ)

[ Prev Quick Start Guide: HPE Apollo 4200 Gen10](https://care.qumulo.com/hc/en-us/articles/360041359594-Quick-Start-Guide-HPE-Apollo-4200-Gen10 "Quick Start Guide: HPE Apollo 4200 Gen10") [Next  Qumulo Installation FAQ](https://care.qumulo.com/hc/en-us/articles/115008010087-Qumulo-Installation-FAQ "Qumulo Installation FAQ")
