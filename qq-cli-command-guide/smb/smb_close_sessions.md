---
category: smb
command: smb_close_sessions
keywords: qq, qq_cli, smb_close_sessions
optional_options:
- alternate: []
  help: "\n                Close only the sessions that match the specified user's\
    \ identity in one of the\n                following forms: a name or a SID optionally\
    \ qualified with a domain prefix (for\n                example, \"local:name\"\
    , \"S-1-1-0\", \"name\", \"world:Everyone\", \"ldap_user:name\",\n           \
    \     \"ad:name\"), or an ID type (for example, \"uid:1001\", \"auth_id:513\"\
    , \"SID:S-1-1-0\").\n                "
  name: --identity
  required: false
- alternate: []
  help: "\n                Use the list of sessions from the smb_list_sessions command\
    \ to close only the\n                session with the specified location.\n  \
    \              "
  name: --location
  required: false
- alternate: []
  help: Close only the sessions that originate from the specified IP address.
  name: --ip
  required: false
permalink: /qq-cli-command-guide/smb/smb_close_sessions.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq smb_close_sessions</code> command.
synopsis: Force close SMB sessions matching one or more of a set of filters.
title: qq smb_close_sessions
usage: qq smb_close_sessions [-h] [--identity IDENTITY] [--location LOCATION] [--ip
  IP]
zendesk_source: qq CLI Command Guide

---