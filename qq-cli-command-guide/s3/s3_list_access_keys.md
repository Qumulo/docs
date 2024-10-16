---
category: s3
command: s3_list_access_keys
optional_options:
- alternate: []
  help: Output JSON instead of table.
  name: --json
  required: false
- alternate: []
  help: Show access keys belonging to a specific user. Use an auth_id, SID, or name
    optionally qualified with a domain prefix (e.g "local:name", "ad:name", "AD\name")
    or an ID type (e.g. "auth_id:513", "SID:S-1-1-0"). Groups are not supported for
    access tokens, must be a user.
  name: --user
  required: false
- alternate: []
  help: List only access keys that target yourself.
  name: --self
  required: false
permalink: /qq-cli-command-guide/s3/s3_list_access_keys.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq s3_list_access_keys</code>
  command.
synopsis: List S3 access keys
title: qq s3_list_access_keys
usage: qq s3_list_access_keys [-h] [--json] [--user USER | --self]
zendesk_source: qq CLI Command Guide

---