---
category: object
command: object_portal_refresh
optional_options:
- alternate: []
  help: The bucket URI as the bridge's configuration shows it. Returns an error if
    no bridge serves that bucket.
  name: --bucket-uri
  required: true
- alternate: []
  help: The object's name in the bucket. For a directory, give the name with its trailing
    delimiter, such as projects/2025/.
  name: --key
  required: true
- alternate: []
  help: MERGE (the default) keeps attributes changed on the cluster. OVERWRITE replaces
    every attribute the object carries, which can't be undone.
  name: --mode
  required: false
permalink: /qq-cli-command-guide/object/object_portal_refresh.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq object_portal_refresh</code>
  command.
synopsis: Update a bridge's file or directory for one object now, rather than when
  the bucket's change notification arrives. Use it when a file on a bridge doesn't
  match its object. If the object no longer exists, the file is deleted, or the directory
  removed along with any parent directories left empty.
title: qq object_portal_refresh
usage: qq object_portal_refresh [-h] --bucket-uri BUCKET_URI --key KEY [--mode {MERGE,OVERWRITE}]
zendesk_source: qq CLI Command Guide

---