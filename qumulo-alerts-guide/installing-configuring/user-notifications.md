---
title: "Configuring User Notifications"
summary: "This section explains how to configure user notifications from Qumulo Alerts."
permalink: /qumulo-alerts-guide/installing-configuring/user-notifications.html
sidebar: qumulo_alerts_guide_sidebar
keywords: Qumulo Alerts, user, notification, configure, configuration, JSON
---

## Configuring User Notifications about a Qumulo Cluster
To configure Qumulo Alerts to notify users about alarms and alerts from a Qumulo cluster, you must edit `QumuloUsers.json`, located in the `config/alerts` directory, in the directory [that you cloned from GitHub](installing-connecting-to-qumulo-cluster.md#step-1-install-qumuloalerts).

The following is an explanation of the JSON keys that configure user notifications.

{% include note.html content="Although both `email_address` and `phone_number` are optional keys, you must specify at least one of them for the user to receive notifications." %}

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
    <td><code>email_address</code></td>
    <td>(Optional) The recipient's email address</td>
  </tr>   
  <tr>
    <td><code>full_name</code></td>
    <td>The recipient's full name</td>
  </tr>
  <tr>
    <td><code>language</code></td>
    <td>
    {% include content-reuse/qumulo-alerts-see-locale.md %}
    </td>
  </tr>
  <tr>
    <td><code>notify</code></td>
    {% include content-reuse/qumulo-alerts-monitor-notify-array.md %}
  </tr>   
  <tr>
    <td><code>phone_number</code></td>
    <td>(Optional) The recipient's phone number, starting with a plus (<code>+</code>) followed by the international calling code</td>
  </tr>  
  <tr>
    <td><code>short_name</code></td>
    <td>The shortened form of the recipient's name</td>
  </tr> 
  <tr>
    <td><code>timezone</code></td>
    <td>
    {% include content-reuse/qumulo-alerts-see-tz.md %}
    </td>
  </tr>     
</tbody>
</table>

## Example: Notifying Users in Different Countries about Different Alarms and Alerts
In the following example, the wildcard `*` specifies _all plugins in this category generate notifications_.

```json
[{
  "full_name": "Linda Johnson",
  "short_name": "Linda",
  "email_address": "ljohnson@example.com",
  "phone_number": "+15555555555",
  "language": "en_US",
  "timezone": "America/Phoenix",
  "notify": [{
    "category": "Alarms",
    "subcategory": ["Disk", "Node"],
    "enabled": true
  }]
},{
  "full_name": "Yennefer Martinez",
  "short_name": "Yen",
  "email_address": "yennefer@example.com",
  "phone_number": "+905555555555"
  "language": "tr_TR",
  "timezone": "Europe/Istanbul",
  "notify": [{
    "category": "Alarms",
    "subcategory": ["*"],
    "enabled": true
  },{
    "category": "Alerts",
    "subcategory": ["Quotas"],
    "enabled": true
  }]
}]
```
