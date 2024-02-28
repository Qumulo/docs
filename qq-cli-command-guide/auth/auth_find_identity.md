---
category: auth
command: auth_find_identity
optional_options:
- alternate: []
  help: Find all external representations for an internal QumuloFS identifier.
  name: --auth-id
  required: false
- alternate: []
  help: Find the auth_id that will be used internally when a UID is written over NFS,
    and any other representations that would produce that auth_id.
  name: --uid
  required: false
- alternate: []
  help: Find the auth_id that will be used internally when a GID is written over NFS,
    and any other representations that would produce that auth_id.
  name: --gid
  required: false
- alternate: []
  help: Find the auth_id that will be used internally when a SID is written over SMB,
    and any other representations that would produce that auth_id.
  name: --sid
  required: false
- alternate: []
  help: Find an auth_id that is uniquely identified by the given name. Names of Active
    Directory users and groups will produce the auth_id that is a representation of
    that principal's SID. AD names may be unqualified, qualified with NetBIOS name
    (e.g. DOMAIN\user), or a universal principal name (e.g. user@domain.example.com).
    Names of LDAP users or groups will produce the auth_id that is a representation
    of that principal's UID or GID.  LDAP names may be either login names, or distinguished
    names (e.g. CN=John Doe,OU=users,DC=example,DC=com). Names of cluster-local users
    and groups will produce the auth_id assigned to that user or group.
  name: --name
  required: false
- alternate: []
  help: Specify which auth_id domain is sought. This can be useful when looking up
    a duplicated name (e.g. if there is an AD user and cluster-local user with the
    same name) to specify which of the identifiers is meant.
  name: --domain
  required: false
- alternate: []
  help: Print result as JSON object.
  name: --json
  required: false
permalink: /qq-cli-command-guide/auth/auth_find_identity.html
positional_options:
- help: A name or a SID, optionally qualified with a domain prefix (e.g "local:name",
    "world:Everyone", "ldap_user:name", "ldap_group:name", or "ad:name") or an ID
    type (e.g. "uid:1001", "gid:2001", "auth_id:513", "SID:S-1-1-0").
  name: identifier
  required: true
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq auth_find_identity</code> command.
synopsis: Find all representations of an auth_id.
title: qq auth_find_identity
usage: "qq auth_find_identity [-h] [--auth-id AUTH_ID] [--uid UID] [--gid GID] [--sid\
  \ SID] [--name NAME] [--domain {LOCAL,WORLD,POSIX_USER,POSIX_GROUP,ACTIVE_DIRECTORY}]\
  \ [--json]\n    [identifier]"
zendesk_source: qq CLI Command Guide

---