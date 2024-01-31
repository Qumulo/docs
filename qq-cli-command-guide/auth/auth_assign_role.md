---
category: auth
command: auth_assign_role
keywords: qq, qq_cli, auth_assign_role
optional_options:
- alternate:
  - --role
  help: Name of the role to assign
  name: -r
  required: true
- alternate:
  - --trustee
  help: Assign the role to this trustee.  e.g. Everyone, uid:1000, gid:1001, sid:S-1-5-2-3-4,
    or auth_id:500
  name: -t
  required: true
permalink: /qq-cli-command-guide/auth/auth_assign_role.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq auth_assign_role</code> command.
synopsis: Assign a user to a role
title: qq auth_assign_role
usage: qq auth_assign_role [-h] -r ROLE -t TRUSTEE
zendesk_source: qq CLI Command Guide

---