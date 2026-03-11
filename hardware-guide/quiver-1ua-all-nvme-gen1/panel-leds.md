---
title: "Panel LEDs on Quiver 1U All-NVMe Gen1 Nodes"
summary: "This section explains the LEDs on Quiver 1UA Gen1 nodes."
permalink: /hardware-guide/quiver-1ua-all-nvme-gen1/panel-leds.html
sidebar: hardware_guide_sidebar
---

## Front Panel LEDs and Buttons

On the front, right side of your node, there are four LEDs. 

{% include note.html content="The LAN1 and LAN2 LEDs are unused." %}

| Label        | Color and Behavior | Description                             |
| ------------ | ------------------ | --------------------------------------- |
| Power LED    | {{site.led.green}} (solid green)   | The node is powered on                  |
| Message LED  | Off                | The node is functioning normally        |
| Message LED  | {{site.led.orange}} (solid amber)   | A hardware event has occurred           |
| Location LED | Off                | The node is functioning normally        |
| Location LED | {{site.led.blue}} (solid blue)    | The location button has been pressed    |



## Front and Internal Storage Bay NVMe Drive Carrier LEDs

Each NVMe drive carrier in front and internal storage bays has a red LED at the top and a green LED at the bottom

{% include note.html content="When both LEDs are off, the storage device isn't present" %}

| Location | Color and Behavior  | Description                                              |
| -------- | ------------------- | -------------------------------------------------------- |
| Top      | {{site.led.red}} (solid red)      | Storage device failed                                    |
| Top      | Off                 | Storage device healthy                                   |
| Bottom   | {{site.led.green}} (solid green)    | Storage device is powered on                             |
| Bottom   | {{site.led.green}} (blinking green) | Reading data from, or writing data to the storage device |


## Rear Panel LEDs and Buttons

On the back of your node, there are three LEDs.

| Label               | Color and Behavior | Description                             |
| ------------------- | ------------------ | --------------------------------------- |
| Q-Code LED          | {{site.led.orange}} (solid amber)   | Indicates a post code for troubleshooting. For more information, see the [Q-Code Table](/pdf/quiver-1ua-all-nvme-gen1-server-user-guide.pdf#page=23) in the ASUS documentation. |
| Location Button LED | {{site.led.blue}} (solid blue)    | The location button has been pressed. To turn off the LED, press the location button again. |
| Power LED           | {{site.led.green}} (solid green)   | The node is powered on. |
