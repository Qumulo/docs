---
title: "Setting the Web UI Inactivity Timeout"
summary: "This section explains how to set an inactivity timeout for the Qumulo Core Web UI."
permalink: /administrator-guide/web-ui/inactivity-timeout.html
redirect_from:
  - /web-ui-inactivity-timeout.html
  - /administrator-guide/web-ui-inactivity-timeout.html
  - /administrator-guide/qumulo-core/web-ui-inactivity-timeout.html
sidebar: administrator_guide_sidebar
keywords: inactivity, idle, timeout, Web_UI, Qumulo_Core
---

In Qumulo Core 5.1.0 (and higher), clusters have an optional _inactivity timeout_ that logs users out of the Web UI if they don't interact with it for a specified amount of time.

{% include note.html content="During the final minute of the timeout period, the **Your Session is About to Expire** dialog box appears. The dialog box shows a countdown and lets the user renew the session or log out immediately. When deciding on the timeout length, take your users' needs into consideration." %}

## To Set the Web UI Inactivity Timeout
To set an inactivity timeout, use the `web_ui_modify_settings` command. Specify the timeout in minutes by using the `--inactivity-timeout` flag. For example:

```bash
qq web_ui_modify_settings --inactivity-timeout 15
```

## To Clear the Web UI Inactivity Timeout
To clear an inactivity timeout, use the `web_ui_modify_settings` command with the `--disable-inactivity-timeout` flag.

```bash
qq web_ui_modify_settings --disable-inactivity-timeout
```

## To View the Current Web UI Inactivity Timeout
To view the current inactivity timeout, use the `web_ui_get_settings` command:

```bash
qq web_ui_get_settings
```
