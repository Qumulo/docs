---
category: s3
command: s3_abort_upload
optional_options:
- alternate: []
  help: The S3 bucket to which the upload was initiated
  name: --bucket
  required: true
- alternate: []
  help: The identifier of the upload to abort.
  name: --upload-id
  required: true
permalink: /qq-cli-command-guide/s3/s3_abort_upload.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq s3_abort_upload</code> command.
synopsis: Aborts an S3 upload in progress. You can perform this operation on user-initiated
  multipart uploads and system-initiated uploads that the PutObject and CopyObject
  API actions use.
title: qq s3_abort_upload
usage: qq s3_abort_upload [-h] --bucket BUCKET --upload-id UPLOAD_ID
zendesk_source: qq CLI Command Guide

---