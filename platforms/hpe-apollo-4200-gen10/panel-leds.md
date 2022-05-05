---
title: "Panel LEDs on HPE Apollo 4200 Gen10 Nodes"
summary: "This section explains the LEDs of your HPE Apollo 4200 Gen10 node."
permalink: platforms/hpe-apollo-4200-gen10/panel-leds.html
sidebar: platforms_sidebar
keywords: LED, front panel, power fault, rear panel, diagnose, diagnosis, hardware health
---

This section explains the LEDs of your HPE Apollo 4200 Gen10 node, including front panel LEDs and buttons, power fault LEDs, and rear panel LEDs. You can use these LEDs to diagnose hardware health issues. For more information, see [HPE Apollo 4200 Gen10 Server - Document List](https://support.hpe.com/hpesc/public/docDisplay?docLocale=en_US&docId=emr_na-a00061642en_us).

## Front Panel LEDs and Buttons

To locate the front panel LEDs, use the following diagram.

{% include image.html alt="Front panel LEDs on the HPE Apollo 4200 Gen10 node" file="hpe-gen10-leds.png" %}

1. **Power On or Standby Button and System Power LED**

   * 🟢 **Solid Green:**  System on
   * 🟢 **Flashing Green:** (1 flash per second) Performing power-on sequence
   * 🟠 **Solid Amber:** System in standby
   * **Off:** No power present

1. **UID Button and LED**

   * 🔵 **Solid Blue:** Activated
   * 🔵 **Flashing Blue:**

     * 1 flash per second: Remote management or firmware upgrade in progress
     * 4 flashes per second: IPMI (iLO) manual reboot sequence initiated
     * 8 flashes per second: IPMI (iLO) manual reboot sequence in progress

   * **Off:** Deactivated

1. **Health LED**

   * 🟢 **Solid Green:** Normal
   * 🟢 **Flashing Green:** (1 flash per second) IPMI (iLO) is rebooting
   * 🟠 **Flashing Amber:** System degraded
   * 🔴 **Flashing Red:** (1 flash per second) System critical

   {% include note.html content="If the Health LED indicates a degraded or critical state, review the system integrated management log (IML) or use IPMI (iLO) to review the system health status." %}

1. **NIC Status LED**

   * 🟢 **Solid Green:** Link to network
   * 🟢 **Flashing Green:** (1 flash per second) Network active
   * **Off:** No network activity

1. **Front Drive Health or Thermal LED**

   * 🟢 **Solid Green:** Drives which the SAS expander supports are functional. This applies to all front drives and the rear drives connected to the front drive cage 2 backplane.
   * 🟠 **Solid Amber:** Failure or predictive failure of one or more drives that the SAS expander supports. This applies to all front drives and to the rear drives connected to the front drive cage 2 backplane.
   * 🟠 **Flashing Amber:** (1 flash per second) The temperature sensor in one or more front drives is about to reach the thermal threshold. You must immediately slide the front drive cages back into the chassis and keep them there until the LED turns green.

     {% include note.html content="This LED behavior depends on the IPMI (iLO) 08-HD Max sensor reading." %}

   * **Off:** No power present

{{site.data.alerts.note}}
If the (5) Front Drive Health or Thermal LED, or the (1) Power On or Standby Button and System Power LED are off, one of the following conditions is possible:

<ul>
  <li>Facility power not present</li>
  <li>Power cord detached</li>
  <li>No power supplies installed</li>
  <li>Power supply failure</li>
  <li>Front I/O cable disconnected</li>
</ul>
{{site.data.alerts.end}}

### Power Fault LEDs

If the (1) Power On or Standby Button and System Power LED, (2) UID Button and LED, (3) Health LED, and (4) NIC Status LED flash simultaneously, a power fault has occurred. The following table lists the LED behavior corresponding to affected subsystems.

<table>
<thead>
  <tr>
    <th>Number of LED Flashes</th>
    <th>Affected Subsystem</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>1</td>
    <td>System board</td>
  </tr>
  <tr>
    <td>2</td>
    <td>Processor</td>
  </tr>
  <tr>
    <td>3</td>
    <td>Memory</td>
  </tr>
  <tr>
    <td>4</td>
    <td>Riser board PCIe slots</td>
  </tr>
  <tr>
    <td>5</td>
    <td>FlexibleLOM</td>
  </tr>
  <tr>
    <td>6</td>
    <td>Removable HPE Flexible Smart Array controller or Smart SAS HBA controller</td>
  </tr>
  <tr>
    <td>7</td>
    <td>System board PCIe slots</td>
  </tr>
  <tr>
    <td>8</td>
    <td>Power backplane or storage backplane</td>
  </tr>
  <tr>
    <td>9</td>
    <td>Power supply</td>
  </tr>  
</tbody>
</table>

### Rear Panel LEDs

The LEDs on the rear panel of HPE Apollo 4200 Gen10 servers can be located using the diagram below:

## Rear Panel LEDs

To locate the rear panel LEDs, use the following diagram.

{% include image.html alt="Rear panel LEDs on the HPE Apollo 4200 Gen10 node" file="hpe-gen10-leds-rear.png" %}

1. **Dedicated IPMI (iLO) Port 1 Link LED**

   * 🟢 **Green:** Network link
   * **Off:** No network link

1. **Dedicated IPMI (iLO) Port 1 Activity LED**

   * 🟢 **Solid Green:** Link to network
   * 🟢 **Flashing Green:** Network active
   * **Off:** No network activity

1. **UID LED**

   * 🔵 **Solid Blue:** Activated
   * 🔵 **Flashing Blue:**

     * 1 flash per second: Remote management or firmware upgrade in progress
     * 4 flashes per second: IPMI (iLO) manual reboot sequence initiated
     * 8 flashes per second: IPMI (iLO) manual reboot sequence in progress

   * **Off:** Deactivated

1. **Dedicated IPMI (iLO) Port 2 Link LED**

   * 🟢 **Green:** Network link
   * **Off:** No network link

1. **Dedicated IPMI (iLO) Port 2 Activity LED**

   * 🟢 **Solid Green:** Link to network
   * 🟢 **Flashing Green:** Network active
   * **Off:** No network activity

1. **NIC Port 1 Link LED**

   * 🟢 **Green:** Network link
   * **Off:** No network link

1. **NIC Port 1 Activity LED**

   * 🟢 **Solid Green:** Link to network
   * 🟢 **Flashing Green:** Network active
   * **Off:** No network activity

1. **NIC Port 2 Link LED**

   * 🟢 **Green:** Network link
   * **Off:** No network link

1. **NIC Port 2 Activity LED**

   * 🟢 **Solid Green:** Link to network
   * 🟢 **Flashing Green:** Network active
   * **Off:** No network activity

1. **Power Supply LED**

   * 🟢 **Solid Green:** Normal
   * **Off:** One or more of the following conditions exist:

     * Power unavailable
     * Power supply failed
     * Power supply in standby mode
     * Power supply error
