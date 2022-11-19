---
title: "Drive LEDs on HPE Apollo 4200 Gen10 Plus Nodes"
summary: "This section explains the LEDs on large form factor (LFF) and small form factor (SFF) drives in HPE Apollo 4200 Gen10 Plus nodes. For more information, see <a href='https://www.hpe.com/psnow/product-documentation?oid=1013422400&cc=ca&lc=en&jumpid=in_pdp-psnow-docs'>HPE Apollo 4200 Gen10 Plus System - Product Documentation</a>."
permalink: /hardware-guide/hpe-apollo-4200-gen10-plus/drive-leds.html
sidebar: hardware_guide_sidebar
keywords: drive, hard drive, LED, large form factor, LFF, small form factor, SFF
---

## Large Form Factor (LFF) Drive LEDs

To locate the LFF drive LEDs, use the following diagram.

{% capture alt_tag %}Large form factor (LFF) drive LEDs on the {{site.a4200g10p}} node{% endcapture %}

{% include image.html alt=alt_tag file="../../hpe-apollo-4200-gen9/images/lff-drive-leds.png" %}

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

## Small Form Factor (SFF) Drive LEDs
hpe-apollo-4200-gen10
To locate the SFF drive LEDs, use the following diagram.

{% capture alt_tag %}Small form factor (SFF) drive LEDs on the {{site.a4200g10p}} node{% endcapture %}
{% include image.html alt=alt_tag file="sff-gen10-led-guide.png" %}

1. **Locate LED**

   * 🔵 **Solid Blue:** A host application is identifying the drive.
   * 🔵 **Flashing Blue:** The drive carrier firmware is updating or requires an update.

   {% include note.html content="The Locate LED is behind the release lever. When it is illuminated, it is visible." %}

1. **Activity Ring LED**

   * 🟢 **Rotating Green:** Drive activity
   * **Off:** No drive activity

1. **Drive Status LED**

   * 🟢 **Solid Green:** The drive is a member of one or more logical drives
   * 🟢 **Flashing Green:** The drive is rebuilding or performing a RAID migration, strip-size migration, capacity expansion, or logical drive extension or is erasing.
   * 🟠🟢 **Flashing Amber and Green:** The drive is a member of one or more logical drives and predicts drive failure.
   * 🟠 **Flashing Amber:** The drive isn't configured and predicts drive failure.
   * 🟠 **Solid Amber:** The drive has failed.
   * **Off:** A RAID controller hasn't configured the drive.

1. **Do Not Remove LED**

   * ⚪ **Solid White:** Don't remove the drive. Removing the drive causes one or more of the logical drives to fail.
   * **Off:** Removing the drive doesn't cause a logical drive to fail.

1. **Do Not Remove Button**

   To open the carrier, press the release lever.
