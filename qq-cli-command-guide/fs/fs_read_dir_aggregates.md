---
category: fs
command: fs_read_dir_aggregates
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
  help: Fetch recursive aggregates
  name: --recursive
  required: false
- alternate: []
  help: Maximum number of entries to return
  name: --max-entries
  required: false
- alternate: []
  help: Maximum depth to recurse when --recursive is set
  name: --max-depth
  required: false
- alternate: []
  help: Specify field used for top N selection and sorting
  name: --order-by
  required: false
- alternate: []
  help: Snapshot ID to read from
  name: --snapshot
  required: false
permalink: /qq-cli-command-guide/fs/fs_read_dir_aggregates.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_read_dir_aggregates</code>
  command.
synopsis: Read directory aggregation entries
title: qq fs_read_dir_aggregates
usage: "qq fs_read_dir_aggregates [-h] (--path PATH | --id ID) [--recursive] [--max-entries\
  \ MAX_ENTRIES] [--max-depth MAX_DEPTH]\n    [--order-by {total_blocks,total_datablocks,total_named_stream_datablocks,total_metablocks,total_files,total_directories,total_symlinks,total_other,total_named_streams}]\
  \ [--snapshot SNAPSHOT]"
zendesk_source: qq CLI Command Guide

---