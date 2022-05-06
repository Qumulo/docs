---
title: "Qumulo on HPE Apollo 4200 Gen10 Getting Started Guide"
summary: "This guide is intended for system administrators, professional service providers, and colleagues in your organization who are responsible for installing and configuring server hardware."
permalink: platforms/hpe-apollo-4200-gen10/getting-started.html
sidebar: platforms_sidebar
---

## Requirements

-   HPE Apollo 4200 Gen10 hardware installed
-   Latest Qumulo-certified HPE service pack installed
    -   Contact [Qumulo Care](https://care.qumulo.com/hc/en-us/articles/115008409408-Contact-Qumulo-Care-) for details
-   [Qumulo Core USB Installer Key](https://care.qumulo.com/hc/en-us/articles/360034690034)

For additional details on the HPE Apollo 4200 Gen10 server, reference the  [HPE Apollo 4200 Gen10 Server Document List](https://support.hpe.com/hpsc/doc/public/display?docId=emr_na-a00061642en_us&docLocale=en_US).

## Verify The Nodes

1. Shut down the node and connect it to a display, keyboard, and mouse.

2. Plug in the **Qumulo Core Installer USB key** to an available USB port.

3. Press the power button highlighted below to power the node on and wait for the machine’s **boot screen** to display. {% include image.html alt="" file="hpe-gen10-front-power.png" %}

4. Verify that the **Boot Mode** is set to **Legacy BIOS**.  {% include image.html alt="" file="hpe-gen10-boot-mode.png" %}

    -   **If the Boot Mode is Legacy BIOS**, disregard the rest of the steps in this section and proceed to the **BOOT TO QUMULO CORE USB INSTALLER KEY** section.
    -   **If the Boot Mode is not Legacy BIOS**, press **F9** to access the **System Utilities menu** and proceed with the subsequent steps.

5. Click through the **System Configuration** page to the **BIOS/Platform Configuration** (RBSU) page and then to the **Boot Options** page.

6. Set **Boot Mode** to **Legacy BIOS Mode** on the **Boot Options** page**.**

7. Press **F10** to save the change.

8. Press **Esc** until you return to the **main page**.

9. Select **Reboot the System**.

## Boot To The Qumulo Core USB Installer Key

1.  Press **F11** to access the **Boot Menu** when prompted at the **HPE ProLiant** screen. Note that this boot may take a few minutes. {% include image.html alt="" file="hpe-gen10-f11.png" %}
2.  Press **ENTER** to boot into the **Legacy BIOS One-Time Boot Menu**.  {% include image.html alt="" file="hpe-legacy-boot.png" %}
3.  Press **ENTER** again to confirm.  {% include image.html alt="" file="hpe-enter-one-time-boot.png" %}
4.  Select **Option 2** from the **Default Boot Override Options** to do a one-time boot to the Qumulo Core USB Installer key.  {% include image.html alt="" file="hpe-one-time-boot-options.png" %}

## Run Field Verification Tool

After rebooting, the Field Verification Tool starts automatically.  {% include image.html alt="" file="hpe-gen10-fvt-running.png" %}

The test results display once it has concluded. Refer to the following sections for details on Pass and Fail scenarios.

### FVT Pass

{% include image.html alt="" file="hpe-gen10-fvt-success.png" %}

If you see an **FVT passed!** message, proceed to the **Installing Qumulo Core** section later in this document. If **FAIL** messages are present, review the example below to determine the appropriate course.

### FVT Fail Cases

**Fixable Issues during Install**

If the FVT fails and there are issues that are fixable, you will be prompted to select whether you wish to allow the FVT to auto-correct the detected issues depending on your install scenario.

{% include image.html alt="" file="hpe-gen10-fvt-fail.png" %}

Issues that can be auto-corrected include:

-   BIOS config
-   Drive firmware
-   Drive controller firmware
-   NIC mode for CX5
-   Boot order

When presented with this menu, select **option 1** to have the tool attempt to fix the issues. If the fixes are successful, the FVT will automatically reboot the node. Return to the **Boot To The Qumulo Core USB Installer Key** section earlier in this document to re-attempt verification and continue the install.

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

## Install Qumulo Core

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
