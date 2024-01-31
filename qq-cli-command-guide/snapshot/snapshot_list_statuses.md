---
category: snapshot
command: snapshot_list_statuses
keywords: qq, qq_cli, snapshot_list_statuses
optional_options:
- alternate: []
  help: Exclude all snapshots in process of being deleted from the list. You can use
    this flag together with the --exclude-locked or --only-locked flag.
  name: --exclude-in-delete
  required: false
- alternate: []
  help: Display only snapshots in process of being deleted. You can use this flag
    together with the  --exclude-locked or --only-locked flag.
  name: --only-in-delete
  required: false
- alternate: []
  help: Exclude all locked snapshots from the list. You can use this flag together
    with the  --exclude-in-delete or --only-in-delete flag.
  name: --exclude-locked
  required: false
- alternate: []
  help: List only locked snapshots. You can use this flag together with the --exclude-in-delete
    or --only-in-delete flag.
  name: --only-locked
  required: false
permalink: /qq-cli-command-guide/snapshot/snapshot_list_statuses.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq snapshot_list_statuses</code>
  command.
synopsis: List the information for every snapshot.
title: qq snapshot_list_statuses
usage: qq snapshot_list_statuses [-h] [--exclude-in-delete | --only-in-delete] [--exclude-locked
  | --only-locked]
zendesk_source: qq CLI Command Guide

---