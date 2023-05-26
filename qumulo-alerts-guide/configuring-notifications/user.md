---
title: "Configuring User Notifications"
summary: "This section explains how to configure user notifications from Qumulo Alerts."
permalink: /qumulo-alerts-guide/configuring-notifications/user.html
redirect_to:
  - /qumulo-alerts-guide/installing-configuring/user-notifications.html
sidebar: qumulo_alerts_guide_sidebar
keywords: Qumulo_Alerts, user, notification, configure, configuration, JSON
---

## Configuring Administrative Notifications for a Qumulo Cluster
To configure Qumulo Alerts to notify individual unique administrators about alarms and alerts from a Qumulo cluster, you must use the CLI to add that 
administrator as a user to Qumulo Alerts and then add that user to a Notify Group.

A configured user is also allowed to login to the Qumulo Alerts CLI and execute administration commands. Users must first be added to a Role to enable this feature.

{% include note.html content="Configuring a user notification has nothing to do with user quota notifications. Please see the section on User Quota Notifications for instructions on how to configure user notifications for quotas." %}

{{site.qumuloalerts.consTrans}}{{site.qumuloalerts.locale}}
{{site.qumuloalerts.tz}}

The format of the command to add a new user is:

```bash
./alerts user_add --help
```
```json
[alerts - 6.0.0 - CLI for Qumulo Alerts subsystem]
Usage: alerts user_add [OPTIONS]

  Add a user to notify in Qumulo Alerts

Options:
  --full_name TEXT               Full name of the user (example: 'John
                                 Smith').  [required]
  --username TEXT                Login user name (example: 'jsmith')
                                 [required]
  --password TEXT                Login password for the new user.  [required]
  --email TEXT                   Email address for the new user
  --phone TEXT                   Mobile phone number for the new user.
  --ifttt-event TEXT             IFTTT event to trigger for the new user.
  --language TEXT                Language used to send alerts to the user.
  --timezone TEXT                Timezone used for formatting alerts to the
                                 user.
  --disabled BOOLEAN             Disable/Enable the user.
  --can-change-password BOOLEAN  A user can change their own password.
  --help                         Show this message and exit.
```
The following is an explanation of the command line arguments that configure user notifications.

{% include note.html content="Although both `email`, `phone`, and `ifttt-event` are optional keys, you must specify at least one of them for the user to receive notifications." %}

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
    <td><code>--full_name</code></td>
    <td>The recipient's full name</td>
  </tr>
  <tr>
    <td><code>--username</code></td>
    <td>A unique username to identify the recipient</td>
  </tr>
  <tr>
    <td><code>--password</code></td>
    <td>A password so that this user can login to the Qumulo Alerts CLI.</td>
  </tr>
  <tr>
    <td><code>--email</code></td>
    <td>(Optional) The recipient's email address</td>
  </tr>   
  <tr>
    <td><code>--phone</code></td>
    <td>(Optional) The recipient's phone number, starting with a plus (<code>+</code>) followed by the international calling code</td>
  </tr>  
  <tr>
    <td><code>--ifttt-event</code></td>
    <td>(Optional) A event string used by IFTTT in a webhook that will be unique for this recipient.</td>
  </tr>  
  <tr>
    <td><code>--language</code></td>
    <td>
    </td>
  </tr>
  <tr>
    <td><code>--timezone</code></td>
    <td>
    </td>
  </tr>
  <tr>
    <td><code>--disabled</code></td>
    <td>(Optional) The user is allowed to receive notifications, but cannot login to the Qumulo Alerts CLI.</td>
  </tr>  
  <tr>
    <td><code>--can-change-password</code></td>
    <td>(Optional) The user is allowed to change their own password. This is only used if the user is allowed through ROLE permissions to login to the Qumulo Alerts CLI.</td>
  </tr>
</tbody>
</table>

## Example: Adding a new Administrative user

```bash
./alerts user_add --full_name "Joe Somebody" --username jsomebody --password Admin123 --email jsomebody@xyzcorp.com --language en_US --timezone America/Los_Angeles
```
```json
[alerts - 6.0.0 - CLI for Qumulo Alerts subsystem]
[{
    "disabled": false,
    "email": "jsomebody@xyzcorp.com",
    "full_name": "Joe Somebody",
    "id": 3,
    "ifttt_event": null,
    "language": "en_US",
    "phone": null,
    "timezone": "America/Los_Angeles",
    "username": "jsomebody"
}]

```

## Configuring a NotifyGroup for User Notifications

Only Users added to a NotifyGroup will get notifications from Qumulo Alerts. A NotifyGroup specifies which events
receive notifications.

To add a user to NotifyGroup, it must first exist. By default, there is one NotifyGroup with all events
included and it is called `NotifyAll`. If you wish to restrict which events any user receives, create an additional
NotifyGroup and add those events to the group. 

```bash
./alerts notifygroup_add --help
```
```json
[alerts - 6.0.0 - CLI for Qumulo Alerts subsystem]
Usage: alerts notifygroup_add [OPTIONS]

  Add a NotifyGroup to Qumulo Alerts

Options:
  --name TEXT         Name of the NotifyGroup.  [required]
  --description TEXT  Description of the NotifyGroup.
  --event TEXT        Event to assign to the NotifyGroup.
  --help              Show this message and exit.
```
The following is an explanation of the command line arguments that are used to add a NotifyGroup.

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
    <td><code>--name</code></td>
    <td>A unique name for the NotifyGroup.</td>
  </tr>
  <tr>
    <td><code>--description</code></td>
    <td>[Optional] A description of the NotifyGroup</td>
  </tr>
  <tr>
    <td><code>--event</code></td>
    <td>The name of the event that will cause a notification. The command may include multiple <b>--event</b> on the command line.</td>
  </tr>
</tbody>
</table>

## Example: Adding a new NotifyGroup

The following command adds a new NotifyGroup identified as `NotifyHardware` and adds all the events
for hardware state changes.

```bash
./alerts notifygroup_add --name NotifyHardware --description "Notify when some hardware has changed state" --event NOTIFY_FANS --event NOTIFY_CPU --event NOTIFY_DISKS --event NOTIFY_NETWORK --event NOTIFY_NODES
```
```json
[alerts - 6.0.0 - CLI for Qumulo Alerts subsystem]
[{
    "description": "Notify when some hardware has changed state",
    "id": 2,
    "name": "NotifyHardware"
}]

```

## Example: Adding a user to the new NotifyGroup

Once the NotifyGroup is created, you can start to add users to it. Remember that only users in a NotifyGroup can
receive notifications; either through email, clicksend (sms), or IFTTT.

```bash
./alerts notifygroup_add_user --name NotifyHardware --username jsomebody
```
```json
[alerts - 6.0.0 - CLI for Qumulo Alerts subsystem]
[{
    "description": "Notify when some hardware has changed state",
    "id": 2,
    "name": "NotifyHardware",
    "users": [
        {
            "can_change_password": true,
            "disabled": false,
            "email": "jsomebody@xyzcorp.com",
            "full_name": "Joe Somebody",
            "id": 3,
            "ifttt_event": null,
            "language": "en_US",
            "phone": null,
            "timezone": "America/Los_Angeles",
            "username": "jsomebody"
        }
    ]
}]

```
