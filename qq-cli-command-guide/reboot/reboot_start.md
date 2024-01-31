---
category: reboot
command: reboot_start
keywords: qq, qq_cli, reboot_start
optional_options:
- alternate: []
  help: Reboot nodes one set at a time, depending on the number of node failures configured
    in the protection system
  name: --rolling
  required: false
- alternate: []
  help: Using the --rolling flag lets you specify the number of nodes to reboot at
    a time. The number of nodes must be greater than 0 and less than or equal to the
    number of node failures that your cluster permits. By default, this value is the
    number of permitted node failures minus 1 (1 node minimum).
  name: --num-nodes
  required: false
- alternate: []
  help: Do not prompt
  name: --force
  required: false
permalink: /qq-cli-command-guide/reboot/reboot_start.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq reboot_start</code> command.
synopsis: Start a cluster-wide reboot
title: qq reboot_start
usage: qq reboot_start [-h] [--rolling] [--num-nodes NUM_NODES_TO_REBOOT] [--force]
zendesk_source: qq CLI Command Guide

---