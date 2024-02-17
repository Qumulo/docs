---
category: auth
command: auth_add_user
optional_options:
- alternate: []
  help: New user's name (windows style)
  name: --name
  required: true
- alternate: []
  help: name or id of primary group (default is Users)
  name: --primary-group
  required: false
- alternate: []
  help: optional NFS uid
  name: --uid
  required: false
- alternate: []
  help: optional home directory
  name: --home-directory
  required: false
- alternate:
  - --password
  help: Set user password; reads password from terminal if omitted
  name: -p
  required: false
permalink: /qq-cli-command-guide/auth/auth_add_user.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq auth_add_user</code> command.
synopsis: Add a new user
title: qq auth_add_user
usage: qq auth_add_user [-h] --name NAME [--primary-group PRIMARY_GROUP] [--uid UID]
  [--home-directory HOME_DIRECTORY] [-p [PASSWORD]]
zendesk_source: qq CLI Command Guide

---