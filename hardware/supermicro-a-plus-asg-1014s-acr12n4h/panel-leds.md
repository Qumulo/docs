---
title: "Panel LEDs on Supermicro A+ ASG-1014S-ACR12N4H Nodes"
summary: "This section explains the LEDs of your Supermicro A+ ASG-1014S-ACR12N4H node."
permalink: hardware/supermicro-a-plus-asg-1014s-acr12n4h/panel-leds.html
sidebar: hardware_sidebar
keywords: LED, front panel, power fault, rear panel, diagnose, diagnosis, hardware health, Supermicro 1014S, ACR12N4H
---

This section explains the LEDs of your {{site.sm1014s}} node.

## Front Panel LEDs and Buttons

On the front, right side of your node, there are five LEDs.

| Label         | Colors                 | Description                                 |
| ------------- | ---------------------- | ------------------------------------------- |
| Info          | 🔴 (solid red)         | Node overheated                             |          
| Info          | 🔴 (1 s. blinking red) | Fan failed                                  |
| Info          | 🔴 (4 s. blinking red) | Power Supply Unit (PSU) failed              |
| Info          | 🔵 (solid blue)        | Unit Identification (UID) activated locally |
| Info          | 🔵 (blinking blue)     | UID activated using IPMI                    |
| Lan A         | ⚪ (off)               | Unused                                      |
| Lan B         | ⚪ (off)               | Unused                                      |
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
