---
category: raw
command: raw
keywords: qq, qq_cli, raw
optional_options:
- alternate: []
  help: 'Content MIME type. Use application/octet-stream for binary input. (Default:
    application/json)'
  name: --content-type
  required: false
permalink: /qq-cli-command-guide/raw/raw.html
positional_options:
- help: HTTP method. PATCH, POST, and PUT accept input on stdin
  name: method
  required: true
- help: REST endpoint (e.g. /v1/ad/join)
  name: url
  required: true
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq raw</code> command.
synopsis: Issue an HTTP request to a Qumulo REST endpoint. Content for modifying requests
  (i.e. PATCH, POST, and PUT) can be provided on stdin.  Output is provided on stdout.
title: qq raw
usage: "qq raw [-h] [--content-type {application/json,application/octet-stream}]\n\
  \    {DELETE,GET,PATCH,POST,PUT} url"

---