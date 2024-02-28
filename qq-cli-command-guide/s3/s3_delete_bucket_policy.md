---
category: s3
command: s3_delete_bucket_policy
optional_options:
- alternate: []
  help: The target bucket for which the access policy will be removed.
  name: --bucket
  required: true
permalink: /qq-cli-command-guide/s3/s3_delete_bucket_policy.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq s3_delete_bucket_policy</code>
  command.
synopsis: Remove the access policy stored at `BUCKET`.
title: qq s3_delete_bucket_policy
usage: qq s3_delete_bucket_policy [-h] --bucket BUCKET
zendesk_source: qq CLI Command Guide

---
For more information, see:
* {{site.xref.adminANQ.manageAccessS3}}
* {{site.xref.adminOnPrem.manageAccessS3}}

## Examples

### To Delete an Access Policy for an S3 Bucket
{% include important.html content="This command removes any existing access policy restrictions." %}

Run the `qq s3_delete_bucket_policy` command and use the `--bucket` flag to specify the name of your S3 bucket. For example:

```bash
qq s3_delete_bucket_policy --bucket MyBucket
```
