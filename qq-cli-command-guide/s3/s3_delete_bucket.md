---
category: s3
command: s3_delete_bucket
optional_options:
- alternate: []
  help: The name of the S3 bucket to delete
  name: --name
  required: true
- alternate: []
  help: If specified, the operation succeeds only if the bucket root directory is
    empty, and the caller has the permissions for unlinking the bucket root directory
    from the S3 bucket. By default, the directory to be deleted can contain objects.
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