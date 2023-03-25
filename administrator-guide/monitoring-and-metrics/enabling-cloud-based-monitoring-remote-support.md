---
title: "Enabling Cloud-Based Monitoring and Remote Support"
summary: "This section explains how to enable Cloud-Based Monitoring and Remote Support for your Qumulo cluster."
permalink: /administrator-guide/monitoring-and-metrics/enabling-cloud-based-monitoring-remote-support.html
keywords: monitoring, Cloud-Based Monitoring, Remote Support, enable, enabling, Qumulo Care
sidebar: administrator_guide_sidebar
---

## How Cloud-Based Monitoring Works
Cloud-Based Monitoring lets the Qumulo Care team monitor your Qumulo cluster proactively. Enabling Cloud-Based Monitoring lets your cluster send the following detailed diagnostic data to Qumulo through an encrypted connection.

* Cluster name

* Number of nodes in cluster

* Hardware and software incidents

  * Drives

    * CRC errors

    * S.M.A.R.T. status alerts

    * Capacity triggers
  
  * Nodes

    * PSU failure

    * Fan failure

    * Recused node

    * Offline node

    * Unreachable cluster

  * Qumulo Core

    * New process core dump

* Configuration data (such as users, groups, SMB shares, and NFS exports)

* Logs, stack traces, and code dumps

{% include important.html content="Cloud-Based Monitoring _doesn't_ collect file names, path names, client IP addresses, or account credentials." %}

### Qumulo Care Response Times
We use a proprietary application that aggregates diagnostic cluster data and alerts the Qumulo Care team if an issue arises. Depending on the issue severity and cluster state, a member of the Qumulo Care team reaches out. The following table outlines Qumulo Care response times.

{% include content-reuse/qumulo-care-response-times.md %}

### Ways to Get Help
{% include content-reuse/qumulo-care-ways-to-get-help.md %}

## How Remote Support Works
_Remote Support_ lets the Qumulo Care team access your Qumulo cluster solely to assist you with a software update or perform diagnostics or troubleshooting on your cluster from the command line. Qumulo uses industry-standard encryption technologies to ensure a secure connection to your cluster and you can enable or disable Remote Support at any time.

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


## Enabling Cloud-Based Monitoring
You can enable cloud-based monitoring by using the Web UI or `qq` CLI.

### To Enable Cloud-Based Monitoring by Using the Web UI

1. Log in to the Web UI.

1. Click **Support > Qumulo Care**.

1. On the **Qumulo Care** page, do the following:

   a. In the **Cloud-Based Monitoring** section, click **Edit**.

   b. Click **Yes, I want Qumulo Cloud-Based Monitoring**.

   c. Click **Save**.

{{site.monitoring.cloudBasedMonitoringEnabled}}
