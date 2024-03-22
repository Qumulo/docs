{{site.protectingData.storeKeysProtectResources}}

{{site.data.alerts.important}}
<ul>
  <li>{{site.protectingData.supportedKeys}}</li>
  <li>No KMS system shows the private key. To sign messages later, write down the key ID in the responses from key generation commands.</li>  
</ul>
{{site.data.alerts.end}}

<a id="generating-ecdsa-private-key"></a>
## Generating an ECDSA Private Key
This section explains how to generate a 256-bit ECDSA private key by using Linux CLI tools and AWS, GCP, and Azure CLI or API.

### To Generate a Private Key by Using Linux CLI Tools
To generate a key in the `.pem` format, use the `openssl` or `ssh-keygen` tools.

* Run the `openssl` command and specify the path to the private key. For example:

  ```bash
  openssl ecparam \
    -genkey \
    -name prime256v1 \
    -out /private-key-path
  ```

* Run the `ssh-keygen` command and specify the path to the private key. For example:

  ```bash
  ssh-keygen \
    -f /private-key-path \
    -t ecdsa \
    -m PEM
  ```

The following is an example private key.

```
-----BEGIN EC PRIVATE KEY-----
EXAMPLEabCDe8fghi8J28KlB8mO+no93N0pBqrs/TUvWXYza4BC0DefghiJklmNO
PQRsTUVWXyZAbc0DEFGhIJ////////////////////////////////////7///kl
MNOPQRSTUVwXYZA5bcD++ef7gHIjKlMOnopQRst82u3OVWxY8oZaBcdEfEg62hij
k8LmNoP7/Q4RSTu9V7WXyzABCDeF0G/7HIJ4KlMN/////////////////////opq
3OrsTUV7w9XyzAB2CDEFGHIjKLMNOPQ7r7S7t/uVwxY1zaBO9c23Sd1EF3G3hijk
L1mN1OPQRSTUve2+X06YZABcD/eFGhIJ/Kl5MNOPQrsTuEXAMPLE
-----END EC PRIVATE KEY-----
```

### Generating a Key Pair by Using the AWS Key Management Service (KMS)
Use the AWS Management Console, AWS CLI, or AWS KMS API. For more information, see the following resources:

