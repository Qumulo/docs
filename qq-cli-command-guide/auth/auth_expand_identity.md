---
category: auth
command: auth_expand_identity
optional_options:
- alternate: []
  help: The canonical identifier used internally by QumuloFS.
  name: --auth-id
  required: false
- alternate: []
  help: An NFS UID
  name: --uid
  required: false
- alternate: []
  help: An NFS GID
  name: --gid
  required: false
- alternate: []
  help: An SMB SID
  name: --sid
  required: false
- alternate: []
  help: A local, AD, or LDAP name. AD names may be unqualified, qualified with NetBIOS
    name (e.g. DOMAIN\user), or a universal principal name (e.g. user@domain.example.com).
    LDAP names may be either login names, or distinguished names (e.g. CN=John Doe,OU=users,DC=example,DC=com).
    Names of cluster-local users and groups may qualified with the cluster name (e.g.
    cluster\user).
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
- alternate: []
  help: Print QFSD Access Tokens and S3 Access Keys associated with the user.
  name: --show-access-tokens
  required: false
permalink: /qq-cli-command-guide/auth/auth_expand_identity.html
positional_options:
- help: A name or a SID, optionally qualified with a domain prefix (e.g "local:name",
    "world:Everyone", "ldap_user:name", "ldap_group:name", or "ad:name") or an ID
    type (e.g. "uid:1001", "gid:2001", "auth_id:513", "SID:S-1-1-0").
  name: identifier
  required: true
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq auth_expand_identity</code>
  command.
synopsis: Find equivalent identities and full group membership.
title: qq auth_expand_identity
usage: qq auth_expand_identity [-h] [--auth-id AUTH_ID] [--uid UID] [--gid GID] [--sid
  SID] [--name NAME] [--domain {LOCAL,WORLD,POSIX_USER,POSIX_GROUP,ACTIVE_DIRECTORY}]
  [--json] [--show-access-tokens] [identifier]
zendesk_source: qq CLI Command Guide

---