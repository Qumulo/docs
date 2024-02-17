---
category: s3
command: s3_add_bucket
optional_options:
- alternate: []
  help: The name of the bucket to be created
  name: --name
  required: true
- alternate: []
  help: The absolute path to be used as the root of the bucket. The user must have
    permissions to read the directory.
  name: --fs-path
  required: false
- alternate: []
  help: Creates the bucket root if it does not exist. The user must have permission
    to create the directory.
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