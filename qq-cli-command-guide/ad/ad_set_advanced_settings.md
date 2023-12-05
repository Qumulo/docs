---
category: ad
command: ad_set_advanced_settings
keywords: qq, qq_cli, ad_set_advanced_settings
optional_options:
- alternate: []
  help: Configure DCERPC signing to be off, prefer signing, or require signing. The
    default is to prefer signing.
  name: --signing
  required: false
- alternate: []
  help: Configure DCERPC sealing to be off, prefer sealing, or require sealing. The
    default is to prefer sealing.
  name: --sealing
  required: false
- alternate: []
  help: Configure DCERPC to not use encryption, prefer AES encryption, or require
    AES encryption. The default is to prefer AES encryption.
  name: --crypto
  required: false
permalink: /qq-cli-command-guide/ad/ad_set_advanced_settings.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq ad_set_advanced_settings</code>
  command.
synopsis: Modify advanced Active Directory settings
title: qq ad_set_advanced_settings
usage: "qq ad_set_advanced_settings [-h] [--signing {off,prefer,require}] [--sealing\
  \ {off,prefer,require}]\n    [--crypto {off,prefer,require}]"

---