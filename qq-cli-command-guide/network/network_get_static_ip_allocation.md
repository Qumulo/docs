---
category: network
command: network_get_static_ip_allocation
optional_options:
- alternate: []
  help: Specify ip range list to try (e.g. '1.1.1.10-12,10.20.5.0/24'
  name: --try-ranges
  required: false
- alternate: []
  help: Specify netmask to apply when using --try-range option
  name: --try-netmask
  required: false
- alternate: []
  help: Specify floating ip range list to try (e.g. '1.1.1.10-12,10.20.5.0/24'
  name: --try-floating-ranges
  required: false
permalink: /qq-cli-command-guide/network/network_get_static_ip_allocation.html
positional_options: []
redirect_from:
- /qq-cli-command-guide/static/static_ip_allocation.html
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq network_get_static_ip_allocation</code>
  command.
synopsis: Get cluster-wide static IP allocation
title: qq network_get_static_ip_allocation
usage: qq network_get_static_ip_allocation [-h] [--try-ranges TRY_RANGES] [--try-netmask
  TRY_NETMASK] [--try-floating-ranges TRY_FLOATING_RANGES]
zendesk_source: qq CLI Command Guide

---