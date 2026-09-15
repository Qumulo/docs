---
category: fs
command: fs_security_replace_key
optional_options:
- alternate:
  - --key
  help: The identifier or name of the key to replace in the key store.
  name: -k
  required: true
- alternate: []
  help: The ECDSA private key file that corresponds to the existing public key.
  name: --old-private-key-file
  required: false
- alternate: []
  help: The ECDSA private key file with which to replace the existing key.
  name: --replacement-private-key-file
  required: false
- alternate: []
  help: The ECDSA public key with which to replace the existing key.
  name: --replacement-public-key
  required: false
- alternate: []
  help: "\n                A signature that you generate when you sign the challenge\
    \ with the existing ECDSA\n                private key.\n                "
  name: --old-key-verification-signature
  required: false
- alternate: []
  help: "\n                A signature that you generate when you sign the challenge\
    \ with the replacement\n                ECDSA private key.\n                "
  name: --replacement-key-verification-signature
  required: false
- alternate: []
  help: Print the output in JSON format. By default, the output is in a table.
  name: --json
  required: false
permalink: /qq-cli-command-guide/fs/fs_security_replace_key.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_security_replace_key</code>
  command.
synopsis: Replace the specified key without affecting the snapshots and snapshot policies
  associated with it.
title: qq fs_security_replace_key
usage: "qq fs_security_replace_key [-h] -k KEY [--old-private-key-file OLD_PRIVATE_KEY_FILE]\
  \ [--replacement-private-key-file REPLACEMENT_PRIVATE_KEY_FILE] [--replacement-public-key\
  \ REPLACEMENT_PUBLIC_KEY]\n    [--old-key-verification-signature OLD_KEY_VERIFICATION_SIGNATURE]\
  \ [--replacement-key-verification-signature REPLACEMENT_KEY_VERIFICATION_SIGNATURE]\
  \ [--json]"
zendesk_source: qq CLI Command Guide

---