---
category: replication
command: replication_release_queued_snapshot
optional_options:
- alternate: []
  help: Unique identifier of the source replication relationship.
  name: --relationship-id
  required: true
- alternate: []
  help: Unique identifier of the snapshot to release.
  name: --snapshot-id
  required: true
permalink: /qq-cli-command-guide/replication/replication_release_queued_snapshot.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq replication_release_queued_snapshot</code>
  command.
synopsis: Release a snapshot queued for replication from the queue of the specified
  source replication relationship.
title: qq replication_release_queued_snapshot
usage: qq replication_release_queued_snapshot [-h] --relationship-id RELATIONSHIP_ID
  --snapshot-id SNAPSHOT_ID
zendesk_source: qq CLI Command Guide

---