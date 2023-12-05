---
category: upgrade
command: upgrade_cluster
keywords: qq, qq_cli, upgrade_cluster
optional_options:
- alternate: []
  help: FS path to upgrade image
  name: --path
  required: false
- alternate: []
  help: Skip monitoring the upgrade
  name: --no-monitor
  required: false
permalink: /qq-cli-command-guide/upgrade/upgrade_cluster.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq upgrade_cluster</code> command.
synopsis: Run a cluster upgrade to the image specified by the provided path
title: qq upgrade_cluster
usage: qq upgrade_cluster [-h] [--path PATH] [--no-monitor] [--rolling] {prepare,commit}
  ...

---