---
category: s3
command: s3_bucket_policy_explain_access
optional_options:
- alternate: []
  help: The bucket for which the access policy will be explained.
  name: --bucket
  required: true
- alternate: []
  help: Auth ID of the qumulo user
  name: --auth-id
  required: false
- alternate: []
  help: An unauthenticated S3 user
  name: --anonymous
  required: false
permalink: /qq-cli-command-guide/s3/s3_bucket_policy_explain_access.html
positional_options:
- help: An auth_id, SID, or name optionally qualified with a domain prefix (e.g "local:name",
    "ad:name", "AD\name") or an ID type (e.g. "auth_id:513", "SID:S-1-1-0"). Groups
    are not supported for access keys, must be a user.
  name: identifier
  required: true
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq s3_bucket_policy_explain_access</code>
  command.
synopsis: Details a users access as allowed by the bucket policy
title: qq s3_bucket_policy_explain_access
usage: qq s3_bucket_policy_explain_access [-h] --bucket BUCKET [--auth-id AUTH_ID]
  [--anonymous] [identifier]
zendesk_source: qq CLI Command Guide

---
For more information, see {{site.xref.adminOnPrem.manageAccessS3}}.
