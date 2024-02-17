---
category: capacity
command: capacity_history_get
optional_options:
- alternate: []
  help: Lower bound on history returned, in epoch seconds.
  name: --begin-time
  required: true
- alternate: []
  help: Upper bound on history returned, in epoch seconds. Defaults to the most recent
    period for which data is available.
  name: --end-time
  required: false
- alternate: []
  help: The interval at which to sample
  name: --interval
  required: false
permalink: /qq-cli-command-guide/capacity/capacity_history_get.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq capacity_history_get</code>
  command.
synopsis: Get capacity history data.
title: qq capacity_history_get
usage: qq capacity_history_get [-h] --begin-time BEGIN_TIME [--end-time END_TIME]
  [--interval {hourly,daily,weekly}]
zendesk_source: qq CLI Command Guide

---