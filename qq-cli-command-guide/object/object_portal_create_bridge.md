---
category: object
command: object_portal_create_bridge
optional_options:
- alternate: []
  help: 'Full URI of the bucket, including the container for Azure. Examples: https://my-bucket.s3.us-west-2.amazonaws.com/
    or https://myaccount.blob.core.windows.net/my-container'
  name: --bucket-uri
  required: true
- alternate: []
  help: Absolute path on the cluster for the bridge's directory, such as /archive.
    The parent directory must already exist, and creating the bridge creates the last
    component.
  name: --mount-path
  required: true
- alternate: []
  help: Cover only objects whose names start with this prefix, matched exactly, including
    case. Must end with the delimiter, as in projects/. An empty prefix is refused;
    omit this option to cover the whole bucket.
  name: --key-prefix
  required: false
- alternate: []
  help: The one character in object names that separates directories. Defaults to
    "/".
  name: --delimiter
  required: false
- alternate: []
  help: Azure Key Vault hostname, such as my-vault.vault.azure.net, from which the
    cluster fetches SAS tokens for an Azure Blob container. Required for Azure. For
    a Frozen bridge, it must be the cluster's own key vault, which Qumulo sets up.
  name: --key-vault-hostname
  required: false
- alternate: []
  help: URL of an SQS queue that delivers this bucket's object-change notifications.
    Required for a READ_WRITE_EXPORT bridge over an AWS S3 bucket.
  name: --notification-queue-url
  required: false
- alternate: []
  help: 'How clients can change files on the bridge; can''t be changed later. READ_ONLY:
    read files and change their metadata only. READ_WRITE_EXPORT: change anything;
    needs bucket versioning. FROZEN: a Frozen bridge; clients can''t write, delete
    or replace at its path a file that is frozen, offline or restoring, and can change
    its metadata and named streams only with --allow-archived-metadata-changes. Freeze
    and thaw jobs move files to and from the Azure Archive tier, and frozen_delete
    removes them. Needs a Qumulo-managed Azure cluster, the cluster''s own key vault
    in --key-vault-hostname, and a versioned container with no objects under --key-prefix.'
  name: --protocol-access
  required: true
- alternate: []
  help: Whether files take their ownership, permissions, ACLs and timestamps from
    metadata a file-copy tool stored on each object. AUTO reads it from each object
    that carries it in a format the cluster recognizes. OFF reads no object metadata,
    and every file takes these from its parent directory. Can't be changed after creation.
  name: --metadata-import
  required: true
- alternate: []
  help: 'FROZEN bridges only. Let clients change the metadata of a file that is frozen,
    offline or restoring: its mode, owner, group, ACL, times and DOS attributes, and
    its named streams. Can''t be changed after creation.'
  name: --allow-archived-metadata-changes
  required: false
- alternate: []
  help: FROZEN bridges only. Refuse clients any change to the metadata or named streams
    of a file that is frozen, offline or restoring. This is the default.
  name: --disallow-archived-metadata-changes
  required: false
permalink: /qq-cli-command-guide/object/object_portal_create_bridge.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq object_portal_create_bridge</code>
  command.
synopsis: 'Create a bridge: a directory on the cluster whose files come from an S3
  bucket or an Azure Blob container.'
title: qq object_portal_create_bridge
usage: "qq object_portal_create_bridge [-h] --bucket-uri BUCKET_URI --mount-path MOUNT_PATH\
  \ [--key-prefix KEY_PREFIX] [--delimiter DELIMITER] [--key-vault-hostname KEY_VAULT_HOSTNAME]\
  \ [--notification-queue-url NOTIFICATION_QUEUE_URL] --protocol-access\n    {READ_WRITE_EXPORT,READ_ONLY,FROZEN}\
  \ --metadata-import {OFF,AUTO} [--allow-archived-metadata-changes | --disallow-archived-metadata-changes]"
zendesk_source: qq CLI Command Guide

---