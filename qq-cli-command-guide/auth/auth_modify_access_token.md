---
category: auth
command: auth_modify_access_token
optional_options:
- alternate: []
  help: The expiration time of the access token. After this time, the token will no
    longer be usable for authentication. For example, "Jan 20 2024", "1/20/2024",
    or "2024-01-20 12:00", with times interpreted in UTC timezone.
  name: --expiration-time
  required: false
- alternate:
  - -e
  help: Enable the access token.
  name: --enable
  required: false
- alternate:
  - -d
  help: Disable the access token. It can no longer be used to authenticate until it
    is enabled.
  name: --disable
  required: false
permalink: /qq-cli-command-guide/auth/auth_modify_access_token.html
positional_options:
- help: The unique ID of the access token to be modified.
  name: id
  required: true
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq auth_modify_access_token</code>
  command.
synopsis: Modify the specified access token
title: qq auth_modify_access_token
usage: qq auth_modify_access_token [-h] [--expiration-time EXPIRATION_TIME] [--enable]
  [--disable] id
zendesk_source: qq CLI Command Guide

---