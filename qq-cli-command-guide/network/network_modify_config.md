---
category: network
command: network_modify_config
optional_options:
- alternate: []
  help: Validate a new cluster-wide network config without writing it to disk.
  name: --dry-run
  required: false
- alternate: []
  help: The path to the JSON file that contains your new cluster-wide network config.
  name: --file
  required: false
- alternate: []
  help: Open the current cluster-wide network config in your default editor. After
    saving and closing your editor, the modified config will be validated.
  name: --modify
  required: false
- alternate: []
  help: Print out the templates for configuring the API endpoint.
  name: --templates
  required: false
permalink: /qq-cli-command-guide/network/network_modify_config.html
positional_options: []
redirect_from:
- /qq-cli-command-guide/network/network_put_config.html
- /qq-cli-command-guide/network/network_v3_put_config.html
- /qq-cli-command-guide/network/network_preview_put_config.html
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq network_modify_config</code>
  command.
synopsis: Validate or overwrite the cluster-wide network configuration.
title: qq network_modify_config
usage: qq network_modify_config [-h] [--dry-run] (--file FILE | --modify | --templates)
zendesk_source: qq CLI Command Guide

---