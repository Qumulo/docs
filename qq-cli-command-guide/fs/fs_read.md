---
category: fs
command: fs_read
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
  help: Snapshot ID to read from
  name: --snapshot
  required: false
- alternate: []
  help: Offset at which to read data. If not specified, read from the beginning of
    the file.
  name: --offset
  required: false
- alternate: []
  help: Amount of data to read. If not specified, read the entire file.
  name: --length
  required: false
- alternate: []
  help: File to receive data
  name: --file
  required: false
- alternate: []
  help: Overwrite an existing file
  name: --force
  required: false
- alternate: []
  help: Output data to standard out
  name: --stdout
  required: false
permalink: /qq-cli-command-guide/fs/fs_read.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_read</code> command.
synopsis: Read an object
title: qq fs_read
usage: qq fs_read [-h] (--path PATH | --id ID) [--stream-id STREAM_ID | --stream-name
  STREAM_NAME] [--snapshot SNAPSHOT] [--offset OFFSET] [--length LENGTH] [--file FILE]
  [--force] [--stdout]
zendesk_source: qq CLI Command Guide

---