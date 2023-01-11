---
title: "Getting Started with the S3 API in Qumulo Core"
summary: "This section explains how to get started using the S3 API with Qumulo Core."
permalink: /administrator-guide/s3-api/getting-started-s3-api.html
sidebar: administrator_guide_sidebar
keywords: s3, aws, bucket, object
---

{% include in_page_toc.html %}

The S3 API in Qumulo Core provides a native way for clients and applications to interact with the Qumulo file system using the [Amazon S3 API]({{site.s3.docs.s3}}).

This guide is intended for system administrators who are responsible for configuring and administering storage, as well as colleagues in your organization who wish to use the S3 API with Qumulo Core. It covers:

* How to configure and enable the S3 API server on a Qumulo cluster
* How to create S3 API access keys for use with a Qumulo cluster
* How to create S3 buckets and upload and retrieve objects

## Prerequisites

To follow this guide, you should have:

* A basic understanding of [Amazon S3](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html)
* The [AWS Command Line Interface]({{site.s3.docs.cli}}) installed
* The [Qumulo command line interface](https://care.qumulo.com/hc/en-us/articles/115008165008) installed
* Network connectivity to one or more nodes in your Qumulo cluster

<a id="configuring-https"></a>
## Step 1: Configuring HTTPS

Using the S3 API with Qumulo Core requires the use of HTTPS. A valid SSL certificate must be installed in the cluster in order for the S3 API service to run. Qumulo clusters are preconfigured with a self-signed SSL certificate; however, we recommend installing your own certificate, as there are applications that do not accept the default certificate.

For information on how to install a signed SSL certificate, please see [SSL: Install a Signed SSL Certificate](https://care.qumulo.com/hc/en-us/articles/115015388507-SSL-Install-a-Signed-SSL-Certificate).

<a id="enabling-s3"></a>
## Step 2: Enabling the S3 API on a Qumulo Cluster

The S3 API is not enabled by default; it must be enabled before a Qumulo cluster will accept S3 traffic.

To enable the S3 API via the `qq` CLI, use the `s3_modify_settings` command:

```
$ qq s3_modify_settings --enable
```

This will cause all nodes in the cluster to start accepting S3 API traffic on TCP port 9000.

<a id="creating-access-key"></a>
## Step 3: Creating an Access Key Pair

To use the S3 API with Qumulo, you need to have a valid S3 access key pair on the relevant Qumulo cluster. Every access key is associated with an existing user on the cluster or in a connected external identity service such as Active Directory.

{% include important.html content="Copy the secret key to a secure place as soon as you create it. It will only be displayed once." %}

To create an access key for a user via the `qq` CLI, use the `s3_create_access_key` command:

```
$ qq s3_create_access_key <username>
```

Please see the [Creating and Managing S3 Access Keys](./creating-managing-s3-access-keys.html) section that covers this in more detail.

## Step 4: Configuring the AWS CLI for Use with Qumulo Core

Configuring an application to use the S3 API with Qumulo Core requires a few additional steps. This section describes how to configure the [AWS Command Line Interface]({{site.s3.docs.cli}}), as that is what we'll use in later sections on this page. These configuration steps should be similar for other S3 applications that can connect to your Qumulo cluster.

{{site.data.alerts.note}}
<ul>
  <li>Qumulo Core listens for S3 API traffic on TCP port 9000. This cannot be changed.</li>
  <li>Only <a href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/VirtualHosting.html#path-style-access">path-style</a> bucket access is supported.</li>
</ul>
{{site.data.alerts.end}}


<a id="configuring-aws-cli"></a>
#### To Configure the AWS CLI

To use the AWS CLI with Qumulo Core, you must set the following configuration options in your [AWS CLI S3 Configuration](https://docs.aws.amazon.com/cli/latest/topic/s3-config.html). We recommend using a dedicated profile in your AWS CLI config specifically .

```
$ aws configure --profile <your-profile> set s3.addressing_style path
$ aws configure --profile <your-profile> set s3.aws_access_key_id <access-key>
$ aws configure --profile <your-profile> set s3.aws_secret_access_key <secret-key>
```

This instructs the AWS CLI to use path-style bucket addressing, which is the only kind Qumulo Core supports. It also instructs it to use the access key pair you created in [Step 3: Creating an Access Key Pair](#creating-access-key).

You will also need to point the CLI to the proper URI for your cluster. This cannot be configured persistently in the CLI. For the purposes of this guide, we recommend creating an alias for the AWS CLI:

```
$ alias aws="aws --endpoint-url https://<qumulo-cluster>:9000 --profile <your-profile>"
```

#### To Manually Specify an SSL Certificate

If your machine is not configured to trust the SSL certificate installed on the Qumulo cluster, you will also need to manually configure the path to the trusted SSL Certificate bundle:

```
$ aws configure --profile <your-profile> set ca_bundle <cert-bundle>
```

The `<cert-bundle>` is the SSL Certificate bundle created and installed during [Step 1: Configuring HTTPS](#configuring-https).

#### To Test Your Configuration

At this point you should be able to send a test S3 API request to your Qumulo cluster using the AWS CLI:

```
$ aws s3api list-buckets
```

A successful response should look like this, showing that no buckets have been created yet:
```
{
    "Buckets": []
}
```

<a id="creating-bucket"></a>
## Step 5: Creating an S3 Bucket
{% include note.html content="Creating buckets requires the user to possess the `PRIVILEGE_S3_BUCKETS_WRITE` [RBAC](https://care.qumulo.com/hc/en-us/articles/360036591633-Role-Based-Access-Control-RBAC-with-Qumulo-Core) privilege and permission to create a directory under the cluster's root directory." %}

To create a bucket using the AWS CLI, run the following command:

```
$ aws s3api create-bucket --bucket <bucket-name>
```

This creates a new directory, `/<bucket-name>/`, under which all of the bucket's objects will live. See [Creating and Managing S3 Buckets in Qumulo Core](./creating-managing-s3-buckets.html) for more details on how to manage S3 buckets and how they map to the Qumulo file system.

<a id="writing-reading-objects"></a>
## Step 6: Writing and Reading S3 Objects

Now that you have set everything up, you are ready to write and read data using the S3 API.

#### To Upload an Object to an S3 Bucket

To write data to the cluster over the S3 API, you can perform a `PutObject` action.

To perform a `PutObject` via the AWS CLI, use the `s3api put-object` subcommand:

```
$ aws s3api put-object --bucket <bucket-name> --key <object-name> --body <path-to-file>
```

This will upload the contents of the local file at `<path-to-file>` into an object named `<object-name>` in the bucket.

#### To Download an Object from an S3 Bucket

To read back the uploaded object, you can perform a `GetObject` action.

To perform a `GetObject` via the AWS CLI, use the `s3api get-object` subcommand:

```
$ aws s3api get-object --bucket <bucket-name> --key <object-name> <path-to-file>
```

This will download the contents of the object into a local file at `<path-to-file>`. It also returns the metadata of the object, for example:

```
{
    "AcceptRanges": "bytes",
    "LastModified": "Wed, 14 Dec 2022 20:42:46 GMT",
    "ETag": "\"-gUAAAAAAAAAAwAAAAAAAAA\"",
    "ContentType": "binary/octet-stream",
    "Metadata": {}
}
```
