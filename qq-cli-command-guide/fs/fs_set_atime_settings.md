---
category: fs
command: fs_set_atime_settings
keywords: qq, qq_cli, fs_set_atime_settings
optional_options:
- alternate:
  - -e
  help: Enable access time (atime) updates.
  name: --enable
  required: false
- alternate:
  - -d
  help: Disable access time (atime) updates.
  name: --disable
  required: false
- alternate:
  - -g
  help: Specify granularity for access time (atime) updates.
  name: --granularity
  required: false
permalink: /qq-cli-command-guide/fs/fs_set_atime_settings.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_set_atime_settings</code>
  command.
synopsis: Set access time (atime) settings.
title: qq fs_set_atime_settings
usage: qq fs_set_atime_settings [-h] [--enable | --disable] [--granularity {HOUR,DAY,WEEK}]

---