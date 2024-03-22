---
title: "Configuring Alarm and Alert Collection from a Qumulo Cluster"
summary: "This section explains how to configure Qumulo Alerts to collect alarms and alerts from a Qumulo Cluster."
permalink: /qumulo-alerts-guide/configuring-alarm-alert-collection.html
redirect_from:
  - /qumulo-alerts-guide/installing-configuring/alarms-and-alerts.html
sidebar: qumulo_alerts_guide_sidebar
varFirstStep: Use the <code>./alerts cluster_add</code> command and specify the fully qualified domain name (FQDN) of your Qumulo cluster, your long-lived access token for the Qumulo Core REST API, and the plugins or plugin categories to include or exclude from monitoring. 
---

## Collecting Information about Specific Alarms
{{page.varFirstStep}}

In the following example, we include the plugins `Disks` and `Nodes`.

```bash
./alerts cluster_add \
  --name cluster.example.com \
  --token 12345678901234567890 \
  -pi Disks \
  -pi Nodes
```

{{site.exampleOutput}}
    
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
  <li>To prevent spreading the load of a plugin's API requests across all nodes in a Qumulo cluster, each alarm or alert plugin that you configure communicates with your cluster by using either a network load balancer or floating IP addresses. You can configure <em>one</em>&mdash;but not both&mdash;of these communication methods.</li>
</ul>
{{site.data.alerts.end}}


## Collecting Information about All Alarms
{{page.varFirstStep}}

In the following example, we include the `Alarms` category.

```bash
./alerts cluster_add \
  --name cluster.example.com \
  --token 12345678901234567890 \
  -pc Alarms
```

{{site.exampleOutput}}

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
    "category": "Alarms",
    "description": "Get Fan Failures",
    "frequency": null,
    "name": "Fans"
  },{
    "category": "Alarms",
    "description": "Get CPU Overtemp",
    "frequency": null,
    "name": "CPU"
  },
  ...
  ],
  "port": 8000
}]
```

## Collecting Information about All Alarms, Alerts, and Informational Messages
{{page.varFirstStep}}

In the following example, we include the `Alarms`, `Alerts`, and `Informational` categories.

```bash
./alerts cluster_add \
  --name cluster.example.com \
  --token 12345678901234567890 \
  -pc Alarms \
  -pc Alerts \
  -pc Informational
```

{{site.exampleOutput}}

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
