---
category: auth
command: auth_list_privileges
optional_options:
- alternate:
  - --role
  help: List privileges associated with a role.
  name: -r
  required: false
- alternate:
  - --verbose
  help: Show granted and denied privileges with --role.
  name: -v
  required: false
- alternate: []
  help: Print JSON representation of the privileges.
  name: --json
  required: false
permalink: /qq-cli-command-guide/auth/auth_list_privileges.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq auth_list_privileges</code>
  command.
synopsis: List all privileges or privileges associated with a role.
title: qq auth_list_privileges
usage: qq auth_list_privileges [-h] [-r ROLE] [-v] [--json]
zendesk_source: qq CLI Command Guide

---