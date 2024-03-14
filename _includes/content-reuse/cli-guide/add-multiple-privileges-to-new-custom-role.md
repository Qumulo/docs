## To Create a Custom Qumulo Core Role with Multiple Privileges
For this operation, you must use the `qq auth_list_privileges` and `qq auth_create_role` commands.

1. Run the `qq auth_list_privileges` command and use `grep` to write only the privileges that contain the word `WRITE` to the `privileges.txt` file. For example:

   ```bash
   qq auth_list_privileges | \
     grep WRITE > privileges.txt
   ```

2. Run the `qq auth_create_role` command and specify the `privileges.txt` file to create a custom role. For example:

   ```bash
   qq auth_create_role -r "Write-Everything" \
    -d "Can write, create, modify everything" \
    -p all-write-privileges.txt
   ```
