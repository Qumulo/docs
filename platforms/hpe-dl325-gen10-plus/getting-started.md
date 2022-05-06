---
title: "Getting Started with Qumulo on HPE Proliant DL325 Gen10 Plus"
summary: "This section explains how to prepare HPE Proliant DL325 Gen10 Plus nodes for creating a Qumulo Core cluster."
permalink: platforms/hpe-dl325-gen10-plus/getting-started.html
sidebar: platforms_sidebar
keywords: getting started guide, quick reference, HPE, Proliant DL325 Gen10 Plus, verify node, field verification tool, FVT, intelligent provisioning
---

This section explains how to prepare HPE Proliant DL325 Gen10 Plus nodes for creating a Qumulo Core cluster. This guide is for system administrators, professional service providers, and colleagues in your organization who are responsible for installing and configuring server hardware. For more information, see [HPE ProLiant DL325 Gen10 Plus Server - Document List](https://support.hpe.com/hpesc/public/docDisplay?docLocale=en_US&docId=a00102298en_us).

## Prerequisites
* The latest Qumulo-certified HPE service pack installed on your nodes. For more information, contact [Qumulo Care](https://care.qumulo.com/hc/en-us/articles/115008409408).
* The [Qumulo Core USB Drive Installer](https://care.qumulo.com/hc/en-us/articles/360034690034)


## Verify The Nodes

1. Shut down the node and connect it to a display, keyboard, and mouse.

2. Plug in the **Qumulo Core Installer USB key** to an available USB port.

3. Press the power button highlighted below to power the node on and wait for the machine’s **boot screen** to display.  {% include image.html alt="Front view of DL325 node" file="dl325-front.png" %}

4. Verify that the **Boot Mode** is set to **Legacy BIOS**.  {% include image.html alt="Boot mode identification screen" file="hpe-dl325-boot-mode.png" %}

    -   **If the Boot Mode is EFI BIOS**, disregard the rest of the steps in this section and proceed to the **BOOT TO QUMULO CORE USB INSTALLER KEY** section.
    -   **If the Boot Mode is not EFI BIOS**, press **F9** to access the **System Utilities menu** and proceed with the subsequent steps.

5. Click through the **System Configuration** page to the **BIOS/Platform Configuration** (RBSU) page and then to the **Boot Options** page.

6. Set **Boot Mode** to **EFI BIOS Mode** on the **Boot Options** page**.**

7. Press **F10** to save the change.

8. Press **Esc** until you return to the **main page**.

9. Select **Reboot the System**.

## Boot To The Qumulo Core USB Installer Key

1.  Press **F11** to access the **Boot Menu** when prompted at the **HPE ProLiant** screen. Note that this boot may take a few minutes. {% include image.html alt="Boot menu prompt screen" file="hpe-dl325-f11.png" %}
2.  Select **Generic USB Boot** from the Boot Menu to do a one-time boot to the Qumulo Core USB Installer key. {% include image.html alt="Boot menu" file="dl325-boot-menu.png" %}

## Run The Qumulo Installer

After rebooting, the Qumulo Installer runs automatically

1.  Choose option 1 when prompted. This will factory reset your node.  {% include image.html alt="Qumulo installer landing screen" file="dl325-installer.png" %}
2.  Confirm you want to proceed by typing DESTROY ALL DATA.  {% include image.html alt="Qumulo installer factory reset" file="dl325-destroy-data.png" %}

The Field Verification Tool (FVt) starts automatically once you confirm.   {% include image.html alt="Field verification tool start" file="dl325-fvt-start.png" %}

The test results display once it has concluded. Refer to the following sections for details on Pass and Fail scenarios.

### FVT Pass

{% include image.html alt="Field verification tool pass" file="dl325-fvt-pass.png" %}

If you see an **FVT passed!** message, proceed to the **Installing Qumulo Core** section later in this document. If **FAIL** messages are present, review the example below to determine the appropriate course.

### FVT Fail Cases

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

## Step N: Create and Configure Your Cluster

{% include content-reuse/create-configure-cluster.md %}

## Technical Specifications

<table>
<thead>
  <tr>
    <th></th>
    <th>34T</th>
    <th>145T</th>
    <th>291T</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>Form Factor</td>
    <td>1U</td>
    <td>1U</td>
    <td>1U</td>
  </tr>
  <tr>
    <td>Raw Storage Capacity</td>
    <td>34 TB</td>
    <td>145 TB</td>
    <td>291 TB</td>
  </tr>
  <tr>
    <td>SSD or NVM3</td>
    <td>9 &times; 3.84 TB NVMe</td>
    <td>19 &times; 7.68 TB NVMe</td>
    <td>19 &times; 15.36 TB NVMe</td>
  </tr>
  <tr>
    <td>Networking</td>
    <td>4 &times; 100 GbE</td>
    <td>4 &times; 100 GbE</td>
    <td>4 &times; 100 GbE</td>
  </tr>
  <tr>
    <td>CPU</td>
    <td>24 cores 2.8 GHz</td>
    <td>24 cores 2.8 GHz</td>
    <td>24 cores 2.8 GHz</td>
  </tr>
  <tr>
    <td>Memory</td>
    <td>128 GB</td>
    <td>128 GB</td>
    <td>128 GB</td>
  </tr>
</tbody>
</table>
