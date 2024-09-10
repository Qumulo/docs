---
category: s3
command: s3_set_bucket_policy
optional_options:
- alternate: []
  help: The name of the S3 bucket whose policy is to be configured
  name: --bucket
  required: true
- alternate: []
  help: The access policy file to upload. For an access policy template, use the --example
    flag.
  name: --file
  required: true
- alternate: []
  help: Allow the configured policy to remove the ability to modify itself from the
    current user.
  name: --allow-remove-self
  required: false
permalink: /qq-cli-command-guide/s3/s3_set_bucket_policy.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq s3_set_bucket_policy</code>
  command.
synopsis: Upload the access policy JSON file that the --file flag specifies to the
  S3 bucket name that the --bucket flag specifies.
title: qq s3_set_bucket_policy
usage: qq s3_set_bucket_policy [-h] --bucket BUCKET --file FILE [--allow-remove-self]
zendesk_source: qq CLI Command Guide

---
For more information, see {{site.xref.adminOnPrem.manageAccessS3}}.
  
## Examples

### To Configure an Access Policy for an S3 Bucket
Run the `qq s3_set_bucket_policy` command, use the `--bucket` flag to specify the name of your bucket and the `--file` flag to specify the JSON file with the access policy. For example:

```bash
qq s3_set_bucket_policy --bucket MyBucket --file mypolicy.json
```
