---
title: "Configuring Alarm and Alert Notifications to an Administrative Account in Qumulo Alerts"
summary: "This section explains how to configure Qumulo Alerts to send alarm and alert notifications from a Qumulo cluster to an administrative account."
permalink: /qumulo-alerts-guide/configuring-notifications/alarms-and-alerts.html
redirect_from:
  - /qumulo-alerts-guide/installing-configuring/user-notifications.html
sidebar: qumulo_alerts_guide_sidebar
keywords: Qumulo_Alerts, notification, configure, configuration, JSON, NotifyGroup
---

You must first add the account as a Qumulo Alerts user, create a NotifyGroup and configure its notifications, and then add the user to the NotifyGroup.


## Step 1: Add an Administrative Account as a Qumulo Alerts User
Use the `./alerts user_add` command and specify the administrator's full name, username, password, email address, language, and time zone. For example:

```bash
./alerts user_add \
  --full_name "Jane Johnson" \
  --username jjohnson \
  --password MyPassword123 \
  --email jjohnson@example.com \
  --language en_US \
  --timezone America/Los_Angeles
```

{{site.data.alerts.note}}
<ul>
  <li>{{site.qumuloalerts.locale}} {{site.qumuloalerts.consTrans}}</li>
  <li>{{site.qumuloalerts.tz}}</li>
</ul>
{{site.data.alerts.end}}

{{site.qumuloalerts.jsonOutput}}

```json
[{
  "disabled": false,
  "email": "jjohnson@example.com",
  "full_name": "Jane Johnson",
  "id": 3,
  "ifttt_event": null,
  "language": "en_US",
  "phone": null,
  "timezone": "America/Los_Angeles",
  "username": "jjohnson"
}]
```


## Step 2: Create and Configure a NotifyGroup
Use the `./alerts notifygroup_add` command and specify the NotifyGroup's name, description, and the events for which the NotifyGroup receives notifications. In the following example, the `NotifyOnHardwareChange` group receives notifications for all hardware state change events.

```bash
./alerts notifygroup_add \
  --name NotifyOnHardwareChange \
  --description "Send a notification when any hardware changes state" \
  --event NOTIFY_FANS \
  --event NOTIFY_CPU \
  --event NOTIFY_DISKS \
  --event NOTIFY_NETWORK \
  --event NOTIFY_NODES
```

{{site.qumuloalerts.jsonOutput}}

```json
[{
  "description": "Send a notification when any hardware changes state",
  "id": 2,
  "name": "NotifyOnHardwareChange"
}]
```

## Step 3: Add a Qumulo Alerts User to a NotifyGroup
Use the `./alerts notifygroup_add_user` command and specify the NotifyGroup name and the Qumulo Alerts user name to add to the NotifyGroup. For example:

```bash
./alerts notifygroup_add_user \
  --name NotifyOnHardwareChange \
  --username jjohnson
```

{{site.qumuloalerts.jsonOutput}}

```json
[{
  "description": "Notify when certain hardware changes state",
  "id": 2,
  "name": "NotifyOnHardwareChange",
  "users": [{
    "can_change_password": true,
    "disabled": false,
    "email": "jjohnson@example.com",
    "full_name": "Jane Johnson",
    "id": 3,
    "ifttt_event": null,
    "language": "en_US",
    "phone": null,
    "timezone": "America/Los_Angeles",
    "username": "jjohnson"
  }]
}]
```
