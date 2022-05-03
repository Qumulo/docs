---
title: "Configuring the Out-of-Band Management (IPMI or iLO) Port"
summary: "This section explains how to configure the out-of-band management (IPMI or iLO) port on HPE Apollo 4200 Gen9 nodes."
permalink: platforms/hpe-apollo-4200-gen9/configuring-ipmi-ilo-port.html
sidebar: platforms_sidebar
keywords: out-of-band management, out of band management, IPMI, iLO, DHCP, network, networking, LAN, ipmitool
---
*IPMI on a Public LAN can be a major security liability providing anyone with the proper credentials direct hardware and console level access to your server. Please use good security practices when implementing IPMI (iLO) access.*

## In This Article

-   Outlines how to configure IPMI (iLO) on HPE Apollo 4200 Gen9 servers

    -   IPMI (iLO) port location
    -   Verify IPMI (iLO) LAN Configuration
    -   IPMI (iLO) LAN Configuration with static IPs
    -   IPMI (iLO) User Operations
    -   Connect via IPMI (iLO)

## Requirements

-   Root user access via ssh on the client-facing network by using the `sudo -s` command.

## Details

HPE Apollo 4200 motherboards provide IPMI (iLO) support which allow for out-of-band maintenance access even if the node is turned off when plugged into power.

-   Nodes are configured to receive DHCP address assignments by default
-   The IPMI (iLO) access network should be completely separate from your client-facing network
-   IPMI (iLO) Configuration is available via BIOS: F9 System Utilities
-   The **default IPMI (iLO) account & password** is Administrator and the password listed on the top of the chassis
    -   Note that this account name and password are completely independent of your Qumulo admin password

The steps below must be repeated on each node that will be a member of your IPMI (iLO) maintenance network. Once configuration is complete, accessing the nodes via IPMI (iLO) requires .NET, HTML5, or a Java-capable web browser using the IPs assigned by you or your DHCP server.

### HPE Apollo 4200 Gen9 IPMI (iLO) Port Location

{% include image.html alt="" file="hpe-gen9-ilo.png" %}

### HPE Apollo 4200 Gen9 IPMI (iLO) Commands

**Verify IPMI (iLO) LAN Configuration**

-   Use the following command:

   ```
   # ipmitool lan print 2
   ```

**IPMI (iLO) LAN Configuration with static IPs**

   ```
   # ipmitool lan set 2 ipsrc static #Set IPMI ethernet interface to static IP
   # ipmitool lan set 2 ipaddr XXX.XXX.XXX.XXX #Set the IP address of the interface
   # ipmitool lan set 2 netmask 255.XXX.XXX.XXX #Set the Subnet Mask for the interface
   # ipmitool lan set 2 defgw ipaddr XXX.XXX.XXX.XXX #Set the IP address of the Default Gateway
   # ipmitool lan set 2 arp respond on #(Optional) Enable BMC ARP responses
   ```

**IPMI (iLO) User Operation Examples**

-   List Current users

   ```
   # ipmitool user list 2
   ID Name Callin Link Auth IPMI Msg Channel Priv Limit
   1 false false true ADMINISTRATOR
   2 root false true true ADMINISTRATOR
   ```

-   Change the default ADMINISTRATOR password

   ```
   # ipmitool user set password 2
   Password for user 2:
   Password for user 2:
   ```

-   Create new user
    -   Example: Create Admin user “netadmin” in user slot \#4

   ```
   # ipmitool user set name 4 netadmin
   # ipmitool user set password 4
   Password for user 4:
   Password for user 4:
   ```

-   Set user access

   ```
   # ipmitool channel setaccess 1 4 link=on ipmi=on callin=on privilege=4
   # ipmitool channel setaccess 2 4 link=on ipmi=on callin=on privilege=4
   # ipmitool user enable 4
   ```

-   Verify User Level Access

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

### Troubleshooting

If you cannot connect to the IPMI (iLO) management console and you are sure that your network configuration is correct, reset the BMC via a SSH or KVM Console session to the node in question:

   ```
   # ipmitool bmc reset cold
   ```
