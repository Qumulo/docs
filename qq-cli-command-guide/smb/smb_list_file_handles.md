---
category: smb
command: smb_list_file_handles
keywords: qq, qq_cli, smb_list_file_handles
optional_options:
- alternate: []
  help: Max files to return per request.
  name: --page-size
  required: false
- alternate: []
  help: "\n                Limits results to the specified file, as returned from\
    \ a command like\n                fs_file_get_attr or fs_read_dir.\n         \
    \       "
  name: --file-number
  required: false
- alternate:
  - --resolve-paths
  help: Returns the primary path of the opened file.
  name: -p
  required: false
- alternate: []
  help: Path to file
  name: --path
  required: false
permalink: /qq-cli-command-guide/smb/smb_list_file_handles.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq smb_list_file_handles</code>
  command.
synopsis: List SMB open file handles
title: qq smb_list_file_handles
usage: qq smb_list_file_handles [-h] [--page-size PAGE_SIZE] [--file-number FILE_NUMBER]
  [-p] [--path PATH]

---