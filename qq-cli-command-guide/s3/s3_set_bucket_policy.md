---
category: s3
command: s3_set_bucket_policy
optional_options:
- alternate: []
  help: The target bucket who's policy will be set.
  name: --bucket
  required: true
- alternate: []
  help: The policy file to upload. Use s3_get_bucket_policy --example to get a policy
    template.
  name: --file
  required: true
- alternate: []
  help: Allow the policy set to remove the ability for this user to change the policy.
  name: --allow-remove-self
  required: false
permalink: /qq-cli-command-guide/s3/s3_set_bucket_policy.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq s3_set_bucket_policy</code>
  command.
synopsis: Upload the access policy json stored at --file to --bucket.
title: qq s3_set_bucket_policy
usage: qq s3_set_bucket_policy [-h] --bucket BUCKET --file FILE [--allow-remove-self]
zendesk_source: qq CLI Command Guide

---
For more information, see:
* {{site.xref.adminANQ.manageAccessS3}}
* {{site.xref.adminOnPrem.manageAccessS3}}
  
## Examples

### To Configure an Access Policy for an S3 Bucket
Run the `qq s3_set_bucket_policy` command, use the `--bucket` flag to specify the name of your bucket and the `--file` flag to specify the JSON file with the access policy. For example:

```bash
qq s3_set_bucket_policy --bucket MyBucket --file mypolicy.json
```
