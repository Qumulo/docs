---
title: "Creating and Managing S3 Buckets in Qumulo Core"
summary: "This section explains how to create and manage S3 buckets on a Qumulo cluster."
permalink: /administrator-guide/s3-api/creating-managing-s3-buckets.html
sidebar: administrator_guide_sidebar
keywords: s3, bucket, permissions, ace, acl

accessKeys: <a href="./creating-managing-s3-access-keys.html">Creating and Managing S3 Access Keys</a>
gettingStarted: <a href="./getting-started-s3-api.html">Getting Started with the S3 API</a>

anonymousAccess: <a href="#anonymous-access">Enabling Anonymous Access for a Bucket</a>
bucketPermissions: <a href="#how-permissions-work">How Permissions Work in Qumulo S3 Buckets</a>
bucketRoots: <a href="#how-bucket-root-directories-work">How Bucket Root Directories Are Determined</a>
creatingBuckets: <a href="#creating-buckets">Creating S3 Buckets</a>
defaultBucketBase: <a href="#configuring-default-bucket-base">Configuring the Default Directory Prefix</a>
inheritableAces: <a href="#inheritable-aces">Using Inheritable ACEs to Imitate Bucket-Level Permissions</a>
managingAccess: <a href="#managing-access">Managing Access to S3 Buckets</a>

writeRoleNote: <code>PRIVILEGE_S3_BUCKETS_WRITE</code> is required when creating and deleting S3 buckets via the Qumulo REST API or <code>qq</code> CLI.
writePermsNote: Additionally, permission to create or delete directories is required, unless you opt to skip those steps when using the `qq` CLI.
readRoleNote: <code>PRIVILEGE_S3_BUCKETS_READ</code> is required when listing S3 buckets via the Qumulo REST API or <code>qq</code> CLI.

---

S3 buckets provide a way to expose a portion of your Qumulo file system to applications that use the [Amazon S3 API]({{site.s3.docs.s3}}).

You can create and manage S3 buckets by using the Qumulo REST API or `qq` CLI, or by using the S3 API directly. The Qumulo REST API and `qq` CLI provide more flexibility. This section explains how to do both.

## Prerequisites

This section assumes that you understand the terms "bucket", "object", and "key" as they pertain to the [Amazon S3 API]({{site.s3.docs.s3}}).

In order to use the S3 API to create and manage buckets, you must have a valid Qumulo S3 access key. See {{page.accessKeys}}.

