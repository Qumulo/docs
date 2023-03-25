---
title: "Enabling Cloud-Based Monitoring and Remote Support"
summary: "This section explains how to enable Cloud-Based Monitoring and Remote Support for your Qumulo cluster."
permalink: /administrator-guide/monitoring-and-metrics/enabling-cloud-based-monitoring-remote-support.html
keywords: monitoring, Cloud-Based Monitoring, Remote Support, enable, enabling, Qumulo Care
sidebar: administrator_guide_sidebar
---

Cloud-Based monitoring lets the Qumulo Care team monitor your Qumulo cluster proactively. Enabling Cloud-Based Monitoring lets your cluster send the following detailed diagnostic data to Qumulo through an encrypted connection.

{% include important.html content="Cloud-Based Monitoring _doesn't_ collect file names, path names, client IP addresses, or account credentials." %}

* Cluster name

* Number of nodes in cluster

* Hardware and software issues

* Configuration data

  * Users

  * Groups

  * SMB shares

  * NFS exports

* Logs, stack traces, and code dumps

We use a proprietary application that aggregates diagnostic cluster data and alerts the Qumulo Care team if an issue arises.

Remote Support lets the Qumulo Care team access your Qumulo cluster solely to assist you with a software update or perform diagnostics or troubleshooting on your cluster from the command line. Qumulo uses industry-standard encryption technologies to ensure a secure connection to your cluster and you can enable or disable Remote Support at any time.

{% include important.html content="To let the Qumulo Care team provide fast support when you need it most, we strongly recommend enabling both Cloud-Based Monitoring and Remote Support." %}

## Prerequisites
Before you can use Cloud-Based monitoring and Remote Support, you must:

* [Install VPN keys on your Qumulo cluster](../getting-started-qumulo-core/installing-vpn-keys-on-cluster.html)

* Enable the following destination hostnames for TCP on port 443.

  <table>
    <thead>
      <tr>
        <th>Hostname</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>api.nexus.qumulo.com</code></td>
        <td>Nexus monitoring</td>
      </tr>  
      <tr>
        <td><code>ep1.qumulo.com</code></td>
        <td>Remote Support</td>
      </tr>
      <tr>
        <td><code>missionq.qumulo.com</code></td>
        <td>Cloud-Based Monitoring connectivity</td>
      </tr>    
      <tr>
        <td><code>missionq-dumps.s3.amazonaws.com</code></td>
        <td>Proxy forwarding</td>
      </tr>
      <tr>
        <td><code>monitor.qumulo.com</code></td>
        <td>Cloud-Based Monitoring log uploads</td>
      </tr>
    </tbody>
  </table>
