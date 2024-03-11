## Requirements

* An SSL certificate based on your certificate signing request (CSR) file from your certificate authority (CA)

* A CA-bundle PEM chain in the following order:

  * Your certificate

  * The intermediate CA

  * The root CA

## To Install a Signed SSL Certificate on a Qumulo Cluster from the Command Line

1. Verify that your certificate and the CA-bundle are in the PEM format by running the `file *` command.

   {{site.commandOutput}}

   ```bash
   certbundle.pem: PEM certificate
   private.key: PEM RSA private key
   ```

1. (Optional) If your file isn't an RSA key, use the `openssl rsa` command to convert your key. For example:

   ```bash
   openssl rsa \
     -in original.key \
     -out private.key
   ```

1. Use the [`qq login`](https://docs.qumulo.com/qq-cli-command-guide/login/login.html) command to log in to your Qumulo cluster as an administrator. For example:

   ```bash
   qq login \
     -u admin \
     --host {{site.exampleIP0}}
   ```

1. Use the [`qq ssl_modify_certificate`](https://docs.qumulo.com/qq-cli-command-guide/ssl/ssl_modify_certificate.html) command to install your certificate. For example:

   ```bash
   qq ssl_modify_certificate \
     --host {{site.exampleIP0}} \
     -c certbundle.pem \
     -k private.key.insecure
   ```

## To Import a Certificate Authority (CA) Certificate on macOS

1. Press **&#8984; + Space**, enter `Keychain Access`, and press **Enter**.

1. When prompted, click **Open Keychain Access**.

1. In the **Keychain Access** window, on the left panel, under **Default Keychains**, click **login**.

1. On the right, click **Certificates**.

1. Copy your CA certificate file to the list of certificates.

1. Right-click your certificate and then click **Get Info**.

1. On the window with the certificate information, expand the **Trust** section and **When using this certificate:** select **Always Trust**.

{% include note.html content="To ensure your certificate is installed correctly, restart your browser." %}
