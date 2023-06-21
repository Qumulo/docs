---
title: "Panel LEDs on Quiver 1U All-NVMe Gen1 Nodes"
summary: "This section explains the LEDs on Quiver 1UA Gen1 nodes."
permalink: /hardware-guide/quiver-1ua-all-nvme-gen1/panel-leds.html
sidebar: hardware_guide_sidebar
keywords: LED, front_panel, power_fault, rear_panel, diagnose, diagnosis, hardware_health, Quiver_1U_All-NVMe_Gen1
---

## Front Panel LEDs and Buttons

On the front, right side of your node, there are four LEDs. 

{% include note.html content="The LAN1 and LAN2 LEDs are unused." %}

| Label        | Color and Behavior | Description                             |
| ------------ | ------------------ | --------------------------------------- |
| Power LED    | 🟢 (solid green)   | The node is powered on                  |
| Message LED  | Off                | The node is functioning normally        |
| Message LED  | 🟠 (solid amber)   | A hardware event has occurred           |
| Location LED | Off                | The node is functioning normally        |
| Location LED | 🔵 (solid blue)    | The location button has been pressed    |



## Front Storage Bay NVMe Drive Carrier LEDs

Each NVMe drive carrier in the front storage bay has a red LED and a green LED.

{% include note.html content="The red LED is unused." %}

| Color and Behavior  | Description                                              |
| ------------------- | -------------------------------------------------------- |
| 🟢 (solid green)    | Storage device is powered on                             |
| green and red off   | Storage device not found                                 |
| 🟢 (blinking green) | Reading data from, or writing data to the storage device |


## Rear Panel LEDs and Buttons

On the back of your node, there are three LEDs.

| Label               | Color and Behavior | Description                             |
| ------------------- | ------------------ | --------------------------------------- |
| Q-Code LED          | 🟠 (solid amber)   | Indicates a post code for troubleshooting. For more information, see the [Q-Code Table](https://dlcdnets.asus.com/pub/ASUS/server/RS500A-E12-RS12U/Manual/E21507_RS500A-E12-RS12U_UM_V2_WEB.pdf?model=RS500A-E12-RS12U#page=23) in the ASUS documentation. |
| Location Button LED | 🔵 (solid blue)    | The location button has been pressed. To turn off the LED, press the location button again. |
| Power LED           | 🟢 (solid green)   | The node is powered on. |

## Rear LAN LEDs

On the back of your node, LAN LEDs are located behind the vent holes on the NIC. Each port has one light.

{{site.data.alerts.note}}
Network traffic <em>doesn't</em> affect the speed of the light's blinking.
{{site.data.alerts.end}}


| Color            | Status             | Description      |
| ---------------- | ------------------ | ---------------- |
| &#8212;          | Off                | No link          |
| 🟢 (solid green) | On or blinking     | Link established |
