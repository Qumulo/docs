---
title: "Configuring Quota Notifications to an Administrative Account in Qumulo Alerts"
summary: "This section explains how to configure Qumulo Alerts to send quota notifications from a Qumulo cluster to an administrative account."
permalink: /qumulo-alerts-guide/configuring-notifications/quotas-to-admins.html
sidebar: qumulo_alerts_guide_sidebar
keywords: Qumulo_Alerts, quota, quotas, notification, configure, configuration
---

You can configure quota monitoring by using _thresholds_.

* {{site.qumuloalerts.warningThreshold}}
* {{site.qumuloalerts.errorThreshold}}
* {{site.qumuloalerts.criticalThreshold}}

You can configure unattached quotas or attach them to a cluster.

## To Configure Quota Notifications with Two Thresholds
Use the `./alerts quota_add` command and specify the quota path to monitor. The following example specifies the warning threshold and the error threshold and doesn't attach the quota to a Qumulo cluster.

```bash
./alerts quota_add \
  --quotapath /Reports/Sales \
  --warning 80 \
  --error 85
```

{{site.qumuloalerts.jsonOutput}}

```json
[{
  "admin_notification": true,
  "critical": 95,
  "error": 85,
  "id": 2,
  "quota_path": "/Reports/Sales/",
  "user_email": "",
  "user_mode": "direct",
  "user_notification": false,
  "warning": 80
}]
```


## To Configure Quota Notifications with a Single Threshold
Use the `./alerts quota_add` command and specify the quota path. The following example specifies the error threshold and attaches the quota to a Qumulo cluster.

```bash
./alerts quota_add \
  --quotapath /Reports/Marketing \
  --error 90 \
  --cluster-include cluster.example.com
```

{% include note.html content="When you add a quota and attach it to a cluster, the `alerts` CLI doesn't list the cluster." %}

{{site.qumuloalerts.jsonOutput}}

```json
[{
  "admin_notification": true,
  "critical": 95,
  "error": 90,
  "id": 3,
  "quota_path": "/Movies/Dutch/",
  "user_email": "",
  "user_mode": "direct",
  "user_notification": false,
  "warning": 75
}]
```


## To List All Defined Quotas and Attached Clusters
Use the `./alerts quota_list` command.

{{site.qumuloalerts.jsonOutput}} In this example, the second quota is attached to a Qumulo cluster.

```json
[{
  "items": [{
    "admin_notification": true,
    "clusters": [],
    "critical": 95,
    "error": 85,
    "id": 2,
    "quota_path": "/Reports/Sales/",
    "user_email": "",
    "user_mode": "direct",
    "user_notification": false,
    "warning": 80
  },{
    "admin_notification": true,
    "clusters": [{
      "frequency": 1,
      "name": "cluster.example.com",
      "nlb": false,
      "port": 8000
    }],
    "critical": 95,
    "error": 90,
    "id": 3,
    "quota_path": "/Reports/Marketing/",
    "user_email": "",
    "user_mode": "direct",
    "user_notification": false,
    "warning": 75
  }],
  "page": 1,
  "pages": 1,
  "size": 50,
  "total": 2
}]
```
