In Qumulo Core 5.1.0 (and higher), clusters have an optional _inactivity timeout_ that logs users out of the Qumulo Core Web UI if they don't interact with it for a specified amount of time.

{% include note.html content="During the final minute of the timeout period, the **Your Session is About to Expire** dialog box appears. The dialog box shows a countdown and lets the user renew the session or log out immediately. When deciding on the timeout length, take your users' needs into consideration." %}

## To Set the Qumulo Core Web UI Inactivity Timeout
To set an inactivity timeout, use the {% include qq.html command="web_ui_modify_settings" %} command and use the `--inactivity-timeout` flag to specify the timeout in minutes. For example:

```bash
qq web_ui_modify_settings --inactivity-timeout 15
```

## To Clear the Qumulo Core Web UI Inactivity Timeout
To clear an inactivity timeout, use the {% include qq.html command="web_ui_modify_settings" %} command and use the `--disable-inactivity-timeout` flag.

```bash
qq web_ui_modify_settings --disable-inactivity-timeout
```

## To View the Current Web UI Inactivity Timeout
To view the current inactivity timeout, use the {% include qq.html command="web_ui_get_settings" %} command:

```bash
qq web_ui_get_settings
```
