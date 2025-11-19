---
category: portal
command: portal_set_eviction_settings
optional_options:
- alternate:
  - --free-threshold
  help: The threshold of remaining free capacity on a cluster, as a decimal number
    between 0 and 1, that triggers the automated removal of cached data. For example,
    if you set this value to 0.05, the system begins to remove cached data from spoke
    portals when the cluster is 95%% full.
  name: -f
  required: true
permalink: /qq-cli-command-guide/portal/portal_set_eviction_settings.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq portal_set_eviction_settings</code>
  command.
synopsis: Configure the automated removal of cached data
title: qq portal_set_eviction_settings
usage: qq portal_set_eviction_settings [-h] -f FREE_THRESHOLD
zendesk_source: qq CLI Command Guide

---