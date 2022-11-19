---
title: "Panel LEDs on Supermicro A+ WIO 1114S-WN10RT Nodes"
summary: "This section explains the LEDs on Supermicro 1114S nodes."
permalink: /hardware-guide/supermicro-a-plus-wio-1114s-wn10rt/panel-leds.html
redirect_from:
  - /hardware/supermicro-a-plus-wio-1114s-wn10rt/panel-leds.html
sidebar: hardware_guide_sidebar
keywords: LED, front panel, power fault, rear panel, diagnose, diagnosis, hardware health, Supermicro 1114S, WN10RT
---

## Front Panel LEDs and Buttons

On the front, right side of your node, there are five LEDs.

| Label         | Color and Behavior     | Description                                 |
| ------------- | ---------------------- | ------------------------------------------- |
| Info          | 🔴 (solid red)         | Node overheated                             |          
| Info          | 🔴 (1 s. blinking red) | Fan failed                                  |
| Info          | 🔴 (4 s. blinking red) | Power Supply Unit (PSU) failed              |
| Info          | 🔵 (solid blue)        | Unit Identification (UID) activated locally |
| Info          | 🔵 (blinking blue)     | UID activated from IPMI                     |
| Lan A         | Off                    | Unused                                      |
| Lan B         | Off                    | Unused                                      |
| Disk Activity | 🟡 (solid yellow)      | On or blinking                              |
| Power         | 🟢 (solid green)       | On                                          |

{% include note.html content="During normal operation, the **Lan B** LED might appear to be lit slightly when the **Disk Activity** LED is on." %}

## Rear LAN LEDs

On the back of your node, LAN LEDs are located behind the vent holes on the NIC. Each port has one light.

{% include note.html content="Network traffic *doesn't* affect the speed of the light's blinking." %}

| Color            | Status             | Description      |
| ---------------- | ------------------ | ---------------- |
| &#8212;          | Off                | No link          |
| 🟢 (solid green) | On or blinking     | Link established |
