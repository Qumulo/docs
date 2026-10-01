---
category: object
command: object_portal_create_bridge
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
  help: Optional prefix inside the bucket, matched against object keys as it is written.
    Must end with the delimiter. An empty prefix is refused; omit this option to bridge
    the whole bucket.
  name: --key-prefix
  required: false
- alternate: []
  help: Object-key separator used to project bridge directories. Defaults to "/".
  name: --delimiter
  required: false
- alternate: []
  help: Azure Key Vault hostname (e.g. my-vault.vault.azure.net) from which to fetch
    SAS tokens for an Azure Blob bucket.
  name: --key-vault-hostname
  required: false
- alternate: []
  help: URL of an SQS queue that delivers this bucket's object-change notifications.
    Omit to use cache expiry only.
  name: --notification-queue-url
  required: false
- alternate: []
  help: READ_ONLY rejects protocol data and namespace writes to the bridge while the
    bucket keeps converging; file attributes stay writable. READ_WRITE_EXPORT leaves
    both writable and requires bucket versioning. Immutable after creation.
  name: --protocol-access
  required: true
- alternate: []
  help: Import file-mover object metadata (ownership, permissions, ACLs, timestamps)
    onto bridge inodes. AUTO translates objects matching a known mover dialect; OFF
    inherits everything from the parent directory. Immutable after creation.
  name: --metadata-import
  required: true
permalink: /qq-cli-command-guide/object/object_portal_create_bridge.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq object_portal_create_bridge</code>
  command.
synopsis: Create a bridge filesystem rooted at an external object bucket.
title: qq object_portal_create_bridge
usage: "qq object_portal_create_bridge [-h] --bucket-uri BUCKET_URI --mount-path MOUNT_PATH\
  \ [--key-prefix KEY_PREFIX] [--delimiter DELIMITER] [--key-vault-hostname KEY_VAULT_HOSTNAME]\
  \ [--notification-queue-url NOTIFICATION_QUEUE_URL] --protocol-access\n    {READ_WRITE_EXPORT,READ_ONLY}\
  \ --metadata-import {OFF,AUTO}"
zendesk_source: qq CLI Command Guide

---