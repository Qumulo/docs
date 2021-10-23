---
title: Choosing NICs, Transceivers, and Cables for Your Qumulo Node
permalink: nics-transceivers-cables.html
tags:
  - network_transceiver
  - network_transceivers
  - nic
  - mellanox
  - short_range_transceiver
  - long_range_transceiver
  - fiber
  - fiber_optic
  - fiber_optic_cable
sidebar: administrator_guide_sidebar
---

# Choosing NICs, Transceivers, and Cables for Your Qumulo Node
This section explains how to choose the correct cables, transceivers, and NIC cards for your Qumulo nodes.

## Recommended NICs for Your Node

The following table lists node types and the recommended NICs, their speeds, and the latest firmware that Qumulo supports.

| Node Type                      | NIC        | Speed      | Latest Firmware Qumulo Supports |
| ------------------------------ | ---------- | ---------- | ------------------------------- |
| C-192T                         | ConnectX-5 | 100 Gbps   | [16.28.1002](https://docs.mellanox.com/display/ConnectX5Firmwarev16281002/Firmware+Compatible+Products#FirmwareCompatibleProducts-ValidatedandSupported100GbECables)|
| C-432T                         | ConnectX-5 | 100 Gbps   | [16.28.1002](https://docs.mellanox.com/display/ConnectX5Firmwarev16281002/Firmware+Compatible+Products#FirmwareCompatibleProducts-ValidatedandSupported100GbECables)|
| HPE ProLiant DL325 Gen10 Plus  | ConnectX-6 | 100 Gbps   | [22.31.1014](https://docs.mellanox.com/display/ConnectX6Firmwarev20311014/Firmware+Compatible+Products)|
| K-432T                         | ConnectX-5 | 25 Gbps    | [16.28.1002](https://docs.mellanox.com/display/ConnectX5Firmwarev16281002/Firmware+Compatible+Products#FirmwareCompatibleProducts-ValidatedandSupported100GbECables) |
| P-23T                          | ConnectX-5 | 100 Gbps   | [16.28.1002](https://docs.mellanox.com/display/ConnectX5Firmwarev16281002/Firmware+Compatible+Products#FirmwareCompatibleProducts-ValidatedandSupported100GbECables) |
| P-92T                          | ConnectX-5 | 100 Gbps   | [16.28.1002](https://docs.mellanox.com/display/ConnectX5Firmwarev16281002/Firmware+Compatible+Products#FirmwareCompatibleProducts-ValidatedandSupported100GbECables) |
| P-184T                         | ConnectX-5 | 100 Gbps   | [16.28.1002](https://docs.mellanox.com/display/ConnectX5Firmwarev16281002/Firmware+Compatible+Products#FirmwareCompatibleProducts-ValidatedandSupported100GbECables) |
| P-368T                         | ConnectX-5 | 100 Gbps   | [16.28.1002](https://docs.mellanox.com/display/ConnectX5Firmwarev16281002/Firmware+Compatible+Products#FirmwareCompatibleProducts-ValidatedandSupported100GbECables) |
| Supermicro A+ WIO 1114S-WN10RT | ConnectX-6 | 100 Gbps   | [22.31.1014](https://docs.mellanox.com/display/ConnectX6Firmwarev20311014/Firmware+Compatible+Products) |


## Choosing Transceivers for Your Node
The two main types of fiber optic cables are the Lucent connector (LC) with two fibers (commonly used for 10 Gbps and 25 Gbps connections) and the multi-fiber push on (MPO) connector with eight fibers (commonly used for 40 Gbps connections). Although there are transceivers that can use LC fiber optic cables for 40 Gbps and 100 Gbps connections, these transceivers are generally more expensive, consume more power, and are mainly intended for reusing LC cabling or for long-distance applications.

Newer switches have 100 Gbps connections using double 50 Gbps PAM4 connections instead of the more common four 25 Gbps connections. However, the most common and cost-efficient transmission standard for 100 Gbps is SR4, with four QSFP28 connections over an eight-fiber cable. The maximum range for SR4 is 100 m. The most common transmission standard for 25 Gbps is the Lucent connector duplex (LC duplex) with two fibers. The maximum short-range connection is 100 m and long-range connection is 10 km. There is also an extended-range standard with a maximum of 40 km.

### Recommended Optical Transceivers for 100 Gbps Connections

**Note:** Mellanox 100 Gbps NICs also work with 40 Gbps connections.

| Speed        | Part Number     | Description                                     |
| ------------ | --------------- | ----------------------------------------------- |
| 100 Gbps LR4 | MMA1L10-CR      | Mellanox QSFP28 Long-Range Transceiver          |
| 100 Gbps SR4 | MMA1B00-C100D   | Mellanox QSFP28 Short-Range Transceiver         |
| 100 Gbps SR4 | QSFP28-SR4-100G | FS Arista and Mellanox Short-Range Transceivers |

### Recommended Optical Transceivers for 25 Gbps Connections

| Speed      | Part Number    | Description                                     |
| ---------- | -------------- | ----------------------------------------------- |
| 25 Gbps LR | MMA2L20-AR     | Mellanox SFP28 Long-Range Transceiver           |
| 25 Gbps SR | MMA2P00-AS     | Mellanox SFP28 Short-Range Transceiver          |
| 25 Gbps SR | SFP28-25GSR-85 | FS Arista and Mellanox Short-Range Transceivers |    


## Choosing Cables for Your Transceiver
* **Optical Cables:** We recommend using optical cables and optical transceivers that both the NIC and the switch support.

* **Direct Attach Cables (DACs):** Although these cables are significantly cheaper than optical cables and are less prone to compatibility and thermal issues, they are limited in length (2-3 m, up to 5 m maximum).

* **Active Optical Cables (AOCs):** Although these cables are cheaper than dedicated transceivers and fiber optic cables, they might cause compatibility issues, or your NIC or switch might not support them.

**Note:** If you use DAC or AOC cables, ensure that Mellanox and the maker of your network switch both support your cables.

### Recommended 100 Gbps DAC and AOC Cables

| Manufacturer | Part Number     | Description                   | Length |
| ------------ | --------------- | ----------------------------- | ------ |
| Amphenol     | NDAAFF-C403     | 100 Gbps Passive Copper Cable | 3 m    |
| FS           | Q28-PC02        | 100 Gbps Passive Copper Cable | 2 m    |
| FS           | Q28-PC03        | 100 Gbps Passive Copper Cable | 3 m    |
| Leoni        | L45593-D218-B50 | 100 Gbps Passive Copper Cable | 3 m    |                                                                          
