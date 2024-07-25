---
category: s3
command: s3_modify_settings
optional_options:
- alternate:
  - -d
  help: Disable S3 server
  name: --disable
  required: false
- alternate:
  - -e
  help: Enable S3 server
  name: --enable
  required: false
- alternate: []
  help: The default bucket directory prefix for all S3 buckets created without an
    explicitly specified path. You must specify this directory as an absolute path.
  name: --base-path
  required: false
- alternate: []
  help: 'The time period during which the system permits a multipart upload to remain
    unmodified. When this time period elapses, the system considers the multipart
    upload stale and cleans it up automatically. Specify the time period in the <quantity><units>
    format (for example, 5days). Quantity must be a positive integer less than 100
    and units must be one of the following: months, weeks, days, or hours. To disable
    automatic multipart upload cleanup, specify never for quantity and do not specify
    any units.'
  name: --multipart-upload-expiry-interval
  required: false
- alternate: []
  help: Configure the S3 server to accept only HTTPS connections
  name: --secure
  required: false
- alternate: []
  help: Configure the S3 server to accept both HTTP and HTTPS connections
  name: --insecure
  required: false
permalink: /qq-cli-command-guide/s3/s3_modify_settings.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq s3_modify_settings</code> command.
synopsis: Modify S3 server settings
title: qq s3_modify_settings
usage: qq s3_modify_settings [-h] [--disable | --enable] [--base-path BASE_PATH] [--multipart-upload-expiry-interval
  MULTIPART_UPLOAD_EXPIRY_INTERVAL] [--secure | --insecure]
zendesk_source: qq CLI Command Guide

---
