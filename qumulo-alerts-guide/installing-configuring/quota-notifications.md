---
title: "Configure Quota Notifications"
summary: "This section explains how to configure quota notifications from Qumulo Alerts."
permalink: /qumulo-alerts-guide/installing-configuring/quota-notifications.html
sidebar: qumulo_alerts_guide_sidebar
keywords: Qumulo_Alerts, quota, quotas, notification, configure, configuration
---

## Configuring Quota Notifications for a Qumulo Cluster

Qumulo Alerts can monitor the usage of quotas and notify administrators or users. Monitoring is done via defined thresholds. 

{% include note.html content="This section describes quota thresholds and how to monitor a quota. Please also read the section
on user quota notifications if you wish to notify individual users on their quota usage." %}

The format of the command to add a new quota notification is:

```bash
./alerts quota_add --help
```
```json
[alerts - 6.0.0 - CLI for Qumulo Alerts subsystem]
Usage: alerts quota_add [OPTIONS]

  Add a quota to monitor in Qumulo Alerts

Options:
  --quotapath TEXT              Pathname of the quota to monitor.  [required]
  --warning INTEGER             Warning threshold on which to alert (default:
                                75).  [required]
  --error INTEGER               Error threshold on which to alert (default:
                                85).  [required]
  --critical INTEGER            Critical threshold on which to alert (default:
                                95).  [required]
  --user-notification BOOLEAN   Notify the user when a quota threshold is
                                violated (default: False)
  --admin-notification BOOLEAN  Notify the admin when a quota threshold is
                                violated (default: True)
  --user-mode [owner|direct]    Whether to use AD to lookup user email or use
                                the direct email address in this quota (default: direct)
  --user-email TEXT             The email address of the user. This is NOT for
                                the admin email address
  --cluster-include TEXT        The cluster that the quota should be added to.
  --help                        Show this message and exit.
```
The following is an explanation of the command line arguments that configure quota notifications.

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
    <td><code>--quotapath</code></td>
    <td>The path of the defined quota on the Qumulo cluster.</td>
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
  <tr>
    <td><code>--user-mode [owner|direct]</code></td>
    <td>When <code>--user-notification</code> is set, either send a <b>direct</b> email or lookup the user in Active Directory based upon the <b>owner</b> of the quota path. Default is <b><i>direct</i></b>.</td>
  </tr>
  <tr>
    <td><code>--user-email</code></td>
    <td>When <code>--user-notification</code> is <b>True</b> and the <code>--user-mode</code> is <b>direct</b>, then the <code>--user-email</code> field contains a comma delimited list of email addresses in which to send the quota notification email.</td>
  </tr>
  <tr>
    <td><code>--cluster-include</code></td>
    <td>(Optional) The name of a defined Qumulo Cluster that will monitor this quota. It is possible that a quota may exist in more than one cluster. The user can issue multiple <code>--cluster-include</code>.</td>
  </tr>
</tbody>
</table>

## Example: Adding a new Quota to monitor

Add a new quota to monitor and change two of the three thresholds. Do not attach this quota to a cluster. Only the Administrator will be notified when a threshold is violated.

```bash
./alerts quota_add --quotapath /Movies/German --warning 80 --error 85
```
```json
[alerts - 6.0.0 - CLI for Qumulo Alerts subsystem]
[{
    "admin_notification": true,
    "critical": 95,
    "error": 85,
    "id": 2,
    "quota_path": "/Movies/German/",
    "user_email": "",
    "user_mode": "direct",
    "user_notification": false,
    "warning": 80
}]

```

## Example: Adding a second Quota to monitor

Add another quota to monitor and change only one of the three thresholds. Attach this to our already defined cluster. Only the Administrator will be notified when a threshold is violated.

```bash
./alerts quota_add --quotapath /Movies/Dutch --error 90 --cluster-include cluster.xyzcorp.com
```
```json
[alerts - 6.0.0 - CLI for Qumulo Alerts subsystem]
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

{% include note.html content="When adding a new quota with a cluster attached, please note that the cluster is not listed. This is intentional." %}

## Example: Listing all the quotas

This command will list all the quotas defined and, if any of them are attached to clusters, any clusters in which they are attached.

```bash
./alerts quota_list
```
```json
[alerts - 6.0.0 - CLI for Qumulo Alerts subsystem]
[{
    "items": [
        {
            "admin_notification": true,
            "clusters": [],
            "critical": 95,
            "error": 85,
            "id": 2,
            "quota_path": "/Movies/German/",
            "user_email": "",
            "user_mode": "direct",
            "user_notification": false,
            "warning": 80
        },
        {
            "admin_notification": true,
            "clusters": [
                {
                    "frequency": 1,
                    "name": "cluster.xyzcorp.com",
                    "nlb": false,
                    "port": 8000
                }
            ],
            "critical": 95,
            "error": 90,
            "id": 3,
            "quota_path": "/Movies/Dutch/",
            "user_email": "",
            "user_mode": "direct",
            "user_notification": false,
            "warning": 75
        }
    ],
    "page": 1,
    "pages": 1,
    "size": 50,
    "total": 2
}]

```
