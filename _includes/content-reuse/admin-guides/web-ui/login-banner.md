In Qumulo Core 5.2.1 (and higher), clusters have an optional login banner that users must acknowledge before being they can log in to the Qumulo Core Web UI.

## To Set the Qumulo Core Web UI Login Banner
To set the login banner, use the `web_ui_modify_settings` command. To specify the Markdown file to use for the banner, use the `--login-banner` flag. For example:

```bash
qq web_ui_modify_settings --login-banner my-banner.html
```

## To Clear the Qumulo Core Web UI Login Banner
To clear the login banner, use the `web_ui_modify_settings` command with the `--disable-login-banner` flag.

```bash
qq web_ui_modify_settings --disable-login-banner
```

## To View the Current Web UI Login Banner
To view the current login banner, use the `web_ui_get_settings` command with the `--login-banner` flag.

```bash
qq web_ui_get_settings --login-banner
```

