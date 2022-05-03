---
title: "HPE Apollo 4200 Gen9 Drive LED Guide"
summary: "Outlines the drive LED behavior in the HPE Apollo 4200 Gen9 server."
permalink: platforms/hpe-apollo-4200-gen9/drive-leds.html
sidebar: platforms_sidebar
---
## In This Article

Outlines the LED locations and status indicators for the following drives in HPE Apollo 4200 Gen9 servers:

-   Large form factor (LFF) drives
-   Small form factor (SFF) drives

## Requirements

-   HPE Apollo 4200 Gen9 server

For additional details on HPE Apollo 4200 servers, reference the  [HPE Apollo 4200 Gen9 Server Document List](https://support.hpe.com/hpesc/public/docDisplay?docLocale=en_US&docId=c05058024).

## Details

HPE Apollo 4200 Gen9 servers are comprised of a combination of large form factor (LFF) and small form factor (SFF) drives. LFF and SFF drives have different sets of LEDs to reflect the drive status.

### Large Form Factor (LFF) Gen9 Drive LEDs

LFF LEDs can be located using the diagram below:

{% include image.html alt="" file="lff-drive-leds.png" %}

The current state of an LFF drive can be determined by reviewing the status of both the **Fault/UID LED** and the **Online/Activity LED**.

-   **(1) Fault/UID LED**: glows either amber or blue
-   **(2) Online/Activity LED**: glows green

Reference the following table to decode the different combinations of the two LFF LEDs:

{% include image.html alt="" file="lff-drive-chart.jpg" %}

### Small Form Factor (SFF) Gen9 Drive LEDs

SFF LEDs can be located using the diagram below:

{% include image.html alt="" file="sff-led-guide.png" %}

**(1) Locate LED**

-   Solid blue: The drive is being identified by a host application
-   Flashing blue: The drive carrier firmware is being updated or requires an update

{{site.data.alerts.note}}
The Locate LED is located behind the release lever and is visible when illuminated.
{{site.data.alerts.end}}

**(2) Activity ring LED**

-   Rotating green: Drive activity
-   Off: No drive activity

**(3) Do not remove LED**

-   _Solid white:_ Do not remove the drive. Removing the drive causes one or more of the logical drives to fail
-   Off: Removing the drive does not cause a logical drive to fail

**(4) Drive status LED**

-   Solid green: The drive is a member of one or more logical drives
-   Flashing green: The drive is rebuilding or performing a RAID migration, strip size migration, capacity expansion, or logical drive extension or is erasing
-   Flashing amber/green: The drive is a member of one or more logical drives and predicts the drive will fail
-   Flashing amber: The drive is not configured and predicts the drive will fail
-   Solid amber: The drive has failed
-   Off: The drive is not configured by a RAID controller

## Resolution

You should now be able to successfully utilize the LED indicators for the LFF and SFF drives on the HPE Apollo 4200 Gen9 servers
