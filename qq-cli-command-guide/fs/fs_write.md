---
category: fs
command: fs_write
keywords: qq, qq_cli, fs_write
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
  help: Create file before writing. Fails if exists or is used with stream identifiers.
  name: --create
  required: false
- alternate: []
  help: Offset at which to write data. If not specified, the existing contents of
    the file will be replaced with the given contents.
  name: --offset
  required: false
- alternate: []
  help: File data to send
  name: --file
  required: false
- alternate: []
  help: Write file from stdin
  name: --stdin
  required: false
permalink: /qq-cli-command-guide/fs/fs_write.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_write</code> command.
synopsis: Write data to an object
title: qq fs_write
usage: "qq fs_write [-h] (--path PATH | --id ID)\n    [--stream-id STREAM_ID | --stream-name\
  \ STREAM_NAME | --create] [--offset OFFSET]\n    [--file FILE] [--stdin]"

---