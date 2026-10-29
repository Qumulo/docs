---
category: cluster
command: cluster_create_stratus
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
  required: false
- alternate: []
  help: Accept the EULA
  name: --accept-eula
  required: false
- alternate: []
  help: Reject the EULA
  name: --reject-eula
  required: false
- alternate: []
  help: Cluster UUID
  name: --cluster-uuid
  required: false
- alternate: []
  help: Administrator password PBKDF2 hash (hexadecimal string)
  name: --admin-pbkdf2-hash
  required: false
- alternate: []
  help: Administrator password PBKDF2 salt (hexadecimal string)
  name: --admin-pbkdf2-salt
  required: false
- alternate: []
  help: Administrator password PBKDF2 num iterations
  name: --admin-pbkdf2-num-iterations
  required: false
- alternate: []
  help: 'Cluster node UUIDs and fault domains.  For each node, specify comma-separated

    tuple of (UUID, fault domain ID).  To create a cluster without fault domains,

    specify None for the fault domain IDs.'
  name: --node-uuids-and-fault-domains
  required: false
- alternate: []
  help: Use all discoverable unconfigured nodes to make cluster
  name: --all-unconfigured
  required: false
- alternate: []
  help: Set usable capacity limit for the cluster, in human-readable format (e.g.
    5TB).
  name: --usable-capacity
  required: true
- alternate: []
  help: Object store URI(s) provided by data core cluster(s)
  name: --object-store-uris
  required: true
- alternate: []
  help: 'Object store credentials for all object stores referenced by the URIs.  For
    each

    unique store name, specify comma-separated tuple of (store name, acces key ID,

    secret access key).'
  name: --object-store-credentials
  required: false
permalink: /qq-cli-command-guide/cluster/cluster_create_stratus.html
positional_options: []
redirect_from:
- /qq-cli-command-guide/stratus/stratus_cluster_create.html
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq cluster_create_stratus</code>
  command.
synopsis: Create a Qumulo Stratus Tenant Cluster
title: qq cluster_create_stratus
usage: "qq cluster_create_stratus [-h] --cluster-name CLUSTER_NAME [--admin-password\
<<<<<<< Updated upstream
  \ ADMIN_PASSWORD] [--accept-eula] [--reject-eula] [--cluster-uuid CLUSTER_UUID]\
  \ [--admin-pbkdf2-hash ADMIN_PBKDF2_HASH] [--admin-pbkdf2-salt ADMIN_PBKDF2_SALT]\n\
  \    [--admin-pbkdf2-num-iterations ADMIN_PBKDF2_NUM_ITERATIONS] [--node-uuids-and-fault-domains\
  \ NODE_UUIDS_AND_FAULT_DOMAINS [NODE_UUIDS_AND_FAULT_DOMAINS ...]] [--all-unconfigured]\
  \ --usable-capacity USABLE_CAPACITY\n    --object-store-uris OBJECT_STORE_URIS [OBJECT_STORE_URIS\
  \ ...] [--object-store-credentials OBJECT_STORE_CREDENTIALS [OBJECT_STORE_CREDENTIALS\
=======
  \ ADMIN_PASSWORD] [--accept-eula] [--reject-eula] [--cluster-uuid CLUSTER_UUID]\n\
  \    [--admin-pbkdf2-hash ADMIN_PBKDF2_HASH] [--admin-pbkdf2-salt ADMIN_PBKDF2_SALT]\
  \ [--admin-pbkdf2-num-iterations ADMIN_PBKDF2_NUM_ITERATIONS]\n    [--node-uuids-and-fault-domains\
  \ NODE_UUIDS_AND_FAULT_DOMAINS [NODE_UUIDS_AND_FAULT_DOMAINS ...]] [--all-unconfigured]\
  \ --usable-capacity\n    USABLE_CAPACITY --object-store-uris OBJECT_STORE_URIS [OBJECT_STORE_URIS\
  \ ...]\n    [--object-store-credentials OBJECT_STORE_CREDENTIALS [OBJECT_STORE_CREDENTIALS\
>>>>>>> Stashed changes
  \ ...]]"
zendesk_source: qq CLI Command Guide

---