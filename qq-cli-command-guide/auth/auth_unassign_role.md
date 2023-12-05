---
category: auth
command: auth_unassign_role
keywords: qq, qq_cli, auth_unassign_role
optional_options:
- alternate:
  - --role
  help: Name of the role to unassign
  name: -r
  required: true
- alternate:
  - --trustee
  help: Unassign the role from this trustee.  e.g. Everyone, uid:1000, gid:1001, sid:S-1-5-2-3-4,
    or auth_id:500
  name: -t
  required: true
permalink: /qq-cli-command-guide/auth/auth_unassign_role.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq auth_unassign_role</code> command.
synopsis: Unassign a user from a role
title: qq auth_unassign_role
usage: qq auth_unassign_role [-h] -r ROLE -t TRUSTEE

---