1. To verify that the VPN keys installed correctly, use the `qq` CLI.

   ```bash
   sudo qq get_vpn_keys
   ```

1. Clean up the VPN key files.

   ```bash
   rm /home/admin/*.key && rm /home/admin/*.crt
   ```

1. To retrieve your cluster ID, use the `qq` CLI.

   ```bash
   sudo qq node_state_get
   ```

1. Send the output of the command to Qumulo Care.

1. Use the Web UI to enable Qumulo Care Remote Support.

1. Notify Qumulo Care when this process is complete.

   Qumulo Care helps you test VPN connectivity and adds your cluster to Cloud-Based Monitoring.
