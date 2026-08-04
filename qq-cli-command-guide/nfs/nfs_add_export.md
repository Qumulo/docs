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
  help: "Path to local file containing the restrictions in JSON format.\n\nhost_restrictions\
    \ is a comma separated list of:\n    IPs| IP ranges | hostnames | wildcarded hostnames\n\
    \nrequired_authentication_mode can be:\n    \"AUTHENTICATION_MODE_NONE\" | \"\
    AUTHENTICATION_MODE_KRB5\" | \"AUTHENTICATION_MODE_KRB5I\" |\n    \"AUTHENTICATION_MODE_KRB5P\"\
    \n\n    kerberos security flavors:\n        KRB5: basic     KRB5I: auth Integrity\
    \     KRB5P: Privacy\n\nuser_mapping can be:\n    \"none\" | \"root\" | \"all\"\
    \nmap_to_user can be:\n    \"{ \"id_type\": \"LOCAL_USER\", \"id_value\": \"<integer_id>\"\
    \ }\" or\n    \"{ \"id_type\": \"NFS_UID\", \"id_value\": \"<integer_id>\" }\"\
    \nmap_to_group can be:\n    \"{ \"id_type\": \"NFS_GID\", \"id_value\": \"<integer_id>\
    \ }\"\nIf user_mapping is not \"none\", then:\n    either specify \"map_to_user\"\
    \ as a local user\n    or specify both \"map_to_user\" and \"map_to_group\" as\
    \ NFS user/group.\n\n==Example JSON==:\n{\n    \"restrictions\" : [\n        {\n\
    \            \"read_only\" : true,\n            \"host_restrictions\" : [ \"1.2.3.1\"\
    , \"1.100.0.0/24\" ],\n            \"required_authentication_mode\": \"AUTHENTICATION_MODE_NONE\"\
    ,\n            \"user_mapping\" : \"root\",\n            \"map_to_user\": {\n\
    \                \"id_type\" : \"LOCAL_USER\",\n                \"id_value\" :\
    \ \"500\"\n            }\n        },\n        {\n            \"read_only\" : false,\n\
    \            \"host_restrictions\" : [ \"*.example.com\" ],\n            \"required_authentication_mode\"\
    : \"AUTHENTICATION_MODE_KRB5\",\n            \"user_mapping\" : \"none\"\n   \
    \     },\n        {\n            \"read_only\" : true,\n            \"host_restrictions\"\
    \ : [],\n            \"required_authentication_mode\": \"AUTHENTICATION_MODE_KRB5P\"\
    ,\n            \"user_mapping\" : \"all\",\n            \"map_to_user\" :{\n \
    \               \"id_type\" : \"NFS_UID\",\n                \"id_value\" : \"\
    500\"\n            },\n            \"map_to_group\": {\n                \"id_type\"\
    \ : \"NFS_GID\",\n                \"id_value\" : \"501\"\n            }\n    \
    \    }\n    ]\n}\n"
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

## Example
### To Configure Required Authentication Modes for Different Hosts

In the following example, we configure three export restrictions.

* The first export restriction allows only the specified hosts to use any authentication mode to access the NFS export.
* The second export restriction allows all hosts matching the wildcard pattern that use the `@KRB5` authentication mode to access the NFS export.
* The third export restriction allows any hosts that use the `@KRB5P` authentication mode to access the NFS export.

```json
{
  "restrictions" : [
    {
      "read_only" : true,
      "host_restrictions" : ["{{site.exampleIP0}}", "{{site.exampleNetworkSegment1}}"],
      "required_authentication_mode": "AUTHENTICATION_MODE_NONE",
      "user_mapping" : "root",
      "map_to_user": {
        "id_type" : "LOCAL_USER",
        "id_value" : "500"
      }
    },{
      "read_only" : false,
      "host_restrictions" : [ "*.example.com" ],
      "required_authentication_mode": "AUTHENTICATION_MODE_KRB5",
      "user_mapping" : "none"
    },{
      "read_only" : true,
      "host_restrictions" : [],
      "required_authentication_mode": "AUTHENTICATION_MODE_KRB5P",
      "user_mapping" : "all",
      "map_to_user" :{
        "id_type" : "NFS_UID",
        "id_value" : "500"
      },
      "map_to_group": {
        "id_type" : "NFS_GID",
        "id_value" : "501"
      }
    }
  ]
}
```
