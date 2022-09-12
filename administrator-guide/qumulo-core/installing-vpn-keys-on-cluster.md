---
title: "Installing VPN Keys on a Qumulo Cluster"
summary: "This section explains how you can install VPN keys on your Qumulo cluster over a network."
permalink: /administrator-guide/qumulo-core/installing-vpn-keys-on-cluster.html
sidebar: administrator_guide_sidebar
keywords: vpn, key, keys, cluster, networki
varCopyDecompress: 1. Copy the `.zip` file from Qumulo Care to a computer on the same network as your cluster, and decompress the file.
varInstallVpnKeys: 1. Install the VPN keys on all nodes in the cluster.
---

This section explains how you can install VPN keys on your Qumulo cluster over a network.

## Prerequisites
Before you begin, make sure that you have done the following.

* Obtain `.zip` file with VPN keys from Qumulo Care

* Whitelist the following domains in your firewall rules

  * `ep.qumulo.com`

  * `missionq.qumulo.com`

  * `monitor.qumulo.com`

* Permit outbound HTTPS traffic on port 443

{% include note.html content="If your firewall performs stateful packet inspection (also known as _SPI_ or _deep-packet inspection_), you must allow OpenVPN (SSL VPN) explicitly, rather than only open port 443." %}


## Installing VPN Keys on macOS
{{page.varCopyDecompress}}

1. Open Terminal and use the `scp` command to copy the VPN key files to one of the nodes. For example:

   ```bash
   scp /my-path/* admin@{{site.exampleIP}}:~/
   ```

1. Use SSH to connect to the node to which you have copied the VPN key files. For example:

   ```bash
   ssh admin@{{site.exampleIP}}
   ```

{{page.varInstallVpnKeys}}

{% include content-reuse/installing-vpn-keys-on-cluster-final-steps.md %}


## Installing VPN Keys on Windows

{% capture content_tag %}On Windows Server 2022, Windows Server 2019, and Windows 10 (build 1809 and higher), you can use [OpenSSH](https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse).{% endcapture %}
{% include note.html content=content_tag %}

1. Download `putty.exe` and `pscp.exe` from the [Putty website](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html).

{{page.varCopyDecompress}}

1. Open Command Prompt, navigate to the folder that contains the executable files, and then use the `pscp` commnd to copy the VPN key files to one of the nodes. For example:

   ```
   pscp\my-path\* admin@{{site.exampleIP}}:/home/admin
   ```

1. Use the `putty` command to connect to the node to which you have copied the VPN key files. For example:

   ```
   putty.exe -ssh admin@{{site.exampleIP}}
   ```

{{page.varInstallVpnKeys}}

{% include content-reuse/installing-vpn-keys-on-cluster-final-steps.md %}
