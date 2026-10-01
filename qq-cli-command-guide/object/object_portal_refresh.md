---
category: object
command: object_portal_refresh
optional_options:
- alternate: []
  help: Bucket URI as it appears in the bridge's configuration. The value must match
    a configured bucket URI exactly. The server answers 200 and discards the call
    otherwise.
  name: --bucket-uri
  required: true
- alternate: []
  help: Object key within the bucket. A directory is named by its marker key, including
    the trailing delimiter.
  name: --key
  required: true
- alternate: []
  help: MERGE (the default) leaves locally changed attributes alone. OVERWRITE discards
    them for every attribute the object carries and cannot be undone.
  name: --mode
  required: false
permalink: /qq-cli-command-guide/object/object_portal_refresh.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq object_portal_refresh</code>
  command.
synopsis: Converge one object key against its bucket now, without waiting for an event.
  An object no longer in the bucket has its local file deleted, or its directory marker
  dropped along with a chain of empty parent directories.
title: qq object_portal_refresh
usage: qq object_portal_refresh [-h] --bucket-uri BUCKET_URI --key KEY [--mode {MERGE,OVERWRITE}]
zendesk_source: qq CLI Command Guide

---