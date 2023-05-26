---
title: "Configure User Quota Notifications"
summary: "This section explains how to configure quotas for individual user notifications from Qumulo Alerts."
permalink: /qumulo-alerts-guide/configuring-notifications/user-quota.html
sidebar: qumulo_alerts_guide_sidebar
keywords: Qumulo_Alerts, quota, quotas, notification, configure, configuration
---

## Requirements for user quota notifications

In addition to notifying an Administrator when a quota has reached or exceeded a defined threshold, it is possible as well
to notify an individual user.

There are two methods in which an Administrator can configure an individual quota to notify a user. 

The first method is called **direct** and allows an Administrator to include the user email into the
defined quota notification.

The second method is called **owner**. With this method, the Qumulo Alerts Administrator creates a connection
to Active Directory and Qumulo Alerts will examine the owner of the directory underlying the Quota. Once that owner SID
is identified, Qumulo Alerts will look within Active Directory for the email address of that user. The **owner** method
has an advantage in that a Qumulo Alerts Administrator need not create a quota entry for each user to notify. Instead,
they can create a default quota and inherit a notification for each user using the **owner** method.

## Configuring an active directory lookup for a user quota notification on a Qumulo Cluster

The format of the command to add a active directory server is:

```bash
./alerts ad_server_add --help
```
```json
[alerts - 6.0.0 - CLI for Qumulo Alerts subsystem]
Usage: alerts ad_server_add [OPTIONS]

  Add an AD server in order to discover user email addresses for quota
  notifications

Options:
  --server-name TEXT      Name or IP Address of the AD Server.  [required]
  --login-name TEXT       Login name to the AD server for user validation.
                          [required]
  --password TEXT         Password required to login to the AD server for user
                          validation.  [required]
  --search-base TEXT      Search base to find User entries in AD.  [required]
  --cluster-include TEXT  The cluster that the AD Server should be added to.
  --help                  Show this message and exit.
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
    <td><code>--server-name</code></td>
    <td>The fully qualified domain name (FQDN) for the Active Directory server.</td>
  </tr>
  <tr>
    <td><code>--login-name</code></td>
    <td>The login name for the Active Directory server.</td>
  </tr>
  <tr>
    <td><code>--password</code></td>
    <td>The password for the Active Directory server.</td>
  </tr>
  <tr>
    <td><code>--search-base</code></td>
    <td>The base DN for looking up <b>User</b> records within Active Directory.</td>
  </tr>
  <tr>
    <td><code>--cluster-include</code></td>
    <td>(Optional) The name of a defined Qumulo Cluster that will use this Active Directory lookup for each of the defined quotas being monitored by this cluster. It is possible that an active directory server may exist in more than one cluster. The Qumulo Alerts Administrator can issue multiple >code>--cluster-include</code>.</td>
  </tr>
</tbody>
</table>

## Example: Adding an Active Directory server to a defined cluster

Add an Active Directory server to an existing defined cluster that is currently being monitored.

```bash
./alerts ad_server_add --server-name "ad.xyzcorp.com" --login-name "xyzcorp.com\LookupUser" --password XXYYZZ --search-base "CN=Users,DC=xyzcorp,DC=com" --cluster-include cluster.xyzcorp.com
```
```json
[alerts - 6.0.0 - CLI for Qumulo Alerts subsystem]
[{
    "clusters": [
        {
            "frequency": 1,
            "name": "cluster.xyzcorp.com",
            "nlb": false,
            "port": 8000
        }
    ],
    "id": 2,
    "login_name": "xyzcorp.com\\LookupUser",
    "search_base": "CN=Users,DC=xyzcorp,DC=com",
    "server_name": "ad.xyzcorp.com"
}]

```

{% include important.html content="Whenever possible, for security reasons, you should configure a specific user in Active Directory that will allow you to issue lookups for specific information in the Users CN. In our example (above), we use the name <b>LookupUser</b>" %}

## Example: Configuring a default quota to use AD Lookup

Once you have added an AD Server, configure the default quota to issue user notifications. Additionally, optionally disable
administrative notifications.

```bash
./alerts default_quota_update --id 1 --user-notification True --admin-notification False
```
```json
[alerts - 6.0.0 - CLI for Qumulo Alerts subsystem]
[{
    "admin_notification": false,
    "critical": 95,
    "error": 85,
    "quota_prefix": "",
    "user_mode": "owner",
    "user_notification": true,
    "warning": 75
}]

```

## Example: Configuring a specific quota to use direct email

While adding a specific quota, it is possible to configure user notifications using a direct email address.

```bash
./alerts quota_add --quotapath /Movies/Dutch --user-notification True --user-mode direct --user-email jsomebody@xyzcorp.com --cluster-include cluster.xyzcorp.com
```
```json
[alerts - 6.0.0 - CLI for Qumulo Alerts subsystem]
[{
    "admin_notification": true,
    "critical": 95,
    "error": 85,
    "id": 1,
    "quota_path": "/Movies/Dutch/",
    "user_email": "jsomebody@xyzcorp.com",
    "user_mode": "direct",
    "user_notification": true,
    "warning": 75
}]

```
