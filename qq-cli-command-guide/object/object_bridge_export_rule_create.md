---
category: object
command: object_bridge_export_rule_create
optional_options:
- alternate: []
  help: Filesystem ID of the bridge.
  name: --fs-id
  required: true
- alternate: []
  help: Bridge-local wildcard pattern matching objects to export.
  name: --pattern
  required: true
- alternate: []
  help: Object access tier to assign to matching objects.
  name: --tier
  required: true
permalink: /qq-cli-command-guide/object/object_bridge_export_rule_create.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq object_bridge_export_rule_create</code>
  command.
synopsis: Test-only. Create an export rule on a bridge filesystem.
title: qq object_bridge_export_rule_create
usage: qq object_bridge_export_rule_create [-h] --fs-id FS_ID --pattern PATTERN --tier
  {HOT,COOL,COLD,INTELLIGENT}
zendesk_source: qq CLI Command Guide

---