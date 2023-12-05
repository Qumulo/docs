---
category: fs
command: fs_notify
keywords: qq, qq_cli, fs_notify
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
  help: Listen for changes recursively.
  name: --recursive
  required: false
- alternate: []
  help: Specific notify types to filter to.
  name: --filter
  required: false
- alternate: []
  help: File to receive data
  name: --file
  required: false
- alternate: []
  help: Output results as a json stream.
  name: --json
  required: false
permalink: /qq-cli-command-guide/fs/fs_notify.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_notify</code> command.
synopsis: Notify on changes to files and directories under the specified directory.
  To cancel the listener, send a SIGQUIT signal (press CTRL+D).
title: qq fs_notify
usage: "qq fs_notify [-h] (--path PATH | --id ID) [--recursive]\n    [--filter {child_file_added,child_dir_added,child_file_removed,child_dir_removed,child_file_moved_from,child_file_moved_to,child_dir_moved_from,child_dir_moved_to,child_btime_changed,child_mtime_changed,child_atime_changed,child_size_changed,child_extra_attrs_changed,child_acl_changed,child_owner_changed,child_group_changed,child_data_written,child_stream_added,child_stream_removed,child_stream_moved_from,child_stream_moved_to,child_stream_size_changed,child_stream_data_written,self_removed}\
  \ [{child_file_added,child_dir_added,child_file_removed,child_dir_removed,child_file_moved_from,child_file_moved_to,child_dir_moved_from,child_dir_moved_to,child_btime_changed,child_mtime_changed,child_atime_changed,child_size_changed,child_extra_attrs_changed,child_acl_changed,child_owner_changed,child_group_changed,child_data_written,child_stream_added,child_stream_removed,child_stream_moved_from,child_stream_moved_to,child_stream_size_changed,child_stream_data_written,self_removed}\
  \ ...]]\n    [--file FILE] [--json]"

---