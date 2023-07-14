---
title: "Panel LEDs on HPE Apollo 4200 Gen10 Nodes"
summary: "This section explains the LEDs on HPE Apollo 4200 Gen10 nodes, including front panel LEDs and buttons, power fault LEDs, and rear panel LEDs. You can use these LEDs to diagnose hardware health issues."
permalink: /hardware-guide/hpe-apollo-4200-gen10/panel-leds.html
redirect_from:
  - /hardware/hpe-apollo-4200-gen10/panel-leds.html
sidebar: hardware_guide_sidebar
keywords: LED, front_panel, power_fault, rear_panel, diagnose, diagnosis, hardware_health, HPE_Apollo_4200_Gen10, HPE, Apollo, 4200_Gen10
---

## Front Panel LEDs and Buttons

To locate the front panel LEDs, use the following diagram.

{% capture alt_front %}Front panel LEDs on the {{site.a4200g10}} node{% endcapture %}
{% include image.html alt=alt_front file="hpe-gen10-leds.png" %}

1. **Power On or Standby Button and System Power LED**

   * {{site.led.green}} **Solid Green:**  System on
   * {{site.led.green}} **Flashing Green:** (1 flash each second) Performing power-on sequence
   * {{site.led.orange}} **Solid Amber:** System in standby
   * **Off:** No power present

1. **UID Button and LED**

   * {{site.led.blue}} **Solid Blue:** Activated
   * {{site.led.blue}} **Flashing Blue:**

     * 1 flash each second: Remote management or firmware upgrade in progress
     * 4 flashes each second: iLO manual reboot sequence initiated
     * 8 flashes each second: iLO manual reboot sequence in progress

   * **Off:** Deactivated

1. **Health LED**

   * {{site.led.green}} **Solid Green:** Normal
   * {{site.led.green}} **Flashing Green:** (1 flash each second) iLO is rebooting
   * {{site.led.orange}} **Flashing Amber:** System degraded
   * {{site.led.red}} **Flashing Red:** (1 flash each second) System critical

   {% include note.html content="If the Health LED indicates a degraded or critical state, review the system integrated management log (IML) or use iLO to review the system health status." %}

1. **NIC Status LED**

   * {{site.led.green}} **Solid Green:** Link to network
   * {{site.led.green}} **Flashing Green:** (1 flash each second) Network active
   * **Off:** No network activity

1. **Front Drive Health or Thermal LED**

   * {{site.led.green}} **Solid Green:** Drives which the SAS expander supports are functional. This applies to all front drives and the rear drives connected to the front drive cage 2 backplane.
   * {{site.led.orange}} **Solid Amber:** Failure or predictive failure of one or more drives that the SAS expander supports. This applies to all front drives and to the rear drives connected to the front drive cage 2 backplane.
   * {{site.led.orange}} **Flashing Amber:** (1 flash each second) The temperature sensor in one or more front drives is about to reach the thermal threshold. You must immediately slide the front drive cages back into the chassis and keep them there until the LED turns green.

     {% include note.html content="This LED behavior depends on the iLO 08-HD Max sensor reading." %}

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

## Rear Panel LEDs

To locate the rear panel LEDs, use the following diagram.

{% capture alt_rear %}Rear panel LEDs on the {{site.a4200g10}} node{% endcapture %}
{% include image.html alt=alt_rear file="hpe-gen10-leds-rear.png" %}

1. **Dedicated iLO Port 1 Link LED**

   * {{site.led.green}} **Green:** Network link
   * **Off:** No network link

1. **Dedicated iLO Port 1 Activity LED**

   * {{site.led.green}} **Solid Green:** Link to network
   * {{site.led.green}} **Flashing Green:** Network active
   * **Off:** No network activity

1. **UID LED**

   * {{site.led.blue}} **Solid Blue:** Activated
   * {{site.led.blue}} **Flashing Blue:**

     * 1 flash each second: Remote management or firmware upgrade in progress
     * 4 flashes each second: iLO manual reboot sequence initiated
     * 8 flashes each second: iLO manual reboot sequence in progress

   * **Off:** Deactivated

1. **Dedicated iLO Port 2 Link LED**

   * {{site.led.green}} **Green:** Network link
   * **Off:** No network link

1. **Dedicated iLO Port 2 Activity LED**

   * {{site.led.green}} **Solid Green:** Link to network
   * {{site.led.green}} **Flashing Green:** Network active
   * **Off:** No network activity

1. **NIC Port 1 Link LED**

   * {{site.led.green}} **Green:** Network link
   * **Off:** No network link

1. **NIC Port 1 Activity LED**

   * {{site.led.green}} **Solid Green:** Link to network
   * {{site.led.green}} **Flashing Green:** Network active
   * **Off:** No network activity

1. **NIC Port 2 Link LED**

   * {{site.led.green}} **Green:** Network link
   * **Off:** No network link

1. **NIC Port 2 Activity LED**

   * {{site.led.green}} **Solid Green:** Link to network
   * {{site.led.green}} **Flashing Green:** Network active
   * **Off:** No network activity

1. **Power Supply LED**

   * {{site.led.green}} **Solid Green:** Normal
   * **Off:** One or more of the following conditions exist:

     * Power unavailable
     * Power supply failed
     * Power supply in standby mode
     * Power supply error
