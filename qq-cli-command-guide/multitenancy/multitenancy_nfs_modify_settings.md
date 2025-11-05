---
category: multitenancy
command: multitenancy_nfs_modify_settings
optional_options:
- alternate: []
  help: ID of tenant to modify settings for
  name: --tenant-id
  required: true
- alternate: []
  help: Enables mounting with the NFSv4.1 protocol
  name: --enable-v4
  required: false
- alternate: []
  help: Disables mounting with the NFSv4.1 protocol
  name: --disable-v4
  required: false
- alternate: []
  help: Enables mounting with KRB5 security
  name: --enable-krb5
  required: false
- alternate: []
  help: Disables mounting with KRB5 security
  name: --disable-krb5
  required: false
- alternate: []
  help: Enables mounting with KRB5p security
  name: --enable-krb5p
  required: false
- alternate: []
  help: Disables mounting with KRB5p security
  name: --disable-krb5p
  required: false
- alternate: []
  help: Enables mounting with KRB5i security
  name: --enable-krb5i
  required: false
- alternate: []
  help: Disables mounting with KRB5i security
  name: --disable-krb5i
  required: false
- alternate: []
  help: Enables mounting with AUTH_SYS security
  name: --enable-auth-sys
  required: false
- alternate: []
  help: Disables mounting with AUTH_SYS security
  name: --disable-auth-sys
  required: false
permalink: /qq-cli-command-guide/multitenancy/multitenancy_nfs_modify_settings.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq multitenancy_nfs_modify_settings</code>
  command.
synopsis: Modify NFS settings for a tenant
title: qq multitenancy_nfs_modify_settings
usage: qq multitenancy_nfs_modify_settings [-h] --tenant-id TENANT_ID [--enable-v4
  | --disable-v4] [--enable-krb5 | --disable-krb5] [--enable-krb5p | --disable-krb5p]
  [--enable-krb5i | --disable-krb5i] [--enable-auth-sys | --disable-auth-sys]
zendesk_source: qq CLI Command Guide

---