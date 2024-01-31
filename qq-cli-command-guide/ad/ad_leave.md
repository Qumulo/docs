---
category: ad
command: ad_leave
keywords: qq, qq_cli, ad_leave
optional_options:
- alternate:
  - --domain
  help: Fully-qualified name of Active Directory Domain
  name: -d
  required: true
- alternate:
  - --username
  help: Domain user to perform the operation, e.g., Administrator
  name: -u
  required: false
- alternate:
  - --password
  help: Domain password (insecure, visible via ps)
  name: -p
  required: false
permalink: /qq-cli-command-guide/ad/ad_leave.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq ad_leave</code> command.
synopsis: Leave an Active Directory Domain
title: qq ad_leave
usage: qq ad_leave [-h] -d DOMAIN [-u USERNAME] [-p PASSWORD]
zendesk_source: qq CLI Command Guide

---