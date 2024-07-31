---
title: "Panel LEDs on Supermicro A+ ASG-2015S-E1CR24L Nodes"
summary: "This section explains the LEDs on Supermicro 2015S nodes."
permalink: /hardware-guide/supermicro-a-plus-asg-2015s-e1cr24l/panel-leds.html
sidebar: hardware_guide_sidebar
---

## Front Panel LEDs and Buttons

On the front, right side of your node, there are seven LEDs. The following table describes the UID button and LED, the Information LED, and the Power LED.

| Label                         | Color and Behavior                                                                           | Description                                       |
| ----------------------------- | -------------------------------------------------------------------------------------------- | ------------------------------------------------- |
| UID Button and LED            | Off                                                                                          | UID off                                           |
| UID Button and LED            | {{site.led.blue}} (solid blue)                                                               | Unit identified at local site                     |
| UID Button and LED            | {{site.led.blue}} (slow-blinking blue)                                                       | Unit identified at remote site or system recovery |
| Information LED               | {{site.led.red}} (solid red)                                                                 | System overheated                                 |
| Information LED               | {{site.led.red}} (1 s. blinking red)                                                         | Fan failed                                        |
| Information LED               | {{site.led.red}} (4 s. blinking red)                                                         | Power Supply Unit (PSU) failed                    |
| Information LED and Power LED | {{site.led.red}} {{site.led.green}} (Info LED solid red, power LED blinking green)           | Fault detected                                    | 
| Information LED               | {{site.led.blue}}/{{site.led.red}} (0.1 s. blinking blue/red)                                | Recovery mode                                     |
| Information LED               | {{site.led.blue}} (solid blue)                                                               | UID activated locally                             |
| Information LED               | {{site.led.blue}} (1 s. blinking blue)                                                       | UID activated by using the BMC                    |
| Information LED               | {{site.led.blue}} (0.5 s. blinking blue)                                                     | BMC resetting                                     |
| Information LED               | {{site.led.blue}} (0.25 s. blinking blue)                                                    | BMC configuring factory defaults                  |
| Information LED and Power LED | {{site.led.blue}} {{site.led.green }} (Info LED solid blue, power LED 0.1 s. blinking green) | BMC or BIOS firmware updating                     |


## NVMe Drive Carrier LEDs

Each NVMe drive carrier has two LEDs.

| Label                  | Color or Behavior                              | Description                         |
| ---------------------- | ---------------------------------------------- | ----------------------------------- |
| Status LED             | {{site.led.red}} (solid red)                   | Drive failed                        |
| Status LED             | {{site.led.red}} (1 s. blinking red)           | Rebuilding drive                    |
| Status LED             | {{site.led.red}} (2 red blinks) then 1 s. stop | Hot spare for drive                 |
| Status LED             | {{site.led.red}} (on for 5 s.) then off        | Power on for drive                  |
| Status LED             | {{site.led.red}} (0.25 s. blinking red)        | Identifying drive                   |
| Status LED             | {{site.led.green}} (solid green)               | NVMe drive safe to remove           |
| Status LED             | {{site.led.orange}} (1 s. blinking amber)      | NVMe drive not safe to remove       |
| Activity LED           | {{site.led.blue}} (solid blue)                 | Idle NVMe drive installed           |
| Activity LED           | {{site.led.blue}} (blinking blue)              | Drive active                        |
| Activity LED           | Off                                            | Idle SATA drive installed           |


## Rear LAN LEDs

On the back of your node, LAN LEDs are located behind the vent holes on the NIC. Each port has one light.

{% include note.html content="Network traffic *doesn't* affect the speed of the light's blinking." %}

| Color            | Status             | Description      |
| ---------------- | ------------------ | ---------------- |
| &#8212;          | Off                | No link          |
| {{site.led.green}} (solid green) | On or blinking     | Link established |
