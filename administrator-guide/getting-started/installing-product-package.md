---
title: "Installing the Qumulo Core Product Package"
summary: "This section explains how to install the Qumulo Core Product Package on a user-managed, Linux-based host system from a <code>.deb</code> or <code>.rpm</code> package."
permalink: /administrator-guide/getting-started/installing-product-package.html
sidebar: administrator_guide_sidebar
---

The Qumulo Core Product Package permits flexible deployment: For example, it can let your organization adhere to its security and compliance requirements, or use a specific Linux distribution that has become standardized across the entire system fleet.

{% capture contactUs %}The Qumulo Core Product Package is currently in Private Availability. To obtain a copy, {{site.contactQumuloCare}}.{% endcapture %}
{% include tip.html content=contactUs %}

{% include content-reuse/admin-guides/getting-started/qumulo-product-package-vs-qumulo-usb-installer.md %}

For more information, see [Creating a Qumulo Core USB Drive Installer](https://docs.qumulo.com/hardware-guide/getting-started/creating-usb-drive-installer.html) in the {{site.guides.hard}}.

## Prerequisites
Before installing the Qumulo Core Product Package, you must ensure your system satisfies the minimum requirements and prepare and configure the host operating system.

### Step 1: Ensure Minimum System Requirements
Ensure that your host system meets the minimum requirements.

<details>
<summary>Click to expand</summary>
<table>
  <tr>
     <th>Requirement</th>
     <th>Description</th>
  </tr>
  <tr>
    <td>Linux Distribution</td>
    <td>
      A <a target="_blank" href="https://en.wikipedia.org/wiki/Systemd#Adoption"><code>systemd</code>-based Linux distribution</a><
      {{site.data.alerts.note}}
      <ul>
         <li>We've performed comprehensive testing of the <code>.deb</code> package running on Ubuntu 20.04, on-premises and on AWS, as well as spot-checks of installation and clustering processes on Ubuntu 22.04, Ubuntu 24.04, and Debian 11.</li>
         <li>We've also spot-checked the <code>.rpm</code> package by performing installation and clustering on the Rocky 9.3 distribution (compatible with RHEL in terms of performance and known issues). </li>
       </ul>
      {{site.data.alerts.end}} 
    </td>
  </tr>
  <tr>
    <td>Kernel</td>
    <td>
      We've tested support for the following kernel versions:
      <ul>
        <li>Debian 6.1.0 (and higher)</li>
        <li>Rocky or Red Hat Enterprise Linux (RHEL) 5.14 (and higher)</li>
        <li>Ubuntu 5.15 (and higher)</li>
      </ul>
      {{site.data.alerts.note}}
      To ensure compatibility with other kernels, check whether the following features are supported.
      <ul>
         <li><code>io_uring</code>: To check whether your kernel has this system call, run the <code>grep io_uring_setup /proc/kallsyms</code> command.</li>
         <li><code>tcp_bbr</code>: To check whether your kernel has this congestion control algorithm, run the <code>sudo modinfo tcp_bbr</code> command.</li>
       </ul>
      {{site.data.alerts.end}}
    </td>
  </tr>
  <tr>
    <td>CPU</td>
    <td>
      <ul>
        <li><a target="_blank" href="https://en.wikipedia.org/wiki/X86-64#Microarchitecture_levels">x86-64-v3 Microarchitecture</a> (or higher)</li>
        <li><a target="_blank" href="https://en.wikipedia.org/wiki/Advanced_Vector_Extensions">Advanced Vector Extensions (AVX)</a></li>
        <li><a target="_blank" href="https://en.wikipedia.org/wiki/CLMUL_instruction_set#New_instructions">Carry-Less Multiplication (PCLMUL)</a></li>
      </ul>
      {{site.data.alerts.tip}}
      <ul>
        <li>To allow Qumulo Core to configure your CPU for optimal performance, install the <code>cpupower</code> and <code>x86_energy_perf_policy</code> utilities.</li>
        <li>Utilities are built from specific versions of the kernel source tree. For information about the packages that you can use to install these utilities, see the documentation for your Linux distribution.</li>
      </ul>
      {{site.data.alerts.end}}
    </td>     
  </tr>
  <tr>
    <td>Memory</td>
    <td>
      <ul>
        <li>Minimum: 3 GB</li>
        <li>Recommended: 128 GB (or more) for hybrid and all-flash nodes</li>
        <li>ECC DIMMs</li>
      </ul>
      {{site.data.alerts.tip}}
      <ul>
        <li>Individual CPU core and data drive caches, as well as the number of CPU cores and number and size of data drives, can affect the memory requirements. For information about recommendations for performance benchmarking, see Qumulo Supported Platforms on the <a target="_blank" href="https://qumulo.com/terms-hub/">Qumulo Terms Hub</a>.</li>
        <li>Because the Debian kernel in the official AMI is compiled with the <code>CONFIG_EDAC</code> kernel configuration option disabled, any ECC memory errors aren't present in <code>sysfs</code> or the <a target="_blank" href="../monitoring-and-metrics/openmetrics-api-specification.html">OpenMetrics API specification</a>. In addition, your system doesn't reboot automatically if an uncorrectable ECC error occurs.</li>
      </ul>
      {{site.data.alerts.end}}
    </td>
  </tr>
  <tr>
    <td>Data Drives</td>
    <td>
      <ul>
        <li>
          Hybrid nodes must have at least 2 SSDs and 4 HDDs
          {% include note.html content="The number of HDDs must divide evenly by the number of SSDs." %}
        </li>
        <li>All-flash systems must have at least 2 SSDs.</li>
        <li>All data drives must be unpartitioned.</li>         
      </ul>
    </td>     
  </tr>  
</table>
</details>

### Step 2: Prepare the Host Operating System
Before configuring your host operating system for installing the Qumulo Core Product Package, you must take the following additional steps depending on the Linux distribution installed on your system.

#### To Prepare a Rocky or Red Hat Enterprise Linux (RHEL) 9.3 System
<details>
<summary>Click to expand</summary>
<ul>
  <li>
    To enable the <code>io_uring</code> kernel interface, use the <code>sysctl</code> command. For example:
    <code>sudo sysctl -w kernel.io_uring_disabled=0</code>
  </li>
  <li>Set SELinux to permissive mode. For more information, see <a target="_blank" href="https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/8/html/using_selinux/changing-selinux-states-and-modes_using-selinux">Changing SELinux States and Modes</a> in the Red Hat Documentation.</li>
</ul>
</details>

#### To Prepare a Debian 11 System
<details>
<summary>Click to expand</summary>
<ul>
  <li>To ensure that you have the features that the Qumulo Core Product Package requires, update the 5.10 kernel that Debian 11 ships with to a newer kernel, such as 6.1.0 (and higher). For more information, see <a target="_blank" href="https://wiki.debian.org/HowToUpgradeKernel">How to Upgrade the Linux Kernel</a> in the Debian documentation.</li>
  <li>Configure <code>systemd-networkd</code> and <code>systemd-resolved</code>. For more information, see <a target="_blank" href="https://wiki.debian.org/SystemdNetworkd">Setting Up <code>systemd-networkd</code></a> and <a target="_blank" href="https://wiki.debian.org/NetworkConfiguration?highlight=%28resolved%29#Using_systemd-resolved_for_DNS_resolution">Using <code>systemd-resolved</code> for DNS resolution</a> in the Debian documentation.</li>
</ul>  
</details>

### Step 3: Configure the Host Operating System
Before installing the Qumulo Core Product Package, you must configure your host operating system.

* To provide the `systemd-nspawn` tool for the Qumulo Core container, install the `systemd-container` package.

* To ensure that Qumulo Core has full control over network configuration, disable or remove the default network configuration tool (such as ENI, netplan.io, NetworkManager and so on).

* Ensure that `systemd-networkd` and `systemd-resolved` are installed and enabled. Qumulo Core uses these services, as well as the configuration files located in the `/etc/systemd/network` directory, to perform network configuration.


## To Install the Qumulo Core Product Package
{{site.data.alerts.note}}
<ul>
  <li>{{contactUs}}</li>
  <li>Use the latest, official image available for your Linux distribution on the distribution's website or cloud marketplace.</li>
</ul>
{{site.data.alerts.end}}

1. To install Qumulo Core, use the correct installation package for your Linux distribution:

   * For the `.deb` package, run the `dpkg` command. For example:

     ```bash
     sudo dpkg -i qumulo-core.deb
     ```

   * For the `.rpm` package, run the `rpm` command. For example:

     ```bash
     sudo rpm -i qumulo-core.rpm
     ```
1. To verify that the Qumulo Core service has started successfully, run the `systemctl` command. For example:

   ```bash
   sudo systemctl status qumulo-qcore.service
   ```

## Upgrading the Qumulo Core Product Package
{{site.data.alerts.important}}
<ul>
  <li>Don't attempt to upgrade the Qumulo Core Produce Package by installing a newer <code>.deb</code> or <code>.rpm</code> package on your system.</li>  
  <li>The Qumulo Core Product Package doesn't have separate versions for on-premises and cloud platforms. You must use the on-premises for upgrading both on-premises and cloud clusters.</li>
  <li>You must upgrade all the nodes in your cluster at the same time, by using the Web UI, Qumulo REST API, or the <code>qq</code> CLI. The Qumulo Core Product Package doesn't support upgrading individual nodes and attempting to do so takes the cluster offline.</li>
</ul>
{{site.data.alerts.end}}

Qumulo Core Product Package upgrades follow the standard [Qumulo Core upgrade process](../upgrading-qumulo-core/performing-upgrades.html). All Qumulo Core Product Package upgrades are [instant software upgrades](/administrator-guide/upgrading-qumulo-core/performing-upgrades.html#instant-software-upgrade) and never require a node to reboot (however, you can use the the Qumulo REST API or {% include qq.html command="reboot_start" %} command to perform a manual or rolling reboot).

## Troubleshooting the Qumulo Core Product Package
Depending on the issue, you can troubleshoot the Qumulo Core Product Package from the host operating system or from within the Qumulo container. The following sections outline common scenarios and some potential troubleshooting approaches to them.

### From the Host Operating System
<table style="width: 100%;">
  <tr>
    <th style="width: 30%;">Scenario</th>
    <th style="width: 70%;">Troubleshooting Approach</th>
  </tr>
  <tr>
    <td>Examine a container that starts successfully</td>
    <td>
      To get shell access to the container, run the following command:
      <pre class="highlight"><code>machinectl shell qcore</code></pre>
    </td>
  </tr>
  <tr>
    <td>Examine a container that doesn't start successfully</td>
    <td>
      To check the logs for the container service, run the following command:
      <pre class="highlight"><code><span class="nb">sudo</span> journalctl -u qumulo-qcore.service</code></pre>
    </td>    
  </tr>
  <tr>
    <td>View QFSD logs</td>
    <td>
      To view the logs within the container, run the following command:
      <pre class="highlight"><code>journalctl -M qcore -u qumulo-qfsd.service</code></pre>
    </td>
  </tr>
  <tr>
    <td>Use the <code>qsh</code>c tool</td>
    <td>
      To be use the <code>qsh</code> tool, run the following command:
      <pre class="highlight"><code>export PATH=$PATH:/opt/qumulo/bin/qsh</code></pre>
      Alternatively, add the path to your shell configuration file.
    </td>
  </tr>
</table>

### From within the Container
<table style="width: 100%;">
  <tr>
    <th style="width: 30%;">Scenario</th>
    <th style="width: 70%;">Troubleshooting Approach</th>
  </tr>
  <tr>
    <td>Examine a container that is unable to create a cluster</td>
    <td>
      To check the QFSD logs, run the following command:
      <pre class="highlight"><code>journalctl -u qumulo-qfsd</code></pre>
    </td>
  </tr>
</table>
