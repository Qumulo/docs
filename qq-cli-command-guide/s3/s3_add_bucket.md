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
- alternate: []
  help: Create the bucket with versioning and object locking enabled.
  name: --enable-object-lock
  required: false
- alternate: []
  help: 'Specifies whether to create a private S3 bucket. By default, Qumulo Core
    creates the bucket without a policy, allowing all S3 API users to perform S3 object
    read and write operations and the S3 bucket''s creator and users with RBAC permissions
    to perform S3 bucket write operations. When enabled, Qumulo Core applies a policy
    that restricts both S3 object and S3 bucket operations to the S3 bucket''s creator
    and users with RBAC permissions. '
  name: --private
  required: false
permalink: /qq-cli-command-guide/s3/s3_add_bucket.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq s3_add_bucket</code> command.
synopsis: Create an S3 bucket
title: qq s3_add_bucket
usage: qq s3_add_bucket [-h] --name NAME [--fs-path FS_PATH] [--create-fs-path] [--enable-object-lock]
  [--private]
zendesk_source: qq CLI Command Guide

---