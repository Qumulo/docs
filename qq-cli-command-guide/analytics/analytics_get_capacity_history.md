---
category: analytics
command: analytics_get_capacity_history
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
permalink: /qq-cli-command-guide/analytics/analytics_get_capacity_history.html
positional_options: []
redirect_from:
- /qq-cli-command-guide/capacity/capacity_history_get.html
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq analytics_get_capacity_history</code>
  command.
synopsis: Get capacity history data.
title: qq analytics_get_capacity_history
usage: qq analytics_get_capacity_history [-h] --begin-time BEGIN_TIME [--end-time
  END_TIME] [--interval {hourly,daily,weekly}]
zendesk_source: qq CLI Command Guide

---