---
category: fs
command: fs_punch_hole
keywords: qq, qq_cli, fs_punch_hole
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
  help: Offset in bytes specifying the start of the hole to create
  name: --offset
  required: true
- alternate: []
  help: Size in bytes of the hole to create
  name: --size
  required: true
permalink: /qq-cli-command-guide/fs/fs_punch_hole.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_punch_hole</code> command.
synopsis: "Create a hole in a region of a file. Destroys all data\n        within\
  \ the hole."
title: qq fs_punch_hole
usage: "qq fs_punch_hole [-h] (--path PATH | --id ID) [--stream-id STREAM_ID | --stream-name\
  \ STREAM_NAME]\n    --offset OFFSET --size SIZE"

---