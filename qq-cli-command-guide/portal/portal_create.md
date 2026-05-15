---
category: portal
command: portal_create
optional_options:
- alternate: []
  help: The full path to the directory that serves as the spoke portal root directory.
    Qumulo Core creates this directory for you automatically. If this directory exists
    already, the system outputs an error.
  name: --spoke-root
  required: false
- alternate: []
  help: The full path to the prospective directory that will serve as the hub portal
    root directory
  name: --hub-root
  required: false
- alternate:
  - --json
  help: Pretty-print JSON
  name: -j
  required: false
- alternate:
  - --read-only-spoke
  help: 'Create a read-only spoke portal. Read-only spoke portals prevent users from
    creating or modifying files or directories under the hub portal root directory.
    Important: It isn''t possible to change a read-only spoke portal to a read-write
    portal after creating it.'
  name: -r
  required: false
- alternate:
  - --no-paths
  help: Do not attempt to resolve file IDs present on the local cluster to paths.
  name: -n
  required: false
- alternate:
  - --hub-hosts
  help: The IP addresses and TCP ports of the remote cluster. Use a comma-delimited
    list to specify multiple hosts. Use colon as a separator after each IP address
    to provide custom TCP port (3713 is used by default). Ports specified this way
    override other --port arguments.
  name: -m
  required: false
- alternate:
  - --hub-address
  help: The IP address of a node in the remote cluster
  name: -a
  required: false
- alternate:
  - --hub-port
  help: The TCP port for portal activity on the remote cluster. The default port 3713
    is used if this field is not provided.
  name: -p
  required: false
permalink: /qq-cli-command-guide/portal/portal_create.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq portal_create</code> command.
synopsis: Create a spoke portal on the current cluster and propose a hub portal on
  another cluster
title: qq portal_create
usage: qq portal_create [-h] [--spoke-root SPOKE_ROOT] [--hub-root HUB_ROOT] [-j]
  [-r] [-n] (-m HUB_HOSTS | -a HUB_ADDRESS) [-p HUB_PORT]
zendesk_source: qq CLI Command Guide

---

## Example
### To Propose an Initial Portal Relationship
Run the {% include qq.html command="portal_create" %} command and specify the spoke portal root directory, the proposed hub portal root directory on that cluster, and the IP addresses of the nodes in the remote cluster.

{{site.data.alerts.important}}
<ul>
  <li>{{ site.gns.qqPortalCreate }}</li>
  <li>{{ site.gns.doNotBreakIPlist}} </li>
</ul>
{{site.data.alerts.end}}

For example:

```bash
qq portal_create \
  --spoke-root /remote/projects \
  --hub-address {{site.exampleIP0}} \
  --hub-root /projects
  --hub-root /projects \
  --hub-hosts {{site.exampleIP1}},{{site.exampleIP2}},{{site.exampleIP3}},{{site.exampleIP4}}
 ```
