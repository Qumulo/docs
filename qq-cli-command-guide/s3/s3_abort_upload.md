---
category: s3
command: s3_abort_upload
optional_options:
- alternate: []
  help: The bucket in which the upload was initiated.
  name: --bucket
  required: true
- alternate: []
  help: The upload to abort.
  name: --upload-id
  required: true
permalink: /qq-cli-command-guide/s3/s3_abort_upload.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq s3_abort_upload</code> command.
synopsis: Aborts an in-progress S3 upload. This can be applied to both user initiated
  multi-part uploads, and system initiated uploads that are used in PutObject and
  CopyObject actions.
title: qq s3_abort_upload
usage: qq s3_abort_upload [-h] --bucket BUCKET --upload-id UPLOAD_ID
zendesk_source: qq CLI Command Guide

---