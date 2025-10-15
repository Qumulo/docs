---
category: authoritative
command: authoritative_dns_modify_settings
optional_options:
- alternate: []
  help: The fully qualified domain name (FQDN) for the Qumulo Authoritative DNS server.
  name: --fqdn
  required: false
- alternate: []
  help: Enable the Qumulo Authoritative DNS server
  name: --enable
  required: false
- alternate: []
  help: Disable the Qumulo Authoritative DNS server
  name: --disable
  required: false
- alternate: []
  help: The list of IP addresses that can query the Qumulo Authoritative DNS server
  name: --host-restrictions
  required: false
- alternate: []
  help: Allow all IP addresses to query the Qumulo Authoritative DNS server
  name: --disable-host-restrictions
  required: false
permalink: /qq-cli-command-guide/authoritative/authoritative_dns_modify_settings.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq authoritative_dns_modify_settings</code>
  command.
synopsis: Configure settings for Qumulo Authoritative DNS server
title: qq authoritative_dns_modify_settings
usage: "qq authoritative_dns_modify_settings [-h] [--fqdn FQDN] [--enable] [--disable]\n\
  \    [--host-restrictions HOST_RESTRICTIONS [HOST_RESTRICTIONS ...]]\n    [--disable-host-restrictions]"
zendesk_source: qq CLI Command Guide

---