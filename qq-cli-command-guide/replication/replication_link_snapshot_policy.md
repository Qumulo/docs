---
category: replication
command: replication_link_snapshot_policy
keywords: qq, qq_cli, replication_link_snapshot_policy
optional_options:
- alternate: []
  help: Unique identifier of the source replication relationship.
  name: --relationship-id
  required: true
- alternate: []
  help: Identifier of the snapshot policy to link.
  name: --snapshot-policy-id
  required: true
- alternate:
  - --target-expiration
  help: 'Duration after which to expire snapshots on the target cluster that were
    replicated from this snapshot policy, in format <quantity><units>, where <quantity>
    is a positive integer less than 100 and <units> is one of [months, weeks, days,
    hours, minutes], e.g. 5days or 1hours. ''never'' indicates snapshots should never
    expire and ''same_as_policy'' indicates snapshots should expire at the same time
    as the snapshot policy specifies. (default: same_as_policy)'
  name: -t
  required: false
permalink: /qq-cli-command-guide/replication/replication_link_snapshot_policy.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq replication_link_snapshot_policy</code>
  command.
synopsis: Link a snapshot policy to a source replication relationship.
title: qq replication_link_snapshot_policy
usage: qq replication_link_snapshot_policy [-h] --relationship-id RELATIONSHIP_ID
  --snapshot-policy-id SNAPSHOT_POLICY_ID [-t TARGET_EXPIRATION]
zendesk_source: qq CLI Command Guide

---