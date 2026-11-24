Your Qumulo cluster uses one SSL certificate for every service that encrypts its connections by using TLS: the Qumulo Core Web UI, REST API, and S3 API; and FTP and NFS over TLS protocols. Every Qumulo cluster is preconfigured with a self-signed certificate. Because browsers and clients don't trust this certificate, we recommend installing a certificate signed by your certificate authority (CA).

## Requirements

* An SSL certificate based on your certificate signing request (CSR) file from your certificate authority (CA)

* A CA-bundle PEM chain in the following order:

  * Your certificate

  * The intermediate CA

  * The root CA

* The private key of your certificate:

  * In the PEM format

  * Not password-protected

## To Install Signed SSL Certificates on a Qumulo Cluster from the Command Line

1. Verify that your certificate and the CA-bundle are in the PEM format by running the `file *` command.

   {{site.exampleOutput}}

   ```bash
   certbundle.pem: PEM certificate
   private.key: PEM RSA private key
   ```

1. Run the {% include qq.html command="login" %} command to log in to a node in your Qumulo cluster as an administrator. For example:

   ```bash
   qq login \
     -u admin \
     --host {{site.exampleIP0}}
   ```

1. To install the certificate and its private key, run the {% include qq.html command="ssl_modify_certificate" %} command. For example:

   ```bash
   qq ssl_modify_certificate \
     --host {{site.exampleIP0}} \
     -c certbundle.pem \
     -k private.key
   ```

   All nodes in the cluster begin to use the new certificate immediately.

1. (Optional) If your cluster connects to an LDAP server by using TLS, install the certificate of the CA that signed the LDAP server's certificate by running the {% include qq.html command="ssl_modify_ca_certificate" %} command. For example:

   ```bash
   qq ssl_modify_ca_certificate \
     -c myCertificate.pem
   ```
   
   Qumulo Core uses this CA certificate only to verify the LDAP server.


## To Import a Certificate Authority (CA) Certificate on macOS

1. Press **&#8984; + Space**, enter `Keychain Access`, and press **Enter**.

1. When prompted, click **Open Keychain Access**.

1. In the **Keychain Access** window, on the left panel, under **Default Keychains**, click **login**.

1. On the right, click **Certificates**.

1. Copy your CA certificate file to the list of certificates.

1. Right-click your certificate and then click **Get Info**.

1. On the window with the certificate information, expand the **Trust** section and **When using this certificate:** select **Always Trust**.

{% include note.html content="To ensure your certificate is installed correctly, restart your browser." %}
