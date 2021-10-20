---
title: Identifying Network Transceivers for Qumulo Nodes
permalink: network-transceivers.html
tags:
  - network_transceiver
  - network_transceivers
---


# Transceivers for NICs in Qumulo clusters.


[TOC]



# Overview 

The purpose of this document is to provide guidance to identify the correct transceiver for deployment. The focus is on 100G and 25G since we don’t expect many new deployments on 40G or 10G.


## Optics versus DAC and AOC 

In general, the recommendation is to use an optical transceiver that is supported in the NIC in the NIC and a transceiver that is supported in the switch in the switch and connect them via the appropriate fiber. 

DACs (direct attach cables) are much cheaper than optics and are much less prone to compatibility or thermal issues but they have limited length, 2 to 3 meters are common, 5 meters is the max.

AOCs (active optical cables), while cheaper than dedicated transceivers and fibers in some cases, can cause compatibility issues, it might be supported by the NIC but not the switch and vice versa.


# 100G 

There are generally 2 types of fibers, LC (2 fibers) and MPO (8 fibers), LC is commonly used for 10G and 25G whereas 40G and up tend to use MPO. There are transceivers that can use LC fibers for 40G and 100G but those tend to be more expensive and consume more power, they are mainly intended to re-use existing LC cabling or for long-distance.

New switches can do 100G using 2 x 50G PAM4 links instead of the usual 4 x 25G but that’s a new standard as of October 2021, Mellanox does not list a 2 x 50G PAM4 transceiver.

The most common transmission standard for 100G is SR4, it’s using 4 QSFP28 lanes over a 8-fiber cable. It’s also the most cost-efficient. SR4 has a max range of 100m.


### Optical Transceivers 

Table 1 100G transceivers


<table>
  <tr>
   <td><strong>Speed</strong>
   </td>
   <td><strong>Transceiver OPN</strong>
   </td>
   <td><strong>Description</strong>
   </td>
  </tr>
  <tr>
   <td>100GbE SR4
   </td>
   <td>MMA1B00-C100D
   </td>
   <td>Mellanox® QSFP28 short-range transceiver
   </td>
  </tr>
  <tr>
   <td>100GbE SR4
   </td>
   <td>QSFP28-SR4-100G
   </td>
   <td>fs.com Arista and Mellanox tagged short-range transceivers are known to work 
   </td>
  </tr>
  <tr>
   <td>100GbE LR4
   </td>
   <td>MMA1L10-CR
   </td>
   <td>Mellanox® QSFP28 long-range transceiver
   </td>
  </tr>
</table>


There are many vendors selling MMA1B00-C100D - compatible transceivers but we don't have a list of working or known-bad vendors at this point. 

I suggest that if you see a working 3-rd party optics configuration, add it to the "know to work" table below.

We are planning to incorporate transceiver information from MissionQ in the table above at some point in the future.

The Mellanox 100G cards also work on 40G in case the customer only has 40G.


# 25G 

Most common fiber used is a LC Duplex (2 fibers).

Short-range has a max range of 100m, long-range has a max range of 10km. There is also an extended range standard that goes up to 40km.


### Optical Transceivers 

Table 2 25G transceiver


<table>
  <tr>
   <td><strong>Speed</strong>
   </td>
   <td><strong>Transceiver OPN</strong>
   </td>
   <td><strong>Description</strong>
   </td>
  </tr>
  <tr>
   <td>25GbE SR
   </td>
   <td>MMA2P00-AS
   </td>
   <td>Mellanox® SFP28 short-range transceiver
   </td>
  </tr>
  <tr>
   <td>25GbE SR
   </td>
   <td>SFP28-25GSR-85
   </td>
   <td>fs.com Arista and Mellanox tagged short-range transceivers are known to work 
   </td>
  </tr>
  <tr>
   <td>25GbE LR
   </td>
   <td>MMA2L20-AR
   </td>
   <td>Mellanox® SFP28 long-range transceiver
   </td>
  </tr>
</table>


There are many vendors selling MMA2P00-AS - compatible transceivers but we don't have a list of working or known-bad vendors at this point. 


# AOCs and DACs 

For a list of supported Mellanox DACs and AOCs, check the Mellanox website.

Since Mellanox is known to add support for new cables or transceivers with new firmware, be sure to check the list for correct firmware.

If you decide to go with DAC or AOC, it’s recommended to ensure that the AOC or DAC of choice is on both the Mellanox supported list and the supported list of the network switch.


### Known to work 

Table 3 100G DACs and AOCs


<table>
  <tr>
   <td><strong>Vendor</strong>
   </td>
   <td><strong>Part number</strong>
   </td>
   <td><strong>description</strong>
   </td>
  </tr>
  <tr>
   <td>fs.com
   </td>
   <td>Q28-PC02
   </td>
   <td>100G Passive copper cable 2m
   </td>
  </tr>
  <tr>
   <td>fs.com
   </td>
   <td>Q28-PC03
   </td>
   <td>100G Passive copper cable 3m
   </td>
  </tr>
  <tr>
   <td>Leoni
   </td>
   <td>L45593-D218-B50
   </td>
   <td>100G Passive copper cable 3m
   </td>
  </tr>
  <tr>
   <td>Amphenol
   </td>
   <td>NDAAFF-C403
   </td>
   <td>100G Passive copper cable 3m
   </td>
  </tr>
</table>



### ConnectX-5  

25G: K-432T

100G: P-Series, C-192T, C-432T

The Latest supported firmware by Qumulo for Mellanox ConnectX-5 cards is 16.28.1002.

[Firmware Compatible Products - ConnectX-5 Firmware v16.28.1002 - Mellanox Docs](https://docs.mellanox.com/display/ConnectX5Firmwarev16281002/Firmware+Compatible+Products#FirmwareCompatibleProducts-ValidatedandSupported100GbECables)


### ConnectX-6 

HPE All-Flash, SuperMicro All-Flash

The latest supported firmware by Qumulo for Mellanox ConnectX-6 cards is 22.31.1014 (HPE has a different FW version)

[Firmware Compatible Products - ConnectX-6 Firmware v20.31.1014 - Mellanox Docs](https://docs.mellanox.com/display/ConnectX6Firmwarev20311014/Firmware+Compatible+Products)
