---
category: replication
command: replication_create_object_relationship
optional_options:
- alternate: []
  help: File ID of the qumulo directory
  name: --local-directory-id
  required: false
- alternate: []
  help: Path of the qumulo directory
  name: --local-directory-path
  required: false
- alternate: []
  help: Whether data is to be copied to, or from, the object store.
  name: --direction
  required: true
- alternate: []
  help: "S3-compatible server address. If omitted, Amazon S3 address\n           \
    \     s3.<region>.amazonaws.com will be used."
  name: --object-store-address
  required: false
- alternate: []
  help: "Folder to use in the object store bucket. A slash separator is\n        \
    \        automatically used to specify a folder. For example, a folder \"example\"\
    \n                and a file path (relative to the directory_path) \"dir/file\"\
    \ results in\n                key \"example/dir/file\". Use empty value \"\" or\
    \ \"/\" to replicate with\n                the root of the bucket."
  name: --object-folder
  required: true
- alternate: []
  help: "HTTPS port to use when communicating with the object store\n            \
    \    (default: 443)"
  name: --use-port
  required: false
- alternate: []
  help: "Path to a file containing the public certificate of the certificate\n   \
    \             authority to trust for connections to the object store, in PEM format.\n\
    \                If not specified, the built-in trusted public CAs are used."
  name: --ca-certificate
  required: false
- alternate: []
  help: Bucket in the object store to use for this relationship
  name: --bucket
  required: true
- alternate: []
  help: "Addressing style for requests to the bucket. Set to\n                BUCKET_STYLE_PATH\
    \ for path-style addressing or\n                BUCKET_STYLE_VIRTUAL_HOSTED for\
    \ virtual hosted-style (the default).\n                For Amazon S3, virtual\
    \ hosted-style is recommended as path-style will be\n                deprecated.\
    \ Bucket names containing dots (\".\") or characters that are\n              \
    \  not valid in domain names may require path-style.\n                The object-store-address\
    \ should not include the bucket name, regardless\n                of addressing\
    \ style."
  name: --bucket-addressing-style
  required: false
- alternate: []
  help: Region the bucket is located in, e.g., us-west-2
  name: --region
  required: true
- alternate: []
  help: Access key ID to use when communicating with the object store
  name: --access-key-id
  required: true
- alternate: []
  help: Secret access key to use when communicating with the object store
  name: --secret-access-key
  required: false
permalink: /qq-cli-command-guide/replication/replication_create_object_relationship.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq replication_create_object_relationship</code>
  command.
synopsis: "\n    Create an object replication relationship that initiates a copy of\
  \ file data to or\n    from S3.\n    "
title: qq replication_create_object_relationship
usage: "qq replication_create_object_relationship [-h] (--local-directory-id LOCAL_DIRECTORY_ID\
  \ | --local-directory-path LOCAL_DIRECTORY_PATH) --direction {COPY_TO_OBJECT,COPY_FROM_OBJECT}\
  \ [--object-store-address OBJECT_STORE_ADDRESS] --object-folder\n    OBJECT_FOLDER\
  \ [--use-port USE_PORT] [--ca-certificate CA_CERTIFICATE] --bucket BUCKET [--bucket-addressing-style\
  \ {BUCKET_STYLE_PATH,BUCKET_STYLE_VIRTUAL_HOSTED}] --region REGION --access-key-id\n\
  \    ACCESS_KEY_ID [--secret-access-key SECRET_ACCESS_KEY]"
zendesk_source: qq CLI Command Guide

---