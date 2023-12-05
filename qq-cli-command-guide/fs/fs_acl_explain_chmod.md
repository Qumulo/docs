---
category: fs
command: fs_acl_explain_chmod
keywords: qq, qq_cli, fs_acl_explain_chmod
optional_options:
- alternate: []
  help: File or directory path
  name: --path
  required: false
- alternate: []
  help: File or directory ID
  name: --id
  required: false
- alternate: []
  help: POSIX mode to hypothetically apply (e.g., 0744, rwxr--r--)
  name: --mode
  required: true
- alternate:
  - --verbose
  help: Print more information in output
  name: -v
  required: false
- alternate: []
  help: Print JSON representation of POSIX mode derivation
  name: --json
  required: false
permalink: /qq-cli-command-guide/fs/fs_acl_explain_chmod.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_acl_explain_chmod</code>
  command.
synopsis: Explain how setting a POSIX mode would affect a file's ACL
title: qq fs_acl_explain_chmod
usage: qq fs_acl_explain_chmod [-h] (--path PATH | --id ID) --mode MODE [-v] [--json]

---