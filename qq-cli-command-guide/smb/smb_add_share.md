---
category: smb
command: smb_add_share
optional_options:
- alternate: []
  help: The ID of the tenant to which to add the share.
  name: --tenant-id
  required: false
- alternate: []
  help: Name of share.
  name: --name
  required: true
- alternate: []
  help: File system path.
  name: --fs-path
  required: true
- alternate: []
  help: Description of this share.
  name: --description
  required: false
- alternate: []
  help: Enable Access-Based Enumeration for this share.
  name: --access-based-enumeration-enabled
  required: false
- alternate: []
  help: Creates the specified file system path if the path does not exist already.
  name: --create-fs-path
  required: false
- alternate: []
  help: "\n                Change the default POSIX file create mode bits (octal)\
    \ for the specified SMB share.\n                These mode bits are applied to\
    \ new files as they are created. Note: If an\n                inheritable ACE\
    \ is present in the permissions ACL, this flag has no effect.\n              \
    \  "
  name: --default-file-create-mode
  required: false
- alternate: []
  help: "\n                Change the default POSIX directory create mode bits (octal)\
    \ for the specified SMB\n                share. These mode bits are applied to\
    \ new directories as they are created. Note: If\n                an inheritable\
    \ ACE is present in the permissions ACL, this flag has no effect.\n          \
    \      "
  name: --default-directory-create-mode
  required: false
- alternate: []
  help: "\n                Require encryption for all traffic for the specified share.\
    \ When set to true,\n                clients without encryption capability cannot\
    \ connect to this share.\n                "
  name: --require-encryption
  required: false
- alternate: []
  help: Print the raw JSON response.
  name: --json
  required: false
- alternate: []
  help: Grant no access.
  name: --no-access
  required: false
- alternate: []
  help: Grant everyone except guest read-only access.
  name: --read-only
  required: false
- alternate: []
  help: Grant everyone except guest full access.
  name: --all-access
  required: false
- alternate: []
  help: "\n            Grant read access to the specified trustees. For example: Everyone,\
    \ uid:1000, gid:1001,\n            sid:S-1-5-2-3-4, auth_id:500\n            "
  name: --grant-read-access
  required: false
- alternate: []
  help: Grant read-write access to these trustees.
  name: --grant-read-write-access
  required: false
- alternate: []
  help: Grant all access to these trustees.
  name: --grant-all-access
  required: false
- alternate: []
  help: Deny all access to these trustees.
  name: --deny-access
  required: false
- alternate: []
  help: "\n            The host addresses or subnet ranges for which access to to\
    \ this share are not limited by\n            network permissions. Access may still\
    \ be limited by share and file permissions.\n            "
  name: --full-control-hosts
  required: false
- alternate: []
  help: Address ranges which should be permitted read-only access at most.
  name: --read-only-hosts
  required: false
- alternate: []
  help: "\n            The host addresses or subnet ranges for which access to the\
    \ specified share is denied,\n            regardless of other permissions. Important:\
    \ Because using this flag alone results in all\n            hosts being denied,\
    \ use the correct --full-control-hosts or --read-only-hosts flags as\n       \
    \     necessary.\n            "
  name: --deny-hosts
  required: false
- alternate: []
  help: "\n            Deny all access to this share. Important: To avoid configuration\
    \ issues, do not apply\n            this flag alongside any others.\n        \
    \    "
  name: --deny-all-hosts
  required: false
permalink: /qq-cli-command-guide/smb/smb_add_share.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq smb_add_share</code> command.
synopsis: Add a new SMB share
title: qq smb_add_share
usage: "qq smb_add_share [-h] [--tenant-id TENANT_ID] --name NAME --fs-path FS_PATH\
  \ [--description DESCRIPTION] [--access-based-enumeration-enabled {true,false}]\
  \ [--create-fs-path] [--default-file-create-mode DEFAULT_FILE_CREATE_MODE]\n   \
  \ [--default-directory-create-mode DEFAULT_DIRECTORY_CREATE_MODE] [--require-encryption\
  \ {true,false}] [--json] [--no-access | --read-only | --all-access] [--grant-read-access\
  \ TRUSTEE [TRUSTEE ...]]\n    [--grant-read-write-access TRUSTEE [TRUSTEE ...]]\
  \ [--grant-all-access TRUSTEE [TRUSTEE ...]] [--deny-access TRUSTEE [TRUSTEE ...]]\
  \ [--full-control-hosts IP/RANGE [IP/RANGE ...]] [--read-only-hosts IP/RANGE [IP/RANGE\
  \ ...]]\n    [--deny-hosts IP/RANGE [IP/RANGE ...]] [--deny-all-hosts]"
zendesk_source: qq CLI Command Guide

---
For more information, see {{site.xref.adminOnPrem.usingSMBhostRestrict}}.

## Examples

### To Create an SMB Share with Host Restrictions
{% capture sameFlags %}{{site.xref.smbCLI.addModSameFlag}}{% endcapture %}
{% include note.html content=sameFlags %}

Run the `qq smb_add_share` command and {{site.xref.smbCLI.addModCommand}} In the following example, Qumulo Core grants hosts {{site.exampleIP42}} and {{site.exampleIP84}} full control, all hosts in {{site.exampleNetworkSegment1}} read-only access, and denies all other hosts.

```bash
qq smb_add_share --fs-path / \
  --name my-share \
  --all-access \
  --full-control-hosts {{site.exampleIP42}} {{site.exampleIP84}} \
  --read-only-hosts {{site.exampleNetworkSegment1}}
```

{{site.exampleOutput}}

```
ID: 3
Name: share
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
ID Trustee                    Type    Rights 
== ========================== ======= ===============================
1  {{site.exampleNetworkSegment1}}             Denied  Write, Change permissions 
2  {{site.exampleNetworkSegment1}}              Allowed Read 
3  {{site.exampleIP42}}, {{site.exampleIP84}} Allowed Read, Write, Change permissions
```
