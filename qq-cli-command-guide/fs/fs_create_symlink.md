---
category: fs
command: fs_create_symlink
keywords: qq, qq_cli, fs_create_symlink
optional_options:
- alternate: []
  help: Parent directory path
  name: --path
  required: false
- alternate: []
  help: Parent directory ID
  name: --id
  required: false
- alternate: []
  help: Link target (relative path recommended)
  name: --target
  required: true
- alternate: []
  help: Symlink target's type. If this is unspecified or FS_FILE_TYPE_UNKNOWN, the
    effect is the same as using 'ln -s' on a Unix NFS client. If this is FS_FILE_TYPE_FILE
    or FS_FILE_TYPE_DIRECTORY, the effect is the same as using 'mklink' or 'mklink
    /D' on a Windows SMB client.
  name: --target-type
  required: false
- alternate: []
  help: New symlink name
  name: --name
  required: true
permalink: /qq-cli-command-guide/fs/fs_create_symlink.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_create_symlink</code> command.
synopsis: Create a new symbolic link
title: qq fs_create_symlink
usage: "qq fs_create_symlink [-h] (--path PATH | --id ID) --target TARGET\n    [--target-type\
  \ {FS_FILE_TYPE_UNKNOWN,FS_FILE_TYPE_FILE,FS_FILE_TYPE_DIRECTORY}]\n    --name NAME"

---