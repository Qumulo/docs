---
title: "Configuring the Out-of-Band Management (IPMI or iLO) Port on HPE Apollo 4200 Gen9 Nodes"
summary: "This section explains how to configure the out-of-band management (IPMI or iLO) port on HPE Apollo 4200 Gen9 nodes."
permalink: platforms/hpe-apollo-4200-gen9/configuring-ipmi-ilo-port.html
sidebar: platforms_sidebar
keywords: out-of-band management, out of band management, IPMI, iLO, DHCP, network, networking, LAN, ipmitool
---

This section explains how to configure the out-of-band management (IPMI or iLO) port on HPE Apollo 4200 Gen9 nodes.

{% include important.html content="Access to the out-of-bound management (IPMI or iLO) port on a public LAN can have serious security implications because it can grant anyone with credentials direct access to your server's hardware and console. Follow security best practices when implementing IPMI access." %}

## Prerequisites
To configure the IPMI port, you must have root access to the client-facing network through SSH. For example, you can use the `sudo -s` command.

## How the IPMI Port Works
HPE A4200 Gen9 nodes provide IPMI support for out-of-band maintenance access even when the node is plugged in but powered off. The following diagram shows the location of the IPMI port.

{% include image.html alt="The location of the IPMI port on the HPE Apollo 4200 Gen9 node" file="hpe-gen9-ilo.png" %}

Your nodes receive DHCP address assignments by default. When you configure a node's IPMI port, you can access the node by using the IP address (that the DHCP server assigns to the node) and a web browser that supports HTML5, Java, and .NET

{% include important.html content="We strongly recommend separating your IPMI access network from your client-facing network" %}

To access IPMI configuration from the BIOS System Utilities menu, press **F9**. The default IPMI username is `Administrator`. The password is printed on top of your node chassis.

{% include note.html content="The IMPI username and password are unrelated to your Qumulo administrative credentials." %}

## IPMI Configuration Commands

Use the following commands to configure the IPMI port on your nodes.

### To Verify IPMI LAN Configuration

```
# ipmitool lan print 2
```

### To Configure IPMI LAN Configuration by Using Static IP Addresses

1. Set the IPMI Ethernet interface to a static IP address.

   ```
   # ipmitool lan set 2 ipsrc static
   ```

1. Set the interface IP address. For example:

   ```
   # ipmitool lan set 2 ipaddr 203.0.113.0
   ```

1. Set the interface subnet mask. For example:

   ```
   # ipmitool lan set 2 netmask 255.0.0.1
   ```

1. Set the default gateway IP address. For example:
   
   ```
   # ipmitool lan set 2 defgw ipaddr 192.168.0.1
   ```

1. (Optional) Enable baseboard management controller (BMC) Address Resolution Protocol (ARP) responses.

   ```
   # ipmitool lan set 2 arp respond on
   ```


### To List Current Users

```
# ipmitool user list 2
ID Name Callin Link Auth IPMI Msg Channel Priv Limit
1 false false true ADMINISTRATOR
2 root false true true ADMINISTRATOR
```

### To Change the Default Administrator Password

```
# ipmitool user set password 2
Password for user 2:
Password for user 2:
```

### To Create a New User

In the following example, we create the administrative user `netadmin` in user slot `4`.

```
# ipmitool user set name 4 netadmin
# ipmitool user set password 4
Password for user 4:
Password for user 4:
```

### To Configure User Access

```
# ipmitool channel setaccess 1 4 link=on ipmi=on callin=on privilege=4
# ipmitool channel setaccess 2 4 link=on ipmi=on callin=on privilege=4
# ipmitool user enable 4
```

### To Verify User Level Access

```
# ipmitool channel getaccess 1 4
Maximum User IDs : 10
Enabled User IDs : 4

User ID : 4
User Name : ADMIN
Fixed Name : No
Access Available : call-in / callback
Link Authentication : disabled
IPMI Messaging : enabled
Privilege Level : ADMINISTRATOR
```

### To Reset the Baseboard Management Controller

If you can't connect to the IPMI management console and your network configuration is correct, reset the BMC through an SSH or KVM Console session for the affected node.

```
# ipmitool bmc reset cold
```
