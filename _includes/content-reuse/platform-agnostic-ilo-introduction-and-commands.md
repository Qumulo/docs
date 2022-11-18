
Your nodes receive DHCP address assignments by default. When you configure a node's iLO port, you can access the node by using the IP address (that the DHCP server assigns to the node) and a web browser that supports HTML5, Java, and .NET

{% capture content_tag %}{{site.splitIlo}}{% endcapture %}
{% include important.html content=content_tag %}

To access iLO configuration from the BIOS System Utilities menu, press **F9**. The default iLO username is `Administrator`. The password is printed on top of your node chassis.

{% include note.html content="The IMPI username and password are unrelated to your Qumulo administrative credentials." %}


## iLO Configuration Commands

Use the following commands to configure the iLO port on your nodes.

### To Verify iLO LAN Configuration

```
# ipmitool lan print 1
```

### To Configure iLO LAN by Using Static IP Addresses

1. Set the iLO Ethernet interface to a static IP address.

   ```
   # ipmitool lan set 1 ipsrc static
   ```

1. Set the interface IP address. For example:

   ```
   # ipmitool lan set 1 ipaddr {{site.exampleIP0}}
   ```

1. Set the interface subnet mask. For example:

   ```
   # ipmitool lan set 1 netmask {{site.exampleSubnet1}}
   ```

1. Set the default gateway IP address. For example:
   
   ```
   # ipmitool lan set 1 defgw ipaddr {{site.exampleGateway1}}
   ```

1. (Optional) Enable baseboard management controller (BMC) Address Resolution Protocol (ARP) responses.

   ```
   # ipmitool lan set 1 arp respond on
   ```


### To List Current Users

```
# ipmitool user list 1
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
# ipmitool user enable 4
```

### To Verify User Access Level

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

If you can't connect to the iLO management console and your network configuration is correct, reset the BMC through an SSH or KVM Console session for the affected node.

```
# ipmitool bmc reset cold
```
