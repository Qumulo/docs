---
title: "Configuring Qumulo Alerts Integration with IFTTT"
summary: "This section explains how to configure Qumulo Alerts to work with IFTTT."
permalink: /qumulo-alerts-guide/configuring-integrations/ifttt.html
redirect_from:
  - /qumulo-alerts-guide/installing-configuring/integration-ifttt.html
sidebar: qumulo_alerts_guide_sidebar
---

[IFTTT (If This Then That)](https://ifttt.com/) is a paid, third-party service that provides delivery of messages by using [Webhooks integrations](https://ifttt.com/maker_webhooks) and events. For more information, see the [IFTTT documentation](https://ifttt.com/docs).


## To Integrate IFTTT with Qumulo Alerts
Run the `./alerts ifttt_server_add` command and specify the IFTTT server token, language, and time zone. For example:

```bash
./alerts ifttt_server_add \
  --token abcABde12f3g4567CDE89 \
  --language en_US \
  --timezone "America/Phoenix"
```

{{site.data.alerts.note}}
<ul>
  <li>{{site.qumuloalerts.locale}} {{site.qumuloalerts.consTrans}}</li>
  <li>{{site.qumuloalerts.tz}}</li>
</ul>
{{site.data.alerts.end}}

{{site.exampleOutput}}

```json
[{
  "language": "en_US",
  "timezone": "America/Los_Angeles",
  "token": "abcABde12f3g4567CDE89"
}]
```

## To Test Integration with IFTTT
Run the `./alerts ifttt_server_test` command.

{{site.qumuloalerts.testSuccess}}
