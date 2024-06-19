---
category: nfs
command: nfs_add_export
optional_options:
- alternate: []
  help: NFS Export path
  name: --export-path
  required: true
- alternate: []
  help: File system path
  name: --fs-path
  required: true
- alternate: []
  help: ID of the tenant to add the export to
  name: --tenant-id
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
  help: "\n    Path to local file containing the restrictions in JSON format.\n  \
    \  host_restrictions is a comma separated list of IPs/ IP ranges/ hostnames/ wildcarded\
    \ hostnames/\n    and the strings KRB5@, KRB5I@, and KRB5P@ for the 3 kerberos\
    \ security flavors: basic auth,\n    Integrity, and Privacy.\n    user_mapping\
    \ can be \"none\"|\"root\"|\"all\".  map_to_user may be \"{ \"id_type\": \"LOCAL_USER\"\
    ,\n    \"id_value\": \"<integer_id>\" }\" or \"{ \"id_type\": \"NFS_UID\", \"\
    id_value\": \"<integer_id>\" }\".\n    map_to_group may be \"{ \"id_type\": \"\
    NFS_GID\", \"id_value\": \"<integer_id>\".  If user_mapping is not\n    \"none\"\
    , then either specify map_to_user as a local user or specify both map_to_user\
    \ and\n    map_to_group as NFS user/group.\n\n    ==Example JSON==:\n    { \"\
    restrictions\" : [\n        {\n            \"read_only\" : true,\n           \
    \ \"host_restrictions\" : [ \"1.2.3.1\", \"1.100.0.0/24\" ],\n            \"user_mapping\"\
    \ : \"root\",\n            \"map_to_user\": {\n                \"id_type\" : \"\
    LOCAL_USER\",\n                \"id_value\" : \"500\"\n            }\n       \
    \ },\n        {\n            \"read_only\" : false,\n            \"host_restrictions\"\
    \ : [ \"KRB5@\" ],\n            \"user_mapping\" : \"none\"\n        },\n    \
    \    {\n            \"read_only\" : true,\n            \"host_restrictions\" :\
    \ [],\n            \"user_mapping\" : \"all\",\n            \"map_to_user\" :{\n\
    \                \"id_type\" : \"NFS_UID\",\n                \"id_value\" : \"\
    500\"\n            },\n            \"map_to_group\": {\n                \"id_type\"\
    \ : \"NFS_GID\",\n                \"id_value\" : \"501\"\n            }\n    \
    \    } ]\n    } "
  name: --restrictions
  required: false
- alternate: []
  help: Creates the specified file system path if it does not exist
  name: --create-fs-path
  required: false
- alternate: []
  help: Fields that should be forced to fit in 32 bits for this export, to support
    legacy clients and applications. FILE_IDS will hash file IDs (inode numbers),
    which can be observed by "stat", and is also necessary for some deprecated linux
    system calls (e.g. to list a directory) to work. FS_SIZE saturates the available,
    used, and total capacity reported to tools like "df" to 4GiB. FILE_SIZES saturates
    the reported size of individual files to 4GiB, and should be used with caution
    as it could cause application misbehavior in the handling of larger files.  NONE
    explicitly specifies no 32 bit mapping.
  name: --fields-to-present-as-32-bit
  required: false
permalink: /qq-cli-command-guide/nfs/nfs_add_export.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq nfs_add_export</code> command.
synopsis: Add a new NFS export
title: qq nfs_add_export
usage: qq nfs_add_export [-h] --export-path EXPORT_PATH --fs-path FS_PATH [--tenant-id
  TENANT_ID] [--description DESCRIPTION] (--no-restrictions | --restrictions JSON_FILE_PATH)
  [--create-fs-path] [--fields-to-present-as-32-bit FIELD [FIELD ...]]
zendesk_source: qq CLI Command Guide

---