---
category: identity
command: identity_attributes_set
keywords: qq, qq_cli, identity_attributes_set
optional_options:
- alternate: []
  help: The home directory for the identity.
  name: --home-directory
  required: true
permalink: /qq-cli-command-guide/identity/identity_attributes_set.html
positional_options:
- help: A name or a SID, optionally qualified with a domain prefix (e.g "local:name",
    "world:Everyone", "ldap_user:name", "ldap_group:name", or "ad:name") or an ID
    type (e.g. "uid:1001", "gid:2001", "auth_id:513", "SID:S-1-1-0").
  name: identifier
  required: true
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq identity_attributes_set</code>
  command.
synopsis: Set attributes related to the given identity.
title: qq identity_attributes_set
usage: qq identity_attributes_set [-h] --home-directory HOME_DIRECTORY identifier

---