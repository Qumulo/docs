---
category: s3
command: s3_modify_bucket_policy
optional_options:
- alternate: []
  help: The name of the S3 bucket whose access policy is to be modified
  name: --bucket
  required: true
- alternate: []
  help: Allow the policy set to remove the ability for this user to change the policy.
  name: --allow-remove-self
  required: false
permalink: /qq-cli-command-guide/s3/s3_modify_bucket_policy.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq s3_modify_bucket_policy</code>
  command.
synopsis: Modify the access policy for --bucket.
title: qq s3_modify_bucket_policy
usage: qq s3_modify_bucket_policy [-h] --bucket BUCKET [--allow-remove-self] {delete_statement,append_statement,modify_statement}
  ...
zendesk_source: qq CLI Command Guide

---
For more information, see {{site.xref.adminOnPrem.manageAccessS3}}.

## Examples

### To Modify a Statement in an Access Policy for an S3 Bucket
Run the `qq s3_modify_bucket_policy` command and use the `--bucket` flag to specify the name of the S3 bucket. For the `modify_statement` subcommand:

* Use the `--index` flag to specify the index of the statement to modify.
* Use the `--type` flag to specify the statement type.
* Use the `--sid` flag to specify the security identifier.
* Use the `--new-principals` flag to specify a comma-separated list of principals (with which to replace the existing ones), enclosed in quotation marks (`"`).
* Use the `--new-actions` flag to specify a comma-separated list of S3 API actions (with which to replace the existing ones), enclosed in quotation marks (`"`).

For example:

```bash
qq s3_modify_bucket_policy --bucket AnotherBucket \
  modify_statement --index 1 \
    --type Deny \
    --sid DenyGuest \
    --new-principals "Authenticated Users" \
    --new-actions "s3:PutBucketPolicy"
```

### To Append a Statement to an Access Policy for an S3 Bucket
Run the `qq s3_modify_bucket_policy` command and use the `--bucket` flag to specify the name of the S3 bucket. For the `append_statement` subcommand:

* Use the `--type` flag to specify the statement type.
* Use the `--sid` flag to specify the security identifier.
* Use the `--principals` flag to specify a comma-separated list of principals, enclosed in quotation marks (`"`).
* Use the `--actions` flag to specify a comma-separated list of S3 API actions, enclosed in quotation marks (`"`).

For example:

```bash
qq s3_modify_bucket_policy --bucket MyBucket \
  append_statement --type Allow \
    --sid AllowGuest \
    --principals "local:guest,local:Mary" \
    --actions "s3:GetBucketPolicy,s3:AbortMultipartUpload"
```

### To Delete a Statement from an Access Policy for an S3 Bucket
Run the `qq s3_modify_bucket_policy` command and use the `--bucket` flag to specify the name of the S3 bucket. For the `delete_statement` subcommand, use the `--index` flag to specify the index of the statement to delete. For example:

```bash
qq s3_modify_bucket_policy --bucket MyBucket \
  delete_statement --index 2
```
