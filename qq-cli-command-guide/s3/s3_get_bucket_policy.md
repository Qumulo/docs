---
category: s3
command: s3_get_bucket_policy
optional_options:
- alternate: []
  help: The target bucket for which the access policy will be retrieved
  name: --bucket
  required: false
- alternate: []
  help: Print an example Policy.
  name: --example
  required: false
permalink: /qq-cli-command-guide/s3/s3_get_bucket_policy.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq s3_get_bucket_policy</code>
  command.
synopsis: Retrieve entries of the access policy json stored at `BUCKET`.
title: qq s3_get_bucket_policy
usage: qq s3_get_bucket_policy [-h] [--bucket BUCKET] [--example]
zendesk_source: qq CLI Command Guide

---
For more information, see {{site.xref.adminOnPrem.manageAccessS3}}.

## Examples

### To Retrieve an Access Policy for an S3 Bucket
Run the `qq s3_get_bucket_policy` command, and use the `--bucket` flag to specify the name of your bucket. For example:

```bash
qq s3_get_bucket_policy --bucket MyBucket
```
