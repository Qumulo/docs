---
category: s3
command: s3_modify_bucket
optional_options:
- alternate: []
  help: The name of the bucket to be modified
  name: --name
  required: true
- alternate: []
  help: Suspends object versioning
  name: --suspend-versioning
  required: false
- alternate: []
  help: Enables object versioning
  name: --enable-versioning
  required: false
permalink: /qq-cli-command-guide/s3/s3_modify_bucket.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq s3_modify_bucket</code> command.
synopsis: Modify the settings of the given bucket. Use this command to update the
  bucket versioning state. Using this command to enable anonymous access to a bucket
  has been disabled, use s3_set_bucket_policy instead.
title: qq s3_modify_bucket
usage: qq s3_modify_bucket [-h] --name NAME [--suspend-versioning | --enable-versioning]
zendesk_source: qq CLI Command Guide

---
For more information, see:
* {{site.xref.adminANQ.manageAccessS3}}
* {{site.xref.adminOnPrem.manageAccessS3}}

{% include note.html content="By default, an S3 bucket is in the `Unversioned` state." %}

## Examples

### To Enable Versioning for an S3 Bucket
Run the `qq s3_modify_bucket` command, specify the bucket name, and use the `--enable-versioning` flag. For example:

```bash
qq s3_modify_bucket \
  --name MyBucket \
  --enable-versioning
```

{{site.exampleOutput}} {{site.s3.permissions.timesUTC}}

```json
{
  "creation_time": "2024-05-22T21:42:11.295718303Z",
  "name": "MyBucket",
  "path": "/my-bucket",
  "versioning": "Enabled"
}
```

### To Suspend Versioning for an S3 Bucket
Run the `qq s3_modify_bucket` command, specify the bucket name, and use the `--suspend-versioning` flag.
