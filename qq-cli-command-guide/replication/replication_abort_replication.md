---
category: replication
command: replication_abort_replication
keywords: qq, qq_cli, replication_abort_replication
optional_options:
- alternate: []
  help: Unique identifier of the source replication relationship
  name: --id
  required: true
- alternate: []
  help: 'If set to true and the currently replicating snapshot was created by a policy,
    the next replication job will use the next queued snapshot instead of retrying
    the current one (default: false).'
  name: --skip-active-policy-snapshot
  required: false
permalink: /qq-cli-command-guide/replication/replication_abort_replication.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq replication_abort_replication</code>
  command.
synopsis: Abort ongoing replication work for the specified source replication relationship.
title: qq replication_abort_replication
usage: qq replication_abort_replication [-h] --id ID [--skip-active-policy-snapshot
  {true,false}]
zendesk_source: qq CLI Command Guide

---