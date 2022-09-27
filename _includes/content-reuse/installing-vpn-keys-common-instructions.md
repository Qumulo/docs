1. To log in to your cluster, use the `qq` CLI and specify your cluster's IP address. For example:

   ```bash
   qq --host 203.0.113.1 login
   ```
    
   {% include note.html content="Your user must have `PRIVILEGE_SUPPORT_WRITE` and `PRIVILEGE_SUPPORT_READ`." %}

1. To install the VPN keys on your cluster, specify your cluster's IP address and the path to the directory that contains the VPN keys. For example:

   ```bash
   qq --host 203.0.113.1 install_vpn_keys /my/path
   ```
    
1. To verify that the VPN keys installed correctly, use the `get_vpn_keys` command. For example:

   ```bash
   qq --host 203.0.113.1 get_vpn_keys
   ```

1. Remove any copies of the VPN key files.
