---
category: fs
command: fs_file_set_smb_attrs
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
  help: Set ARCHIVE to a boolean-like value (e.g. true, false, yes, no, 1, 0).
  name: --archive
  required: false
- alternate: []
  help: Set COMPRESSED to a boolean-like value (e.g. true, false, yes, no, 1, 0).
  name: --compressed
  required: false
- alternate: []
  help: Set HIDDEN to a boolean-like value (e.g. true, false, yes, no, 1, 0).
  name: --hidden
  required: false
- alternate: []
  help: Set NOT_CONTENT_INDEXED to a boolean-like value (e.g. true, false, yes, no,
    1, 0).
  name: --not-content-indexed
  required: false
- alternate: []
  help: Set READ_ONLY to a boolean-like value (e.g. true, false, yes, no, 1, 0).
  name: --read-only
  required: false
- alternate: []
  help: Set SYSTEM to a boolean-like value (e.g. true, false, yes, no, 1, 0).
  name: --system
  required: false
- alternate: []
  help: Set TEMPORARY to a boolean-like value (e.g. true, false, yes, no, 1, 0).
  name: --temporary
  required: false
- alternate: []
  help: Set OFFLINE to a boolean-like value (e.g. true, false, yes, no, 1, 0).
  name: --offline
  required: false
permalink: /qq-cli-command-guide/fs/fs_file_set_smb_attrs.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_file_set_smb_attrs</code>
  command.
synopsis: Change SMB extended attributes on the file
title: qq fs_file_set_smb_attrs
usage: qq fs_file_set_smb_attrs [-h] (--path PATH | --id ID) [--archive BOOL] [--compressed
  BOOL] [--hidden BOOL] [--not-content-indexed BOOL] [--read-only BOOL] [--system
  BOOL] [--temporary BOOL] [--offline BOOL]
zendesk_source: qq CLI Command Guide

---