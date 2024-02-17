---
title: "Upgrading Qumulo Alerts from the Beta Version"
summary: "This section explains how to upgrade Qumulo Alerts from the beta version."
permalink: /qumulo-alerts-guide/upgrading/from-beta-version.html
sidebar: qumulo_alerts_guide_sidebar
---

{{site.data.alerts.note}}
<ul>
  <li>Whereas the beta version of Qumulo Alerts uses JSON files for configuration, the public version of Qumulo Alerts uses its API or the <code>alerts</code> CLI to store configuration information in a database.</li>
  <li>It isn't possible to upgrade from the beta version of Qumulo Alerts to the public version automatically. To enable upgrades from a beta version, you must perform the following manual steps.</li>
</ul>
{{site.data.alerts.end}}

## To Prepare for Upgrading Qumulo Alerts from the Beta Version

{{site.qumuloalerts.shutdownQA}}

1. Copy the information from the `user_token` field located in the `QumuloAlerts/config/alerts/QumuloAlerts.json` file.

1. Rename the directory of the beta version of Qumulo Alerts, for example to `QumuloAlerts.beta`.

1. [Install the latest public version of Qumulo Alerts](../installing-configuring-qumulo-alerts.html).

1. When you [configure alarm and alert collection from your Qumulo cluster](../configuring-alarm-alert-collection.html), use the information from the `user_token` field.
