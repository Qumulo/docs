---
title: "Configuring Alarms and Alerts"
summary: "This section explains how to configure Qumulo Alerts to generate alarms and alerts."
permalink: /qumulo-alerts-guide/installing-configuring/alarms-and-alerts.html
sidebar: qumulo_alerts_guide_sidebar
keywords: Qumulo_Alerts, alert, alarm, Docker, producer, plug_in, plugin, plug-in, monitoring, configure, configuration, JSON
---

## To Configure Qumulo Alerts to Collect Specific Data from a Qumulo Cluster
Use the `./alerts cluster_add` command and specify the fully qualified domain name (FQDN) of your Qumulo cluster, your long-lived access token for the Qumulo REST API, and the plugins to include or exclude from monitoring. In the following example, we include `Disks` and exclude `Nodes`.

```bash
./alerts cluster_add \
  --name mycluster.example.com \
  --token 12345678901234567890 \
  -pi Disks \
  -pi Nodes
```

{{site.qumuloalerts.jsonOutput}}
    
```json
[{
  "frequency": 1,
  "id": 1,
  "name": "cluster.example.com",
  "nlb": false,
  "plugins": [{
    "category": "Alarms",
    "description": "Get Disk State Information",
    "frequency": null,
    "name": "Disks"
  },{
    "category": "Alarms",
    "description": "Get Cluster Node Failures",
    "frequency": null,
    "name": "Nodes"
  }],
  "port": 8000
}]
```

{{site.data.alerts.note}}
<ul>
  <li>For the <code>--nlb</code> flag, the <code>false</code> setting requires floating IP address configuration.</li>
  <li>To prevent spreading the load of a plugin's API requests across all nodes in a Qumulo cluster, each alarm or alert plugin that you configure communicates with your cluster by using either a network load balancer or floating IPs. You can configure <em>one</em>&mdash;but not both&mdash;of these communication methods.</li>
</ul>
{{site.data.alerts.end}}

## To Configure Qumulo Alerts to Collect All Alerts for Specific Data from a Qumulo Cluster
Use the `./alerts cluster_add` command and specify the fully qualified domain name (FQDN) of your Qumulo cluster, your long-lived access token for the Qumulo REST API, the plugins to include or exclude from monitoring, and the plugin category to include. In the following example, we include `Disks`, exclude `Nodes`, and include the `Alerts` category.

```bash
./alerts cluster_add \
  --name cluster.example.com \
  --token 12345678901234567890 \
  -pi Disks \
  -pi Nodes \
  -pc Alerts
```

{{site.qumuloalerts.jsonOutput}} This example output is truncated.

```json
[{
  "frequency": 1,
  "id": 1,
  "name": "cluster.example.com",
  "nlb": false,
  "plugins": [{
    "category": "Alarms",
    "description": "Get Disk State Information",
    "frequency": null,
    "name": "Disks"
  },{
    "category": "Alarms",
    "description": "Get Cluster Node Failures",
    "frequency": null,
    "name": "Nodes"
  },{
    "category": "Alerts",
    "description": "Get Active Directory State",
    "frequency": null,
    "name": "AD"
  },{
    "category": "Alerts",
    "description": "Get Audit Status",
    "frequency": null,
    "name": "Audit"
  },{
    "category": "Alerts",
    "description": "Get Cluster Volume Capacity",
    "frequency": null,
    "name": "Capacity"
  },
  ...
  ],
  "port": 8000
}]
```
