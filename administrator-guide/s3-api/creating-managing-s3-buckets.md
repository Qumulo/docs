---
title: "Creating and Managing S3 Buckets in Qumulo Core"
summary: "This section explains how to create and manage S3 buckets for a Qumulo cluster. These buckets expose a part of your Qumulo file system to applications that use the <a href='https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html'>Amazon S3 API</a>."
permalink: /administrator-guide/s3-api/creating-managing-s3-buckets.html
sidebar: administrator_guide_sidebar
keywords: s3, bucket, permissions, bucket_root, root_directory, root, key, object_keys, bucket_name, name, default_bucket_directory_prefix, default_prefix, default_directory_prefix, directory_prefix, prefix, create, configure, list, delete
varListJSON: The JSON output contains an array named <code>Buckets</code> that contains the individual buckets as objects.
varUploadKinds: <code>UploadPart</code>, <code>PutObject</code>, or <code>CopyObject</code>
varNoBucket: The specified bucket doesn't exist.
varCantDelRootDir: You don't have permission to delete the bucket root directory.
varRootDirNotEmpty: The bucket root directory isn't empty.
varDefaultPrefix: <a href="#default-directory-prefix">default bucket directory prefix</a>
---

{% include content-reuse/admin-guides/s3-api/creating-managing-s3-buckets.md %}
