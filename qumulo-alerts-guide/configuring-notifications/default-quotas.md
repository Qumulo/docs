---
title: "Configuring Default Quota Notifications in Qumulo Alerts"
summary: "This section explains how to configure default quota notifications in Qumulo Alerts."
permalink: /qumulo-alerts-guide/configuring-notifications/default-quotas.html
sidebar: qumulo_alerts_guide_sidebar
keywords: Qumulo_Alerts, quota, quotas, notification, configure, configuration, default
---

Qumulo Alerts lets an administrator configure notifications that inherit a template from one of the following default quotas.

* **No-Path Quota**: This quota type has no defined file system path. It is the most common quota type and it applies thresholds to every quota defined for a Qumulo cluster.

* **Inherited-Path Quotas:** This quota type lets an administrator specify a default path for every quota defined for a Qumulo cluster. Every quota created under the default path inherits its thresholds from this quota.

You can configure quota monitoring by using _thresholds_.

* {{site.qumuloalerts.warningThreshold}}
* {{site.qumuloalerts.errorThreshold}}
* {{site.qumuloalerts.criticalThreshold}}

For more information about how quotas work, see [Configuring Quota Notifications to an Administrative Account](quotas-to-admins.html) and [Configuring Quota Notifications to a User Account](quotas-to-users.html).

## To List the Predefined No-Path Quota
Qumulo Alerts comes with a predefined no-path quota. To get information about this quota, use the `./alerts default_quota_list` command.

{{site.qumuloalerts.jsonOutput}}

```json
[{
  "items": [{
    "admin_notification": true,
    "critical": 95,
    "error": 85,
    "id": 1,
    "quota_prefix": "",
    "user_mode": "owner",
    "user_notification": false,
    "warning": 75
  }],
  "page": 1,
  "pages": 1,
  "size": 50,
  "total": 1
}]

```

## To Configure an Inherited-Path Quota
Use the `./alerts default_quota_add` command and specify the default path and thresholds. For example:

```bash
./alerts default_quota_add \
  --quota-prefix /Home \
  --warning 80 \
  --error 90 \
  --critical 98
```

{{site.qumuloalerts.jsonOutput}}

```json
[{
  "admin_notification": true,
  "critical": 98,
  "error": 90,
  "id": 2,
  "quota_prefix": "/Home/",
  "user_mode": "owner",
  "user_notification": false,
  "warning": 80
}]
```
