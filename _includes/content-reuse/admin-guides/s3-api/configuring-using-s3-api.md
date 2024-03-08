## Prerequisites
To use the S3 API, you must install the [`aws`]({{site.s3.docs.cli}}) and [`qq`](https://care.qumulo.com/hc/en-us/articles/115008165008) CLI tools.

{% include important.html content="The following instructions are for Ubuntu 18.04 (and higher)." %}

<a id="configuring-https"></a>
## Step 1: Configure HTTPS
The Qumulo Core S3 API accepts only HTTPS requests by default. To enable HTTPS support for your Qumulo cluster, you must install a valid SSL certificate on it.

Every Qumulo cluster is preconfigured with a self-signed SSL certificate. However, because certain applications don't accept the default certificate, we recommend installing your own.

For information about configuring HTTPS for your cluster, see [Installing the Qumulo Core Web UI SSL Certificate](https://care.qumulo.com/hc/en-us/articles/17652500917779) on Qumulo Care.

### Enabling and Disabling Plaintext HTTP Connections
{% include important.html content="If you configure the S3 API service to accept only plaintext HTTP connections, no requests made through the S3 API are encrypted." %}

* To enable HTTP connections, use the `qq s3_modify_settings --insecure` command.

* To revert to encrypted HTTPS requests, use the `qq s3_modify_settings --secure` command.


## Step 2: Enable the S3 API for Your Qumulo Cluster
To let your Qumulo cluster accept S3 traffic, you must enable the S3 API by using the `qq s3_modify_settings --enable` command.

After you run the command, all nodes in your cluster begin to accept S3 API traffic on TCP port 9000.


<a id="creating-access-key"></a>
## Step 3: Create an Access Key Pair
To create and manage S3 buckets you must have a valid S3 access key pair associated with a specific user in your Qumulo cluster or in a connected external identity provider (such as Active Directory). For more information, see [Creating and Managing S3 Access Keys](creating-managing-s3-access-keys.html).

Use the `qq s3_create_access_key` and specify the username. For example:

```bash
$ qq s3_create_access_key my-username
```

{% capture accessKeys %}{{site.s3.permissions.secretAccessKeys}}{% endcapture %}
{% include note.html content=accessKeys %}


<a id="configuring-aws-cli"></a>
## Step 4: Configure the AWS CLI for Use with Qumulo Core
To create and manage S3 buckets, you must configure AWS CLI to work with your Qumulo cluster.

{{site.data.alerts.note}}
<ul>
  <li>We recommend configuring a dedicated profile for Qumulo in your <a href="https://docs.aws.amazon.com/cli/latest/topic/s3-config.html">AWS CLI S3 Configuration</a>.</li>
  <li>Qumulo Core listens for S3 API traffic on TCP port 9000. It isn't possible to change this setting.</li>
  <li>Currently, Qumulo Core supports only <a href="{{site.s3.docs.pathStyleAddressing}}">path-style</a> bucket addressing. For more information, see <a href="supported-s3-functionality-known-limits.html#bucket-addressing-style">Bucket Addressing Style</a>.</li>
</ul>
{{site.data.alerts.end}}

1. Configure the AWS CLI to use path-style bucket addressing by using the `aws configure` command and specify your profile.

   ```bash
   $ aws configure \
     --profile my-qumulo-profile set s3.addressing_style path
   ```

1. Use [the access key pair that you have created earlier](#creating-access-key) and the `aws configure` command to:

   1. Specify your profile and [access key ID](creating-managing-s3-access-keys.html#access-key-id). For example:

      ```bash
      $ aws configure
        --profile my-qumulo-profile set aws_access_key_id \
          000000000001fEXAMPLE
      ```
   
   1. Specify your profile and [secret access key](creating-managing-s3-access-keys.html#secret-access-key). For example:

      ```bash
      $ aws configure
        --profile my-qumulo-profile set aws_secret_access_key \
          TEIT4liMZ8A32iI7JXmqIiLWp5co/jmkjEXAMPLE
      ```

1. Because it isn't possible to specify your cluster's URI persistently, create a shell alias to specify your cluster's URI, in the following format:

   ```bash
   $ alias aws="aws --endpoint-url https://<qumulo-cluster>:9000 --profile my-qumulo-profile"
   ```
   
   {% include note.html content="If you haven't installed an SSL certificate, append `--no-verify-ssl` to the end of the command." %}

1. (Optional) If you haven't configured your machine to trust the SSL certificate installed on your Qumulo cluster, to configure the path to [the trusted SSL certificate bundle that you have created and installed earlier](#configuring-https) manually, use the `aws configure` command. For example:
  
   ```bash
   $ aws configure \
     --profile my-qumulo-profile set ca_bundle MySpecialCert.crt
   ```

1. To test your configuration, send an S3 API request to your Qumulo cluster by using the `aws s3api list-buckets` command.

   A successful response includes an empty JSON array named `Buckets`.
   
   ```json
   {
    "Buckets": []
   }
   ```


## Step 5: Create an S3 Bucket
{% include note.html content="Creating buckets requires the `PRIVILEGE_S3_BUCKETS_WRITE` [role-based access control (RBAC)](https://care.qumulo.com/hc/en-us/articles/360036591633) privilege and permission to create a directory under the cluster's root directory." %}

Use the `aws s3api create-bucket` command and specify the bucket name. For example:

```bash
$ aws s3api create-bucket \
  --bucket my-bucket
```

The S3 API creates the new directory `/my-bucket/`. All of the bucket's objects are located under this directory. For more information, see [Creating and Working with S3 Buckets in Qumulo Core](creating-managing-s3-buckets.html).


<a id="writing-reading-objects"></a>
## Step 6: Test Writing and Reading S3 Objects

1. To test writing data to your Qumulo cluster, perform a `PutObject` S3 API action by using the `aws s3api put-object` command. For example:

   ```bash
   $ aws s3api put-object \
     --bucket my-bucket \
     --key archives/my-remote-file.zip \
     --body my-local-file.zip
   ```
   
   The S3 API uploads the contents of `my-local-file.zip` into an object named `my-remote-file.zip`.

1. To test reading read data from and S3 bucket, perform a `GetObject` S3 API action by using the `aws s3api get-object` command. For example:

   ```bash
   $ aws s3api get-object \
     --bucket my-bucket \
     --key archives/my-remote-file.zip local-file.zip
   ```
   
   The S3 API downloads the contents of the `my-remote-file.zip` object into `local-file.zip` and returns the object metadata. For example:

   ```json
   {
     "AcceptRanges": "bytes",
     "LastModified": "Wed, 14 Dec 2022 20:42:46 GMT",
     "ETag": "\"-gUAAAAAAAAAAwAAAAAAAAA\"",
     "ContentType": "binary/octet-stream",
     "Metadata": {}
   }
   ```
