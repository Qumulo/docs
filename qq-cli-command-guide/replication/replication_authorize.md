---
category: replication
command: replication_authorize
optional_options:
- alternate: []
  help: Unique identifier of the target replication relationship
  name: --id
  required: true
- alternate: []
  help: Allow the replication relationship to be authorized on a target directory
    containing existing data. Existing data in the target directory may be deleted
    or overwritten. If you wish to preserve this data, consider taking a snapshot
    before authorizing.
  name: --allow-non-empty-directory
  required: false
- alternate: []
  help: Allow the target directory to be created with inherited permissions if it
    does not already exist
  name: --allow-fs-path-create
  required: false
permalink: /qq-cli-command-guide/replication/replication_authorize.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq replication_authorize</code>
  command.
synopsis: Authorize the specified replication relationship, establishing this cluster
  as the target of replication.
title: qq replication_authorize
usage: qq replication_authorize [-h] --id ID [--allow-non-empty-directory] [--allow-fs-path-create]
zendesk_source: qq CLI Command Guide

---