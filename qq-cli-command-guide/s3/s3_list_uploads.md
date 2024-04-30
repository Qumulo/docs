---
category: s3
command: s3_list_uploads
optional_options:
- alternate: []
  help: The S3 bucket for which to list uploads
  name: --bucket
  required: true
- alternate: []
  help: List uploads only for keys that begin with the specified string
  name: --starts-with
  required: false
permalink: /qq-cli-command-guide/s3/s3_list_uploads.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq s3_list_uploads</code> command.
synopsis: List S3 uploads in progress, including user-initiated multipart uploads
  and system-initiated uploads that the PutObject and CopyObject API actions use.
title: qq s3_list_uploads
usage: qq s3_list_uploads [-h] --bucket BUCKET [--starts-with STARTS_WITH]
zendesk_source: qq CLI Command Guide

---