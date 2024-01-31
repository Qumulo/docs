---
category: smb
command: smb_list_sessions
keywords: qq, qq_cli, smb_list_sessions
optional_options:
- alternate: []
  help: Max sessions to return per request
  name: --page-size
  required: false
- alternate: []
  help: "\n                List only the sessions that match the specified user's\
    \ identity in one of the\n                following forms: a name or a SID optionally\
    \ qualified with a domain prefix (for\n                example, \"local:name\"\
    , \"S-1-1-0\", \"name\", \"world:Everyone\", \"ldap_user:name\",\n           \
    \     \"ad:name\"), or an ID type (for example, \"uid:1001\", \"auth_id:513\"\
    , \"SID:S-1-1-0\").\n                "
  name: --identity
  required: false
permalink: /qq-cli-command-guide/smb/smb_list_sessions.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq smb_list_sessions</code> command.
synopsis: List SMB open sessions
title: qq smb_list_sessions
usage: qq smb_list_sessions [-h] [--page-size PAGE_SIZE] [--identity IDENTITY]
zendesk_source: qq CLI Command Guide

---