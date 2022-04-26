---
title: "HPE Apollo 4200 Gen9 LED Guide"
summary: "Outlines the LED behavior in the HPE Apollo 4200 Gen9 server."
permalink: platforms/hpe-apollo-4200-gen9/led-guide.html
sidebar: platforms_sidebar
---
## In This Article

Outlines the LED locations and status indicators for HPE Apollo 4200 Gen9 servers

-   Front panel LEDs and buttons
-   Power fault LEDs
-   Rear panel LEDs

## Requirements

-   HPE Apollo 4200 Gen9 server

For additional details on HPE Apollo 4200 servers, reference the  [HPE Apollo 4200 Gen9 Server Document List](https://support.hpe.com/hpesc/public/docDisplay?docLocale=en_US&docId=c05058024).

## Details

HPE Apollo 4200 Gen9 servers include several LED indicators which can be used to diagnose health issues with the hardware.

## HPE Apollo 4200 Gen9 Front Panel LEDs And Buttons

The LEDs on the front panel of HPE Apollo 4200 Gen9 servers can be located using the diagram below:

{% include image.html alt="" file="hpe-front-leds.png" %}

### LED Codes

**(1) Health LED**

-   Solid green: Normal
-   Flashing green (1 flash per second): iLO is rebooting
-   Flashing Amber: System degraded
-   Flashing red (1 flash per second): System critical

{{site.data.alerts.note}}
If the health LED indicates a degraded or critical state, review the system IML or use iLO to review the system health status.
{{site.data.alerts.end}}

**(2) NIC status LED**

-   Solid green: Link to network
-   Flashing green (1 flash per second): Network active
-   Off: No network activity

**(3) Front drive health/thermal LED**

-   Solid green: Drives supported by the SAS expander are functional (applies to all front drives as well as to the rear drives connected to the front drive cage 2 backplane)
-   Solid amber: Failure or predictive failure of one or more drives supported by the SAS expander (applies to all front drives as well as to the rear drives connected to the front drive cage 2 backplane)
-   Flashing amber (1 flash per second): The temperature sensor in one or more front drives is about to reach the thermal threshold. Immediately slide the front drive cages back into the chassis and keep them there until the LED turns green. Note that this LED behavior depends on the iLO 08-HD Max sensor reading.
-   Off: No power present

**(4) Power On/Standby button and system power LED**

-   Solid green: System on
-   Flashing green (1 flash per second): Performing power on sequence
-   Solid amber: System is in standby
-   Off: No power present

**(5) UID button/LED**

-   Solid blue: Activated
-   Flashing blue:
    -   1 flash per second = Remote management or firmware upgrade in progress
    -   4 flashes per second = iLO manual reboot sequence initiated
    -   8 flashes per second = iLO manual reboot sequence in progress
-   Off: Deactivated

{{site.data.alerts.note}}
If the Front drive health/thermal LED (3) or Power on/standby button and system power LED (4) are off, it could mean one of the following:
{{site.data.alerts.end}}

-   Facility power is not present
-   Power cord is not attached
-   No power supplies are installed
-   Power supply failure has occurred
-   Front I/O cable is disconnected

### Power Fault LEDs

If the Health LED (1), NIC status LED (2), Power on/standby button and system power LED (4) and the UID button/LED (5) flash simultaneously, a power fault has occurred. The following table provides a list of power fault LEDs and the subsystems that are affected.

{% include image.html alt="" file="hpe-power-led-guide.png" %}

### Rear Panel LEDs

The LEDs on the rear panel of HPE Apollo 4200 Gen9 servers can be located using the diagram below:

{% include image.html alt="" file="hpe-rear-leds.png" %}

**(1) Dedicated iLO activity LED**

-   Solid green: Link to network
-   Flashing green: Network active
-   Off: No network activity

**(2) Dedicated iLO link LED**

-   Green: Network link
-   Off: No network link

**(3) NIC activity LED**

-   Solid green: Link to network
-   Flashing green: Network active
-   Off: No network activity

**(4) NIC link LED**

-   Green: Network link
-   Off: No network link

**(5) UID LED**

-   Solid blue: Activated
-   Flashing blue:
    -   1 flash per second = Remote management or firmware upgrade in progress
    -   4 flashes per second = iLO manual reboot sequence initiated
    -   8 flashes per second = iLO manual reboot sequence in progress
-   Off: Deactivated

**(6) Power supply LED**

-   Solid green: Normal
-   Off: One or more of the following conditions exist:
    -   Power is unavailable
    -   Power supply failed
    -   Power supply is in standby mode
    -   Power supply error


## Resolution

You should now be able to successfully utilize the built-in LED indicators to diagnose hardware issues with the HPE Apollo 4200 Gen9 servers

## Additional Resources

[HPE Apollo 4200 Gen9 Server Document List](https://support.hpe.com/hpesc/public/docDisplay?docLocale=en_US&docId=c05058024)

