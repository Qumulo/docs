---
category: audit
command: audit_set_syslog_config
keywords: qq, qq_cli, audit_set_syslog_config
optional_options:
- alternate:
  - -e
  help: Enable audit log.
  name: --enable
  required: false
- alternate:
  - -d
  help: Disable audit log.
  name: --disable
  required: false
- alternate: []
  help: Output audit log as CSV.
  name: --csv
  required: false
- alternate: []
  help: Output audit log as JSON.
  name: --json
  required: false
- alternate: []
  help: Enable per-node local audit log.
  name: --local-enable
  required: false
- alternate: []
  help: Disable per-node local audit log.
  name: --local-disable
  required: false
- alternate:
  - -s
  help: The IP address, hostname, or fully qualified domain name of your remote syslog
    server.
  name: --server-address
  required: false
- alternate:
  - -p
  help: The port to connect to on your remote syslog server.
  name: --server-port
  required: false
permalink: /qq-cli-command-guide/audit/audit_set_syslog_config.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq audit_set_syslog_config</code>
  command.
synopsis: Change audit syslog server configuration
title: qq audit_set_syslog_config
usage: "qq audit_set_syslog_config [-h] [--enable | --disable] [--csv | --json] [--local-enable\
  \ | --local-disable] [--server-address SERVER_ADDRESS]\n    [--server-port SERVER_PORT]"
zendesk_source: qq CLI Command Guide

---