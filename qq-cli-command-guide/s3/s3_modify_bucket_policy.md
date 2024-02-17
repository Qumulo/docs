---
category: s3
command: s3_modify_bucket_policy
optional_options:
- alternate: []
  help: The bucket who's policy will be modified.
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