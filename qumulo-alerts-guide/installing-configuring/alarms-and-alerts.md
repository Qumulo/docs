---
title: "Configuring Alarms and Alerts"
summary: "This section explains how to configure Qumulo Alerts to generate alarms and alerts."
permalink: /qumulo-alerts-guide/installing-configuring/alarms-and-alerts.html
sidebar: qumulo_alerts_guide_sidebar
keywords: Qumulo_Alerts, alert, alarm, Docker, producer, plug_in, plugin, plug-in, monitoring, configure, configuration, JSON
---

## Configuring Monitoring for a Qumulo Cluster
To configure Qumulo Alerts to connect to, and collect data from a Qumulo cluster, you must run the **cluster_add** subcommand in the **alerts** CLI.

The following is an explanation of the options that configure Qumulo cluster monitoring.


```bash
Usage: alerts cluster_add [OPTIONS]

  Add a cluster to monitor in Qumulo Alerts

Options:
  --name TEXT                  Name of cluster to monitor.  [required]
  --token TEXT                 Long-lived token needed to communicate with the
                               cluster.  [required]
  --port INTEGER               Port used to communicate with the cluster
                               (default: 8000).
  --nlb BOOLEAN                REST calls to cluster occur through a network
                               load balancer (default: False).
  --frequency INTEGER          Frequency in which Qumulo Alerts looks for
                               events on cluster (default: 1 minute).
  -pc, --plugin-category TEXT  List of plugin categories
                               [alarms/alerts/informational] to monitor.
  -pi, --plugin-include TEXT   List of plugins to add to the cluster for
                               monitoring.
  -pe, --plugin-exclude TEXT   List of plugins to remove from the cluster for
                               monitoring.
  --help                       Show this message and exit.

```

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
    <td><code>--name</code></td>
    <td>The fully qualified domain name (FQDN) for your Qumulo cluster</td>
  </tr>
  <tr>
    <td><code>--token</code></td>
    <td>The long-lived access token for communicating with the Qumulo REST API</td>
  </tr> 
  <tr>
    <td><code>--port</code></td>
    <td>The port for communicating with the Qumulo REST API, <code>8000</code> by default</td>
  </tr>
  <tr>
    <td><code>--nlb</code></td>
    <td>
      <p>Network load balancer: when set to <code>false</code>, floating IP address configuration is required</p>    
      <p>To prevent spreading the load of a plugin's API requests across all nodes in a Qumulo cluster, each alarm or alert plugin that you configure communicates with your cluster by using either a network load balancer or floating IPs.</p>
      {% include important.html content="You can configure _one_&mdash;but not both&mdash;of these communication methods." %}
    </td>
  </tr>
  <tr>
    <td><code>--frequency</code></td>
    <td>
      <p>The time period between each plugin's execution, including the unit (seconds or minutes) and value, that applies to all plugins in a category without a specific frequency, 60 seconds by default</p>
      <p>You can configure a distinct frequency for each category of alarm or alert.</p>
    </td>
  </tr>
  <tr>
    <td><code>-pc / --plugin-category</code></td>
    <td>
      <p>The category of plugins to include for monitoring. Multiple [-pc, --plugin-category] options can be included on the command line..</p>
    </td>
  </tr>
  <tr>
    <td><code>-pi / --plugin-include</code></td>
    <td>
      <p>The name of an individual plugin to include for monitoring. Multiple [-pi, --plugin-include] options can be included on the command line.</p>
    </td>
  </tr>
  <tr>
    <td><code>-pe / --plugin-exclude</code></td>
    <td>
      <p>The name of an individual plugin to exclude from monitoring. Multiple [-pe, --plugin-exclude] options can be included on the command line.</p>
    </td>
  </tr>
</tbody>
</table>

## Example: Monitoring Alarms for Disks and Nodes on a Single Cluster

```bash
alerts cluster_add --name cluster.xyzcorp.com --token 12345678901234567890 -pi Disks -pi Nodes
```
```json
[{
    "frequency": 1,
    "id": 1,
    "name": "cluster.xyzcorp.com",
    "nlb": false,
    "plugins": [
        {
            "category": "Alarms",
            "description": "Get Disk State Information",
            "frequency": null,
            "name": "Disks"
        },
        {
            "category": "Alarms",
            "description": "Get Cluster Node Failures",
            "frequency": null,
            "name": "Nodes"
        }
    ],
    "port": 8000
}]

```

## Example: Monitoring Alarms for Disks and Nodes and All Alerts on a Single Cluster

```bash
alerts cluster_add --name cluster.xyzcorp.com --token 12345678901234567890 -pi Disks -pi Nodes -pc Alerts
```
```json
[{
    "frequency": 1,
    "id": 1,
    "name": "cluster.xyzcorp.com",
    "nlb": false,
    "plugins": [
        {
            "category": "Alarms",
            "description": "Get Disk State Information",
            "frequency": null,
            "name": "Disks"
        },
        {
            "category": "Alarms",
            "description": "Get Cluster Node Failures",
            "frequency": null,
            "name": "Nodes"
        },
        {
            "category": "Alerts",
            "description": "Get Active Directory State",
            "frequency": null,
            "name": "AD"
        },
        {
            "category": "Alerts",
            "description": "Get Audit Status",
            "frequency": null,
            "name": "Audit"
        },
        {
            "category": "Alerts",
            "description": "Get Cluster Volume Capacity",
            "frequency": null,
            "name": "Capacity"
        },
        {
            "category": "Alerts",
            "description": "Get NFS Exports",
            "frequency": null,
            "name": "Exports"
        },
        {
            "category": "Alerts",
            "description": "Get FTP Status",
            "frequency": null,
            "name": "FTP"
        },
        {
            "category": "Alerts",
            "description": "Get Local Groups",
            "frequency": null,
            "name": "Groups"
        },
        {
            "category": "Alerts",
            "description": "Get Cloud Monitoring and Remote Support Information",
            "frequency": null,
            "name": "Monitoring"
        },
        {
            "category": "Alerts",
            "description": "Get Quota Notifications",
            "frequency": null,
            "name": "Quotas"
        },
        {
            "category": "Alerts",
            "description": "Get Restriper Status Information",
            "frequency": null,
            "name": "Restriper"
        },
        {
            "category": "Alerts",
            "description": "Get SMB Shares",
            "frequency": null,
            "name": "Shares"
        },
        {
            "category": "Alerts",
            "description": "Get Softquota Notifications",
            "frequency": null,
            "name": "Softquotas"
        },
        {
            "category": "Alerts",
            "description": "Get Local Users",
            "frequency": null,
            "name": "Users"
        }
    ],
    "port": 8000
}]
```
