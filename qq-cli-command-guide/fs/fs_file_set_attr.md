---
category: fs
command: fs_file_set_attr
optional_options:
- alternate: []
  help: File path
  name: --path
  required: false
- alternate: []
  help: File ID
  name: --id
  required: false
- alternate: []
  help: Stream ID
  name: --stream-id
  required: false
- alternate: []
  help: Stream name
  name: --stream-name
  required: false
- alternate: []
  help: Posix-style file mode (octal)
  name: --mode
  required: false
- alternate: []
  help: File size
  name: --size
  required: false
- alternate: []
  help: File creation time (as RFC 3339 string)
  name: --creation-time
  required: false
- alternate: []
  help: File access time (as RFC 3339 string)
  name: --access-time
  required: false
- alternate: []
  help: File modification time (as RFC 3339 string)
  name: --modification-time
  required: false
- alternate: []
  help: File change time (as RFC 3339 string)
  name: --change-time
  required: false
- alternate: []
  help: File owner as auth_id
  name: --owner
  required: false
- alternate: []
  help: File owner as local user name
  name: --owner-local
  required: false
- alternate: []
  help: File owner as SID
  name: --owner-sid
  required: false
- alternate: []
  help: File owner as NFS UID
  name: --owner-uid
  required: false
- alternate: []
  help: File group as auth_id
  name: --group
  required: false
- alternate: []
  help: File group as local group name
  name: --group-local
  required: false
- alternate: []
  help: File group as SID
  name: --group-sid
  required: false
- alternate: []
  help: File group as NFS GID
  name: --group-gid
  required: false
permalink: /qq-cli-command-guide/fs/fs_file_set_attr.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_file_set_attr</code> command.
synopsis: Set file attributes
title: qq fs_file_set_attr
usage: "qq fs_file_set_attr [-h] (--path PATH | --id ID) [--stream-id STREAM_ID |\
  \ --stream-name STREAM_NAME] [--mode MODE] [--size SIZE] [--creation-time CREATION_TIME]\
  \ [--access-time ACCESS_TIME] [--modification-time MODIFICATION_TIME]\n    [--change-time\
  \ CHANGE_TIME] [--owner OWNER | --owner-local OWNER_LOCAL | --owner-sid OWNER_SID\
  \ | --owner-uid OWNER_UID] [--group GROUP | --group-local GROUP_LOCAL | --group-sid\
  \ GROUP_SID | --group-gid GROUP_GID]"
zendesk_source: qq CLI Command Guide

---