---
title: "User Defined Metadata in Qumulo Core"
summary: "This section documents User Defined Metadata Qumulo Core."
permalink: /administrator-guide/user-metadata.html
sidebar: administrator_guide_sidebar
keywords: metadata
---

## What is User Defined Metadata

User defined metadata is metadata that can be added to any file type stored by a Qumulo Core system,
and is composed of user specified key-value pairs. The key is required to be a unicode string, and
the value is a sequence of bytes. The total size of each key-value pair is required to be not more
than 400KB, and each file has a key space that allows a large number of key-value pairs
(approximately 17 trillion).

### Keyspaces

User defined metadata in Qumulo Core is divided into two separate keyspaces. These are referred to
as `GENERIC` and `S3`. This distinction is mostly to support the S3 API, which is required to have
two sets of metadata in separate keyspaces. It is required that, within a keyspace, all keys used in
a key-value pair are unique. In order to access or create a user defiend metadata entry, the
keyspace and key need to be specified. Keyspaces could be thought of as buckets of key-value pairs.

## Working with User Defined Metadata

User defined metadata is currently supported in the S3 and REST APIs in Qumulo Core, with qq
commands. In order to read the user defined metadata of file, you will need to have the READ_EA
privilege on the file. In order to write or delete the user defined metadata of a file, you will
require the WRITE_EA privilege.

### User Defined Metadata via qq

All `qq` commands will default to using the `GENERIC` keyspace. Use the `--s3` option to access the
S3 keyspace.

As per all qq commands, either the path of the file can be specified with the `--path` option, or
the file ID can be specified with the `--id` option.

#### Setting User a Defined Metadata entry

To set user defined metadata on a file, use the `fs_set_user_metadata` qq command, for example:

  ```bash
  $ qq fs_set_user_metadata \
    --path my-file --key my-key --value my-value
  ```

This will add a key-value pair to the file `my-file`, with key `my-key` and value `my-value` in the
`GENERIC` keyspace. Add the `--s3` flag to put the metadata into the `S3` keyspace. To specify a
non-text value for the user defined metadata, use either the `--base64-value` or `--hex-value`
options. For example:

  ```bash
  $ qq fs_set_user_metadata \
    --path my-file --key my-key --hex-value A1B2C3D4 --s3
  ```

This will create a key-value pair with key `my-key` and hexdecimal value A1B2C3D4 in the `S3`
keyspace of file `my-file`.

#### Deleting a User Defined Metadata entry

To delete a user defined metadata entry on a file, use the `fs_delete_user_metadata` qq command, for example:

  ```bash
  $ qq fs_delete_user_metadata \
    --path my-file --key my-key
  ```

This will delete a key-value pair with key `my-key` from file `my-file` in the `GENERIC` keyspace,
if such a key exists. Add the `--s3` flag to remove a value from the S3 keyspace.

#### Listing User Defined Metadata

To list all user defined metadata for a file, use the `fs_list_user_metadata` qq command. For
example:

  ```bash
  $ qq fs_list_user_metadata --path my-file
  ```

This will list all user defined metadata in the `GENERIC` keyspace of the head version of file `my-file` in a
tabular format. It is assumed that values can be utf-8 encoded. If you wish to display values in
hex or base64 format, add the `--hex` or `--base64` flags. If you wish to display the user defined
metadata in snapshot of the file, use the `--snapshot` flag with the id of the snapshot.

#### Getting a User Defined Metadata entry

To retrive a single user defined metadata value, use the `fs_get_user_metadata` qq command, for
example:

  ```bash
  $ qq fs_get_user_metadata --path my-file --key my-key
  ```

This will return the value of the metadata entry of head version of file `my-file` with key `my-key`
in the `GENERIC` keyspace. As per the `fs_list_user_metadata` command, the value will be displayed
`utf-8` encoded if possible. If you wish to display this in hex or base64 format, add the `--hex` or
`--base64` flags. If you wish to access the metadata in snapshot of the file, use the `--snapshot`
flag with the id of the snapshot.

### User Defined Metadata via S3 API

S3 defines two types of user defined metadata, one type that is immutable for the life of the
objecti (generally referred to as metadata by the S3 API), and another (called tags) that is mutable
and will not impact the object etag. In Qumulo Core, tags are mapped to the `GENERIC` keyspace,
whilst immutable metadata is mapped to the `S3` keyspace.

{% include important.html content="Tags values are required to be utf-8 encodable." %}

Consult the S3 API documentation, or the documentation of your S3 client for how to access metadata
via the S3 API. The Qumulo Core S3 API has full support for user defined metadata from version 6.3.2
and later.
