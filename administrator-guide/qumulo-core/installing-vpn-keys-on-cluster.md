---
title: "Installing VPN Keys on a Qumulo Cluster"
summary: "This section explains how to install VPN keys on your Qumulo cluster over a network."
permalink: /administrator-guide/qumulo-core/installing-vpn-keys-on-cluster.html
sidebar: administrator_guide_sidebar
keywords: vpn, key, cluster, network
---

This section explains how to install VPN keys on your Qumulo cluster over a network.

## Prerequisites
Before you begin, make sure that you have done the following.

* Obtain a `.zip` file with VPN keys from Qumulo Care

* Whitelist the following domains in your firewall rules:

  * `ep.qumulo.com`

  * `missionq.qumulo.com`

  * `monitor.qumulo.com`

* Permit outbound HTTPS traffic on port 443

{% include note.html content="If your firewall performs stateful packet inspection (also known as _SPI_ or _deep-packet inspection_), you must allow OpenVPN (SSL VPN) explicitly, rather than only open port 443." %}


## To Install VPN Keys
1. Copy the `.zip` file from Qumulo Care to a computer on the same network as your cluster, and decompress the file.

1. Install the `qq` CLI on the same computer. For more information, see [QQ CLI: Get Started](https://care.qumulo.com/hc/en-us/articles/115008165008) on Qumulo Care.

1. To log in to your cluster, use the `qq` CLI and specify your cluster's IP address. For example:

   ```bash
   qq --host 203.0.113.1 login
   ```
    
   {% include note.html content="Your user must have `PRIVILEGE_SUPPORT_WRITE` and `PRIVILEGE_SUPPORT_READ`." %}

1. To install the VPN keys on your cluster, specify your cluster's IP address and the path to the directory that contains the VPN keys. For example:

   ```bash
   qq --host 203.0.113.1 install_vpn_keys /my/path
   ```
    
1. To verify that the VPN keys installed correctly, use the `get_vpn_keys` command. For example:

   ```bash
   qq --host 203.0.113.1 get_vpn_keys
   ```

1. Remove any local copies of the VPN key files.


## To Register Cluster with Cloud-Based Monitoring

1. To retrieve your cluster ID, use the `node_state_get` command.

   ```bash
   qq --host 203.0.113.1 node_state_get
   ```

1. Send the output of the command to Qumulo Care.

1. Use the Web UI to enable Qumulo Care Remote Support.

1. Notify Qumulo Care when this process is complete.

   Qumulo Care verifies your VPN functionality and then adds your cluster to Cloud-Based Monitoring.
