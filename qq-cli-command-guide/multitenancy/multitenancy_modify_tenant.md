---
category: multitenancy
command: multitenancy_modify_tenant
optional_options:
- alternate: []
  help: The unique ID of the tenant to modify.
  name: --id
  required: true
- alternate: []
  help: Unique name of the tenant chosen by the user. If not specified, the existing
    name will be preserved.
  name: --name
  required: false
- alternate: []
  help: Web UI is accessible from this tenant. If neither --enable-web-ui nor --disable-web-ui
    is specified, the existing setting will be preserved.
  name: --enable-web-ui
  required: false
- alternate: []
  help: Web UI is not accessible from this tenant. If neither --enable-web-ui nor
    --disable-web-ui is specified, the existing setting will be preserved.
  name: --disable-web-ui
  required: false
- alternate: []
  help: REST API is accessible from this tenant. If neither --enable-rest-api nor
    --disable-rest-api is specified, the existing setting will be preserved.
  name: --enable-rest-api
  required: false
- alternate: []
  help: REST API is not accessible from this tenant. If neither --enable-rest-api
    nor --disable-rest-api is specified, the existing setting will be preserved.
  name: --disable-rest-api
  required: false
- alternate: []
  help: SSH is accessible from this tenant. If neither --enable-ssh nor --disable-ssh
    is specified, the existing setting will be preserved.
  name: --enable-ssh
  required: false
- alternate: []
  help: SSH is not accessible from this tenant. If neither --enable-ssh nor --disable-ssh
    is specified, the existing setting will be preserved.
  name: --disable-ssh
  required: false
- alternate: []
  help: Replication is accessible from this tenant. If neither --enable-replication
    nor --disable-replication is specified, the existing setting will be preserved.
  name: --enable-replication
  required: false
- alternate: []
  help: Replication is not accessible from this tenant. If neither --enable-replication
    nor --disable-replication is specified, the existing setting will be preserved.
  name: --disable-replication
  required: false
- alternate: []
  help: NFS is accessible from this tenant. If neither --enable-nfs nor --disable-nfs
    is specified, the existing setting will be preserved.
  name: --enable-nfs
  required: false
- alternate: []
  help: NFS is not accessible from this tenant. If neither --enable-nfs nor --disable-nfs
    is specified, the existing setting will be preserved.
  name: --disable-nfs
  required: false
- alternate: []
  help: SMB is accessible from this tenant. If neither --enable-smb nor --disable-smb
    is specified, the existing setting will be preserved.
  name: --enable-smb
  required: false
- alternate: []
  help: SMB is not accessible from this tenant. If neither --enable-smb nor --disable-smb
    is specified, the existing setting will be preserved.
  name: --disable-smb
  required: false
- alternate: []
  help: List of zero or more network IDs associated with this tenant, as returned
    by the `network_list_networks` command. Each network ID may be assigned to at
    most one tenant. If specified, this must contain a complete list of all network
    IDs to be assigned to the tenant. Any already-assigned networks not present will
    be unassigned and services will be disabled on those networks. If not specified,
    the existing networks will be preserved.
  name: --network-id
  required: false
permalink: /qq-cli-command-guide/multitenancy/multitenancy_modify_tenant.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq multitenancy_modify_tenant</code>
  command.
synopsis: Modify a tenant
title: qq multitenancy_modify_tenant
usage: "qq multitenancy_modify_tenant [-h] --id ID [--name NAME] [--enable-web-ui\
  \ | --disable-web-ui] [--enable-rest-api | --disable-rest-api] [--enable-ssh | --disable-ssh]\
  \ [--enable-replication | --disable-replication] [--enable-nfs | --disable-nfs]\n\
  \    [--enable-smb | --disable-smb] [--network-id [NETWORK_ID [NETWORK_ID ...]]]"
zendesk_source: qq CLI Command Guide

---