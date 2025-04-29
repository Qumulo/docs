---
title: "Replacing Hardware Components in Your Supermicro A+ WIO 1114S-WN10RT Nodes"
summary: "This section explains how to replace hardware components in Supermicro 1114S nodes."
permalink: /hardware-guide/supermicro-a-plus-wio-1114s-wn10rt/replacing-hardware-components.html
redirect_from:
  - /hardware/supermicro-a-plus-wio-1114s-wn10rt/replacing-hardware-components.html
sidebar: hardware_guide_sidebar
platform:
  - supermicro
  - sm1114s
---

{% include content-reuse/hardware-guides/platform-agnostic-part-replacement-admonitions.md %}

{% include content-reuse/hardware-guides/platform-agnostic-part-replacement-procedure-fvt.md %}

## To Replace a Drive
The ten hot-swap drive carriers are located at the front of your {{site.sm1114s}} chassis.

Replacement drives, including the on-site spare drives that you received with your original nodes, are provided without a drive carrier. When replacing a faulty drive, you must remove the existing drive from its carrier and then insert the new drive into the carriers. The drive carriers are toolless and don't require any screws.

{% include caution.html content="We strongly recommend having a Supermicro engineer perform on-site boot drive replacement." %}

1. Locate the drive that requires replacement by using the drive bay mapping.

   {% include image.html alt="Supermicro 1114S Drive Bay Mapping" file="supermicro-1114s-drive-bay-mapping.png" url="/hardware-guide/supermicro-a-plus-wio-1114s-wn10rt/images/supermicro-1114s-drive-bay-mapping.png" %}

1. To remove the existing drive:

   1. Press the orange release button on the right of the drive carrier until the drive carrier handle extends on the left.
    
   1. Use the drive carrier handle to pull the carrier out of the chassis.

   1. To remove the drive from the carrier, undo the mounting clips.

1. To install a replacement drive:

   1. Insert the new drive into the drive carrier with the printed circuit board (PCB) side facing down and the connector end facing towards the rear of the tray.

   1. Secure the drive to its carrier by using the mounting clips.

   1. Insert the drive carrier into the chassis with the orange release button facing right.
   
   1. Push the drive carrier into the chassis until the handle retracts and clicks into place.

{% include note.html content="If you remove and reinsert a drive extremely quickly (faster than one second), the baseboard management controller (BMC) doesn't recognize the drive and the activity LEDs don't return to their normal states. To resolve this issue, remove the drive, wait five seconds, and then reinsert it." %}

## To Replace an M.2 Boot Drive
The boot drive is located in the internal M.2 expansion slot.

{{site.bootDriveInit}}

{% include content-reuse/hardware-guides/platform-agnostic-boot-drive-replacement.md %}

## To Replace a Power Supply Unit (PSU)
The two hot-swap PSUs are located at the front of your {{site.sm1114s}} chassis. If either of the two PSUs fails, the other PSU takes on the full load and lets the node continue operating without interruption.

When a PSU fails, the **Info** LED at the front of the node begins to blink red every four seconds. In addition, the failure LED on the PSU at the back of the node lights up.

1. To determine which PSU failed, check the PSU LED.

   {% include image.html alt="Supermicro Power Supply Units (PSUs)" file="supermicro-1114s-psu-diagram.png" %}

1. Disconnect the power cord from the existing PSU.

1. To remove the existing PSU, press the purple release tab to the left while pulling on the handle.

1. Insert the new PSU and push it into the chassis until it clicks into place.

1. Connect the power cord to the new PSU.


## To Replace a Fan
Your {{site.sm1114s}} chassis has six internal fans. When a fan fails, the **Info** LED at the front of the node begins to blink red every second.

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
Your {{site.sm1114s}} chassis has 16 DIMM slots (8 &#215; 16 GB DIMMs for a total 128 GB of memory).

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
