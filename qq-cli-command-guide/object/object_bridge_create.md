---
category: object
command: object_bridge_create
optional_options:
- alternate: []
  help: 'Full bucket URI. Examples: https://my-bucket.s3.us-west-2.amazonaws.com/
    or https://myaccount.blob.core.windows.net/my-container'
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
  help: Object-key separator used to project bridge directories. Defaults to "/".
  name: --delimiter
  required: false
- alternate: []
  help: Access key for private S3 endpoints. Omit for AWS ambient credentials.
  name: --access-key-id
  required: false
- alternate: []
  help: Secret key for private S3 endpoints. Omit for AWS ambient credentials.
  name: --secret-access-key
  required: false
- alternate: []
  help: Azure Key Vault hostname (e.g. my-vault.vault.azure.net) from which to fetch
    SAS tokens for an Azure Blob bucket. Mutually exclusive with --access-key-id/--secret-access-key.
  name: --key-vault-hostname
  required: false
- alternate: []
  help: URL of an SQS queue that delivers this bucket's object-change notifications.
    Omit to use cache expiry only.
  name: --notification-queue-url
  required: false
- alternate: []
  help: Reject protocol writes to the bridge while the bucket keeps converging.
  name: --read-only
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
  \ [--key-prefix KEY_PREFIX] [--delimiter DELIMITER] [--access-key-id ACCESS_KEY_ID]\
  \ [--secret-access-key SECRET_ACCESS_KEY] [--key-vault-hostname KEY_VAULT_HOSTNAME]\n\
  \    [--notification-queue-url NOTIFICATION_QUEUE_URL] [--read-only]"
zendesk_source: qq CLI Command Guide

---