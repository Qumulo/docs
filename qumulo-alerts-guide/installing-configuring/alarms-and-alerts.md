---
title: "Configuring Alarms and Alerts"
summary: "This section explains how to configure Qumulo Alerts to generate alarms and alerts."
permalink: /qumulo-alerts-guide/installing-configuring/alarms-and-alerts.html
sidebar: qumulo_alerts_guide_sidebar
keywords: Qumulo Alerts, alert, alarm, Docker, producer, plug in, plugin, plug-in, monitoring, configure, configuration, JSON
---

## Configuring Monitoring for a Qumulo Cluster
To configure Qumulo Alerts to connect to, and collect data from a Qumulo cluster, you must edit `QumuloAlerts.json`, located in the `config/alerts` directory, in the directory [that you cloned from GitHub](installing-connecting-to-qumulo-cluster.md#clone-qumuloalerts-repository).

The following is an explanation of the JSON keys that configure Qumulo cluster monitoring.

<table>
  <colgroup>
    <col span="1" style="width: 30%;">
    <col span="1" style="width: 70%;">
  </colgroup>
<thead>
  <tr>
    <th>Name</th>
    <th>Description</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td><code>cluster_name</code></td>
    <td>The fully qualified domain name (FQDN) for your Qumulo cluster</td>
  </tr>
  <tr>
    <td><code>cluster_port</code></td>
    <td>The port for communicating with the Qumulo REST API, <code>8000</code> by default</td>
  </tr>
  <tr>
    <td><code>frequency</code></td>
    <td>
      <p>The time period between each plugin's execution, including the unit (seconds or minutes) and value, that applies to all plugins in a category without a specific frequency, 60 seconds by default</p>
      <p>You can configure a distinct frequency for each category of alarm or alert.</p>
    </td>
  </tr>
  <tr>
    <td><code>monitor</code></td>
    {% include content-reuse/qumulo-alerts-monitor-notify-array.md %}
  </tr>  
  <tr>
    <td><code>nlb</code></td>
    <td>
      <p>Network load balancer: when set to <code>false</code>, floating IP address configuration is required</p>    
      <p>To prevent spreading the load of a plugin's API requests across all nodes in a Qumulo cluster, each alarm or alert plugin that you configure communicates with your cluster by using either a network load balancer or floating IPs.</p>
      {% include important.html content="You can configure _one_&mdash;but not both&mdash;of these communication methods." %}
    </td>
  </tr>
  <tr>
    <td><code>user_token</code></td>
    <td>The long-lived access token for communicating with the Qumulo REST API</td>
  </tr> 
</tbody>
</table>

## Example: Monitoring Alarms for Disks and Nodes on a Single Cluster

```json
[{
  "cluster_name": "test-cluster.corp.example.com",
  "cluster_port": 8000,
  "user_token": "access-v1:abcdefgh1234567...",
  "nlb": false,
  "frequency": {"seconds": 60},
  "monitor": [{
    "category": "Alarms",
    "subcategory": ["Disks", "Nodes"],
    "enabled": true
  }]
}]
```

## Example: Monitoring Alarms for Disks and Nodes and All Alerts on a Single Cluster
In the following example, the wildcard `*` specifies _every plugin available in this category_.

```json
[{
  "cluster_name": "test_cluster.corp.example.com",
  "cluster_port": 8000,
  "user_token": "access-v1:abcdefgh1234567...",
  "nlb": false,
  "frequency": {"seconds": 60},
  "monitor": [{
    "category": "Alarms",
    "subcategory": ["Disks", "Nodes"],
    "enabled": true
  },{
    "category": "Alerts",
    "subcategory": ["*"],
    "frequency": {"minutes": 5},
    "enabled": true
  }]
}]
```
