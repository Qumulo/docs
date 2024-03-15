---
category: smb
command: smb_list_share
optional_options:
- alternate: []
  help: ID of share to list.
  name: --id
  required: false
- alternate: []
  help: Name of share to list.
  name: --name
  required: false
- alternate: []
  help: ID of the tenant to get the share from. Only used if using the --name argument.
  name: --tenant-id
  required: false
- alternate: []
  help: Print the raw JSON response.
  name: --json
  required: false
permalink: /qq-cli-command-guide/smb/smb_list_share.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq smb_list_share</code> command.
synopsis: List a share
title: qq smb_list_share
usage: qq smb_list_share [-h] (--id ID | --name NAME) [--tenant-id TENANT_ID] [--json]
zendesk_source: qq CLI Command Guide

---
For more information, see:
* {{site.xref.adminANQ.usingSMBhostRestrict}}
* {{site.xref.adminOnPrem.usingSMBhostRestrict}}

## Examples

### To View Existing SMB Share Host Restrictions
Run the `qq smb_list_share` command and specify the share ID. For example:

```bash
qq smb_list_share --id 4
```

{{site.exampleOutput}}

```
ID: 4
Name: share2
Path: /
Description:
Access Based Enumeration: False
Encryption Required: False
Default File Create Mode: 0644
Default Directory Create Mode: 0755

Permissions:
ID Trustee  Type    Rights 
== ======== ======= ===============================
1  Everyone Allowed Read, Write, Change permissions

Network Permissions:
ID Trustee        Type    Rights 
== ============== ======= ===============================
1  {{site.exampleNetworkSegment1}} Allowed Read, Write, Change permissions
```
