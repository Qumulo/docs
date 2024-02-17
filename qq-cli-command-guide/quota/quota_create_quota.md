---
category: quota
command: quota_create_quota
optional_options:
- alternate: []
  help: Path name
  name: --path
  required: false
- alternate: []
  help: File ID
  name: --id
  required: false
- alternate: []
  help: 'Quota limit in bytes. Both base-10 and base-2 shorthand names are accepted:
    GB or GiB, TB or TiB (e.g. 50GB)'
  name: --limit
  required: true
permalink: /qq-cli-command-guide/quota/quota_create_quota.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq quota_create_quota</code> command.
synopsis: Create a directory quota
title: qq quota_create_quota
usage: qq quota_create_quota [-h] [--path PATH] [--id ID] --limit LIMIT
zendesk_source: qq CLI Command Guide

---