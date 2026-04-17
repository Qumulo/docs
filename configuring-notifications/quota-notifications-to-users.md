---
title: "Configuring Quota Notifications to One or More User Accounts in Qumulo Alerts"
summary: "This section explains how to configure Qumulo Alerts to send quota notifications from a Qumulo cluster to one or more user accounts."
permalink: /qumulo-alerts-guide/configuring-notifications/quota-notifications-to-users.html
redirect_from:
  - /qumulo-alerts-guide/configuring-notifications/quotas-to-users.html
sidebar: qumulo_alerts_guide_sidebar
---

## To Configure Quota Notifications by Using the Qumulo Alerts Web UI

1. On the sidebar, under **Quotas**, click **Quotas**.

1. Click **+ Add Quota** or click **Edit** next to an existing rule.

1. In the **Clusters** section, select one or more Qumulo clusters to add to this quota and then enter the quota rules:

   * For **Quota Path**, enter the quota directory path on your Qumulo cluster (for example, `/Reports/Marketing`).
  
   * For **Warning (%)**, enter the quota usage percentage that triggers a _warning_ notification (`70` by default).
  
   * For **Error (%)**, enter the quota usage percentage that triggers an _error_ notification (`80` by default).
  
   * For **Critical (%)**, enter the quota usage percentage that triggers a _critical_ notification (`90` by default).

1. Click **Notify Users entered below** and enter an email address.

1. (Optional) To add more addresses, click **+**.

1. Click **Save**.


## To Configure Quota Notifications by Using the alerts CLI
Run the `./alerts quota_add` command and specify the quota path, the email address to notify, and the fully qualified domain name (FQDN) of your Qumulo cluster. For example:

```bash
./alerts quota_add \
  --quotapath /Reports/Marketing \
  --user-notification \
  --user-mode direct \
  --user-email jjohnson@example.com \
  --cluster-include cluster.example.com
```

{% include note.html content="For the `--user-email` flag, you can specify a comma-delimited list of email addresses to notify, if you also specify `--user-notification --user-mode direct`." %}

{{site.exampleOutput}}

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

