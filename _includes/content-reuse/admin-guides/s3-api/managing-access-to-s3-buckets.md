Managing user access to S3 buckets in a Qumulo cluster is very similar to managing access to SMB shares and NFS exports, with the following exceptions:

* To let a user access S3 buckets in the cluster, you must [assign an S3 access key](creating-managing-s3-access-keys.html) to the user. Alternatively, you can create [presigned URLs](#presigned-urls) or enable [read-only, anonymous access](#enabling-anonymous-access-for-an-s3-bucket) for the entire S3 bucket.

* Because Amazon S3 provides access to an entire S3 bucket but Qumulo Core provides access to individual files and directories, a bucket might behave differently from user expectations.

  {% include note.html content="There are no bucket-level permissions in Qumulo Core, only file-level permissions. To configure an S3 bucket in Qumulo Core to work more like an Amazon S3 bucket, [use inheritable access control entries (ACEs) to imitate bucket-level permissions](#inheritable-aces)." %}


## How S3 Bucket Permissions Work in Qumulo Core
To process an S3 API request, Qumulo Core performs one or more file system operations. Qumulo Core processes these operations by checking the user's access against the access control lists (ACLs) for each file that is part of the request.

For authenticated requests signed with [Amazon Signature Version 4]({{site.s3.docs.signatureV4}}), Qumulo Core maps the [access key ID](creating-managing-s3-access-keys.html#access-key-id) in the request to its corresponding [auth ID](creating-managing-s3-access-keys.html#auth-id), and then processes the request as that user. Qumulo Core processes unsigned, anonymous requests as the `Guest` user.

While Qumulo Core processes an S3 request, the ownership of any newly created files and directories belongs to the user that makes the request. These files and directories inherit access control entries (ACEs) from their parents (this process is the same for all protocols).


<a id="presigned-urls"></a>
## Granting Access to S3 Buckets by Using Presigned URLs
To let trusted users perform S3 API actions&mdash;such as `GetObject` or `UploadPart`&mdash;as if using your user account, you can generate a _presigned URL_ (also known as _query parameter authentication_), associate the URL with specific API actions, and then share it with trusted users. Every presigned URLs has a configurable expiration time that ensures that the URL stops working at the configured time.

For more information, see [Authenticating Requests: Using Query Parameters (AWS Signature Version 4)](https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html) in the Amazon Simple Storage Service API Reference.

{{site.data.alerts.note}}
<p>Qumulo Core accepts only presigned requests that use the <code>PUT</code>, <code>GET</code>, <code>HEAD</code>, and <code>DELETE</code> HTTP methods. Qumulo Core rejects presigned requests for <code>POST</code> requests, such as the following:</p>
<ul>
  <li><code>AbortMultipartUpload</code></li>
  <li><code>CompleteMultipartUpload</code></li>
  <li><code>CreateMultipartUpload</code></li>
  <li><code>DeleteObjects</code></li>
</ul>
{{site.data.alerts.end}}

To create a presigned URL, use the AWS CLI [`presign`](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/s3/presign.html) command. In the following example, the presigned URL expires in 10 minutes (600 seconds).

```bash
$ aws2 s3 presign s3://my-bucket/my-file.txt \
  --endpoint-url https://{{site.exampleIP0}}:9000 \
  --profile my-qumulo-profile \
  --expires-in 600
```

The following is example output from the command, with line breaks inserted for readability. The `X-Amz-Expires` header is set to 10 minutes.

```
https://{{site.exampleIP0}}:9000/my-bucket/my-file.txt?
X-Amz-Algorithm=AWS4-HMAC-SHA256
&X-Amz-Credential=00000000000003e88527%2F20230217%2Fus-east-1%2Fs3%2Faws4_request
&X-Amz-Date=20230217T205559Z
&X-Amz-Expires=600
&X-Amz-SignedHeaders=host
&X-Amz-Signature=141fa5b10caaa8575ba9c065d2270a24ce14b2ff58bb2c2e98382c76297b21ee
```


<a id="anonymous-access"></a>
## Enabling Anonymous Access for an S3 Bucket
In certain cases, it might be more practical to allow anonymous (unauthenticated) requests to access the contents of S3 buckets, for example, if you want to let users access objects from the S3 bucket by using a web browser or if the number of users who need read access is very large. When you enable anonymous access to an S3 bucket, your users can perform read-only S3 operations without authenticating their requests.

{% include important.html content="Anonymous requests can never perform modifying operations. Qumulo Core requires all modifying operations on an S3 bucket to be authenticated." %}

When you enable anonymous access for an S3 bucket, Qumulo Core performs all anonymous requests as the `Guest` user. The `Guest` user is a member of the `Everyone` group, but not of the `Users` group.

To ensure that anonymous requests have permission to read files in a bucket, grant read permission to the `Everyone` group or to the `Guest` user. For more information, see [Imitating Bucket-Level Read-Only Access](#bucket-level-read-access).

{% include note.html content="If a file's ACL doesn't allow reads for the `Guest` user, an anonymous request can't read the file." %}

* To view the current bucket configuration {{site.s3.permissions.APIorCLI}}, you need {{site.s3.permissions.bucketsRead}}.

* To change the bucket configuration, you need {{site.s3.permissions.bucketsWrite}}.

### To Enable Anonymous Access to an S3 Bucket by Using the qq CLI

1. To view the current bucket configuration, use the `qq s3_get_bucket` command and specify the bucket name. For example:

   ```bash
   $ qq s3_get_bucket \
     --name my-bucket
   ```

   {{site.s3.permissions.commandOutput}} {{site.s3.permissions.timesUTC}}

   ```json
   {
     "anonymous_access_enabled": false,
     "creation_time": "2022-12-20T19:42:26.833076147Z",
     "name": "my-bucket",
     "path": "/buckets/my-bucket"
   }
   ```

1. Anonymous access to S3 buckets is disabled by default. To enable anonymous access, use the `qq s3_modify_bucket` command, specify the bucket name, and use the `--enable-anonymous-access` flag.

1. To disable anonymous access, use the `qq s3_modify_bucket` command, specify the bucket name, and use the `--disable-anonymous-access` flag.


<a id="inheritable-aces"></a>
## Using Inheritable ACEs to Imitate Bucket-Level Permissions
To grant multiple users access to all paths in a bucket and ensure that newly created directories inherit the correct permissions, use inheritable access control entries (ACEs).

In Amazon S3, permission to read objects from &mdash;and write objects to&mdash; an S3 bucket applies to the entire bucket. In Qumulo Core, each [object key](creating-managing-s3-buckets.html#object-keys) corresponds to a file path relative to a bucket's root directory. Qumulo Core grants permissions for individual files and directories.

When users create objects in an S3 bucket in a Qumulo cluster, they might also create new directories. The user that creates these directories owns them. However, without the correct access control entries (ACEs) in your bucket, these directories might have restrictive permissions that prevent other users from creating objects with the same prefix.

### How Permissions with Inheritable ACEs Work
Access control entries (ACEs) control the permissions that users have for files and directories in a Qumulo cluster. When you add ACEs to a directory and mark them as _inheritable,_ all new files and directories created in that directory inherit those ACEs and pass them on.

You can use inheritable ACEs to:

* Imitate bucket-level permissions by ensuring that any files and directories that your users create in an S3 bucket receive the same permissions.

  To make all paths in an S3 bucket inherit the same set of ACEs, add the ACEs to the bucket's root directory and mark them as inheritable.

* Configure default permissions for newly created buckets.

  To make a set of ACEs the default for buckets that your users create by using the S3 API, add the ACEs to the default bucket directory prefix.

To add ACEs to a directory, use the `qq` CLI or use the File Explorer on a Windows client with a mapped SMB share that contains the directory.

{% include note.html content="Adding inheritable ACEs to a directory doesn't affect any files that already exist in that directory. For more information, see [To Recursively Add a New ACL (with Multithreading)](https://care.qumulo.com/hc/en-us/articles/6351767625491#to-recursively-add-a-new-acl-with-multithreading--0-6) on Qumulo Core." %}

## Imitating Bucket-Level Permissions by Using the qq CLI
The following sections show how to use the `qq` CLI to imitate bucket-level permissions by adding inheritable ACEs.

### Imitating Bucket-Level Read-Write Access
Use the `qq fs_modify_acl` command. In the following example, we add the access control entry (ACE) to the bucket whose root directory is `/buckets/my-bucket` for the user group `MyWriters`.

```bash
$ qq fs_modify_acl \
  --path /buckets/my-bucket add_entry \
  --trustee MyWriters \
  --type Allowed \
  --flags 'Container inherit' 'Object inherit' \
  --rights 'Delete child' 'Execute/Traverse' 'Read' 'Write file'
```

The ACE imitates bucket-level read-write access for a user or group of users.

```
Type     Flags                              Rights
=======  =================================  =====================================
Allowed  Object inherit, Container inherit  Delete child, Execute/Traverse, Read,
                                            Write file
```

<a id="bucket-level-read-access"></a>
### Imitating Bucket-Level Read-Only Access
Use the `qq fs_modify_acl` command. In the following example, we add the access control entry (ACE) to the bucket whose root directory is `/buckets/my-bucket` for the user group `MyReaders`:

```bash
$ qq fs_modify_acl
  --path /buckets/my-bucket add_entry \
  --trustee MyReaders \
  --type Allowed \
  --flags 'Container inherit' 'Object inherit' \
  --rights 'Execute/Traverse' 'Read'
```

The ACE imitates bucket-level read-only access for a user or group of users.

```
Type     Flags                              Rights
=======  =================================  ======================
Allowed  Object inherit, Container inherit  Execute/Traverse, Read
```

### Imitating Bucket-Level List-Only Access
Use the `qq fs_modify_acl` command. In the following example, we add two access control entries (ACEs) to the bucket whose root directory is `/buckets/my-bucket` for the user group `MyListers`.

```bash
$ qq fs_modify_acl
  --path /buckets/my-bucket add_entry \
  --trustee MyListers \
  --type Allowed \
  --flags 'Container inherit' \
  --rights 'Execute/Traverse' 'Read'
```

```bash
$ qq fs_modify_acl
  --path /buckets/my-bucket add_entry \
  --trustee MyListers \
  --type Allowed \
  --flags 'Object inherit' \
  --rights 'Read attr'
```

The two ACEs imitate bucket-level list-only access for a user or group of users:

```
Type     Flags              Rights
=======  =================  ======================
Allowed  Container inherit  Execute/Traverse, Read
Allowed  Object inherit     Read attr
```
