---
title: "Configuring Alarm and Alert Notifications to an Administrative Account in Qumulo Alerts"
summary: "This section explains how to configure Qumulo Alerts to send alarm and alert notifications from a Qumulo cluster to an administrative account."
permalink: /qumulo-alerts-guide/configuring-notifications/alarms-and-alert-notifications-to-administrators.html
redirect_from:
  - /qumulo-alerts-guide/configuring-notifications/alarms-and-alerts.html
  - /qumulo-alerts-guide/installing-configuring/user-notifications.html
sidebar: qumulo_alerts_guide_sidebar
---

You must first add the account as a Qumulo Alerts user, create a notification group and configure its notifications, and then add the user to the notification group.


## Step 1: Add an Administrative Account as a Qumulo Alerts User
Use the `./alerts user_add` command and specify the administrator's full name, username, password, email address, language, and time zone. For example:

```bash
./alerts user_add \
  --full_name "Jane Johnson" \
  --username jjohnson \
  --password MyPassword123 \
  --email jjohnson@example.com \
  --language en_US \
  --timezone "America/Los_Angeles"
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


## Step 2: Create and Configure a Notification Group
Use the `./alerts notification_group_add` command and specify the notification group's name, description, and the events for which the notification group receives notifications. In the following example, the `NotifyOnHardwareChange` group receives notifications for all hardware state change events.

```bash
./alerts notification_group_add \
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

## Step 3: Add a Qumulo Alerts User to a Notification Group
Use the `./alerts notification_group_add_user` command and specify the notification group name and the Qumulo Alerts user name to add to the notification group. For example:

```bash
./alerts notification_group_add_user \
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
