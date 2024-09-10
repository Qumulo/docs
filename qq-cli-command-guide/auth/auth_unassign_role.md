---
category: auth
command: auth_unassign_role
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
zendesk_source: qq CLI Command Guide

---
For more information, see {{site.xref.adminOnPrem.manageRBAC}}.

## Examples

### To Remove a Trustee from an Existing Qumulo Core Role
Run the `qq auth_unassign_role` command and specify the role and trustee. For example:

```bash
qq auth_unassign_role \
  --role observers \
  --trustee uid:2000
```
