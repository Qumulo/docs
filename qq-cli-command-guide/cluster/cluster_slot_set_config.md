---
category: cluster
command: cluster_slot_set_config
optional_options:
- alternate: []
  help: Slot ID
  name: --slot
  required: true
- alternate: []
  help: Turn on the slot's locate LED.
  name: --locate
  required: false
- alternate: []
  help: Turn off the slot's locate LED.
  name: --no-locate
  required: false
permalink: /qq-cli-command-guide/cluster/cluster_slot_set_config.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq cluster_slot_set_config</code>
  command.
synopsis: Set the attributes for the given cluster slot. Currently only led_pattern
  may be set.
title: qq cluster_slot_set_config
usage: qq cluster_slot_set_config [-h] --slot SLOT [--locate | --no-locate]
zendesk_source: qq CLI Command Guide

---