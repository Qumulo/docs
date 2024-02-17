---
category: fs
command: fs_file_samples
optional_options:
- alternate: []
  help: Query root path
  name: --path
  required: false
- alternate: []
  help: Query root ID
  name: --id
  required: false
- alternate: []
  help: 'Weight the sampling by the value specified: capacity (total bytes used for
    data and metadata), data (total bytes used for data only), file (file count),
    named_streams (named stream count)'
  name: --sample-by
  required: false
permalink: /qq-cli-command-guide/fs/fs_file_samples.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_file_samples</code> command.
synopsis: Get a number of sample files from the file system
title: qq fs_file_samples
usage: qq fs_file_samples [-h] (--path PATH | --id ID) --count COUNT [--sample-by
  {capacity,data,file,named_streams}]
zendesk_source: qq CLI Command Guide

---