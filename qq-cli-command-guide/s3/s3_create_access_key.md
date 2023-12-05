---
category: s3
command: s3_create_access_key
keywords: qq, qq_cli, s3_create_access_key
optional_options:
- alternate: []
  help: Auth ID of the qumulo user
  name: --auth-id
  required: false
permalink: /qq-cli-command-guide/s3/s3_create_access_key.html
positional_options:
- help: An auth_id, SID, or name optionally qualified with a domain prefix (e.g "local:name",
    "ad:name", "AD\name") or an ID type (e.g. "auth_id:513", "SID:S-1-1-0"). Groups
    are not supported for access keys, must be a user.
  name: identifier
  required: true
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq s3_create_access_key</code>
  command.
synopsis: Create S3 access key
title: qq s3_create_access_key
usage: qq s3_create_access_key [-h] [--auth-id AUTH_ID] [identifier]

---