---
category: audit
command: audit_set_cloudwatch_config
keywords: qq, qq_cli, audit_set_cloudwatch_config
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
- alternate:
  - --log-group-name
  help: The group name in CloudWatch Logs to send logs to.
  name: -l
  required: false
- alternate:
  - --region
  help: The AWS region to send logs to.
  name: -r
  required: false
permalink: /qq-cli-command-guide/audit/audit_set_cloudwatch_config.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq audit_set_cloudwatch_config</code>
  command.
synopsis: Change audit CloudWatch configuration
title: qq audit_set_cloudwatch_config
usage: qq audit_set_cloudwatch_config [-h] [--enable | --disable] [-l LOG_GROUP_NAME]
  [-r REGION]

---