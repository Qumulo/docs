---
title: "Drive LEDs"
summary: "This section explains the drive LEDs of your HPE Apollo 4200 Gen9 node."
permalink: platforms/hpe-apollo-4200-gen9/drive-leds.html
sidebar: platforms_sidebar
keywords: drive, hard drive, LED
---

This article explains the LEDs of large form factor (LFF) and small form factor (SFF) drives in your HPE Apollo 4200 Gen9 node. For more information, see [HPE Apollo 4200 Gen9 Server - Document List](https://support.hpe.com/hpesc/public/docDisplay?docLocale=en_US&docId=c05058024).

## Large Form Factor (LFF) Drive LEDs

To locate the LFF drive LEDs, use the following diagram.

{% include image.html alt="Large form factor (LFF) drive LEDs" file="lff-drive-leds.png" %}

You can determine the current state of an LFF drive by reviewing the status of the following LEDs:

1. **Fault or UID LED** (🟠 Amber or 🔵 Blue)

1. **Online or Activity LED** (🟢 Green)

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
        <li>This drive received a predictive failure alert.</li>
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
    <td>This drive received a predictive failure alert. Replace the drive as soon as possible.</td>
  </tr>
  <tr>
    <td>On</td>
    <td>Off</td>
    <td>The drive is online but isn't active currently.</td>
  </tr>
  <tr>
    <td>1 flash per second</td>
    <td>Flashing amber</td>
    <td>Don't remove the drive. Removing the drive might terminate the current operation and cause data loss. The drive is part of an array that is undergoing capacity expansion or stripe migration. However, the drive received a predictive failure alert. To minimize the risk of data loss, don't remove the drive until the expansion or migration is complete.</td>
  </tr>
  <tr>
    <td>1 flash per second</td>
    <td>Off</td>
    <td>Don't remove the drive. Removing the drive might terminate the current operation and cause data loss. The drive is rebuilding, erasing, or is part of an array that is undergoing capacity expansion or stripe migration.</td>
  </tr>
  <tr>
    <td>4 flashes per second</td>
    <td>Flashing amber</td>
    <td>The drive is active but it received a predictive faiulure alert. Replace the drive as soon as possible.</td>
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
    <td>This drive received a predictive failure alert. Replace the drive as soon as possible.</td>
  </tr>
  <tr>
    <td>Off</td>
    <td>Off</td>
    <td>The drive is offline, a space, or isn't configured as part of an array.</td>
  </tr>
</tbody>
</table>

## Small Form Factor (SFF) Drive LEDs

To locate the SFF drive LEDs, use the following diagram.

{% include image.html alt="Small form factor (SFF) drive LEDs" file="sff-led-guide.png" %}}

1. **Locate LED**

   * 🔵 **Solid Blue:** The drive is being identified by a host application.
   * 🔵 **Flashing Blue:** The drive carrier firmware is being updated or requires an update.

   {% include important.html content="The Locate LED is behind the release lever. It is visible when it is illuminated." %}

1. **Activity Ring LED**

   * 🟢 **Rotating Green:** Drive activity
   * **Off:** No drive activity

1. **Do Not Remove LED**

   * ⚪ **Solid White:** Don't remove the drive. Removing the drive causes one or more of the logical drives to fail.
   * **Off:** Removing the drive doesn't cause a logical drive to fail.

1. **Drive Status LED**

   * 🟢 **Solid Green:** The drive is a member of one or more logical drives
   * 🟢 **Flashing Green:** The drive is rebuilding or performing a RAID migration, strip-size migration, capacity expansion, or logical drive extension or is erasing.
   * 🟠🟢 **Flashing Amber and Green:** The drive is a member of one or more logical drives and predicts drive failure.
   * 🟠 **Flashing Amber:** The drive isn't configured and predicts drive failure.
   * 🟠 **Solid Amber:** The drive has failed.
   * **Off:** A RAID controller hasn't configured the drive.
