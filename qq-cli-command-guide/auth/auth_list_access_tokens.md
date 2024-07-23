---
category: auth
command: auth_list_access_tokens
optional_options:
- alternate: []
  help: Output JSON instead of table.
  name: --json
  required: false
- alternate: []
  help: Show access tokens belonging to a specific user. Use an auth_id, SID, or name
    optionally qualified with a domain prefix (e.g "local:name", "ad:name", "AD\name")
    or an ID type (e.g. "auth_id:513", "SID:S-1-1-0"). Groups are not supported for
    access tokens, must be a user.
  name: --user
  required: false
permalink: /qq-cli-command-guide/auth/auth_list_access_tokens.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq auth_list_access_tokens</code>
  command.
synopsis: List metadata for all access tokens
title: qq auth_list_access_tokens
usage: qq auth_list_access_tokens [-h] [--json] [--user USER]
zendesk_source: qq CLI Command Guide

---