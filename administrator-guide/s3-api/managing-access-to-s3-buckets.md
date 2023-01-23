---
title: "Managing Access to S3 Buckets in a Qumulo Cluster"
summary: "This section explains how to manage access to S3 buckets in a Qumulo cluster."
permalink: /administrator-guide/s3-api/managing-access-to-s3-buckets.html
sidebar: administrator_guide_sidebar
keywords: s3, bucket, permissions, access control entry, ace, access control list, acl, anonymous, read-only, read only, access, inherit, inheritable ace
---

Managing user access to S3 buckets in a Qumulo cluster is very similar to managing access to SMB shares and NFS exports, with the following exceptions:

* To let a user access S3 buckets in the cluster, you must [assign an S3 access key](creating-managing-s3-access-keys.html) to the user. Alternatively, you can enable [read-only, anonymous access](#enabling-anonymous-access-for-an-s3-bucket) for the S3 bucket.

* Because Amazon S3 provides access to an entire S3 bucket but Qumulo Core provides access to individual files and directories, a bucket might behave differently from user expectations.

  {% include note.html content="There are no bucket-level permissions in Qumulo Core, only file-level permissions. To configure an S3 bucket in Qumulo Core to work more like an Amazon S3 bucket, [use inheritable access control entries (ACEs) to imitate bucket-level permissions](#inheritable-aces)." %}


## How S3 Bucket Permissions Work in Qumulo Core
To process an S3 API request, Qumulo Core performs one or more file system operation. Qumulo Core processes these operations by checking the user's access against the access control lists (ACLs) for each file that is part of the request.

For authenticated requests signed with [Amazon Signature Version 4]({{site.s3.docs.signatureV4}})), Qumulo Core maps the access key ID in the request to its corresponding [auth ID](creating-managing-s3-access-keys.html#auth-id), and then processes the request as that user. Qumulo Core processes unsigned, anonymous requests as the `Guest` user, to whom all modifying operations are forbidden.

While Qumulo Core processes an S3 request, the ownership of any newly created files and directories belongs to the user that makes the request. These files and directories inherit access control entries (ACE) from their parents (this process is the same for all protocols).


<a id="anonymous-access"></a>
## Enabling Anonymous Access for an S3 Bucket
Your users might need to make [read-only S3 API requests]({{site.s3.docs.signatureV4}}) to individual S3 buckets for operations that require plain HTTPS access to a bucket's contents, for example by using the `wget` command or a browser. To allow read-only access, you must enable anonymous access to specific buckets.

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

In Amazon S3, permission to read objects from&mdash;and write objects to&mdash;an S3 bucket applies to the entire bucket. In Qumulo Core, each [object key](creating-managing-s3-buckets.html#object-keys) corresponds to a file path relative to a root directory and Qumulo Core grants permissions for individual files and directories.

When users create objects in an S3 bucket in a Qumulo cluster, they might also create new directories. The user that creates these directories owns them. However, without the correct access control entries (ACLs) in your bucket, these directories might have restrictive permissions that prevent other users from creating objects with the same prefix.

### How Permissions with Inheritable ACEs Work
You can use inheritable ACEs to ensure that:

* Any files and directories that you create under the root directory inherit your ACEs and pass them to any child files and directories, add inheritable ACEs to your bucket's root directory when you first create your S3 bucket.

* Any newly created buckets inherit the same set of ACEs, add inheritable ACEs to the default bucket directory prefix.

To add ACEs to a directory, use the `qq` CLI or using the File Explorer on a Windows client with a mapped SMB share that contains the directory.

{% include note.html content="Adding inheritable ACEs to a directory doesn't affect any files that already exist in that directory. For more information, see [To Recursively Add a New ACL (with Multithreading)](https://care.qumulo.com/hc/en-us/articles/6351767625491#to-recursively-add-a-new-acl-with-multithreading--0-6) on Qumulo Core." %}

## Imitating Bucket-Level Permissions by Using the qq CLI
The following sections show how to imitate bucket-level permissions by using the `qq` CLI.

### Imitating Bucket-Level Read-Write Access
Use the `qq fs_modify_acl` command. In the following example, we add the access control entry (ACE) to the bucket whose root directory is `/buckets/my-bucket` for the user group `MyWriters`.

```bash
$ qq fs_modify_acl \
  --path /buckets/my-bucket add_entry
    -t MyWriters \
    -y Allowed \
    -f 'Container inherit' 'Object inherit' \
    -r 'Delete child' 'Execute/Traverse' 'Read' 'Write file'
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
  --path /buckets/my-bucket add_entry 
    -t MyReaders \
    -y Allowed \
    -f 'Container inherit' 'Object inherit' \
    -r 'Execute/Traverse' 'Read'
```

The ACE imitates bucket-level read-only access for a user or group of users.

```
Type     Flags                              Rights
=======  =================================  ======================
Allowed  Object inherit, Container inherit  Execute/Traverse, Read
```

### Imitating Bucket-Level List-Only Access
Use the `qq fs_modify_acl` command for each of the two ACEs. In the following example, we add each access control entry (ACE) to the bucket whose root directory is `/buckets/my-bucket` for the user group `MyListers`.

```bash
$ qq fs_modify_acl 
  --path /buckets/my-bucket add_entry
    -t MyListers \
    -y Allowed \
    -f 'Container inherit' \
    -r 'Execute/Traverse' 'Read'
```

```bash
$ qq fs_modify_acl 
  --path /buckets/my-bucket add_entry 
    -t MyListers \
    -y Allowed \
    -f 'Object inherit' \
    -r 'Read attr'
```

The ACE imitates bucket-level list-only access for a user or group of users:

```
Type     Flags              Rights
=======  =================  ======================
Allowed  Container inherit  Execute/Traverse, Read
Allowed  Object inherit     Read attr
```
