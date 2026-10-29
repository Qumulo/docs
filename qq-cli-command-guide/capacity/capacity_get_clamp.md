---
category: capacity
command: capacity_get_clamp
optional_options: []
permalink: /qq-cli-command-guide/capacity/capacity_get_clamp.html
positional_options: []
redirect_from:
- /qq-cli-command-guide/capacity/capacity_clamp_get.html
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq capacity_get_clamp</code> command.
synopsis: Get the capacity clamp value in bytes, which can be set via PUT API or during
  cluster creation. When the cluster provisions more pstores, it will take this value
  into account. The cluster will not provision new pstores if the usable capacity
  would exceed this value.
title: qq capacity_get_clamp
usage: qq capacity_get_clamp [-h]
zendesk_source: qq CLI Command Guide

---