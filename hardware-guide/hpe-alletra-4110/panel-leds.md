---
title: "Panel LEDs on HPE Alletra 4110 Nodes"
summary: "This section explains the LEDs on HPE Alletra 4110 nodes, including front panel LEDs and buttons and rear panel LEDs."
permalink: /hardware-guide/hpe-alletra-4110/panel-leds.html
sidebar: hardware_guide_sidebar
---

## Front Panel LEDs and Buttons
On the front, right side of your node, there are four LEDs.  The following diagram shows the LEDs and buttons on the front panel.

{% capture alt_tag %}The System Power LED and Power On or Standby Button, Health LED, NIC Status LED, and UID Button and LED on a {{site.all4110}} node{% endcapture %}
{% include image.html alt=alt_tag file="hpe-alletra-4110-front-panel-led.png" %}

| Label                                           | Color and Behavior                                       | Description                                       |
| ----------------------------------------------- | -------------------------------------------------------- | ------------------------------------------------- |
| System Power LED and Power On or Standby Button | {{site.led.green}} (solid green)                         | System is powered on                              |
| System Power LED and Power On or Standby Button | {{site.led.green}} (1 s. blinking green)                 | Performing power-on sequence                      |
| System Power LED and Power On or Standby Button | {{site.led.orange}} (solid amber)                        | System is on standby                              |
| System Power LED and Power On or Standby Button | Off                                                      | System is powered off                             |
| Health LED                                      | {{site.led.green}} (solid green)                         | Health is normal                                  |
| Health LED                                      | {{site.led.green}} (1 s. blinking green)                 | iLO is rebooting                                  |
| Health LED                                      | {{site.led.orange}} (blinking amber)                     | System state degraded                             |
| Health LED                                      | {{site.led.red}} (1 s. blinking red)                     | System state critical                             |
| NIC Status LED                                  | {{site.led.green}} (solid green)                         | Linked to network                                 |
| NIC Status LED                                  | {{site.led.green}} (1 s. flashing green)                 | Network active                                    |
| NIC Status LED                                  | Off                                                      | No network activity                               |
| UID Button and LED                              | {{site.led.blue }} (solid blue)                          | UID activated                                     |
| UID Button and LED                              | {{site.led.blue }} (1 s. blinking blue)                  | Remote management or firmware upgrade in progress |
| UID Button and LED                              | {{site.led.blue }} (0.25 s. blinking blue)               | Manual iLO reboot sequence initiated              |
| UID Button and LED                              | {{site.led.blue }} (0.125 s. blinking blue)              | Manual iLO reboot sequence in progress            |
| UID Button and LED                              | {{site.led.blue }} (1 fast blue blink) then 3 s. stop    | iLO service port status is `Complete`             |
| UID Button and LED                              | {{site.led.blue }} (4 medium blue blinks) then 1 s. stop | iLO service port status is `Busy`                 |
| UID Button and LED                              | {{site.led.blue }} (8 fast blue blinks) then 1 s. stop   | iLO service port status is `Error`                |
| UID Button and LED                              | {{site.led.blue }} Off                                   | UID deactivated                                   |


## Rear Panel LED
On the back of your node, there is a UID LED.

| Color and Behavior                         | Description                                       |
| ------------------------------------------ | ------------------------------------------------- |
| {{site.led.blue}} (solid blue)             | UID activated                                     |
| {{site.led.blue}} (1 s. blinking blue)     | Remote management or firmware upgrade in progress |
| {{site.led.blue}} (0.25 s. blinking blue)  | Manual iLO reboot sequence has been initiated     |
| {{site.led.blue}} (0.125 s. blinking blue) | Manual iLO reboot sequence is in progress         |
| Off                                        | UID deactivated                                   |


## Rear LAN LEDs
On the back of your node, LAN LEDs are located behind the vent holes on the NIC. Each port has one light.

{{site.data.alerts.note}}
Network traffic <em>doesn't</em> affect the speed of the light's blinking.
{{site.data.alerts.end}}

| Color                            | Status             | Description      |
| -------------------------------- | ------------------ | ---------------- |
| &#8212;                          | Off                | No link          |
| {{site.led.green}} (solid green) | On or blinking     | Link established |
