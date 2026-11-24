---
category: audit
command: audit_modify_destination
optional_options:
  - alternate: []
    help: Audit log destination ID.
    name: --id
    required: true
  - alternate: []
    help: New audit log destination name.
    name: --name
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
    help: Enable audit log destination. If neither is given, the enabled state is
      unchanged.
    name: --enable
    required: false
  - alternate:
      - -d
    help: Disable audit log destination. If neither is given, the enabled state is
      unchanged.
    name: --disable
    required: false
permalink: /qq-cli-command-guide/audit/audit_modify_destination.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq audit_modify_destination</code>
  command.
synopsis: Modify audit log destination configuration, changing only the given settings
title: qq audit_modify_destination
usage: qq audit_modify_destination [-h] --id ID (--enable | --disable)
---