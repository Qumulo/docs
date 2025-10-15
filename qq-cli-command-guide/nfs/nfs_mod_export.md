---
category: nfs
command: nfs_mod_export
optional_options:
- alternate: []
  help: ID of export to modify
  name: --export-id
  required: false
- alternate: []
  help: Path of export to modify
  name: --export-path
  required: false
- alternate: []
  help: ID of the tenant the export is in. Only used if using the --export-path argument.
  name: --tenant-id
  required: false
- alternate: []
  help: Change NFS export path
  name: --new-export-path
  required: false
- alternate: []
  help: Change tenant that export is in
  name: --new-tenant-id
  required: false
- alternate: []
  help: Change file system path
  name: --fs-path
  required: false
- alternate: []
  help: Description of this export
  name: --description
  required: false
- alternate: []
  help: Specify no restrictions for this export.
  name: --no-restrictions
  required: false
- alternate: []
  help: "Path to local file containing the restrictions in JSON format.\n\nhost_restrictions\
    \ is a comma separated list of:\n    IPs| IP ranges | hostnames | wildcarded hostnames\
    \ | KRB5@ | KRB5I@ | KRB5P@\n\n    kerberos security flavors:\n        KRB5@:\
    \ basic     KRB5I@: auth Integrity     KRB5P@: Privacy\n\nuser_mapping can be:\n\
    \    \"none\" | \"root\" | \"all\"\nmap_to_user can be:\n    \"{ \"id_type\":\
    \ \"LOCAL_USER\", \"id_value\": \"<integer_id>\" }\" or\n    \"{ \"id_type\":\
    \ \"NFS_UID\", \"id_value\": \"<integer_id>\" }\"\nmap_to_group can be:\n    \"\
    { \"id_type\": \"NFS_GID\", \"id_value\": \"<integer_id> }\"\nIf user_mapping\
    \ is not \"none\", then:\n    either specify \"map_to_user\" as a local user\n\
    \    or specify both \"map_to_user\" and \"map_to_group\" as NFS user/group.\n\
    \n==Example JSON==:\n{\n    \"restrictions\" : [\n        {\n            \"read_only\"\
    \ : true,\n            \"host_restrictions\" : [ \"1.2.3.1\", \"1.100.0.0/24\"\
    \ ],\n            \"user_mapping\" : \"root\",\n            \"map_to_user\": {\n\
    \                \"id_type\" : \"LOCAL_USER\",\n                \"id_value\" :\
    \ \"500\"\n            }\n        },\n        {\n            \"read_only\" : false,\n\
    \            \"host_restrictions\" : [ \"KRB5@\" ],\n            \"user_mapping\"\
    \ : \"none\"\n        },\n        {\n            \"read_only\" : true,\n     \
    \       \"host_restrictions\" : [],\n            \"user_mapping\" : \"all\",\n\
    \            \"map_to_user\" :{\n                \"id_type\" : \"NFS_UID\",\n\
    \                \"id_value\" : \"500\"\n            },\n            \"map_to_group\"\
    : {\n                \"id_type\" : \"NFS_GID\",\n                \"id_value\"\
    \ : \"501\"\n            }\n        }\n    ]\n}\n"
  name: --restrictions
  required: false
- alternate: []
  help: Creates the specified file system path if it does not exist
  name: --create-fs-path
  required: false
- alternate: []
  help: "Fields that are forced to fit in 32 bits for the export, to support legacy\n\
    clients and applications. Choices are: ['FILE_IDS', 'FILE_SIZES', 'FS_SIZE', 'NONE']\n\
    \nFILE_IDS: will hash file IDs (inode numbers), which can be observed by \"stat\"\
    ,\n          and is also necessary for some deprecated linux system calls\n  \
    \        (e.g. to list a directory) to work.\n\nFS_SIZE: saturates the available,\
    \ used, and total capacity reported to\n         tools like \"df\" to 4GiB.\n\n\
    FILE_SIZES: saturates the reported size of individual files to 4GiB, and\n   \
    \         should be used with caution as it could cause application\n        \
    \    misbehavior in the handling of larger files.\n\nNONE: explicitly specifies\
    \ no 32 bit mapping.\n"
  name: --fields-to-present-as-32-bit
  required: false
permalink: /qq-cli-command-guide/nfs/nfs_mod_export.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq nfs_mod_export</code> command.
synopsis: Modify an export
title: qq nfs_mod_export
usage: "qq nfs_mod_export [-h] (--export-id EXPORT_ID | --export-path EXPORT_PATH)\
  \ [--tenant-id TENANT_ID]\n    [--new-export-path NEW_EXPORT_PATH] [--new-tenant-id\
  \ NEW_TENANT_ID] [--fs-path FS_PATH]\n    [--description DESCRIPTION] [--no-restrictions\
  \ | --restrictions JSON_FILE_PATH] [--create-fs-path]\n    [--fields-to-present-as-32-bit\
  \ FIELD [FIELD ...]]"
zendesk_source: qq CLI Command Guide

---