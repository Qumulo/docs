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

| Label                  | Color and Behavior     | Description                                 |
| ---------------------- | ---------------------- | ------------------------------------------- |
| Info                   | 🔴 (solid red)         | Node overheated                             |          
| Info                   | 🔴 (1 s. blinking red) | Fan failed                                  |
| Info                   | 🔴 (4 s. blinking red) | Power Supply Unit (PSU) failed              |
| Info                   | 🔵 (solid blue)        | Unit Identification (UID) activated locally |
| Info                   | 🔵 (blinking blue)     | UID activated using IPMI                    |
| NIC 2 LED              | 🟢 (solid green)       | On                                          |
| NIC 2 LED              | 🟢 (blinking)          | Network activity                            |
| NIC 1 LED              | 🟢 (solid green)       | On                                          |
| NIC 1 LED              | 🟢 (blinking)          | Network activity                            |
| HDD LED                | 🟢 (blinking)          | Disk activity                               |
| Power LED              | 🟢 (on)                | On                                          |

Each NVMe drive carrier has two LEDs.

| Label                  | Color or Behavior               | Description                          |
| ---------------------- | ------------------------------- | -----------------------------------  |
| Status LED             | ⚪ (off)                        | No issues detected                   |
| Status LED             | 🔴 (solid red)                  | Drive failed                         |
| Status LED             | 🔴 (1 s. blinking red)          | Drive rebuild activity               |
| Status LED             | 🔴 (2 red links) then 1 s. stop | Hot spare drive                      |
| Status LED             | 🔴 (5 s.) then ⚪ (off)         | Power-on drive status                |
| Status LED             | 🔴 (0.25 s. blinking red)       | Identifying or locating drive status |
| Status LED             | 🟢 (on)                         | Drive is safe to remove              |
| Status LED             | 🟠 (solid amber)                | Drive is not safe to remove          |
| Activity LED           | 🔵 (solid blue)                 | Drive installed                      |
| Activity LED           | 🔵 (blinking blue)              | Drive activity                       |


## Rear LAN LEDs

On the back of your node, LAN LEDs are located behind the vent holes on the NIC. Each port has one light.

{% include note.html content="Network traffic *doesn't* affect the speed of the light's blinking." %}

| Color            | Status             | Description      |
| ---------------- | ------------------ | ---------------- |
| &#8212;          | Off                | No link          |
| 🟢 (solid green) | On or blinking     | Link established |
