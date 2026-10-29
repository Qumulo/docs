---
category: capacity
command: capacity_set_clamp
optional_options:
- alternate: []
  help: The capacity clamp to set as a human readable byte count (e.g. "10TB").
  name: --clamp
  required: false
- alternate: []
  help: Remove the capacity clamp on the cluster.
  name: --disable
  required: false
permalink: /qq-cli-command-guide/capacity/capacity_set_clamp.html
positional_options: []
redirect_from:
- /qq-cli-command-guide/capacity/capacity_clamp_set.html
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq capacity_set_clamp</code> command.
synopsis: Set the capacity clamp value in bytes. This limits the capacity that will
  be provisioned to be no more than the clamp value. A value below the current provisioned
  capacity has no effect. The actual stored value will be a pstore count that produces
  a byte count closest to the requested bytes without going over. If the change is
  applied successfully, quorum will be abandoned and the change will appear in the
  new quorum.
title: qq capacity_set_clamp
usage: qq capacity_set_clamp [-h] (--clamp CLAMP | --disable)
zendesk_source: qq CLI Command Guide

---