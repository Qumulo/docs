---
category: time
command: time_set
optional_options:
- alternate: []
  help: The time source type. For all platforms other than Azure, must be API_TIME_SOURCE_NTP.
    For Azure, can be either API_TIME_SOURCE_NTP or API_TIME_SOURCE_HYPERVISOR.
  name: --source
  required: false
- alternate: []
  help: Use Active Directory controller for NTP.
  name: --set-use-ad
  required: false
- alternate: []
  help: Don't use Active Directory controller for NTP.
  name: --unset-use-ad
  required: false
- alternate: []
  help: Set of NTP servers specified as comma delimited list.
  name: --ntp-servers
  required: false
permalink: /qq-cli-command-guide/time/time_set.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq time_set</code> command.
synopsis: Set time configuration.
title: qq time_set
usage: qq time_set [-h] [--source SOURCE] [--set-use-ad] [--unset-use-ad] [--ntp-servers
  NTP_SERVERS]
zendesk_source: qq CLI Command Guide

---