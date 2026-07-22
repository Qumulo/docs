---
category: object
command: object_bridge_create
optional_options:
- alternate: []
  help: 'Full bucket URI. Examples: https://my-bucket.s3.us-west-2.amazonaws.com/
    or https://minio.local:9000/my-bucket'
  name: --bucket-uri
  required: true
- alternate: []
  help: Absolute path in the primary filesystem where the bridge will be mounted.
    The parent directory must already exist; the basename is created during bridge
    creation.
  name: --mount-path
  required: true
- alternate: []
  help: Optional prefix inside the bucket. Stored with a trailing "/".
  name: --key-prefix
  required: false
- alternate: []
  help: Access key for private S3 endpoints. Omit for AWS ambient credentials.
  name: --access-key-id
  required: false
- alternate: []
  help: Secret key for private S3 endpoints. Omit for AWS ambient credentials.
  name: --secret-access-key
  required: false
permalink: /qq-cli-command-guide/object/object_bridge_create.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq object_bridge_create</code>
  command.
synopsis: Test-only. Create a bridge filesystem rooted at an external object bucket.
  The cluster must have been created with the object_portals test option enabled.
title: qq object_bridge_create
usage: "qq object_bridge_create [-h] --bucket-uri BUCKET_URI --mount-path MOUNT_PATH\
  \ [--key-prefix KEY_PREFIX] [--access-key-id ACCESS_KEY_ID]\n    [--secret-access-key\
  \ SECRET_ACCESS_KEY]"
zendesk_source: qq CLI Command Guide

---