---
category: smb
command: smb_mod_share
optional_options:
- alternate: []
  help: The ID of the share to modify.
  name: --id
  required: false
- alternate: []
  help: The name of the share to modify.
  name: --name
  required: false
- alternate: []
  help: ID of the tenant the share is in. Only used if using the --name argument.
  name: --tenant-id
  required: false
- alternate: []
  help: Change SMB share name.
  name: --new-name
  required: false
- alternate: []
  help: Change the tenant that the share is in.
  name: --new-tenant-id
  required: false
- alternate: []
  help: Change file system path.
  name: --fs-path
  required: false
- alternate: []
  help: Change share description.
  name: --description
  required: false
- alternate: []
  help: Enable Access-Based Enumeration for this share.
  name: --access-based-enumeration-enabled
  required: false
- alternate: []
  help: Creates the specified file system path if the path does not exist already.
  name: --create-fs-path
  required: false
- alternate: []
  help: "\n                Change the default POSIX file create mode bits (octal)\
    \ for the specified SMB share.\n                These mode bits are applied to\
    \ new files as they are created. Note: If an\n                inheritable ACE\
    \ is present in the permissions ACL, this flag has no effect.\n              \
    \  "
  name: --default-file-create-mode
  required: false
- alternate: []
  help: "\n                Change the default POSIX directory create mode bits (octal)\
    \ for the specified SMB\n                share. These mode bits are applied to\
    \ new directories as they are created. Note: If\n                an inheritable\
    \ ACE is present in the permissions ACL, this flag has no effect.\n          \
    \      "
  name: --default-directory-create-mode
  required: false
- alternate: []
  help: Require all traffic for this share to be encrypted. If true, clients without
    encryption capabilities will not be able to connect.
  name: --require-encryption
  required: false
- alternate: []
  help: Print the raw JSON response.
  name: --json
  required: false
- alternate: []
  help: "\n            The host addresses or subnet ranges for which access to to\
    \ this share are not limited by\n            network permissions. Access may still\
    \ be limited by share and file permissions.\n            "
  name: --full-control-hosts
  required: false
- alternate: []
  help: Address ranges which should be permitted read-only access at most.
  name: --read-only-hosts
  required: false
- alternate: []
  help: "\n            The host addresses or subnet ranges for which access to the\
    \ specified share is denied,\n            regardless of other permissions. Important:\
    \ Because using this flag alone results in all\n            hosts being denied,\
    \ use the correct --full-control-hosts or --read-only-hosts flags as\n       \
    \     necessary.\n            "
  name: --deny-hosts
  required: false
- alternate: []
  help: "\n            Deny all access to this share. Important: To avoid configuration\
    \ issues, do not apply\n            this flag alongside any others.\n        \
    \    "
  name: --deny-all-hosts
  required: false
permalink: /qq-cli-command-guide/smb/smb_mod_share.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq smb_mod_share</code> command.
synopsis: Modify a share
title: qq smb_mod_share
usage: "qq smb_mod_share [-h] (--id ID | --name NAME) [--tenant-id TENANT_ID] [--new-name\
  \ NEW_NAME] [--new-tenant-id NEW_TENANT_ID] [--fs-path FS_PATH]\n    [--description\
  \ DESCRIPTION] [--access-based-enumeration-enabled {true,false}] [--create-fs-path]\
  \ [--default-file-create-mode DEFAULT_FILE_CREATE_MODE]\n    [--default-directory-create-mode\
  \ DEFAULT_DIRECTORY_CREATE_MODE] [--require-encryption {true,false}] [--json]\n\
  \    [--full-control-hosts IP/RANGE [IP/RANGE ...]] [--read-only-hosts IP/RANGE\
  \ [IP/RANGE ...]] [--deny-hosts IP/RANGE [IP/RANGE ...]] [--deny-all-hosts]"
zendesk_source: qq CLI Command Guide

---