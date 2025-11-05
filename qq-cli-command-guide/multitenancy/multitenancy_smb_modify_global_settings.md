---
category: multitenancy
command: multitenancy_smb_modify_global_settings
optional_options:
- alternate:
  - --encryption-mode
  help: Server encryption mode to set
  name: -e
  required: false
- alternate:
  - --supported-dialects
  help: "\n            Specify a space-separated list of SMB dialects that clients\
    \ are permitted to negotiate.\n            To disable SMB, specify -d \"\". Available\
    \ dialects: smb2_dialect_2_002, smb2_dialect_2_1, smb2_dialect_3_0, smb2_dialect_3_11.\n\
    \            Alternatively, use -d ALL to allow all supported dialects.\n    \
    \        "
  name: -d
  required: false
- alternate: []
  help: "\n            Configure share listing to omit shares to which the requesting\
    \ host isn't authorized to\n            connect.\n            "
  name: --hide-shares-from-unauthorized-hosts
  required: false
- alternate: []
  help: "\n            Configure share listing to omit shares to which the requesting\
    \ user isn't authorized to\n            connect. Important: Clients which don't\
    \ have passwordless authentication typically list\n            shares by using\
    \ guest privileges. This flag typically hides all shares from this client\n  \
    \          type.\n            "
  name: --hide-shares-from-unauthorized-users
  required: false
- alternate: []
  help: "\n            When you set this flag to visible, the .snapshot directory\
    \ appears at the root of shares\n            during directory listing operations.\
    \ The .snapshot directory is also accessible by name\n            in any directory.\
    \ When you set this flag to hidden, .snapshot directories do not appear\n    \
    \        in directory listings but remains accessible by name. When you set this\
    \ flag to\n            disabled, .snapshot directories are not accessible and\
    \ snapshots are available only\n            through the Restore Previous Versions\
    \ dialog box on Windows.\n            "
  name: --snapshot-directory-mode
  required: false
- alternate: []
  help: "\n            Enables bypass traverse checking for all users and directories.\
    \ For example, a user who\n            tries to access directory /x/y and has\
    \ permissions to the /x directory but not to the\n            /x/y directory can\
    \ access the /x/y directory. A user still requires permissions to the\n      \
    \      /x directory to view its contents.\n            "
  name: --bypass-traverse-checking
  required: false
- alternate: []
  help: "\n            If the user is not a guest, require all messages to be signed.\
    \ This flag applies to all\n            SMB shares.\n            "
  name: --signing-required
  required: false
permalink: /qq-cli-command-guide/multitenancy/multitenancy_smb_modify_global_settings.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq multitenancy_smb_modify_global_settings</code>
  command.
synopsis: Modify global default SMB settings
title: qq multitenancy_smb_modify_global_settings
usage: "qq multitenancy_smb_modify_global_settings [-h] [-e {none,preferred,required}]\
  \ [-d dialect_1 [dialect_2 ...]] [--hide-shares-from-unauthorized-hosts {true,false}]\
  \ [--hide-shares-from-unauthorized-users {true,false}]\n    [--snapshot-directory-mode\
  \ {visible,hidden,disabled}] [--bypass-traverse-checking {true,false}] [--signing-required\
  \ {true,false}]"
zendesk_source: qq CLI Command Guide

---