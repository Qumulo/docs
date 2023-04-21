---
title: "Panel LEDs on Quiver 1U Hybrid Gen2 Nodes"
summary: "This section explains the LEDs on Quiver 1UH Gen 2 nodes."
permalink: /hardware-guide/quiver-1u-hybrid-gen2/panel-leds.html
sidebar: hardware_guide_sidebar
keywords: LED, front_panel, power_fault, rear_panel, diagnose, diagnosis, hardware_health, Quiver_1U_Hybrid_Gen2
---

## Front Panel LEDs and Buttons

On the front, right side of your node, there are four LEDs.

| Label                 | Color and Behavior  | Description               |
| --------------------- | ------------------- | ------------------------- |
| Power Button with LED | 🔵 (solid blue)     | On                        |
| Power Button with LED | 🔵 (blinking blue)  | Standby or sleep          |
| ID LED                | Off                 | No ID requested           |
| ID LED                | 🔵 (solid blue)     | Selected unit ID          |
| Status LED            | Off                 | Operation normal          |
| Status LED            | 🟠 (solid amber)    | DC off and critical error |
| Status LED            | 🟠 (blinking amber) | DC on and critical error  |
| HDD Row LED           | Off                 | Operation normal          |
| HDD Row LED           | 🟠 (blinking amber) | Fault                     |


## NVMe Drive Carrier LEDs

Each NVMe drive carrier has one LED.

| Color or Behavior | Description   |
| ----------------- | ------------- |
| 🔵 (solid blue)   | Drive present |
| 🟠 (solid amber)  | Drive failed  |
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
| 🟢 (solid green) | On or blinking     | Link established |
