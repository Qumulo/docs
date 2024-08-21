---
category: replication
command: replication_modify_source_relationship
optional_options:
- alternate: []
  help: Unique identifier of the source replication relationship
  name: --id
  required: true
- alternate: []
  help: The target IP address
  name: --new-target-address
  required: false
- alternate: []
  help: Network port to replicate to on the target
  name: --new-target-port
  required: false
- alternate:
  - --timezone
  help: The timezone for the relationship's blackout windows (e.g. America/Los_Angeles
    or UTC). See the time_list_timezones qq command for a complete list of supported
    timezones.
  name: -z
  required: false
permalink: /qq-cli-command-guide/replication/replication_modify_source_relationship.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq replication_modify_source_relationship</code>
  command.
synopsis: Modify an existing source replication relationship.
title: qq replication_modify_source_relationship
usage: "qq replication_modify_source_relationship [-h] --id ID [--new-target-address\
  \ NEW_TARGET_ADDRESS] [--new-target-port NEW_TARGET_PORT] [-z TIMEZONE] [--enable-replication\
  \ {true,false}] [--set-source-directory-read-only {true,false}]\n    [--map-local-ids-to-nfs-ids\
  \ {true,false}]"
zendesk_source: qq CLI Command Guide

---