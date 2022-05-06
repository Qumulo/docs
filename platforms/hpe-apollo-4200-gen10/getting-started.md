---
title: "Getting Started with Qumulo on HPE Apollo 4200 Gen10"
summary: "This section explains how to prepare HPE Apollo 4200 Gen10 nodes for creating a Qumulo Core cluster."
permalink: platforms/hpe-apollo-4200-gen10/getting-started.html
sidebar: platforms_sidebar
keywords: getting started guide, quick reference, HPE, Apollo 4200 Gen10, verify node, field verification tool, FVT, intelligent provisioning
---

This section explains how to prepare HPE Apollo 4200 Gen10 nodes for creating a Qumulo Core cluster. This guide is for system administrators, professional service providers, and colleagues in your organization who are responsible for installing and configuring server hardware. For more information, see [HPE Apollo 4200 Gen10 Server - Document List](https://support.hpe.com/hpesc/public/docDisplay?docLocale=en_US&docId=emr_na-a00061642en_us).


## Prerequisites
* The latest Qumulo-certified HPE service pack installed on your nodes. For more information, contact [Qumulo Care](https://care.qumulo.com/hc/en-us/articles/115008409408).
* The [Qumulo Core USB Drive Installer](https://care.qumulo.com/hc/en-us/articles/360034690034)


## Step 1: Verify Your Node

1. Shut down your node and connect a display, a keyboard, and a mouse to it.

1. Plug the Qumulo Core USB Drive Installer into an available USB port on the node and then press the power button.

   {% include image.html alt="To power on the node, press the power button." file="hpe-gen10-front-power.png" %}

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

1. On the **Boot Menu** page, to boot into the **Legacy BIOS One-Time Boot Menu**, press **Enter**.

1. In the blue dialog box, to confirm, press **Enter**.

1. From the **Default Boot Override Options** menu, select **2) One Time Boot to USB DriveKey**.


## Step 3: Using the Field Verification Tool (FVT)

After the node reboots, the Field Verification Tool begins to run automatically.

Review the verification results and consider the following before proceeding with a clean install

* If the **FVT Passed!** message appears, continue to [install Qumulo Core by using the USB drive installer](#step-5-install-qumulo-core-by-using-the-usb-drive-installer).

* If **FAIL** messages appear, use one of the following resolutions.

### Fixable Issues During Installations

If the FVT finds fixable issues, it prompts you to auto-correct any detected issues, depending on your installation scenario. Issues that the FVT can auto-correct include the following:

* BIOS Configuration
* Drive firmware
* Drive controller firmware
* NIC mode for CX5
* Boot order

1. To attempt auto-correction, select **1) Run FVT Flash for a fresh install. This will try to fix issues, then reboot. Please take caution this MAY DESTROY EXISTING DATA.**

   If the fixes are successful, the FVT reboots the node automatically.

1. To re-attempt verification, [boot by using the Qumulo Core USB Drive Installer](#step-2-boot-by-using-the-qumulo-core-usb-drive-installer) and then continue the installation.


**Fixable Issues during Part Replacement**

In Qumulo Core 3.1.0 and higher, the FVT offers an option to automatically correct issues (such as a firmware upgrade) after a part replacement has been performed. In this case, select **option 2** to run FVT Flash for a part replacement. This will fix the issue and reboot into the FVT menu once more to proceed with the installation.

{% include image.html alt="" file="hpe-gen10-fvt-replacement.png" %}

**Non-Fixable Issues**

If the FVT is unable to automatically fix any failures detected, the  message “Not fixable issues were detected” will display after providing failure reasons.

Examples of non-fixable issues:

-   BIOS version
-   ILO version
-   NIC FW

{% include image.html alt="" file="hpe-gen10-fvt-fail-all.png" %}

Please reach out to [Qumulo Care](https://care.qumulo.com/hc/en-us/articles/115008409408-Contact-Qumulo-Care-) for additional troubleshooting options.

## Setep 5: Install Qumulo Core by Using the USB Drive Installer

Now that the server has verified it is ready to be configured, you can start to install Qumulo Core.

{% include image.html alt="" file="hpe-gen10-fvt-encryption.png" %}

{{site.data.alerts.note}}
If only performing a part replacement on your system, select <b>option 1</b> to reboot and skip the remaining steps.
{{site.data.alerts.end}}

1.  Select whether you wish to install with or without encryption.
2.  When prompted, type "DESTROY ALL DATA" to confirm that all data will be destroyed on the server.
3.  If you selected **Install Qumulo Core with encryption** in Step 1, enter your crypto login password and master encryption key following the guidelines displayed. See the requirements below:

**Crypto Login Password Requirements**

-   8 to 16 characters in length
-   Must contain at least one upper-case character
-   Must contain at least one lower-case character
-   Must contain at least one numeric character
-   Must contain at least one symbol such as \# or $
-   ASCII only
-   Uppercase letters, lowercase letters, numbers, and symbols are allowed
-   \<space\>, \<semicolon\>, and \<double quote\> are **NOT** allowed

**Encryption Master Key Requirements**

-   10 to 32 characters in length
-   ASCII only
-   Uppercase letters, lowercase letters, numbers, and symbols are allowed
-   \<space\>, \<semicolon\>, and \<double quote\> are **NOT** allowed

Be sure to store the key in a secure location for the lifetime of the cluster. Once the installation is complete and the server reboots, continue on to create a cluster.

## Step N: Create and Configure Your Cluster

{% include content-reuse/create-configure-cluster.md %}

## Technical Specifications

<table>
<thead>
  <tr>
    <th></th>
    <th>HPE Apollo 36 TB<br>Hybrid SSD and Disk</th>
    <th>HPE Apollo 90 TB<br>Hybrid SSD and Disk</th>
    <th>HPE Apollo 192 TB<br>Hybrid SSD and Disk</th>
    <th>HPE Apollo 336 TB<br>Active Archive</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>Raw Capacity</td>
    <td>36 TB</td>
    <td>90 TB</td>
    <td>192 TB</td>
    <td>336 TB</td>
  </tr>
  <tr>
    <td>HDDs</td>
    <td>9 &times; 4 TB</td>
    <td>9 &times; 10 TB</td>
    <td>24 &times; 8 TB</td>
    <td>24 &times; 14 TB</td>
  </tr>
  <tr>
    <td>Logical Flash Cache Capacity</td>
    <td>1.44 TB</td>
    <td>2.88 TB</td>
    <td>5.76 TB</td>
    <td>7.68 TB</td>
  </tr>
  <tr>
    <td>Connectivity Ports</td>
    <td colspan="2">2 &times; 25 GbE or<br>2 &times; 100 GbE</td>
    <td>2 &times; 100 GbE<br>(25 GbE minimum link speed)</td>
    <td>2 &times; 25 GbE</td>
  </tr>
  <tr>
    <td>Management Ports</td>
    <td colspan="4">2 &times; IPMI 1 GbE baseT (RJ45)</td>
  </tr>
  <tr>
    <td>Connectivity Ports</td>
    <td colspan="2">1 &times; Intel Xeon Silver<br>4210 2.2 GHz 10 cores</td>
    <td>2 &times; Intel Xeon Silver<br>4210 2.2 GHz 10 cores</td>
    <td>1 &times; Intel Xeon Silver<br>4210 2.2 GHz 10-cores</td>
  </tr>
  <tr>
    <td>Physical Dimensions</td>
    <td colspan="4">3.44" (8.75 cm) &times; 17.63" (44.8 cm) &times; 32" (81.28 cm)</td>
  </tr>
</tbody>
</table>
