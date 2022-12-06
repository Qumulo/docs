---
title: "What Language Locales Qumulo Alerts Supports"
summary: "This section lists the language locales that Qumulo Alerts supports for notifying users through email and SMS."
permalink: /qumulo-alerts-guide/getting-started-qumulo-alerts/language-locales-support.html
sidebar: qumulo_alerts_guide_sidebar
keywords: Qumulo Alerts, user, notification, language, locale
---

## Language Locales
{{site.consTrans}}

| Code    | Description                  |
|---------|------------------------------|
| `de_AT` | German (Austria)             |
| `de_CH` | German (Switzerland)         |
| `de_DE` | German (Germany)             |
| `en_GB` | English (Great Britain)      |
| `en_US` | English (USA)                |
| `es_ES` | Spanish (Spain)              |
| `fr_BE` | French (Belgium)             |
| `fr_CA` | French (Canada)              |
| `fr_CH` | French (Switzerland)         |
| `fr_FR` | French (France)              |
| `hu_HU` | Hungarian (Hungary)          |
| `it_CH` | Italian (Switzerland)        |
| `it_IT` | Italian (Italy)              |
| `ja_JP` | Japanese (Japan)             |
| `ko_KR` | Korean (Korea)               |
| `pl_PL` | Polish (Poland)              |
| `sk_SK` | Slovak (Slovakia)            |
| `tr_TR` | Turkish (Turkey)             |
| `zh_TW` | Traditional Chinese (Taiwan) |

## Converting Time Zones
Each message that the Exchange processes contains a timestamp encoded in UTC time by default. This timestamp must match the recipient's time zone. If you don't define the `default_timezone` in your `*Server.json` files, Qumulo Alerts uses `UTC`.

Each translated message that a user receives includes a time zone in the `Continent/City` format (for example, `America/Phoenix`). For more information, see [List of TZ Database Time Zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones).

{% include note.html content="`UTC` doesn't follow the `Continent/City` format." %}