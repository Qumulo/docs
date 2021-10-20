---
title: Replacing the Chassis in Qumulo C-Series 2U (C-168T and C-432T) Nodes
permalink: c-series-chassis-replacement.html
tags:
  - chassis
  - chassis_replacement
  - c-168T
  - c-432T
  - 2u
  - 2u_hybrid
  - 2u_chassis_replacement
---

# Replacing the Chassis in Qumulo C-Series 2U (C-168T and C-432T) Nodes
This section explains how you can replace the chassis in Qumulo C-Series 2U nodes. 

## Prerequisites 
Before you begin, ensure that you have C-168T or C-432T hardware and the replacement chassis.

## To Replace the Chassis of a Qumulo C-Series 2U Node
**Note:** We strongly suggest having another person help you with this process.

1. To shut down the node, use the power button at the front or connect using SSH and run the `sudo shutdown -h now` command. 

1. Disconnect all cables from the back of the node.

1. Pull the node out from the rack and set it down on a flat surface.

1. To release the lid, press the large **PUSH** button on each side of the chassis frame.

   ![Chassis Side Release Buttons](administrator-guide/images/c-series-button-releases.png)

   The inner components of the node are exposed.

1. Remove the internal M.2 boot drive and insert it into the replacement chassis Qumulo provided to you.

   ![M.2 Boot Drive Diagram](administrator-guide/images/c-series-m2-boot-drive-location.png)

5. Remove the rear NVME SSD drives and transfer them into the replacement chassis. 
![Rear NVME Drive Diagram](administrator-guide/images/c-series-rear-nvme-diagram.png) 
6. Rack the replacement chassis in the appropriate rack location.
**NOTE:** Be sure to verify that any shipping screws have been removed from the replacement chassis as they will prevent the HDDs trays from sliding open. 
![Shipping screws diagram](administrator-guide/images/c-series-2u-shipping-screws.png)
7. Starting with the top drawer, transfer the HDDs from each tray on the original chassis into their corresponding slots on the replacement chassis. For this portion it may be helpful to reference our C-Series Drive Diagrams page to ensure each drive is being transferred to the appropriate location. In order to remove the HDD drives, gently lift up on the drive tray knob allowing the drive to come forward and unlatch. Once the drive is transferred into the new chassis, gently slide the drive tray knob backwards latching both the knob and drive in place. 
![HDD Tray Diagram](administrator-guide/images/c-series-2u-hdd-tray.png)
**NOTE:** Only one drawer should be worked on at a time. To open the HDD drawers use the blue levers on the front of the node. The shelves may deform if a downward force of 2kg or more is applied while opened. 
8. With all the drives transferred you may now reconnect the rear power and networking cables. 
9. Power on your new node!

## (Optional) Reconfigure IPMI
If the current IPMI settings are set statically and not via DHCP, they will need to be reapplied to each node in the cluster. Reference the [IPMI Quick Reference Guide for Qumulo C-Series](https://care.qumulo.com/hc/en-us/articles/360024426314-IPMI-Quick-Reference-Guide-for-Qumulo-C-Series) article for additional details. 

## Resolution 
You should now be able to successfully replace the chassis for Qumulo’s C Series 192T or 432T platform. Please contact Qumulo Care to complete any RMA returns or if you have outstanding questions. 





