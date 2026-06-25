---
category: multitenancy
command: multitenancy_create_tenant
optional_options:
- alternate: []
  help: Unique name of the tenant chosen by the user.
  name: --name
  required: true
- alternate: []
  help: List of zero or more network IDs associated with this tenant, as returned
    by the `network_list_networks` command. Each network ID may be assigned to at
    most one tenant.
  name: --network-id
  required: false
- alternate: []
  help: Web UI is accessible from this tenant.
  name: --enable-web-ui
  required: false
- alternate: []
  help: Web UI is not accessible from this tenant. This is the default.
  name: --disable-web-ui
  required: false
- alternate: []
  help: REST API is accessible from this tenant.
  name: --enable-rest-api
  required: false
- alternate: []
  help: REST API is not accessible from this tenant. This is the default.
  name: --disable-rest-api
  required: false
- alternate: []
  help: SSH is accessible from this tenant.
  name: --enable-ssh
  required: false
- alternate: []
  help: SSH is not accessible from this tenant. This is the default.
  name: --disable-ssh
  required: false
- alternate: []
  help: Replication is accessible from this tenant.
  name: --enable-replication
  required: false
- alternate: []
  help: Replication is not accessible from this tenant. This is the default.
  name: --disable-replication
  required: false
- alternate: []
  help: NFS is accessible from this tenant.
  name: --enable-nfs
  required: false
- alternate: []
  help: NFS is not accessible from this tenant. This is the default.
  name: --disable-nfs
  required: false
- alternate: []
  help: SMB is accessible from this tenant.
  name: --enable-smb
  required: false
- alternate: []
  help: SMB is not accessible from this tenant. This is the default.
  name: --disable-smb
  required: false
permalink: /qq-cli-command-guide/multitenancy/multitenancy_create_tenant.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq multitenancy_create_tenant</code>
  command.
synopsis: Create a tenant
title: qq multitenancy_create_tenant
usage: "qq multitenancy_create_tenant [-h] --name NAME [--network-id [NETWORK_ID [NETWORK_ID\
  \ ...]]] [--enable-web-ui | --disable-web-ui] [--enable-rest-api | --disable-rest-api]\
  \ [--enable-ssh | --disable-ssh]\n    [--enable-replication | --disable-replication]\
  \ [--enable-nfs | --disable-nfs] [--enable-smb | --disable-smb]"
zendesk_source: qq CLI Command Guide

---