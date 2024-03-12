---
category: fs
command: fs_modify_acl
optional_options:
- alternate: []
  help: File path
  name: --path
  required: false
- alternate: []
  help: File ID
  name: --id
  required: false
- alternate: []
  help: Print the raw JSON response.
  name: --json
  required: false
permalink: /qq-cli-command-guide/fs/fs_modify_acl.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_modify_acl</code> command.
synopsis: Modify file ACL
title: qq fs_modify_acl
usage: qq fs_modify_acl [-h] (--path PATH | --id ID) [--json] {add_entry,remove_entry,modify_entry,set_posix_special_permissions}
  ...
zendesk_source: qq CLI Command Guide
varCreateACL: "Run the `qq fs_modify_acl` command and use the `--path` flag to specify the path for the ACL."
---

## Examples
The following examples show how to use the `qq fs_modify_acl` command to work with access control lists (ACLs).

### To Create a New ACL
{{page.varCreateACL}} For the `add_entry` subcommand:

* Use the `-t` flag to specify a trustee.
* Use the `-y` flag to specify `Allowed` or `Denied`.
* Use the `-r` flag to specify the rights.
  {% include tip.html content="For full control, specify `-r All`." %}
* Use the `-f` flag to specify ACL flags.
  {% capture newFiles %}To ensure that the ACL applies to newly created files automatically, specify `"Object inherit" "Container inherit"`.{% endcapture %}
  {% include note.html content=newFiles %}

For example:

```bash
qq fs_modify_acl --path /my_path \
  add_entry -t "MYDOMAIN\\my_username" \
    -y Allowed \
    -r "Execute/Traverse" "Read" \
    -f "Object inherit" "Container inherit"
```

```bash
qq fs_modify_acl --path /my_path \
  add_entry -t "uid:5005" \
    -y Allowed \
    -r "Execute/Traverse" "Read" \
    -f "Object inherit" "Container inherit"
```

```bash
qq fs_modify_acl --path /my_path \
  add_entry -t "gid:5005" \
    -y Allowed \
    -r "Execute/Traverse" "Read" \
    -f "Object inherit" "Container inherit"
```

### To Modify an Existing ACL
{{page.varCreateACL}} For the `modify_entry` subcommand:

* Use the `--old-trustee` flag to specify the existing trustee.
* Use the `--new-rights` flag to specify new rights to assign to the trustee.

For example:

```bash
qq fs_modify_acl --path /my_path \
  modify_entry --old-trustee Everyone \
    --new-rights=Read
```

```bash
qq fs_modify_acl --path=/my_path \
  modify_entry --old-trustee Everyone \
    --new-rights=All
```

### To Remove an Existing ACL or Its Elements
{{page.varCreateACL}}

* To remove a single trustee from an ACL, for the `remove_entry` subcommand use the `--trustee` flag to specify the trustee to remove. For example:

  ```bash
  qq fs_modify_acl --path /my_path \
    remove_entry --trustee="DOMAIN\\myusername"

* To remove a specific position from an ACL, for the `remove_entry` subcommand use the `-p` flag to specify the position number. For example:

  ```bash
  qq fs_modify_acl --path /my_path \
    remove_entry -p 42
  ```

* To remove all ACLs, for the `remove_entry` subcommand use the `-a` flag.

### To Recursively Add a New ACL with Multithreading
{% include note.html content="For very large directories, we recommend running the following command [in a screen session](https://linuxize.com/post/how-to-use-linux-screen/)." %}

1. Ensure that the `jq` utility is installed on your system.

1. Run the `qq fs_walk_tree` command and use the `--path` flag to specify the path for the ACL. To extract the path for each item into an array, pipe the command to `jq`. To modify the ACL for each path, pipe the command to `xargs` which in turn runs the `qq fs_set_acl` command on each path. For example:

   ```bash
   qq fs_walk_tree --path /my_path | \
     jq -r '.tree_nodes[].path' | \
       xargs -d '\n' -I % -n1 -P 4 \
         qq fs_modify_acl --path '%' \
           add_entry -t "DOMAIN\my_username" \
             -y Allowed \
             -r "Read" "Execute/Traverse" \
             -f "Object inherit" "Container inherit"
   ```

### To Recursively Apply a Permissions Template
Performing a permission repair operation ensures consistent access controls across your file system.

{% include important.html content="Before deploying permissions changes in a production environment, we strongly recommend performing a dry run on a test directory." %}

1. Ensure that the `jq` utility is installed on your system.

1. Use a new or existing file with the necessary permissions to capture the ACL and save it in JSON format by using the `qq fs_get_acl` command. For example:
   
   ```bash
   qq fs_get_acl --path /path_to_acl_source \
     --json >/history/new_permissions.json
   ```

1. To apply the captured ACL, run the `qq fs_walk_tree` command and use the `--path` flag to specify the path for the ACL. To extract the path for each item into an array, pipe the command to `jq`. To modify the ACL for each path, pipe the command to `xargs` which in turn runs the `qq fs_set_acl` command on each path.

   ```bash
   qq fs_walk_tree --path /my_target_path | \
     jq -r '.tree_nodes[].path' | \
       xargs -I % -n1 -P 4 \
         qq fs_set_acl --path '%' \
           --file /history/new_permissions.json >> &>/dev/null
   ```

### To Recursively Modify SMB Attributes
Run the `qq fs_walk_tree` command and use the `--path` flag to specify the path for the ACL. To extract the path for each item into an array, pipe the command to `jq`. To modify the ACL for each path, pipe the command to `xargs` which in turn runs the `qq fs_set_acl` command on each path.

```bash
qq fs_walk_tree --path /my_path | \
  jq -r '.tree_nodes[].path' | \
    xargs -I % -n1 -P 4 \
      qq fs_file_set_smb_attrs --path % \
        --hidden false
```
