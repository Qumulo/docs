---
title: "Enabling Cloud-Based Monitoring and Remote Support"
summary: "This section explains how to enable Cloud-Based Monitoring and Remote Support for your Qumulo cluster."
permalink: /administrator-guide/monitoring-and-metrics/enabling-cloud-based-monitoring-remote-support.html
keywords: monitoring, Cloud-Based Monitoring, Remote Support, enable, enabling
sidebar: administrator_guide_sidebar
---

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
      <td>Cloud-Based Monitoring</td>
    </tr>    
    <tr>
      <td><code>missionq-dumps.s3.amazonaws.com</code></td>
      <td>Proxy forwarding</td>
    </tr>
    <tr>
      <td><code>monitor.qumulo.com</code></td>
      <td>Log uploads</td>
    </tr>
  </tbody>
</table>
