## Requirements
A custom root CA certificate from your organization in the `.crt` file format

## To Install a Custom Root Certificate Authority (CA) Certificate from the Command Line
1. Connect to a node in your Qumulo cluster by using SSH.

1. Verify that your certificate is in the PEM format by running the `file *` command.

   {{site.exampleOutput}}

   ```bash
   customRootCACert.crt: PEM certificate
   ```

1. To copy the custom root CA certificate to the container running on the node, use the `machinectl` command. In the following example, `qcore` is the name of the container.

   ```bash
   sudo machinectl \
     copy-to qcore \
     ./customRootCACert.crt \
     /root/customRootCACert.crt
   ```

## To Import a Custom Root Certificate Authority (CA) Certificate from the Command Line
Run the {% include qq.html command="ssl_modify_ca_certificate" %} command. For example:

```bash
qq ssl_modify_ca_certificate \
  -c /root/customRootCACert.crt
```
