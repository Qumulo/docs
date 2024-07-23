---
category: auth
command: auth_create_access_token
optional_options:
- alternate: []
  help: The expiration time of the access token. After this time, the token will no
    longer be usable for authentication. For example, "Jan 20 2024", "1/20/2024",
    or "2024-01-20 12:00", with times interpreted in UTC timezone.
  name: --expiration-time
  required: false
- alternate:
  - -f
  help: File to store the access token credential. That file can be passed to the
    --credentials-store argument to authenticate using the created access token.
  name: --file
  required: false
permalink: /qq-cli-command-guide/auth/auth_create_access_token.html
positional_options:
- help: An auth_id, SID, or name optionally qualified with a domain prefix (e.g "local:name",
    "ad:name", "AD\name") or an ID type (e.g. "auth_id:513", "SID:S-1-1-0"). Groups
    are not supported for access tokens, must be a user.
  name: identifier
  required: true
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq auth_create_access_token</code>
  command.
synopsis: Create a long-lived access token
title: qq auth_create_access_token
usage: qq auth_create_access_token [-h] [--expiration-time EXPIRATION_TIME] [--file
  PATH] identifier
zendesk_source: qq CLI Command Guide

---