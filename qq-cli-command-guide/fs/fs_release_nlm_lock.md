---
category: fs
command: fs_release_nlm_lock
keywords: qq, qq_cli, fs_release_nlm_lock
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
  help: NLM byte-range lock offset
  name: --offset
  required: true
- alternate: []
  help: NLM byte-range lock size
  name: --size
  required: true
- alternate: []
  help: Owner id
  name: --owner-id
  required: true
- alternate: []
  help: This command can cause corruption, add this flag to release lock
  name: --force
  required: false
- alternate: []
  help: Snapshot ID of the specified file
  name: --snapshot
  required: false
permalink: /qq-cli-command-guide/fs/fs_release_nlm_lock.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_release_nlm_lock</code>
  command.
synopsis: "Release an arbitrary NLM byte-range lock range. This is\n    dangerous,\
  \ and should only be used after confirming that the owning process\n    has leaked\
  \ the lock, and only if there is a very good reason why the\n    situation should\
  \ not be resolved by terminating that process."
title: qq fs_release_nlm_lock
usage: qq fs_release_nlm_lock [-h] (--path PATH | --id ID) --offset OFFSET --size
  SIZE --owner-id OWNER_ID [--force] [--snapshot SNAPSHOT]
zendesk_source: qq CLI Command Guide

---