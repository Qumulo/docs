---
category: login
command: login
optional_options:
- alternate:
  - --username
  help: User name
  name: -u
  required: true
- alternate:
  - --password
  help: Password (insecure, visible via ps)
  name: -p
  required: false
permalink: /qq-cli-command-guide/login/login.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq login</code> command.
synopsis: Log in to qfsd to get REST credentials
title: qq login
usage: qq login [-h] -u USERNAME [-p PASSWORD]
zendesk_source: qq CLI Command Guide

---

## Examples

## To Log in to Your Qumulo Cluster
Run the `qq login` command and specify the IP address of one of the nodes in your cluster and your credentials. For example:

```bash
qq login --host {{site.exampleIP0}} \
  -u admin
  -p NW0bJbixtQcQzkq5q4sp
```
