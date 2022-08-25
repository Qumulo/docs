---
title: "Replacing Hardware Components in Your Supermicro A+ ASG-1014S-ACR12N4H Nodes"
summary: "This section explains how you can replace hardware components in your Supermicro A+ ASG-1014S-ACR12N4H nodes."
permalink: hardware/supermicro-a-plus-asg-1014s-acr12n4h/replacing-hardware-components.html
sidebar: hardware_sidebar
keywords: technical specifications, tech specs, specs, specifications, Supermicro 1014S, ACR12N4H
---

This section explains how you can replace hardware components in your {{site.sm1014s}} nodes.

{{site.data.alerts.caution}}
<ul>
  <li>We strongly recommend engaging an on-site Supermicro engineer to replace failed hardware components including but not limited to any procedure that:
    <ul>
      <li>This guide doesn't cover</li>
      <li>You haven't received training on</li>
      <li>Requires precautions to avoid damage caused by electrostatic discharge (ESD) by using industry standard anti-static equipment (such as gloves or wrist straps)</li>
    </ul>
  </li>
  <li>Don't update your node firmware unless a Qumulo representative instructs you to perform an update.</li>
</ul>
{{site.data.alerts.end}}

This section explains the most common scenarios of replacing failed hardware components such as:
* Drives (excluding boot drives)
* Power Supply Units (PSUs)
* Fans
* DIMM (memory)

## Performing the Part Replacement Procedure by Using the FVT
When you replace a component of your node (such as the motherboard or an NIC card), you must ensure that the firmware version and configuration are correct for your new components. To do this, you must perform the part replacement procedure using the FVT.

{% include note.html content="Before you replace the motherboard, you must request a new Data Center Management Suite (DCMS) license key from Supermicro and apply it before you run the FVT. (The license key uses the BMC MAC address which changes with the motherboard.) If you don't install a DCMS license on a {{site.sm1014s}} node, the Field Verification Tool (FVT) fails, preventing you from installing Qumulo Core." %}

1. Boot by using the latest version of the Qumulo Core USB Drive Installer.

1. Select **[*] Perform maintenance**.
   
1. Select **[2] Perform automatic repair after part replacement (non-destructive)**.

   The part replacement procedure runs and the **FVT passed!** message appears.

{% include note.html content="In some cases, after the part replacement procedure, the message `FIX: Run the FVT flash command.` appears. Enter `1` as you would for a [fixable issue](/hardware/supermicro-a-plus-asg-1014s-acr12n4h/getting-started.html#fixable-issues-during-installation) to reboot the node and then repeat the part replacement procedure." %}

## To Replace a Drive
Your {{site.sm1014s}} chassis contains 12 HDDs, 4 NVMe drives, and 1 M.2 NVMe boot drive. For information about replacing these drives, see the following topics in the Supermicro documentation.

* [Storage Drives (HDD and NVMe)](https://www.supermicro.com/manuals/superserver/1U/MNL-2436.pdf#page=40)

* [Installing an M.2 Solid State Drive](https://www.supermicro.com/manuals/superserver/1U/MNL-2436.pdf#page=44)


## To Replace a Power Supply Unit (PSU)
The two hot-swap PSUs are located at the front of your Supermicro 1114S chassis. If either of the two PSUs fails, the other PSU takes on the full load and lets the node continue operating without interruption.

When a PSU fails, the **Info** LED at the front of the node begins to blink red every four seconds. In addition, the failure LED on the PSU at the back of the node lights up.

1. To determine which PSU failed, check the PSU LED.

   {% include image.html alt="Supermicro Power Supply Units (PSUs)" file="supermicro-psu-diagram.png" %}

1. Disconnect the power cord from the existing PSU.

1. To remove the existing PSU, press the purple release tab to the left while pulling on the handle.

1. Insert the new PSU and push it into the chassis until it clicks into place.

1. Connect the power cord to the new PSU.


## To Replace a Fan
Your Supermicro 1114S chassis has six internal fans. When a fan fails, the **Info** LED at the front of the node begins to blink red every second.

{{site.data.alerts.caution}}
<ul>
  <li>The fans aren't hot-swappable. You must power off the node to replace a fan. However, you may remove the top cover to determine which fan failed.</li>
  <li>For optimal air circulation, you must always reinstall the top chassis cover. You must never run the node for an extended period of time with the top chassis cover removed.</li>
</ul>
{{site.data.alerts.end}}

1. Power off the node, remove the top chassis cover, and disconnect the power cords from both PSUs.

1. Disconnect the existing fan housing cable from the motherboard and remove the fan housing from its two mounting posts.

1. Insert a new fan provided by Supermicro into the housing, making sure that the airflow direction arrows on top of the fan face the same direction as the arrows on the other fans.

1. Reposition the fan housing over the two mounting posts and connect the fan housing cable to the motherboard.

1. Power on the node and confirm that the new fan is working properly and the **Info** LED has stopped blinking red.

1. Install the top chassis cover.


## To Replace a DIMM
Your Supermicro 1114S chassis has 16 DIMM slots (8 &#215; 16 GB DIMMs for a total 128 GB of memory).

To identify which DIMM failed, you must use the baseboard management controller (BMC) on the node or another hardware monitoring solution.

{{site.data.alerts.caution}}
<ul>
  <li>Use extreme caution when handling DIMMs. Don't touch their metal contacts.</li>
  <li>Never force a DIMM into a slot. Each DIMM has a keyed notch which lets you insert the module in only one way.</li>
  <li>DIMMs aren't hot-swappable. You must power off the node to replace a DIMM.</li>
  <li>For optimal air circulation, you must always reinstall the top chassis cover. You must never run the node for an extended period of time with the top chassis cover removed.</li>
</ul>
{{site.data.alerts.end}}

1. Power off the node, remove the top chassis cover, and disconnect the power cords from both PSUs.

1. Remove the existing DIMM.

   The following is the DIMM slot mapping. In this diagram, the CPU socket mounting bracket and power headers are at the bottom.

    <table>
      <tr>
         <th>Slot</th>
         <td>1</td>
         <td>2</td>
         <td>3</td>
         <td>4</td>
         <td>5</td>
         <td>6</td>
         <td>7</td>
         <td>8</td>
         <td>CPU Socket</td>
         <td>9</td>
         <td>10</td>
         <td>11</td>
         <td>12</td>
         <td>13</td>
         <td>14</td>
         <td>15</td>
         <td>16</td>
      </tr>
      <tr>
         <th>DIMM</th>
         <td>D2</td>
         <td>D1</td>
         <td>C2</td>
         <td>C1</td>
         <td>B2</td>
         <td>B1</td>
         <td>A2</td>
         <td>A1</td>
         <td>Bracket at bottom</td>
         <td>E1</td>
         <td>E2</td>
         <td>F1</td>
         <td>F2</td>
         <td>G1</td>
         <td>G2</td>
         <td>H1</td>
         <td>H2</td>
      </tr>
    </table>
   
1. To remove the existing DIMM, press both DIMM slot release tabs outwards. When the module is loose, remove it from the slot.

1. To insert a new DIMM, align the keyed notch on the DIMM with the receptive points on the DIMM slot.

1. Push in both ends of the DIMM straight down until it clicks into place.

1. Press both DIMM slot release tabs inwards.

1. Install the top chassis cover.

1. Power on the node.
