---
category: fs
command: fs_acl_explain_rights
optional_options:
- alternate: []
  help: File or directory path
  name: --path
  required: false
- alternate: []
  help: File or directory ID
  name: --id
  required: false
- alternate:
  - --user
  help: User for whom to explain rights. e.g. Alice, uid:1000, sid:{{site.exampleShortSID3}}, or
    auth_id:500.  If multiple are given, they will be considered equivalent for the
    purpose of the explanation.
  name: -u
  required: true
- alternate:
  - --groups
  help: Groups that the user should be considered a member of for the purpose of the
    explanation.
  name: -g
  required: false
- alternate: []
  help: Don't expand the given user and group IDs. This can be useful if you want
    to test a hypothetical (e.g 'what happens if I add/remove a user to some group?')
  name: --no-expand
  required: false
- alternate:
  - --verbose
  help: Prints the credential that will be used for the explanation, after it has
    been expanded.
  name: -v
  required: false
- alternate: []
  help: Print JSON representation of rights explanation.
  name: --json
  required: false
permalink: /qq-cli-command-guide/fs/fs_acl_explain_rights.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_acl_explain_rights</code>
  command.
synopsis: Explain how rights are granted to a user for a file.
title: qq fs_acl_explain_rights
usage: qq fs_acl_explain_rights [-h] (--path PATH | --id ID) -u ID [ID ...] [-g [ID
  [ID ...]]] [--no-expand] [-v] [--json]
zendesk_source: qq CLI Command Guide

---
