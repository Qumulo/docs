---
category: s3
command: s3_get_bucket
optional_options:
- alternate: []
  help: The name of the S3 bucket for which to retrieve details
  name: --name
  required: true
permalink: /qq-cli-command-guide/s3/s3_get_bucket.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq s3_get_bucket</code> command.
synopsis: Retrieve details for an S3 bucket
title: qq s3_get_bucket
usage: qq s3_get_bucket [-h] --name NAME
zendesk_source: qq CLI Command Guide

---

## Examples

### To Get Configuration Information for an S3 Bucket
Run the `qq s3_get_bucket` command and use the `--bucket` flag to specify the name of your bucket. For example:

```bash
qq s3_get_bucket_policy --bucket MyBucket
```

{{site.exampleOutput}} {{site.s3.permissions.timesUTC}}

```json
{
  "creation_time": "2022-12-20T19:42:26.833076147Z",
  "name": "MyBucket",
  "path": "/buckets/my-bucket"
}
```