In addition, to use the AWS CLI, you must follow the instructions in [Getting Started with the S3 API](./getting-started-s3-api.html#configuring-aws-cli).

#### Required Permissions

* {{page.writeRoleNote}}
  * {{page.writePermsNote}}
* {{page.readRoleNote}}

<a id="how-buckets-work"></a>
## How S3 Buckets Map to the Qumulo File System

An S3 bucket exposes a portion of your Qumulo file system to applications that use the [Amazon S3 API]({{site.s3.docs.s3}}).

{% include note.html content="S3 buckets can be rooted at any directory in the file system. Therefore, the same file may be an object in multiple buckets." %}

The _bucket root directory_ (or _bucket root_) is the directory that an S3 bucket is attached to. All files under the bucket root directory (and all of its subdirectories) are objects in the bucket. The directory hierarchy is reflected by the presence of slash (`/`) characters in the objects' keys.

<a id="how-object-keys-work"></a>
### How Object Keys Are Determined

The key for every object in a Qumulo S3 bucket is its file system path relative to the bucket's root directory. Objects that are directories will have a trailing slash (`/`) character in their key, while objects that are files will have no trailing slash character.

For example, suppose your Qumulo file system has the following contents:

```
/
├── banana-data/
│   └── banana.dat
│
└── grumpquat-data/
    ├── quat.dat
    ├── fruity/
    └── grumpy/
        ├── data1.dat
        └── data2.dat
```

If you have a bucket named `bucket1` rooted at `/grumpquat-data/grumpy/`, it contains objects with the following keys:

* `data1.dat`
* `data2.dat`

And if you have another bucket named `bucket2` rooted at `/grumpquat-data/`, it contains objects with the following keys:

* `quat.dat`
* `fruity/`
* `grumpy/data1.dat`
* `grumpy/data2.dat`

Note how both buckets contain `/grumpquat-data/grumpy/data1.dat` and `/grumpquat-data/grumpy/data2.dat` as objects. Note also that the `fruity/` object in `bucket2` has a trailing slash because it corresponds to a directory.

<a id="how-bucket-names-work"></a>
### How Bucket Names Are Determined

You choose a name for your bucket when you create it. A bucket's name does not need to have any relation to its root directory.

Qumulo Core accepts all bucket names that Amazon S3 accepts, except for those that contain any dot (`.`) characters.

<a id="bucket-naming-rules"></a>
#### Bucket naming rules

This is the full list of restrictions for bucket names in Qumulo S3:
* Bucket names must be between 3 (min) and 63 (max) characters long.
* Bucket names can consist only of lowercase ASCII letters, numbers, and hyphens (`-`).
* Bucket names must start with a letter or a number.

For comparison, see [Amazon's bucket naming rules]({{site.s3.docs.bucketNamingRules}}).

<a id="how-bucket-root-directories-work"></a>
### How Bucket Root Directories Are Determined

When you create an S3 bucket via the Qumulo REST API or `qq` CLI, you have the option of selecting which directory should be used as the bucket root.

When you create an S3 bucket via the S3 API's `CreateBucket` action, a new directory with the same name as the bucket will be created under the default bucket directory prefix. See {{page.defaultBucketBase}}. The Qumulo REST API and `qq` CLI provide this same behavior if you do not specify a directory.

When a new directory is created for a new bucket, it will be owned by the user that made the request. See {{page.managingAccess}} for more information on how to manage bucket permissions.

<a id="creating-buckets"></a>
## Creating S3 Buckets

{{site.data.alerts.note}}
<ul>
  <li>All S3 buckets in a Qumulo cluster share the same namespace. There cannot be two buckets with the same name, even if they are rooted at different directories.</li>
  <li>All S3 buckets must follow the <a href="#bucket-naming-rules">bucket naming rules</a>.</li>
</ul>
{{site.data.alerts.end}}

You can create an S3 bucket by using the Qumulo REST API or `qq` CLI, or by using the S3 API directly. The Qumulo REST API and `qq` CLI allow you to specify an existing directory as the new bucket's root, while the S3 API always creates a new directory for the bucket root.

### To Create an S3 Bucket by Using the qq CLI

{% capture createBucketsRestApiResponse %}{
    "anonymous_access_enabled": false,
    "creation_time": "2022-12-13T22:18:01.406433425Z",
    "name": "my-bucket",
    "path": "/my-bucket"
}{% endcapture %}

{{page.writeRoleNote}}

When using the `qq` CLI to create a bucket, you have the option of creating a new directory or rooting the bucket at a pre-existing directory.

#### To Create a New, Empty Bucket

To create an empty S3 bucket named `my-bucket`, use the `s3_create_bucket` command with the `--name` argument:

```
$ qq s3_create_bucket --name my-bucket
```

A new directory named `my-bucket` will be created under the default bucket directory prefix. See {{page.defaultBucketBase}} for more information.

If an entry with the name specified name already exists, or if you do not have permission to create the directory, this command will return an error.

#### To Create a Bucket on an Existing Directory

To create an S3 bucket that exposes the files under a pre-existing directory, specify the `--path` argument as well:

```
$ qq s3_create_bucket --name my-bucket --path /some/existing/directory
```

If the specified directory does not exist, or if you do not have permission to look up the directory, this command will return an error.

{% comment %}
### To Create an S3 Bucket by Using the Qumulo REST API

{{page.writeRoleNote}}

To create an S3 bucket named `my-bucket`, send a `POST` request to `/v1/s3/buckets/`:

```
{
  "name": "my-bucket"
}
```

The response will look like this:

```json
{{createBucketsRestApiResponse}}
```
{% endcomment %}

### To Create a Bucket by Using the S3 API

{% include note.html content="The Qumulo S3 API server supports only the `\"local\"` region when using `CreateBucket` with a location constraint." %}

You can use the [`CreateBucket`]({{site.s3.actions.CreateBucket}}) S3 action to create a new bucket on a Qumulo cluster.

To create a bucket named `my-bucket` with the AWS CLI, use the `s3api create-bucket` command:

```
$ aws s3api create-bucket --bucket my-bucket
```

The bucket's root directory will be created under the default bucket directory prefix (see {{page.defaultBucketBase}}), and it will have the same name as the bucket. The directory must not already exist, and you must have permission to create the directory.

For the above example, if the default bucket creation directory is `/buckets/`, then the new bucket's root directory is `/buckets/my-bucket/`.

<a id="configuring-default-bucket-base"></a>
### Configuring the Default Directory Prefix for S3 Buckets

The _default bucket directory prefix_ is the directory under which new bucket root directories will be created when creating S3 buckets via the S3 API `CreateBucket` command. It is also used when creating S3 buckets via the Qumulo REST API and `qq` CLI if no directory is specified.

By default, the bucket root of a newly created bucket will be created under the cluster's root directory, `/`. You can change this using the `qq` CLI.

#### To Configure the Default Directory Prefix by Using the qq CLI

`PRIVILEGE_S3_SETTINGS_WRITE` is required when configuring the Qumulo S3 server settings.

To change the default directory prefix to `/buckets/`, use the `s3_modify_settings` command:

```
$ qq s3_modify_settings --base-path /buckets
```

#### To Check the Default Directory Prefix by Using the qq CLI

`PRIVILEGE_S3_SETTINGS_READ` is required when checking the Qumulo S3 server settings.

To see the current setting for the default directory prefix, use the `s3_get_settings` command:

```
$ qq s3_get_settings
```

The output will look like:

```json
{"enabled": true, "base_path": "/buckets/"}
```

<a id="configuring-buckets"></a>
## Configuring S3 Buckets

You can view and modify per-bucket settings by using the Qumulo REST API or `qq` CLI.

The only per-bucket setting that can be configured in Qumulo Core is [anonymous access](#anonymous-access).

#### To View the Settings for an S3 Bucket by Using the qq CLI

`PRIVILEGE_S3_BUCKETS_READ` is required when viewing the settings for an S3 bucket.

To view the settings for the S3 bucket named `my-bucket`, use the `s3_get_bucket` command:

```
$ qq s3_get_bucket --name my-bucket
```

The output will look like this:

```json
{
    "anonymous_access_enabled": false,
    "creation_time": "2022-12-20T19:42:26.833076147Z",
    "name": "my-bucket",
    "path": "/buckets/my-bucket"
}
```

<a id="configuring-anonymous-access"></a>
#### To Enable Or Disable Anonymous Access for a Bucket by Using the qq CLI

`PRIVILEGE_S3_BUCKETS_WRITE` is required when enabling or disabling anonymous access for an S3 bucket.

To enable or disable [anonymous access](#anonymous-access) for the bucket named `my-bucket`, use the `s3_modify_bucket` command:

```
$ qq s3_modify_bucket --name my-bucket --enable-anonymous-access
{
    "anonymous_access_enabled": true,
    "creation_time": "2022-12-20T19:42:26.833076147Z",
    "name": "my-bucket",
    "path": "/buckets/my-bucket"
}
$ qq s3_modify_bucket --name my-bucket --disable-anonymous-access
{
    "anonymous_access_enabled": false,
    "creation_time": "2022-12-20T19:42:26.833076147Z",
    "name": "my-bucket",
    "path": "/buckets/my-bucket"
}
```

<a id="listing-buckets"></a>
## Listing S3 Buckets

You can list the S3 buckets on a Qumulo cluster by using the Qumulo REST API or `qq` CLI, or by using the S3 API directly.

### To List S3 Buckets by Using the qq CLI

{{page.readRoleNote}}

To list all of the S3 buckets on a Qumulo cluster, use the `s3_list_buckets` command:

```
$ qq s3_list_buckets
```

The output will look like this:

```
name       creation_time                   path
=========  ==============================  ==========
my-bucket  2022-12-13T22:18:01.406433425Z  /my-bucket
```

All times returned are in UTC.

If you prefer to show the output in JSON format, you can append the `--json` argument:

```
$ qq s3_list_buckets --json
```

This returns the JSON response as returned by the Qumulo REST API endpoint that the `qq` CLI invokes:

```json
{
    "buckets": [
        {
            "anonymous_access_enabled": false,
            "creation_time": "2022-12-13T22:18:01.406433425Z",
            "name": "my-bucket",
            "path": "/my-bucket"
        }
    ]
}
```

{% comment %}
### To List S3 Buckets by Using the Qumulo REST API
{% endcomment %}

### To List S3 Buckets by Using the S3 API

You can use the [`ListBuckets`]({{site.s3.actions.ListBuckets}}) S3 action to list all of the S3 buckets in a Qumulo cluster.

To use the AWS CLI to list all S3 buckets for which you have read access, use the `s3api list-buckets` command:

```
$ aws s3api list-buckets
```

The output will look like this:

```json
{
    "Buckets": [
        {
            "Name": "my-bucket",
            "CreationDate": "2022-12-13T22:18:01.406Z"
        }
    ]
}
```

All times returned are in UTC.

<a id="deleting-buckets"></a>
## Deleting S3 Buckets

{{site.data.alerts.note}}
All in-progress multipart uploads for an S3 bucket must be completed or aborted before deleting the bucket.
{{site.data.alerts.end}}

You can delete an S3 bucket by using the Qumulo REST API or `qq` CLI, or by using the S3 API directly. The Qumulo REST API and `qq` CLI allow you to choose whether or not the bucket root directory should be deleted. The S3 API always deletes the bucket root.

### To Delete an S3 Bucket by Using the qq CLI

{{page.writeRoleNote}}

When using the `qq` CLI to delete a bucket, you have the option of deleting the bucket root directory or leaving it untouched.

#### To Delete a Bucket But Not Its Root Directory

To delete the S3 bucket named `my-bucket` without deleting its root directory, use the `s3_delete_bucket` command with the `--name` argument:

```
$ qq s3_delete_bucket --name my-bucket
```

This will remove all metadata related to the bucket from the Qumulo cluster. The bucket root does not need to be empty.

This command will return an error if any of the following are true:
* The specified bucket does not exist.
* You do not have `PRIVILEGE_S3_BUCKETS_WRITE`.
* The bucket has in-progress multipart uploads.

#### To Delete a Bucket And Its Root Directory

To delete the bucket and its root directory, specify both the `--name` and `--delete-root-dir` arguments:

```
$ qq s3_delete_bucket --name my-bucket --delete-root-dir
```

This command will return an error in the same cases as listed above, as well as if:
* You do not have permission to delete the bucket root.
* The bucket root is not empty.

{% comment %}
### To Delete an S3 Bucket by Using the Qumulo REST API
{% endcomment %}

### To Delete an S3 Bucket by Using the S3 API

You can use the [`DeleteBucket`]({{site.s3.actions.DeleteBucket}}) S3 action to delete an S3 bucket from a Qumulo cluster.

To delete a bucket named `my-bucket` with the AWS CLI, use the `s3api delete-bucket` command:

```
$ aws s3api delete-bucket --bucket my-bucket
```

This will remove all metadata related to the bucket from the Qumulo cluster, and it will delete the bucket root directory.

This command will return an error if any of the following are true:
* The specified bucket does not exist.
* You do not have permission to delete the bucket root.
* The bucket root is not empty.
* The bucket has in-progress multipart uploads.

<a id="managing-access"></a>
## Managing Access to S3 Buckets

Managing users' access to S3 buckets on a Qumulo cluster is very similar to managing access to SMB shares or NFS exports. There are a few extra steps and important caveats, though.

First, users must be assigned S3 access keys in order to access any buckets on the cluster. See {{page.accessKeys}}. Alternatively, you can [enable anonymous access on a bucket](#enabling-anonymous-access-for-a-bucket) to allow any user read-only access to the bucket. Access keys are still needed to perform modifying operations.

{% include note.html content="There are no \"bucket-level\" permissions for S3 buckets in Qumulo, only per-file permissions. You can imitate bucket-level permissions by [using inheritable ACEs](#using-inheritable-aces-to-imitate-bucket-level-permissions)." %}

Secondly, the behavior that users might expect from an S3 bucket may not align with how the bucket behaves without additional configuration. In Amazon's S3 service, access is provided to the entire bucket, but in Qumulo's S3 implementation, access is provided to individual files and directories. To configure a Qumulo S3 bucket to work more like an Amazon S3 bucket, see {{page.inheritableAces}}.

<a id="how-permissions-work"></a>
### How Permissions Work for S3 Buckets in Qumulo Core

Unlike Amazon S3, which lets you grant access at the bucket level, Qumulo Core only lets you grant access at the level of individual files and directories.

In Qumulo Core, every S3 API request is processed by performing one or more file system operations. These operations are processed the same way as other protocols such as SMB or NFS: by checking the user's access against the per-file access control lists (ACLs) of the file(s) involved.

For authenticated requests (those that are signed with [Amazon Signature Version 4]({{site.s3.docs.signatureV4}})), Qumulo Core maps the access key ID in the request to its corresponding auth ID, and the request is processed as that user. For anonymous requests (those that are not signed), the request is processed as the `Guest` user, and all modifying operations are forbidden.

When processing an S3 request, any new files and directories that are created are owned by the user that made the request. They inherit access control entries (ACEs) from their parents just as they do when created through any other protocol. You can leverage the inheritable permissions to [imitate bucket-level permissions similar to Amazon S3](#inheritable-aces).

For more information about S3 access keys and how they map to user identities, see {{page.accessKeys}}. For more information on anonymous access, see below.

<a id="anonymous-access"></a>
### Enabling Anonymous Access for a Bucket

Qumulo Core allows you to grant read-only access for [anonymous S3 API requests]({{site.s3.docs.signatureV4}}) on a per-bucket basis. This can be useful, for example, to allow for plain HTTPS access to a bucket's contents, e.g., via `wget` or a web browser.

If you want to grant applications unathenticated, read-only access to an S3 bucket, you must enable anonymous access on that bucket. Anonymous access is disabled by default for all newly created buckets and must be enabled as described in [Configuring S3 Buckets](#configuring-anonymous-access).

{% include important.html content="Anonymous S3 API requests are forbidden from making any modifications to a bucket, even when anonymous access is enabled." %}

When anonymous access is enabled for a bucket, applications may send anonymous requests to the bucket for non-modifying operations. These requests will be performed as the `Guest` user. Modifying operations must always be authenticated, even when anonymous access is enabled.

{% include note.html content="Anonymous S3 API requests will not have read access to files if their ACLs do not allow reads for the <code>Guest</code> user." %}

The `Guest` user is a member of the `Everyone` group, but not of the `Users` group. To ensure that anonymous requests have permission to read files in a bucket, grant read permission to the `Everyone` group, or simply to the `Guest` user. See [Imitating Bucket-Level Read-Only Access](#bucket-level-read-access) below.

<a id="inheritable-aces"></a>
### Using Inheritable ACEs to Imitate Bucket-Level Permissions

If you want to grant multiple users access to all paths within a bucket, you can use inheritable access control entries (ACEs) to ensure that newly created directories inherit the proper permissions.

{{site.data.alerts.note}}
Adding inheritable ACEs to a directory does not affect any files that already exist under that directory. See <a href="https://care.qumulo.com/hc/en-us/articles/6351767625491-Managing-Permissions-from-the-qq-CLI#to-recursively-add-a-new-acl-with-multithreading--0-6">this Qumulo Care article</a> to see how to apply permissions recursively to existing files.
{{site.data.alerts.end}}

When you first create your bucket, you can add inheritable ACEs to that bucket's root directory. After doing so, all files and directories that are created under that bucket root will inherit those ACEs and pass them on to any files and directories that get created under them.

You can also put inheritable ACEs on the default bucket directory prefix so that all newly created buckets inherit the same set of ACEs.

You can add ACEs to a directory by using the `qq` CLI, which is described below. You can also use the File Explorer on a Windows client that has an SMB share mapped containing the directory.

#### How Permissions Work Without Inheritable ACEs

In Amazon S3, permission to read and write objects in a bucket is granted for the entire bucket. In Qumulo Core, each object key corresponds to a file path relative to some root directory, and permissions are granted for each individual file and directory.

When users create objects in an S3 bucket on a Qumulo cluster, they may end up creating new directories. These directories are owned by the user that created them. Without the proper access control entries in your bucket, these new directories may have restrictive permissions that prevent other users from creating objects with the same prefix.

<a id="bucket-level-write-access"></a>
#### Imitating Bucket-Level Read-Write Access with Inheritable ACEs

The following access control entry (ACE), when added to a bucket's root directory, will imitate bucket-level read-write access for some user or group of users:

```
Type     Flags                              Rights
=======  =================================  ================================================
Allowed  Object inherit, Container inherit  Delete child, Execute/Traverse, Read, Write file
```

To use the `qq` CLI to add this ACE to the bucket rooted at `/buckets/my-bucket` for the user group named `MyWriters`, run the following command:

```
$ qq fs_modify_acl --path /buckets/my-bucket add_entry -t MyWriters \
  -y Allowed \
  -f 'Container inherit' 'Object inherit' \
  -r 'Delete child' 'Execute/Traverse' 'Read' 'Write file'
```

<a id="bucket-level-read-access"></a>
#### Imitating Bucket-Level Read-Only Access with Inheritable ACEs

The following access control entry (ACE), when added to a bucket's root directory, will imitate bucket-level read-only access for some user or group of users:

```
Type     Flags                              Rights
=======  =================================  ======================
Allowed  Object inherit, Container inherit  Execute/Traverse, Read
```

To use the `qq` CLI to add this ACE to the bucket rooted at `/buckets/my-bucket` for the user group named `MyReaders`, run the following command:

```
$ qq fs_modify_acl --path /buckets/my-bucket add_entry -t MyReaders \
  -y Allowed \
  -f 'Container inherit' 'Object inherit' \
  -r 'Execute/Traverse' 'Read'
```

<a id="bucket-level-list-access"></a>
#### Imitating Bucket-Level List-Only Access with Inheritable ACEs

The following two access control entries (ACEs), when added to a bucket's root directory, will imitate bucket-level list-only access for some user or group of users:

```
Type     Flags              Rights
=======  =================  ======================
Allowed  Container inherit  Execute/Traverse, Read
Allowed  Object inherit     Read attr
```

To use the `qq` CLI to add these ACEs to the bucket rooted at `/buckets/my-bucket` for the user group named `MyListers`, run the following commands:

```
$ qq fs_modify_acl --path /buckets/my-bucket add_entry -t MyListers \
  -y Allowed \
  -f 'Container inherit' \
  -r 'Execute/Traverse' 'Read'
$ qq fs_modify_acl --path /buckets/my-bucket add_entry -t MyListers \
  -y Allowed \
  -f 'Object inherit' \
  -r 'Read attr'
```


