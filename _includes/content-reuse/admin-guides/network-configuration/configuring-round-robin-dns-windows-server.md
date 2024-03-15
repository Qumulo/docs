{% include note.html content="To perform the following operations, you must be a member of the Domain Admins, Enterprise Admins, or DnsAdmins group." %}

## Step 1: Confirm that Round-Robin DNS Support is Enabled

1. In the Microsoft Management Console (MMC), ensure that the DNS Manager snap-in is installed.

1. Click **Start > Administrative Tools > DNS**, right-click **DNS**, and then click **Properties**.

1. Click **Advanced** and ensure that round-robin DNS is enabled.


## Step 2: Add DNS Entries for Each Remote Desktop Session Host Server

1. In the DNS Manager snap-in, expand your server name, then **Forward Lookup Zones**, and then your domain name.

1. Right-click a zone and then click **New Host (A or AAAA)**.

1. For **Name**, enter the hostname (virtual name) for clients that connect to your Qumulo cluster.

   {% include note.html content="Don't enter the hostname of another existing server." %}

1. Enter the first floating IP address for one of the nodes in your cluster.

   {% include note.html content="Use only floating IP addresses for round-robin DNS entries." %}

1. Repeat these steps for each floating IP address that belongs to a node in your cluster.


## Step 3: Configure the Time to Live (TTL) for DNS Requests to Your Cluster

To ensure that client connections to your cluster are balanced evenly, you must provide a single namespace for your cluster. To do this, configure your DNS server to send a different IP address for each DNS request for your Qumulo cluster.

For example, you can set the TTL for each record to `0`, to allow each DNS lookup for your Qumulo cluster to yield one of the four configured IP addresses.

1. In the DNS Manager snap-in, click **View > Advanced** and open your records for editing.

1. Configure the TTL for each record.
