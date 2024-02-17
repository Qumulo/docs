---
title: "Configuring Quota Notifications to a User Account in Qumulo Alerts"
summary: "This section explains how to configure Qumulo Alerts to send quota notifications from a Qumulo cluster to a user account."
permalink: /qumulo-alerts-guide/configuring-notifications/quota-notifications-to-users.html
redirect_from:
  - /qumulo-alerts-guide/configuring-notifications/quotas-to-users.html
sidebar: qumulo_alerts_guide_sidebar
---

Qumulo Alerts can notify an individual user's email address manually or use [default quotas](default-quotas.html) to notify email addresses associated in Active Directory (AD) with the security identifier (SID) of the quota directory's owner automatically.


## To Notify an Individual Email Address
Use the `./alerts quota_add` command and specify the quota path, the email address to notify, the email address to notify, and the fully qualified domain name (FQDN) of your Qumulo cluster. For example:

```bash
./alerts quota_add \
  --quotapath /Reports/Marketing \
  --user-notification True \
  --user-mode direct \
  --user-email jjohnson@example.com \
  --cluster-include cluster.example.com
```

{% include note.html content="For the `--user-email` flag, you can specify a comma-delimited list of email addresses to notify, if you also specify `--user-notification True --user-mode direct`." %}

{{site.qumuloalerts.jsonOutput}}

```json
[{
  "admin_notification": true,
  "critical": 95,
  "error": 85,
  "id": 1,
  "quota_path": "/Reports/Marketing/",
  "user_email": "jjohnson@example.com",
  "user_mode": "direct",
  "user_notification": true,
  "warning": 75
}]
```

## Notifying Directory Owners Automatically
To ue this method, you must first add an AD server to Qumulo Alerts and then configure the default quota to use AD lookup to retrieve users' email addresses.

### Step 1: Connect Qumulo Alerts to an Active Directory Server
Use the `./alerts ad_server_add` command and specify the AD server, AD login name, AD password, the search base for looking up users, and the fully qualified domain name (FQDN) of your Qumulo cluster. For example:

```bash
./alerts ad_server_add \
  --server-name "ad.example.com" \
  --login-name "example.com\LookupUser" \
  --password MyPassword123 \
  --search-base "CN=Users,DC=example,DC=com" \
  --cluster-include cluster.example.com
```

{% include important.html content="For maximum security, configure a specific AD user to issue lookup requests." %}

{{site.qumuloalerts.jsonOutput}}

```json
[{
  "clusters": [{
    "frequency": 1,
    "name": "cluster.example.com",
    "nlb": false,
    "port": 8000
  }],
  "id": 2,
  "login_name": "example.com\\LookupUser",
  "search_base": "CN=Users,DC=example,DC=com",
  "server_name": "ad.example.com"
}]
```

### Step 2: Configure a Default Quota to use Active Directory Lookup
Use the `./alerts default_quota_update` command, specify the default quota ID, and configure the quota to notify users. For example:

```bash
./alerts default_quota_update \
  --id 1 \
  --user-notification True \
  --admin-notification False
```

{{site.qumuloalerts.jsonOutput}}

```json
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
