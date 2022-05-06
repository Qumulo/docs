---
title: "Drive LEDs on HPE Apollo 4200 Gen10 Nodes"
summary: "This section explains the drive LEDs in HPE Apollo 4200 Gen9 nodes."
permalink: platforms/hpe-apollo-4200-gen10/drive-leds.html
sidebar: platforms_sidebar
keywords: drive, hard drive, LED, large form factor, LFF, small form factor, SFF
---

This section explains the LEDs of large form factor (LFF) and small form factor (SFF) drives in your HPE Apollo 4200 Gen10 node. For more information, see [HPE Apollo 4200 Gen10 Server - Document List](https://support.hpe.com/hpesc/public/docDisplay?docLocale=en_US&docId=emr_na-a00061642en_us).

## Large Form Factor (LFF) Drive LEDs

To locate the LFF drive LEDs, use the following diagram.

<!-- Reuse the Gen9 image -->
{% include image.html alt="Large form factor (LFF) drive LEDs on the HPE Apollo 4200 Gen10 node" file="../../hpe-apollo-4200-gen9/images/lff-drive-leds.png" %}

You can determine the current state of an LFF drive by reviewing the status of the following LEDs:

1. **Fault or UID LED**

   * 🟠 **Amber**
   * 🔵 **Blue**

1. **Online or Activity LED**

   * 🟢 **Green**

The following table explains the various combinations of the two LFF LEDs.

<table>
<thead>
  <tr>
    <th>Online or Activity LED</th>
    <th>Fault or UID LED</th>
    <th>Description</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>On, off, or flashing</td>
    <td>Alternating amber and blue</td>
    <td>One or more of the following conditions exist:
      <ul>
        <li>The drive has failed.</li>
        <li>This system received a predictive failure alert about the drive.</li>
        <li>A management application has selected the drive.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>On, off, or flashing</td>
    <td>Solid blue</td>
    <td>One or more of the following conditions exist:
      <ul>
        <li>The drive is operating normally.</li>
        <li>A management application has selected the drive.</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>On</td>
    <td>Flashing amber</td>
    <td>This system received a predictive failure alert about the drive. Replace the drive as soon as possible.</td>
  </tr>
  <tr>
    <td>On</td>
    <td>Off</td>
    <td>The drive is online but isn't active currently.</td>
  </tr>
  <tr>
    <td>1 flash per second</td>
    <td>Flashing amber</td>
    <td>Don't remove the drive. Removing the drive might terminate the current operation and cause data loss. The drive is part of an array that is undergoing capacity expansion or stripe migration. However, the system received a predictive failure alert about the drive. To minimize the risk of data loss, don't remove the drive until the expansion or migration is complete.</td>
  </tr>
  <tr>
    <td>1 flash per second</td>
    <td>Off</td>
    <td>Don't remove the drive. Removing the drive might terminate the current operation and cause data loss. The drive is rebuilding, erasing, or is part of an array that is undergoing capacity expansion or stripe migration.</td>
  </tr>
  <tr>
    <td>4 flashes per second</td>
    <td>Flashing amber</td>
    <td>The drive is active but it received a predictive failure alert. Replace the drive as soon as possible.</td>
  </tr>
  <tr>
    <td>4 flashes per second</td>
    <td>Off</td>
    <td>The drive is active and is operating normally.</td>
  </tr>
  <tr>
    <td>Off</td>
    <td>Solid amber</td>
    <td>The drive has a critical fault condition and the controller has placed it offline. Replace the drive as soon as possible.</td>
  </tr>
  <tr>
    <td>Off</td>
    <td>Flashing amber</td>
    <td>This system received a predictive failure alert about the drive. Replace the drive as soon as possible.</td>
  </tr>
  <tr>
    <td>Off</td>
    <td>Off</td>
    <td>The drive is offline, a spare, or isn't configured as part of an array.</td>
  </tr>
</tbody>
</table>


### Small Form Factor (SFF) Gen10 Drive LEDs

SFF LEDs can be located using the diagram below:

{% include image.html alt="" file="sff-gen10-led-guide.png" %}

**(1) Locate LED**

-   Solid blue: The drive is being identified by a host application
-   Flashing blue: The drive carrier firmware is being updated or requires an update

{{site.data.alerts.note}}
The Locate LED is located behind the release lever and is visible when illuminated.
{{site.data.alerts.end}}

**(2) Activity ring LED**

-   Rotating green: Drive activity
-   Off: No drive activity

**(3) Drive status LED**

-   Solid green: The drive is a member of one or more logical drives
-   Flashing green: The drive is rebuilding or performing a RAID migration, strip size migration, capacity expansion, or logical drive extension or is erasing
-   Flashing amber/green: The drive is a member of one or more logical drives and predicts the drive will fail
-   Flashing amber: The drive is not configured and predicts the drive will fail
-   Solid amber: The drive has failed
-   Off: The drive is not configured by a RAID controller

**(4) Do not remove LED**

-   _Solid white:_ Do not remove the drive. Removing the drive causes one or more of the logical drives to fail
-   Off: Removing the drive does not cause a logical drive to fail

**(5) Do not remove button**

-   Press to open the release lever

## Resolution

You should now be able to successfully utilize the LED indicators for the LFF and SFF drives on the HPE Apollo 4200 Gen10 servers
