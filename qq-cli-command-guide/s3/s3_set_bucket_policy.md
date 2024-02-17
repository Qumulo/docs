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