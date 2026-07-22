---
category: audit
command: audit_set_destination
optional_options:
- alternate: []
  help: Audit log destination ID.
  name: --id
  required: true
- alternate: []
  help: Audit log destination name.
  name: --name
  required: true
- alternate: []
  help: 'Audit log destination type (default: SYSLOG).'
  name: --type
  required: false
- alternate: []
  help: Use CSV format for SYSLOG destinations.
  name: --csv
  required: false
- alternate: []
  help: Use JSON format for SYSLOG destinations.
  name: --json
  required: false
- alternate:
  - -s
  help: Syslog server address.
  name: --server-address
  required: false
- alternate:
  - -p
  help: Syslog server port.
  name: --server-port
  required: false
- alternate:
  - -l
  help: CloudWatch log group.
  name: --log-group-name
  required: false
- alternate:
  - -r
  help: CloudWatch region.
  name: --region
  required: false
- alternate:
  - -e
  help: Enable audit log destination.
  name: --enable
  required: false
- alternate:
  - -d
  help: Disable audit log destination.
  name: --disable
  required: false
permalink: /qq-cli-command-guide/audit/audit_set_destination.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq audit_set_destination</code>
  command.
synopsis: Replace audit log destination configuration
title: qq audit_set_destination
usage: "qq audit_set_destination [-h] --id ID --name NAME [--type {SYSLOG,CLOUDWATCH,LOCAL}]\
  \ [--csv | --json] [--server-address SERVER_ADDRESS] [--server-port SERVER_PORT]\n\
  \    [--log-group-name LOG_GROUP_NAME] [--region REGION] (--enable | --disable)"
zendesk_source: qq CLI Command Guide

---