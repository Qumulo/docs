---
category: replication
command: replication_add_blackout_window
keywords: qq, qq_cli, replication_add_blackout_window
optional_options:
- alternate: []
  help: Unique identifier of the source replication relationship.
  name: --id
  required: true
- alternate: []
  help: The 24 hour time of day start time for the blackout window (e.g. 15:30). Time
    is always in the timezone configured on the specified source replication relationship.
  name: --start-time
  required: true
- alternate: []
  help: The 24 hour time of day end time for the blackout window (e.g. 18:30) -- on
    the following day if earlier than the --start-time parameter.
  name: --end-time
  required: true
- alternate: []
  help: Days of the week the window applies to. Comma separated list (e.g. MON,TUE,WED,THU,FRI,SAT,SUN)
    or ALL.
  name: --days-of-week
  required: true
permalink: /qq-cli-command-guide/replication/replication_add_blackout_window.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq replication_add_blackout_window</code>
  command.
synopsis: Add a blackout window to the specified source replication relationship.
title: qq replication_add_blackout_window
usage: qq replication_add_blackout_window [-h] --id ID --start-time START_TIME --end-time
  END_TIME --days-of-week DAYS_OF_WEEK
zendesk_source: qq CLI Command Guide

---