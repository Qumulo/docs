---
category: add
command: add_object_storage_uris
optional_options:
- alternate: []
  help: The new URIs to add to the cluster.
  name: --uris
  required: false
- alternate: []
  help: 'The new credentials to add to the cluster. Parsed as comma delimited tuples
    where

    each tuple is on its own line in the file:

    <store_name-1>,<access_key_id-1>,<secret_access_key-1>

    <store_name-2>,<access_key_id-2>,<secret_access_key-2>...

    '
  name: --credentials-file
  required: false
- alternate: []
  help: 'The new credentials to add to the file via stdin. Parsed as comma delimited
    tuples

    where each tuple is separated by a space:

    <store_name-1>,<access_key_id-1>,<secret_access_key-1>

    <store_name-2>,<access_key_id-2>,<secret_access_key-2>...

    '
  name: --credentials
  required: false
permalink: /qq-cli-command-guide/add/add_object_storage_uris.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq add_object_storage_uris</code>
  command.
synopsis: Add object storage URIs and associated credentials for configuring the cluster's
  data persistence. As the system provisions additional storage capacity on the cluster
  (which increases together with the clamp increase functionality), the file system
  recognizes and uses any new object storage URIs. Ensure that the new URIs point
  to empty S3 buckets or storage accounts and that the nodes on the cluster have sufficient
  permissions to perform LIST, PUT, GET, and DELETE operations on these buckets or
  accounts. Performing this action on a cluster not backed by objects results in an
  error.
title: qq add_object_storage_uris
usage: qq add_object_storage_uris [-h] [--uris URIS [URIS ...]] [--credentials-file
  CREDENTIALS_FILE | --credentials CREDENTIALS [CREDENTIALS ...]]
zendesk_source: qq CLI Command Guide

---