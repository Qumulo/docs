---
category: tree
command: tree_delete_create
optional_options:
- alternate:
  - -f
  help: Bypass path confirmation. WARNING! Tree delete can be canceled with tree_delete_cancel,
    but already deleted items cannot be recovered.
  name: --force
  required: false
permalink: /qq-cli-command-guide/tree/tree_delete_create.html
positional_options:
- help: Directory id or path
  name: directory
  required: true
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq tree_delete_create</code> command.
synopsis: Create delete job
title: qq tree_delete_create
usage: qq tree_delete_create [-h] [--force] directory
zendesk_source: qq CLI Command Guide

---