---
category: upgrade
command: upgrade_cluster
keywords: qq, qq_cli, upgrade_cluster
optional_options:
- alternate: []
  help: FS path to upgrade image
  name: --path
  required: false
- alternate: []
  help: Skip monitoring the upgrade
  name: --no-monitor
  required: false
- alternate: []
  help: Using the --rolling flag lets you specify the number of nodes to reboot at
    a time. The number of nodes must be greater than 0 and less than or equal to the
    number of node failures that your cluster permits. By default, this value is the
    number of permitted node failures minus 1 (1 node minimum).
  name: --num-nodes-to-reboot
  required: false
permalink: /qq-cli-command-guide/upgrade/upgrade_cluster.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq upgrade_cluster</code> command.
synopsis: Run a cluster upgrade to the image specified by the provided path
title: qq upgrade_cluster
usage: qq upgrade_cluster [-h] [--path PATH] [--no-monitor] [--rolling] [--num-nodes-to-reboot
  NO_COMMAND_NUM_NODES_TO_REBOOT] {prepare,commit} ...
zendesk_source: qq CLI Command Guide

---