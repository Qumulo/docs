---
category: s3
command: s3_modify_bucket
optional_options:
- alternate: []
  help: The name of the bucket to be modified
  name: --name
  required: true
- alternate: []
  help: Disallows unsigned S3 requests; will be refused with 403 Forbidden.
  name: --disable-anonymous-access
  required: false
- alternate: []
  help: Allows unsigned S3 requests; will execute with GUEST privilege.
  name: --enable-anonymous-access
  required: false
permalink: /qq-cli-command-guide/s3/s3_modify_bucket.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq s3_modify_bucket</code> command.
synopsis: Modify S3 bucket settings
title: qq s3_modify_bucket
usage: qq s3_modify_bucket [-h] --name NAME [--disable-anonymous-access | --enable-anonymous-access]
zendesk_source: qq CLI Command Guide

---