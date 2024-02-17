---
category: s3
command: s3_list_uploads
optional_options:
- alternate: []
  help: The bucket for which uploads should be listed.
  name: --bucket
  required: true
- alternate: []
  help: Only output uploads for keys that start with the given string
  name: --starts-with
  required: false
permalink: /qq-cli-command-guide/s3/s3_list_uploads.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq s3_list_uploads</code> command.
synopsis: List in-progress S3 uploads. This includes user initiated multi-part uploads,
  and system initiated uploads that are used in PutObject and CopyObject actions.
title: qq s3_list_uploads
usage: qq s3_list_uploads [-h] --bucket BUCKET [--starts-with STARTS_WITH]
zendesk_source: qq CLI Command Guide

---