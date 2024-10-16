---
category: create
command: create_object_backed_cluster
optional_options:
- alternate:
  - -n
  help: Cluster Name
  name: --cluster-name
  required: true
- alternate:
  - -p
  help: Administrator Password
  name: --admin-password
  required: true
- alternate: []
  help: Instance ID of node receiving this request.
  name: --host-instance-id
  required: true
- alternate: []
  help: Object storage URIs, e.g. https://bucket.s3.region.amazonaws.com/
  name: --object-storage-uris
  required: true
- alternate: []
  help: Set usable capacity limit for the cluster, in human-readable format (e.g.
    5TB).
  name: --usable-capacity-clamp
  required: true
- alternate: []
  help: 'The product type of cluster to create. Valid options for AWS clusters are:
    ACTIVE_WITH_STANDARD_STORAGE, ACTIVE_WITH_INTELLIGENT_STORAGE, ARCHIVE_WITH_IA_STORAGE,
    ARCHIVE_WITH_GIR_STORAGE. Valid options for Azure clusters are: ACTIVE_WITH_HOT_STORAGE,
    ARCHIVE_WITH_COLD_STORAGE.'
  name: --product-type
  required: true
- alternate: []
  help: 'Cluster node ips and fault domains. Parsed as comma delimited tuples

    <ip-1>,<fault domain-1> <ip-2>,<fault domain-2>...

    To create a non-fault domain aware cluster, provide None in place of the fault

    domain ids <ip-1>,None <ip-2>,None <ip-3>,None...

    '
  name: --node-ips-and-fault-domains
  required: false
- alternate: []
  help: Accept the EULA.
  name: --accept-eula
  required: true
- alternate: []
  help: The URI of the key vault used to access blobs on Azure.
  name: --azure-key-vault-uri
  required: false
permalink: /qq-cli-command-guide/create/create_object_backed_cluster.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq create_object_backed_cluster</code>
  command.
synopsis: Creates a Qumulo Object Backed Cluster
title: qq create_object_backed_cluster
usage: "qq create_object_backed_cluster [-h] --cluster-name CLUSTER_NAME --admin-password\
  \ ADMIN_PASSWORD --host-instance-id HOST_INSTANCE_ID --object-storage-uris OBJECT_STORAGE_URIS\n\
  \    [OBJECT_STORAGE_URIS ...] --usable-capacity-clamp USABLE_CAPACITY_CLAMP --product-type\
  \ PRODUCT_TYPE\n    [--node-ips-and-fault-domains NODE_IPS_AND_FAULT_DOMAINS [NODE_IPS_AND_FAULT_DOMAINS\
  \ ...]] --accept-eula [--azure-key-vault-uri AZURE_KEY_VAULT_URI]"
zendesk_source: qq CLI Command Guide

---