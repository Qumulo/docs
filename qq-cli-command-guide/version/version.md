---
category: version
command: version
optional_options: []
permalink: /qq-cli-command-guide/version/version.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq version</code> command.
synopsis: Print version information
title: qq version
usage: qq version [-h]
zendesk_source: qq CLI Command Guide

---

## Examples

### To Show the Version of Qumulo Core Running on Your Cluster
Run the `qq version` command and specify the IP address of one of the nodes in your cluster. For example:

```bash
qq version --host {{site.exampleIP0}}
```

{{site.exampleOutput}}

```json
{
  "build_date": "2024-02-10T19:50:58Z",
  "build_id": "123456.7.8",
  "flavor": "release",
  "revision_id": "Qumulo Core 8.0.1"
}
```
