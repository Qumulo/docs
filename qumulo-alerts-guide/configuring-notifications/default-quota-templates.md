---
title: "Configuring Quota Notifications by Using Default Quotas in Qumulo Alerts"
summary: "This section explains how to configure quota notifications by using default quotas in Qumulo Alerts."
permalink: /qumulo-alerts-guide/configuring-notifications/default-quotas.html
sidebar: qumulo_alerts_guide_sidebar
keywords: Qumulo_Alerts, quota, quotas, notification, configure, configuration, default
---

## The definition of a default quota

Default Quotas allow an Administrator to quickly setup quota notifications by inheriting a standard template
for quota notifications.

There are two types of default quotas. The first is a default quota with no filesystem path defined. This type of default quota
is more typical in that a **no path** default quota will apply thresholds to every single quota defined on a Qumulo cluster.

The second type is a **path inheritence** default quota. This type of default quota allows an Administrator to specify 
a default path and every quota created on a Qumulo cluster below that path will be inherited with the thresholds from
that default quota.

## Listing Default Quota Notifications for a Qumulo Cluster

The first type of default quota (a **no path** default quota) has already been preloaded within Qumulo Alerts.

To list this default quota, an Administrator need only use the CLI:

```bash
./alerts default_quota_list
```
```json
[alerts - 6.0.0 - CLI for Qumulo Alerts subsystem]
[{
    "items": [
        {
            "admin_notification": true,
            "critical": 95,
            "error": 85,
            "id": 1,
            "quota_prefix": "",
            "user_mode": "owner",
            "user_notification": false,
            "warning": 75
        }
    ],
    "page": 1,
    "pages": 1,
    "size": 50,
    "total": 1
}]

```

## Configuring an inherited Default Quota Notifications for a Qumulo Cluster

The format of the command to add a new default quota notification is:

```bash
./alerts default_quota_add --help
```
```json
[alerts - 6.0.0 - CLI for Qumulo Alerts subsystem]
Usage: alerts default_quota_add [OPTIONS]

  Add a default quota to monitor in Qumulo Alerts

Options:
  --quota-prefix TEXT           Prefix of the quota to monitor.  [required]
  --warning INTEGER             Warning threshold on which to alert (default:
                                75).  [required]
  --error INTEGER               Error threshold on which to alert (default:
                                85).  [required]
  --critical INTEGER            Critical threshold on which to alert (default:
                                95).  [required]
  --user-notification BOOLEAN   Notify the user when a quota threshold is
                                violated (default: False).
  --admin-notification BOOLEAN  Notify the admin when a quota threshold is
                                violated (default: True).
  --help                        Show this message and exit.
```
The following is an explanation of the command line arguments to configure a default quota notification based upon an inherited path.

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
    <td><code>--quota-prefix</code></td>
    <td>The prefix filesystem path of the defined quota on the Qumulo cluster. If you wish to inherit all quotas below <b>/Home</b> as an example, the <code>--quota-prefix</code> would be <b>/Home</b>.</td>
  </tr>
  <tr>
    <td><code>--warning</code></td>
    <td>The <bold>warning</bold> threshold. The warning threshold must be less than both the <b>error</b> or <b>critical</b> thresholds.</td>
  </tr>
  <tr>
    <td><code>--error</code></td>
    <td>The <bold>error</bold> threshold. The warning threshold must be less than the <b>critical</b> threshold.</td>
  </tr>
  <tr>
    <td><code>--critical</code></td>
    <td>The <bold>critical</bold> threshold. The critical threshold must be greater than both the <b>warning</b> or <b>error</b> thresholds.</td>
  </tr>
  <tr>
    <td><code>--user-notification</code></td>
    <td>Notify a user when any threshold is exceeded. Default is <b><i>False</i></b>.</td>
  </tr>
  <tr>
    <td><code>--admin-notification</code></td>
    <td>Notify an administrator when any threshold is exceeded. Default is <b><i>True</i></b>.</td>
  </tr>
</tbody>
</table>

## Example: Adding a new inherited Default Quota to monitor

Add a new inherited default quota to monitor and change all the thresholds. Only the Administrator will be notified when a threshold is violated.

```bash
./alerts default_quota_add --quota-prefix /Home --warning 80 --error 90 --critical 98
```
```json
[alerts - 6.0.0 - CLI for Qumulo Alerts subsystem]
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
