---
title: "Configuring Alarm and Alert Collection from a Qumulo Cluster"
summary: "This section explains how to collect alarms and alerts from a Qumulo Cluster by using the Qumulo Alerts Web UI and the <code>alerts</code> CLI."
permalink: /qumulo-alerts-guide/configuring-alarm-alert-collection.html
redirect_from:
  - /qumulo-alerts-guide/installing-configuring/alarms-and-alerts.html
sidebar: qumulo_alerts_guide_sidebar
varFirstStep: Run the <code>./alerts cluster_add</code> command and specify the fully qualified domain name (FQDN) of your Qumulo cluster, your long-lived access token for the Qumulo REST API, and the plugins or plugin categories to include or exclude from monitoring.
---

## To Configure Alarm and Alert Collection by Using the Qumulo Alerts Web UI
This section explains how to configure alarm and alert collection by adding your Qumulo cluster to Qumulo Alerts and then configuring alert plugins for your cluster in the Qumulo Alerts Web UI.

{% capture avoidSpreading %}To avoid spreading a plugin's API request load across the nodes of a Qumulo cluster, all alarm and alert plugins communicate with your cluster by using either a network load balancer or floating IP addresses. You can configure <em>one</em>&mdash;but not both&mdash;of these communication methods.{% endcapture %}

{{site.data.alerts.important}}
<ul>
  <li>When you add a Qumulo cluster to Qumulo Alerts, all available alarm and alert plugins are enabled for that cluster by default.</li>
  <li>If you use a floating IP address, you must click <strong>Network Load Balancer</strong> to ensure that Qumulo Alerts connects to the node that currently uses the floating IP address.</li>
  <li>{{ avoidSpreading }}</li>
</ul>
{{site.data.alerts.end}}

### Step 1: Add a Qumulo Cluster to Qumulo Alerts
1. Log in to the Qumulo Alerts Web UI.

1. On the sidebar, under **Monitoring**, click **Clusters**.

1. Click **+ Add Cluster** and enter the following details:

   1. For **Cluster Name/IP**, specify the hostname or IP address for your Qumulo cluster.

      {% include important.html content="Qumulo Alerts uses this value as a display name. It isn't possible to change it after saving the cluster configuration." %}
   
   1. For **Access Token**, specify the long-lived access token that you created while [Installing and Configuring Qumulo Alerts](installing-configuring-qumulo-alerts.html#step-5-create-a-long-lived-access-token) guide.
   
   1. For **Port**, specify the REST API port (`8000` by default).
   
   1. For **Polling Frequency (minutes)**, specify how frequently Qumulo Alerts should poll your Qumulo cluster.
   
   1. (Optional) If your Qumulo cluster is accessible through a floating IP address behind a network load balancer, click **Network Load Balancer**.

1. Click **Save**.


### Step 2: Configure Alarm or Alert Plugins for a Qumulo Cluster
{% include tip.html content="To view all available plugin names and categories before configuring a cluster, click **Monitoring > Alert Types** on the sidebar" %}

1. Log in to the Qumulo Alerts Web UI.

1. On the sidebar, under **Monitoring**, click **Clusters** and then click **Edit** next to the cluster to configure.

1. In the **Plugins** section, click individual alarm and alert plugins to enable or disable them for your Qumulo cluster.

1. Click **Save**.


## To Configure Alarm and Alert Collection by Using the alerts CLI
This section explains how to collect information and specific alarms; all alarms; or all alarms, alerts, and informational messages by using the `alerts` CLI.

### Collecting Information about Specific Alarms
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
  <li>{{ avoidSpreading }}</li>
</ul>
{{site.data.alerts.end}}


### Collecting Information about All Alarms
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

### Collecting Information about All Alarms, Alerts, and Informational Messages
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
