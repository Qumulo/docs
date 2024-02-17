---
title: "Panel LEDs on Fujitsu PRIMERGY RX2540 M7 Nodes"
summary: "This section explains the LEDs on Fujitsu RX2540 M7 nodes."
permalink: /hardware-guide/fujitsu-primergy-rx2540-m7/panel-leds.html
sidebar: hardware_guide_sidebar
---

## Front Panel LEDs and Buttons
On the front, right side of your node, there are five LEDs.

| Label                            | Color                        |
| -------------------------------- | ---------------------------- |
| CSS (Customer Self Service) LED  | {{site.led.orange}} (orange) |
| Global Error LED                 | {{site.led.orange}} (orange) |
| Drive Access LED                 | {{site.led.green}} (green)   |
| Power Button with LED (DC On)    | {{site.led.green}} (green)   |
| Power Button with LED (AC On)    | {{site.led.white}} (white)   |
| Identification Button with LED   | {{site.led.blue}} (blue)     |


## Rear Panel LEDs
On the rear, left side of your node, there are three LEDs.

| Label                           | Color                        |
| ------------------------------- | ---------------------------- |
| Identification LED              | {{site.led.blue}} (blue)     |
| Global Error LED                | {{site.led.orange}} (orange) |
| CSS (Customer Self Service) LED | {{site.led.orange}} (orange) |


## Front HDD and Rear NVMe Carrier LEDs
Each HDD drive carrier in the front and NVMe carrier in the back has two LEDs.

| Label        | Color                        |
| ------------ | ---------------------------- |
| Drive Error  | {{site.led.orange}} (orange) |
| Drive Access | {{site.led.green}} (green)   |


## Rear LAN LEDs
On the back of your node, LAN LEDs are located behind the vent holes on the NIC. Each port has one light.

{% include note.html content="Network traffic _doesn't_ affect the speed of the light's blinking." %}

| Color                            | Status             | Description      |
| -------------------------------- | ------------------ | ---------------- |
| &#8212;                          | Off                | No link          |
| {{site.led.green}} (solid green) | On or blinking     | Link established |
