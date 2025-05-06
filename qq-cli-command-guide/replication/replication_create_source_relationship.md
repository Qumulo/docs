---
category: replication
command: replication_create_source_relationship
optional_options:
- alternate: []
  help: File ID of the source directory
  name: --source-id
  required: false
- alternate: []
  help: Path to the source directory
  name: --source-path
  required: false
- alternate: []
  help: Path to the target directory
  name: --target-path
  required: true
- alternate: []
  help: The target IP address
  name: --target-address
  required: true
- alternate: []
  help: Network port to replicate to on the target (overriding default)
  name: --target-port
  required: false
permalink: /qq-cli-command-guide/replication/replication_create_source_relationship.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq replication_create_source_relationship</code>
  command.
synopsis: Create a new replication relationship.
title: qq replication_create_source_relationship
usage: "qq replication_create_source_relationship [-h] (--source-id SOURCE_ID | --source-path\
  \ SOURCE_PATH) --target-path TARGET_PATH --target-address TARGET_ADDRESS [--target-port\
  \ TARGET_PORT] [--enable-replication {true,false}]\n    [--set-source-directory-read-only\
  \ {true,false}] [--map-local-ids-to-nfs-ids {true,false}]"
zendesk_source: qq CLI Command Guide

---