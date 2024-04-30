---
category: s3
command: s3_add_bucket
optional_options:
- alternate: []
  help: The name of the bucket to create
  name: --name
  required: true
- alternate: []
  help: The absolute path to use as the bucket root directory. The user must have
    permission to read the directory.
  name: --fs-path
  required: false
- alternate: []
  help: Create the bucket root directory if it does not already exist. The user must
    have permission to create the bucket root directory.
  name: --create-fs-path
  required: false
permalink: /qq-cli-command-guide/s3/s3_add_bucket.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq s3_add_bucket</code> command.
synopsis: Create an S3 bucket
title: qq s3_add_bucket
usage: qq s3_add_bucket [-h] --name NAME [--fs-path FS_PATH] [--create-fs-path]
zendesk_source: qq CLI Command Guide

---