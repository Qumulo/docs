---
category: fs
command: fs_read_dir
keywords: qq, qq_cli, fs_read_dir
optional_options:
- alternate: []
  help: Directory path
  name: --path
  required: false
- alternate: []
  help: Directory ID
  name: --id
  required: false
- alternate: []
  help: REST API pagination size to use. This affects the number of API calls made,
    and the structure of the resulting JSON output, but does not affect what entries
    are returned. Note that the system may impose an upper limit on the page size.
  name: --page-size
  required: false
- alternate: []
  help: Snapshot ID to read from
  name: --snapshot
  required: false
- alternate: []
  help: SMB style match pattern.
  name: --smb-pattern
  required: false
permalink: /qq-cli-command-guide/fs/fs_read_dir.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_read_dir</code> command.
synopsis: Read directory
title: qq fs_read_dir
usage: "qq fs_read_dir [-h] (--path PATH | --id ID) [--page-size PAGE_SIZE] [--snapshot\
  \ SNAPSHOT]\n    [--smb-pattern SMB_PATTERN]"

---