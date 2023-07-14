---
title: "Panel LEDs on Quiver 1U Hybrid Gen2 Nodes"
summary: "This section explains the LEDs on Quiver 1UH Gen2 nodes."
permalink: /hardware-guide/quiver-1u-hybrid-gen2/panel-leds.html
sidebar: hardware_guide_sidebar
keywords: LED, front_panel, power_fault, rear_panel, diagnose, diagnosis, hardware_health, Quiver_1U_Hybrid_Gen2, Quiver, Quiver_1UH, QVRG2-96T, QVRG2-240T, QVRG296T, QVRG2240T
---

## Front Panel LEDs and Buttons

On the front, right side of your node, there are four LEDs.

| Label                 | Color and Behavior  | Description               |
| --------------------- | ------------------- | ------------------------- |
| Power Button with LED | {{site.led.blue}} (solid blue)     | On                        |
| Power Button with LED | {{site.led.blue}} (blinking blue)  | Standby or sleep          |
| ID LED                | Off                 | No ID requested           |
| ID LED                | {{site.led.blue}} (solid blue)     | Selected unit ID          |
| Status LED            | Off                 | Operation normal          |
| Status LED            | {{site.led.orange}} (solid amber)    | DC off and critical error |
| Status LED            | {{site.led.orange}} (blinking amber) | DC on and critical error  |
| HDD Row LED           | Off                 | Operation normal          |
| HDD Row LED           | {{site.led.orange}} (blinking amber) | Fault                     |


## NVMe Drive Carrier LEDs

Each NVMe drive carrier has one LED.

| Color or Behavior | Description   |
| ----------------- | ------------- |
| {{site.led.blue}} (solid blue)   | Drive present |
| {{site.led.orange}} (solid amber)  | Drive failed  |
| Off               | Slot empty    |


## Rear LAN LEDs

On the back of your node, LAN LEDs are located behind the vent holes on the NIC. Each port has one light.

{{site.data.alerts.note}}
<ul>
  <li>{{site.noNIC}}</li>
  <li>Network traffic <em>doesn't</em> affect the speed of the light's blinking.</li>
</ul>
{{site.data.alerts.end}}


| Color            | Status             | Description      |
| ---------------- | ------------------ | ---------------- |
| &#8212;          | Off                | No link          |
| {{site.led.green}} (solid green) | On or blinking     | Link established |
