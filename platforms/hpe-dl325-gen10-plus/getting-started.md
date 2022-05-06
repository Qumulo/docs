---
title: "Getting Started with Qumulo on HPE ProLiant DL325 Gen10 Plus"
summary: "This section explains how to prepare HPE ProLiant DL325 Gen10 Plus nodes for creating a Qumulo Core cluster."
permalink: platforms/hpe-dl325-gen10-plus/getting-started.html
sidebar: platforms_sidebar
keywords: getting started guide, quick reference, HPE, ProLiant DL325 Gen10 Plus, verify node, field verification tool, FVT, intelligent provisioning
---

This section explains how to prepare HPE ProLiant DL325 Gen10 Plus nodes for creating a Qumulo Core cluster. This guide is for system administrators, professional service providers, and colleagues in your organization who are responsible for installing and configuring server hardware. For more information, see [HPE ProLiant DL325 Gen10 Plus Server - Document List](https://support.hpe.com/hpesc/public/docDisplay?docLocale=en_US&docId=a00102298en_us).

## Prerequisites
* The latest Qumulo-certified HPE service pack installed on your nodes. For more information, contact [Qumulo Care](https://care.qumulo.com/hc/en-us/articles/115008409408).
* The [Qumulo Core USB Drive Installer](https://care.qumulo.com/hc/en-us/articles/360034690034)


## Step 1: Verify Your Node
1. Shut down your node and connect a display, a keyboard, and a mouse to it.

1. Plug the Qumulo Core USB Drive Installer into an available USB port on the node and then press the power button.

   {% include image.html alt="To power on the node, press the power button." file="dl325-front.png" %}

1. On the **HPE ProLiant** boot screen, do one of the following:

   * If the **Boot Mode: Legacy BIOS** message appears, skip the rest of this section and continue to [boot by using the Qumulo Core USB Drive Installer](#step-2-boot-by-using-the-qumulo-core-usb-drive-installer).

   * If the **Boot Mode: Legacy BIOS** message doesn't appear, press **F9**.

1. On the **System Utilities** page, click **System Configuration > BIOS/Platform Configuration (RBSU) > Boot Options**.

1. On the **Boot Options** page, set **Boot Mode** to **Legacy BIOS Mode** and then press **F10**.

1. Press **Esc** until you return to the main page.

1. Click **Reboot the System**.


## Step 2: Boot by Using the Qumulo Core USB Drive Installer

1. On the **HPE ProLiant** boot screen, press **F11**.

   {% include note.html content="The **Boot Menu** page might take a few minutes to appear." %}

1. On the **Boot Menu** page, to perform a one-time boot, click **Generic USB Boot**.

## Step 3: Using the Field Verification Tool (FVT)

After the node reboots, the Field Verification Tool starts automatically.

1. Choose **[1] Factory reset (DESTROYS ALL DATA)**.

1. To perform a clean installation of Qumulo Core on your node, type `DESTROY ALL DATA` (case-sensitive).

1. Review the verification results and consider the following before proceeding with the installation.

   * If the **FVT Passed!** message appears, continue to [install Qumulo Core by using the USB drive installer](#step-5-install-qumulo-core-by-using-the-usb-drive-installer).

   * If **FAIL** messages appear, use one of the following resolutions.

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


## Step 5: Install Qumulo Core by Using the USB Drive Installer

Perform the following steps on every node in your cluster.

Now that the server has verified it is ready to be configured, you can start to install Qumulo Core. Select option 1 when prompted to begin.

{% include image.html alt="Qumulo core installation" file="dl325-install-qumulo.png" %}

Once the installation is complete and the server reboots, continue on to create a cluster.

## Step 6: Create and Configure Your Cluster

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
