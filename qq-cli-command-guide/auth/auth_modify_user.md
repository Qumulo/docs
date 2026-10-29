---
category: auth
command: auth_modify_user
optional_options:
- alternate: []
  help: Name or ID of user to modify
  name: --id
  required: true
- alternate: []
  help: Change user's name
  name: --name
  required: false
- alternate: []
  help: Change the user's primary group
  name: --primary-group
  required: false
- alternate: []
  help: Change the user's NFS uid (or specify "none" to remove)
  name: --uid
  required: false
- alternate: []
  help: Add this user to a group
  name: --add-group
  required: false
- alternate: []
  help: Remove this user from a group
  name: --remove-group
  required: false
- alternate: []
  help: Change the user's home directory path (or specify "none" to remove)
  name: --home-directory
  required: false
- alternate:
  - --password
  help: Change the user password
  name: -p
  required: false
permalink: /qq-cli-command-guide/auth/auth_modify_user.html
positional_options: []
redirect_from:
- /qq-cli-command-guide/auth/auth_mod_user.html
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq auth_modify_user</code> command.
synopsis: Modify a user
title: qq auth_modify_user
<<<<<<< Updated upstream
usage: qq auth_modify_user [-h] --id ID [--name NAME] [--primary-group PRIMARY_GROUP]
  [--uid UID] [--add-group ADD_GROUP] [--remove-group REMOVE_GROUP] [--home-directory
  HOME_DIRECTORY] [-p [PASSWORD]]
=======
usage: "qq auth_modify_user [-h] --id ID [--name NAME] [--primary-group PRIMARY_GROUP]\
  \ [--uid UID] [--add-group ADD_GROUP] [--remove-group REMOVE_GROUP]\n    [--home-directory\
  \ HOME_DIRECTORY] [-p [PASSWORD]]"
>>>>>>> Stashed changes
zendesk_source: qq CLI Command Guide

---