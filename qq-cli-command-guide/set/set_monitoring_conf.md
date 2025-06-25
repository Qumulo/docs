---
category: set
command: set_monitoring_conf
optional_options:
- alternate: []
  help: Enable monitoring service.
  name: --enabled
  required: false
- alternate: []
  help: Disable monitoring service.
  name: --disabled
  required: false
- alternate: []
  help: Enable support VPN.
  name: --vpn-enabled
  required: false
- alternate: []
  help: Disable support VPN.
  name: --vpn-disabled
  required: false
- alternate: []
  help: Specify MQ host name or IP.
  name: --mq-host
  required: false
- alternate: []
  help: Optional MQ service port.
  name: --mq-port
  required: false
- alternate: []
  help: Optional MQ proxy host.
  name: --mq-proxy-host
  required: false
- alternate: []
  help: Optional MQ proxy port.
  name: --mq-proxy-port
  required: false
- alternate: []
  help: Optional S3 proxy host.
  name: --s3-proxy-host
  required: false
- alternate: []
  help: Optional S3 proxy port.
  name: --s3-proxy-port
  required: false
- alternate: []
  help: Optional S3 proxy disable HTTPS.
  name: --s3-proxy-disable-https
  required: false
- alternate: []
  help: Optional Set both MQ and S3 proxy host to HOST.
  name: --all-proxy-host
  required: false
- alternate: []
  help: Optional Set both MQ and S3 proxy port to PORT.
  name: --all-proxy-port
  required: false
- alternate: []
  help: Monitoring poll interval in seconds.
  name: --period
  required: false
- alternate: []
  help: Support VPN host name or IP.
  name: --vpn-host
  required: false
- alternate: []
  help: Enable Nexus monitoring.
  name: --nexus-enabled
  required: false
- alternate: []
  help: Disable Nexus monitoring.
  name: --nexus-disabled
  required: false
- alternate: []
  help: Optional nexus host.
  name: --nexus-host
  required: false
- alternate: []
  help: Optional nexus port.
  name: --nexus-port
  required: false
- alternate: []
  help: Nexus poll interval in seconds.
  name: --nexus-interval
  required: false
permalink: /qq-cli-command-guide/set/set_monitoring_conf.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq set_monitoring_conf</code>
  command.
synopsis: Update monitoring configuration.
title: qq set_monitoring_conf
usage: "qq set_monitoring_conf [-h] [--enabled | --disabled] [--vpn-enabled | --vpn-disabled]\
  \ [--mq-host MQ_HOST] [--mq-port MQ_PORT] [--mq-proxy-host MQ_PROXY_HOST] [--mq-proxy-port\
  \ MQ_PROXY_PORT] [--s3-proxy-host S3_PROXY_HOST]\n    [--s3-proxy-port S3_PROXY_PORT]\
  \ [--s3-proxy-disable-https] [--all-proxy-host HOST] [--all-proxy-port PORT] [--period\
  \ PERIOD] [--vpn-host VPN_HOST] [--nexus-enabled | --nexus-disabled] [--nexus-host\
  \ NEXUS_HOST]\n    [--nexus-port NEXUS_PORT] [--nexus-interval NEXUS_INTERVAL]"
zendesk_source: qq CLI Command Guide

---