---
title: "Panel LEDs on HPE Alletra 4140 Nodes"
summary: "This section explains the LEDs on HPE Alletra 4140 nodes, including front panel LEDs and buttons and rear panel LEDs."
permalink: /hardware-guide/hpe-alletra-4140/panel-leds.html
sidebar: hardware_guide_sidebar
---

## Front Panel LEDs and Buttons
On the front, right side of your node, there are four LEDs:

* UID Button and LED

* NIC Status LED

* Health LED

* Power On/Standby Button and System Power LED 

For more information about the color and behavior of these LEDs, see [Front Panel LEDs and Buttons](https://support.hpe.com/hpesc/public/docDisplay?docId=sd00003805en_us&page=GUID-D3D2588E-465D-49B5-977E-305234A3EDB6.html) in the HPE Alletra Storage Server 4140 Setup and Installation Guide.


## Rear Panel LED
On the back of your node, there is a UID LED. For more information about the color and behavior of this LEDs, see [Rear Panel LEDs](https://support.hpe.com/hpesc/public/docDisplay?docId=sd00003805en_us&page=GUID-5823604B-73C4-4642-9F1D-67A96838947E.html) in the HPE Alletra Storage Server 4140 Setup and Installation Guide.


## Rear LAN LEDs
On the back of your node, LAN LEDs are located behind the vent holes on the NIC. Each port has one light.

{{site.data.alerts.note}}
Network traffic <em>doesn't</em> affect the speed of the light's blinking.
{{site.data.alerts.end}}

| Color                            | Status             | Description      |
| -------------------------------- | ------------------ | ---------------- |
| &#8212;                          | Off                | No link          |
| {{site.led.green}} (solid green) | On or blinking     | Link established |
