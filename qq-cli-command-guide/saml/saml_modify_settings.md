---
category: saml
command: saml_modify_settings
optional_options:
- alternate:
  - -d
  help: Disable authentication via SAML
  name: --disable
  required: false
- alternate:
  - -e
  help: Enable authentication via SAML
  name: --enable
  required: false
- alternate: []
  help: Sets the cluster's configured IDP SSO URL.
  name: --idp-sso-url
  required: false
- alternate: []
  help: Sets the cluster's configured IDP public key with the given value in PEM format.
  name: --idp-certificate
  required: false
- alternate: []
  help: Sets the cluster's configured IDP public key from a PEM file.
  name: --idp-certificate-file
  required: false
- alternate: []
  help: Sets the URI for the IDP this cluster trusts to authenticate users via SAML.
  name: --idp-entity-id
  required: false
- alternate: []
  help: Sets the cluster's configured DNS name (must be FQDN).
  name: --cluster-dns-name
  required: false
- alternate: []
  help: If set, requires SSO for Active Directory (AD) users to be able to manage
    this cluster. The cluster rejects password-based authentication from AD users
    of the Web UI, qq CLI, and REST API. This setting does not restrict access over
    file protocols such as SMB.
  name: --require-sso
  required: false
permalink: /qq-cli-command-guide/saml/saml_modify_settings.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq saml_modify_settings</code>
  command.
synopsis: Modify cluster SAML configuration
title: qq saml_modify_settings
usage: "qq saml_modify_settings [-h] [--disable | --enable] [--idp-sso-url IDP_SSO_URL]\
  \ [--idp-certificate IDP_CERTIFICATE | --idp-certificate-file IDP_CERTIFICATE_FILE]\
  \ [--idp-entity-id IDP_ENTITY_ID] [--cluster-dns-name CLUSTER_DNS_NAME]\n    [--require-sso\
  \ {true,false}]"
zendesk_source: qq CLI Command Guide

---