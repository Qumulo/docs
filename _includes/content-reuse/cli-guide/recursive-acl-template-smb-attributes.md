### To Recursively Add a New ACL with Multithreading
For this operation, you must use the `qq fs_walk_tree` and `qq fs_modify_acl` commands.

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
For this operation, you must use the `qq fs_walk_tree` and `qq fs_modify_acl` commands.

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
For this operation, you must use the `qq fs_walk_tree` and `qq fs_modify_acl` commands.

Run the `qq fs_walk_tree` command and use the `--path` flag to specify the path for the ACL. To extract the path for each item into an array, pipe the command to `jq`. To modify the ACL for each path, pipe the command to `xargs` which in turn runs the `qq fs_set_acl` command on each path.

```bash
qq fs_walk_tree --path /my_path | \
  jq -r '.tree_nodes[].path' | \
    xargs -I % -n1 -P 4 \
      qq fs_file_set_smb_attrs --path % \
        --hidden false
```
