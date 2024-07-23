---
category: s3
command: s3_create_access_key
optional_options:
- alternate: []
  help: The auth_id of the Qumulo Core user
  name: --auth-id
  required: false
permalink: /qq-cli-command-guide/s3/s3_create_access_key.html
positional_options:
- help: An auth_id, SID, or a name optionally qualified by a domain prefix (for example,
    "local:name", "ad:name", "AD\name") or an ID type (for example, "auth_id:513",
    "SID:{{site.everyoneGroupSID}}"). Qumulo Core supports only users (not groups) for S3 access keys.
  name: identifier
  required: true
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq s3_create_access_key</code>
  command.
synopsis: Create S3 access key
title: qq s3_create_access_key
usage: qq s3_create_access_key [-h] [--auth-id AUTH_ID] [identifier]
zendesk_source: qq CLI Command Guide

---