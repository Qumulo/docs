---
category: add
command: add_object_storage_uris
optional_options:
- alternate: []
  help: The new URIs to add to the cluster.
  name: --uris
  required: false
permalink: /qq-cli-command-guide/add/add_object_storage_uris.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq add_object_storage_uris</code>
  command.
synopsis: Add object storage URIs for configuring the cluster's data persistence.
  As the system provisions additional storage capacity on the cluster (which increases
  together with the clamp increase functionality), the file system recognizes and
  uses any new object storage URIs. Ensure that the new URIs point to empty S3 buckets
  or storage accounts and that the nodes on the cluster have sufficient permissions
  to perform LIST, PUT, GET, and DELETE operations on these buckets or accounts. Performing
  this action on a cluster not backed by objects results in an error.
title: qq add_object_storage_uris
usage: qq add_object_storage_uris [-h] [--uris URIS [URIS ...]]
zendesk_source: qq CLI Command Guide

---