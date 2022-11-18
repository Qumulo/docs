---
title: "Panel LEDs on HPE Apollo 4200 Gen10 Plus Nodes"
summary: "This section explains the LEDs on HPE Apollo 4200 Gen10 Plus nodes, including front panel LEDs and buttons, power fault LEDs, and rear panel LEDs. You can use these LEDs to diagnose hardware health issues. For more information, see <a href='https://www.hpe.com/psnow/product-documentation?oid=1013422400&cc=ca&lc=en&jumpid=in_pdp-psnow-docs'>HPE Apollo 4200 Gen10 Plus System - Product Documentation</a>."
permalink: hardware-guide/hpe-apollo-4200-gen10-plus/panel-leds.html
sidebar: hardware_guide_sidebar
keywords: LED, front panel, power fault, rear panel, diagnose, diagnosis, hardware health
---

## Front Panel LEDs and Buttons

To locate the front panel LEDs, use the following diagram.

{% capture alt_tag %}Front panel LEDs on the {{site.a4200g10p}} node{% endcapture %}
{% include image.html alt=alt_tag file="hpe-apollo-4200-gen10-plus-front-panel-led.png" %}

1. **Health LED**

1. **NIC Status LED**

1. **Front Drive Health or Thermal LED**

1. **System Power LED and Power-On or Standby Button**

1. **UID LED and Button**


## Rear Panel LEDs

To locate the rear panel LEDs, use the following diagram.

{% capture alt_tag %}Rear panel LEDs on the {{site.a4200g10p}} node{% endcapture %}
{% include image.html alt=alt_tag file="hpe-gen10-leds-rear.png" %}

1. **Dedicated iLO Port 1 Link LED**

   * 🟢 **Green:** Network link
   * **Off:** No network link

1. **Dedicated iLO Port 1 Activity LED**

   * 🟢 **Solid Green:** Link to network
   * 🟢 **Flashing Green:** Network active
   * **Off:** No network activity

1. **UID LED**

   * 🔵 **Solid Blue:** Activated
   * 🔵 **Flashing Blue:**

     * 1 flash per second: Remote management or firmware upgrade in progress
     * 4 flashes per second: iLO manual reboot sequence initiated
     * 8 flashes per second: iLO manual reboot sequence in progress

   * **Off:** Deactivated

1. **Dedicated iLO Port 2 Link LED**

   * 🟢 **Green:** Network link
   * **Off:** No network link

1. **Dedicated iLO Port 2 Activity LED**

   * 🟢 **Solid Green:** Link to network
   * 🟢 **Flashing Green:** Network active
   * **Off:** No network activity

1. **NIC Port 1 Link LED**

   * 🟢 **Green:** Network link
   * **Off:** No network link

1. **NIC Port 1 Activity LED**

   * 🟢 **Solid Green:** Link to network
   * 🟢 **Flashing Green:** Network active
   * **Off:** No network activity

1. **NIC Port 2 Link LED**

   * 🟢 **Green:** Network link
   * **Off:** No network link

1. **NIC Port 2 Activity LED**

   * 🟢 **Solid Green:** Link to network
   * 🟢 **Flashing Green:** Network active
   * **Off:** No network activity

1. **Power Supply LED**

   * 🟢 **Solid Green:** Normal
   * **Off:** One or more of the following conditions exist:

     * Power unavailable
     * Power supply failed
     * Power supply in standby mode
     * Power supply error
