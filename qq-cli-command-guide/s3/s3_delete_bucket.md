---
category: s3
command: s3_delete_bucket
optional_options:
- alternate: []
  help: The name of the bucket to be deleted
  name: --name
  required: true
- alternate: []
  help: If set to true, the operation will only succeed if the bucket root directory
    is empty, and the caller has the necessary permissions to unlink it. Otherwise,
    the directory need not be empty.
  name: --delete-root-dir
  required: false
permalink: /qq-cli-command-guide/s3/s3_delete_bucket.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq s3_delete_bucket</code> command.
synopsis: Delete an S3 bucket
title: qq s3_delete_bucket
usage: qq s3_delete_bucket [-h] --name NAME [--delete-root-dir]
zendesk_source: qq CLI Command Guide

---