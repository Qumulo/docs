---
category: s3
command: s3_modify_settings
keywords: qq, qq_cli, s3_modify_settings
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
  help: The directory which will be the parent of all buckets created without an explicitly
    specified path.
  name: --base-path
  required: false
- alternate: []
  help: If a multipart upload is not modified in this amount of time, it is considered
    stale and may be cleaned up automatically. The duration must be in the format
    <quantity><units> where <quantity> is a positive integer less than 100 and <units>
    is one of [months, weeks, days, hours] (e.g. 5days). To disable automatic cleanup,
    specify 'never' for the duration.
  name: --multipart-upload-expiry-interval
  required: false
- alternate: []
  help: Configure the S3 server to only accept HTTPS connections
  name: --secure
  required: false
- alternate: []
  help: Configure the S3 server to only accept HTTP connections
  name: --insecure
  required: false
permalink: /qq-cli-command-guide/s3/s3_modify_settings.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq s3_modify_settings</code> command.
synopsis: Modify S3 server settings
title: qq s3_modify_settings
usage: "qq s3_modify_settings [-h] [--disable | --enable] [--base-path BASE_PATH]\n\
  \    [--multipart-upload-expiry-interval MULTIPART_UPLOAD_EXPIRY_INTERVAL]\n   \
  \ [--secure | --insecure]"

---