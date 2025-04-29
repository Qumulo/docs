---
title: "Panel LEDs on Supermicro A+ WIO 1114S-WN10RT Nodes"
summary: "This section explains the LEDs on Supermicro 1114S nodes."
permalink: /hardware-guide/supermicro-a-plus-wio-1114s-wn10rt/panel-leds.html
redirect_from:
  - /hardware/supermicro-a-plus-wio-1114s-wn10rt/panel-leds.html
sidebar: hardware_guide_sidebar
---

## Front Panel LEDs and Buttons

On the front, right side of your node, there are five LEDs.

| Label         | Color and Behavior     | Description                                 |
| ------------- | ---------------------- | ------------------------------------------- |
| Info          | {{site.led.red}} (solid red)         | Node overheated                             |          
| Info          | {{site.led.red}} (1 s. blinking red) | Fan failed                                  |
| Info          | {{site.led.red}} (4 s. blinking red) | Power Supply Unit (PSU) failed              |
| Info          | {{site.led.blue}} (solid blue)        | Unit Identification (UID) activated locally |
| Info          | {{site.led.blue}} (blinking blue)     | UID activated from IPMI                     |
| Lan A         | Off                    | Unused                                      |
| Lan B         | Off                    | Unused                                      |
| Disk Activity | {{site.led.yellow}} (solid yellow)      | On or blinking                              |
| Power         | {{site.led.green}} (solid green)       | On                                          |

{% include note.html content="During normal operation, the **Lan B** LED might appear to be lit slightly when the **Disk Activity** LED is on." %}