* **Console:** [Creating asymmetric KMS keys](https://docs.aws.amazon.com/kms/latest/developerguide/asymm-create-key.html#create-asymmetric-keys-console)

* **AWS CLI:** [`create-key`](https://docs.aws.amazon.com/cli/latest/reference/kms/create-key.html) in the AWS CLI Command Reference.

* **AWS KMS API:** [`CreateKey`](https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html) in the AWS Key Management Service API Reference

{{page.varSpecifyDetails}}

* **Key Type:** Asymmetric key

* **Usage:** Sign and verify

* **Key Specification:** ECC_NIST_P256

### Generating a Key Pair by Using the GCP Cloud Key Management Service (Cloud KMS)
Use the GCP Cloud Console, Cloud CLI, or Cloud API. For more information, see [Create a key](https://cloud.google.com/kms/docs/create-key) in the Cloud Key Management Service documentation.

{{page.varSpecifyDetails}}

* **Protection Level:** software or HSM

* **Purpose:** Asymmetric sign

* **Algorithm:** Elliptic Curve P-256 - SHA256 Digest

### Generating a Key Pair by Using the Azure Key Vault
Use the Azure Key Vault and the Azure CLI. For more information, see [`az keyvault key create`](https://learn.microsoft.com/en-us/cli/azure/keyvault/key?view=azure-cli-latest#az-keyvault-key-create) in the Azure documentation.

{{page.varSpecifyDetails}}

* **Key Type:** EC

* **Curve:** P-256

* **Key Size:** 256


## Extracting the Public Key from an ECDSA Private Key
After you create a 256-bit ECDSA private key, you can extract a public key from it by using Linux CLI tools and AWS, GCP, and Azure CLI and API. You can [store the public key in the Qumulo file system key store](managing-security-keys.html#add-public-key).

### To Extract the Public Key by Using Linux CLI Tools
1. Use the `openssl` tool and specify the path to the private key and the path for saving the public key. For example:

   ```bash
   openssl pkey \
     -in /private-key-path \
     -pubout > /public-key-path
   ```

1. If your private key is in OpenSSH format, export the public key into the `.pem` format. Use the `ssh-keygen` tool and specify the path to the private key and the path for saving the public key. For example:

   ```bash
   ssh-keygen \
    -e \
    -f /private-key-path \
    -m PEM > /public-key-path
   ```

1. To convert your private key to `.pem` format, you can use the `ssh-keygen` tool and specify the path to the private key. For example:

   ```bash
   ssh-keygen \
     -p \
     -f /private-key-path \
     -m pem
   ```

The following is an example public key in `.pem` format.

```
-----BEGIN PUBLIC KEY-----
EXAMPLEabCDef0GHIJKL4MNOPqRStUV5wXyz491abc1d2efGijklmNOP0qrsTUv
WXYza1BCdEfGHIjkOlMnOpqr1STUvW3XYzAB6c8DefghIJkEXAMPLE==
-----END PUBLIC KEY-----
```

### Extracting the Public Key by Using the AWS Key Management Service (KMS)
Use the AWS Management Console, AWS CLI, or AWS KMS API. For more information, see the following resources:

* **Console:** [Displaying KMS key details](https://docs.aws.amazon.com/kms/latest/developerguide/viewing-keys-console.html#viewing-console-details)

* **AWS CLI:** [`get-public-key`](https://docs.aws.amazon.com/cli/latest/reference/kms/get-public-key.html)

* **AWS API:** [`GetPublicKey`](https://docs.aws.amazon.com/kms/latest/APIReference/API_GetPublicKey.html)

### Extracting the Public Key by Using the GCP Cloud Key Management Service (Cloud KMS)
Use the GCP Cloud Console, Cloud CLI, or Cloud API. For more information, see [Retrieve the public key](https://cloud.google.com/kms/docs/create-key#retrieve-public) in the Cloud Key Management Service documentation.

### Extracting the Public Key by Using the Azure Key Vault
Use the Azure Key Vault and the Azure CLI. For more information, see [`az keyvault key download`](https://learn.microsoft.com/en-us/cli/azure/keyvault/key?view=azure-cli-latest#az-keyvault-key-download) in the Azure documentation.


## Signing a Security Challenge by Using an ECDSA Private Key
When you perform actions such as adding a new key to the Qumulo file system key store, replacing an existing key in the key store, or unlocking a snapshot, you must verify that you have access to the private key by signing a security challenge.

You can use your private key to generate a verification signature and then provide this signature to Qumulo Core in Base64 encoding.

{{site.data.alerts.note}}
<ul>
  <li>When you add a new key, the key name is the security challenge.</li>
  <li>When you replace an existing key or unlock a snapshot, the <code>qq</code> CLI command provides the challenge.</li>
</ul>
{{site.data.alerts.end}}

### To Sign a Security Challenge by Using Linux CLI Tools
1. Save the security challenge to be signed to a file. For example:

   ```bash
   echo -n "This is my challenge." > /tmp/challenge.out
   ```

   {% include note.html content="The `-n` flag ensures that there are no newline characters following the challenge." %}

1. To sign the challenge, use the `openssl` tool and specify the path to the private key. For example:

   ```bash
   openssl dgst \
     -sha256 \
     -r \
     -sign /path-to-private-key \
     -out /tmp/signature.sha256 /tmp/challenge.out
   ```

1. To encode the signature in Base64 format, use the `openssl` tool. For example:

   ```bash
   openssl base64 \
     -in /tmp/signature.sha256 \
     -out /tmp/key_signature.b64
   ```

### To Sign a Security Challenge by Using the AWS Key Management Service (KMS)
1. Sign a security challenge by using the AWS CLI or AWS KMS API. For more information, see the following resources:

   * **AWS CLI:** [`sign`](https://docs.aws.amazon.com/cli/latest/reference/kms/sign.html) in the AWS CLI Command Reference

   * **AWS KMS API:** [`Sign`](https://docs.aws.amazon.com/kms/latest/APIReference/API_Sign.html) in the AWS Key Management Service API Reference

1. Specify the `ECDSA_SHA_256` algorithm.

   The response returns a Base64-encoded verification signature.

### To Sign a Security Challenge by Using the GCP Cloud Key Management Service (Cloud CMS)
1. Sign a security challenge by using the GCP Cloud Console, Cloud CLI, or Cloud API. For more information, see [Creating a signature](https://cloud.google.com/kms/docs/create-validate-signatures#create_signature) in the Cloud Key Management Service documentation.

1. Specify the `SHA256` digest algorithm.

1. If the signature in the response is comprised of raw bytes (not a Base64-encoded string) encode the signature file by using the `base64` CLI tool on the signature file that the Cloud CLI generates. For example:

   ```bash
   base64 /gcp-output-path/signature.bytes
   ```

### To Sign a Security Challenge by Using the Azure Key Vault
{% include important.html content="The Azure API requires a security challenge as a UrlBase64-encoded SHA-256 digest." %}

1. Sign a security challenge by using the Azure Key Vault and the Azure API. For more information, see [`sign`](https://learn.microsoft.com/en-us/rest/api/keyvault/keys/sign/sign?tabs=HTTP) in the Azure documentation.

1. Convert your plaintext challenge into the correct format. For example:

   ```bash
   echo -n "This is my challenge." \
     | sha256sum \
     | cut -d' ' -f1 \
     | xxd -r -p \
     | base64 \
     | tr '/+' '_-'
   ```

1. Use the re-encoded challenge to call the Azure API.

1. Specify ES256 as the algorithm.

   The signature in the response is encoded in UrlBase64 format.

1. Encode the signature in Base64 format. For example:

   ```bash
   echo $(echo -n VGhpcyBpcyBteSBzaWduYXR1cmUu | tr '_-' '/+')==
   ```
