---
title: "Panel LEDs on Supermicro A+ ASG-1014S-ACR12N4H Nodes"
summary: "This section explains the LEDs on Supermicro 1014S nodes."
permalink: /hardware-guide/supermicro-a-plus-asg-1014s-acr12n4h/panel-leds.html
redirect_from:
  - /hardware/supermicro-a-plus-asg-1014s-acr12n4h/panel-leds.html
sidebar: hardware_guide_sidebar
keywords: LED, front_panel, power_fault, rear_panel, diagnose, diagnosis, hardware_health, Supermicro, Supermicro_1014S, 1014S, ACR12N4H
---

## Front Panel LEDs and Buttons

On the front, right side of your node, there are five LEDs.

| Label                  | Color and Behavior     | Description                                 |
| ---------------------- | ---------------------- | ------------------------------------------- |
| Info                   | {{site.led.red}} (solid red)         | Node overheated                             |          
| Info                   | {{site.led.red}} (1 s. blinking red) | Fan failed                                  |
| Info                   | {{site.led.red}} (4 s. blinking red) | Power Supply Unit (PSU) failed              |
| Info                   | {{site.led.blue}} (solid blue)        | Unit Identification (UID) activated locally |
| Info                   | {{site.led.blue}} (blinking blue)     | UID activated from IPMI                     |
| NIC 2 LED              | {{site.led.green}} (solid green)       | On                                          |
| NIC 2 LED              | {{site.led.green}} (blinking)          | Network activity                            |
| NIC 1 LED              | {{site.led.green}} (solid green)       | On                                          |
| NIC 1 LED              | {{site.led.green}} (blinking)          | Network activity                            |
| HDD LED                | {{site.led.green}} (blinking)          | Disk activity                               |
| Power LED              | {{site.led.green}} (on)                | On                                          |


## NVMe Drive Carrier LEDs

Each NVMe drive carrier has two LEDs.

| Label                  | Color or Behavior               | Description                          |
| ---------------------- | ------------------------------- | -----------------------------------  |
| Status LED             | Off                             | No issues detected                   |
| Status LED             | {{site.led.red}} (solid red)                  | Drive failed                         |
| Status LED             | {{site.led.red}} (1 s. blinking red)          | Drive rebuild activity               |
| Status LED             | {{site.led.red}} (2 red links) then 1 s. stop | Hot spare drive                      |
| Status LED             | {{site.led.red}} (5 s.) then off              | Power-on drive status                |
| Status LED             | {{site.led.red}} (0.25 s. blinking red)       | Identifying or locating drive status |
| Status LED             | {{site.led.green}} (on)                         | Drive is safe to remove              |
| Status LED             | {{site.led.orange}} (solid amber)                | Drive isn't safe to remove           |
| Activity LED           | {{site.led.blue}} (solid blue)                 | Drive installed                      |
| Activity LED           | {{site.led.blue}} (blinking blue)              | Drive activity                       |


## Rear LAN LEDs

On the back of your node, LAN LEDs are located behind the vent holes on the NIC. Each port has one light.

{% include note.html content="Network traffic *doesn't* affect the speed of the light's blinking." %}

| Color            | Status             | Description      |
| ---------------- | ------------------ | ---------------- |
| &#8212;          | Off                | No link          |
| {{site.led.green}} (solid green) | On or blinking     | Link established |
