---
title: "Using Qumulo Shift-To to Copy Objects to Amazon S3"
summary: "This topic explains how you can use Qumulo Shift-To to copy objects from a directory in a Qumulo cluster to a folder in an Amazon Simple Storage Service (Amazon S3) bucket."
permalink: /administrator-guide/qumulo-core/shift-to-s3.html
redirect_from:
  - /shift-to-s3.html
  - /administrator-guide/shift-to-s3.html
sidebar: administrator_guide_sidebar
keywords: shift to, copy, copy objects, copy files, object copy, amazon s3, s3, iam permissions, iam, cli commands, cli, shift relationships, shift, relationships, configuration details, status
---

This section explains how you can use Qumulo Shift-To to copy objects from a directory in a Qumulo cluster to a folder in an Amazon Simple Storage Service (Amazon S3) bucket (cloud object store). For more information about copying objects from S3 to Qumulo, see [Using Qumulo Shift-From for Amazon S3 to Copy Objects](/shift-from-s3.md).

The guide describes how a Shift-To relationship works and includes information about the prerequisites, IAM permissions, and CLI commands that you can use to copy files and manage Shift relationships.

## Prerequisites
* A Qumulo cluster with:

  * Qumulo Core 3.2.1 (and higher) for the CLI and 3.2.5 (and higher) for the Web UI

  * HTTPS connectivity to `s3.<region>.amazonaws.com` though one of the following means:

    * Public Internet

    * [VPC endpoint](https://docs.aws.amazon.com/vpc/latest/privatelink/vpc-endpoints.html)

    * [AWS Direct Connect](https://docs.aws.amazon.com/whitepapers/latest/aws-vpc-connectivity-options/aws-direct-connect.html)
    
    For more information, see [AWS IP address ranges](https://docs.aws.amazon.com/general/latest/gr/aws-ip-ranges.html) in the AWS General Reference.

* Membership in a Qumulo role with the following privileges:

  * `PRIVILEGE_REPLICATION_OBJECT_WRITE`: This privilege is required to create a Shift relationship.

  * `PRIVILEGE_REPLICATION_OBJECT_READ`: This privilege is required to view the status of a Shift relationship.

  {{site.data.alerts.note}}
  <ul>
    <li>For any changes to take effect, user accounts with newly assigned roles must log out and log back in (or their sessions must time out).</li>
    <li>Use special care when granting privileges to roles and users because certain privileges (such as replication-write privileges) can use system privileges to overwrite or move data to a location where a user has greater permissions. This can give a user access to all directories and files in a cluster regardless of any specific file and directory settings.</li>
  </ul>
  {{site.data.alerts.end}}

* An existing bucket with contents in Amazon S3

* AWS credentials (access key ID and secret access key) with the following permissions:

  * `s3:AbortMultipartUpload`

  * `s3:GetObject`

  * `s3:PutObject`

  * `s3:ListBucket`

  For more information, see [Understanding and getting your AWS credentials](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html) in the AWS General Reference
  
### Example IAM Policy
In the following example, the IAM policy gives permission to read from and write to the `my-folder` folder in the `my-bucket`. This policy can give users the permissions required to run Shift-To jobs.

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "s3:ListBucket",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::my-bucket"
    },
    {
      "Action": [
        "s3:AbortMultipartUpload",
        "s3:GetObject", 
        "s3:PutObject"
      ]
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::my-bucket/my-folder/*"
    }
  ]
}
```


## How Shift-To Relationships Work
Qumulo Core performs the following steps when it creates a Shift-To relationship.

1. Verifies that the directory exists on the Qumulo cluster and that the specified S3 bucket exists, is accessible using the specified credentials, and contains downloadable objects.

1. Creates the Shift-To relationship.

1. Starts a job using one of the nodes in the Qumulo cluster.

   {% include note.html content="If you perform multiple Shift operations, Qumulo Core uses multiple nodes." %}

1. To ensure that the copy is point-in-time consistent, takes a temporary snapshot of the directory (for example, named `replication_to_bucket_my_bucket`).

1. Recursively traverses the directories and files in the snapshots and copies each object to a corresponding object in S3.

1. Preserves the file paths in the local directory in the keys of replicated objects.

   For example, the file `/my-dir/my-project/file.text`, where `my-dir` is the directory on your Qumulo cluster, is uploaded to S3 as the following object, where `my-folder` is the specified S3 folder.

   ```
   https://my-bucket.s3.us-west-2.amazonaws.com/my-folder/my-project/file.txt
   ```

   {% include note.html content="This process doesn't encode or transform your data in any way. Shift-To replicates only the data in a regular file's primary stream, excluding alternate data streams and file system metadata such as access control lists (ACLs). To avoid transferring data across the public Internet, a server-side S3 copy operation also copies any hard links to files in the replication local directory to S3 as full copies of objects, with identical contents and metadata." %}

   The following table explains how entities in the Qumulo file system map to entities in an S3 bucket.

   | Entity in the Qumulo File System                | Entity in an Amazon S3 Bucket                                                                 |
   | ----------------------------------------------- | --------------------------------------------------------------------------------------------- |
   | Access control list (ACL)                       | Not copied                                                                                    |
   | Alternate data streams                          | Not copied                                                                                    |
   | Directory                                       | Not copied (directory structure is preserved in the object key for objects created for files) |
   | Hard link to a non-regular file                 | Not copied                                                                                    |
   | Hard link to a regular file                     | Copy of the S3 object                                                                         |
   | Holes in sparse files                           | Zeroes (holes are expanded)                                                                   |
   | Regular file                                    | S3 object (the object key is the file system path and the metadata is the field data)         |
   | SMB extended file attributes                    | Not copied                                                                                    |
   | Symbolic link                                   | Not copied                                                                                    |
   | Timestamps (`mtime`, `ctime`, `atime`, `btime`) | Not copied                                                                                    |
   | UNIX device file                                | Not copied                                                                                    |
   
1. Checks whether a file is already replicated. If the object exists in the remote S3 bucket, and neither the file nor the object are modified since the last successful replication, its data isn't retransferred to S3.

   {% include note.html content="Shift never deletes files in the remote S3 folder, even if the files are removed from the local directory since the last replication." %}

1. Deletes the temporary snapshot.

### Storing and Reusing Relationships
The Shift-To relationship remains on the Qumulo cluster. You can monitor the completion status of a job, start new jobs for a relationship after the initial job finishes, and delete the relationship (when you no longer need the S3-folder-Qumulo-directory pair). To avoid reuploading objects that a previous copy job uploaded, relationships take up approximately 100 bytes per object. To free this storage, you can delete relationships that you no longer need.

If you repeatedly copy from the same Qumulo directory, you can speed up the upload process (and skip already uploaded files) by using the same relationship.

A new relationship for subsequent uploads doesn't share any tracking information with previous relationships associated with a directory and might recopy data that is already uploaded.


## Using the Qumulo Web UI to Copy Files and Manage Relationships
This section describes how you can use the Qumulo Web UI 3.2.5 (and higher) to copy files from a Qumulo cluster to Amazon S3, review Shift relationship details, stop a running copy job, repeat a completed copy job, and delete a relationship.

### To Copy Files to Amazon S3
1. Log in to Qumulo Core.
1. Click **Cluster > Copy to/from S3**.
1. On the **Copy to/from S3** page, click **Create Copy**.
1. On the **Create Copy to/from S3** page, click **Local ⇨ Remote** and then enter the following:

   a. The **Directory Path** on your cluster (`/` by default)

   b. The S3 **Bucket Name**

   c. The **Folder** in your S3 bucket

   d. The **Region** for your S3 bucket

   e. Your AWS **Region** (`/` by default)

   f. Your AWS **Access Key ID** and **Secret Access Key**.

1. (Optional) For additional configuration, click **Advanced S3 Server Settings**.
1. Click **Create Copy**.
1. In the **Create Copy to S3?** dialog box, review the Shift relationship and then click **Yes, Create**.

   The copy job begins.   

{% include content-reuse/shift-view-config-details-stop-job-repeat-job-delete-relationship.md %}


## Using the Qumulo CLI to Copy Files and Manage Relationships
This section describes how you can use the Qumulo CLI 3.2.5 (and higher) to copy files from a Qumulo cluster to Amazon S3, review Shift relationship details, stop a running copy job, repeat a completed copy job, and delete a relationship.

### Copying Files from Amazon S3
To copy files, use the `replication_create_object_relationship` command and specify the following:
* Local directory path on Qumulo cluster
* Copy direction (copy-to)
* S3 object folder
* S3 bucket
* AWS region
* AWS access key ID
* AWS secret access key

The following example shows how you can create a relationship between the directory `/my-dir/` on a Qumulo cluster and the S3 bucket `my-bucket` and folder `/my-folder/` in the `us-west-2` AWS region. The secret access key is associated with the access key ID.

```bash
qq replication_create_object_relationship \
  --source-directory-path /my-dir/ \
  --direction COPY_TO_OBJECT \
  --object-folder /my-folder/ \
  --bucket my-bucket \
  --region us-west-2 \
  --access-key-id AKIAIOSFODNN7EXAMPLE \
  --secret-access-key wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
```

The CLI returns the details of the relationship in JSON format, for example:

```json
{
  "access_key_id": "ABC",
  "bucket": "my-bucket",
  "object_store_address": "s3.us-west-2.amazonaws.com",
  "id": "1c23b4ed-5c67-8f90-1e23-a4f5f6ceff78",
  "object_folder": "my-folder/",
  "port": 443,
  "ca_certificate": null,
  "region": "us-west-2",
  "source_directory_id": "3",
  "direction": "COPY_TO_OBJECT",
}
```

{% include content-reuse/shift-view-config-details-status-shift-relationship.md %}

  ```json
  [
    {
      "direction": "COPY_TO_OBJECT",
      "access_key_id": "AKIAIOSFODNN7EXAMPLE",
      "bucket": "my-bucket",
      "object_store_address": "s3.us-west-2.amazonaws.com",
      "id": "1c23b4ed-5c67-8f90-1e23-a4f5f6ceff78",
      "object_folder": "my-folder/",
      "port": 443,
      "ca_certificate": null,
      "region": "us-west-2",
      "source_directory_id": "3",
      "source_directory_path": "/my-dir/",
      "state": "REPLICATION_RUNNING",
      "current_job": {
        "start_time": "2020-04-06T17:56:29.659309904Z",
        "estimated_end_time": "2020-04-06T21:54:33.244095593Z",
        "job_progress": {
          "bytes_transferred": "178388608",
          "bytes_unchanged": "0",
          "bytes_remaining": "21660032",
          "bytes_total": "200048640",
          "files_transferred": "17",
          "files_unchanged": "0",
          "files_remaining": "4",
          "files_total": "21",
          "percent_complete": 89.0368314738253,
          "throughput_current": "12330689",
          "throughput_overall": "12330689"
        }
      },
      "last_job": null
    }
  ]
  ```
{% include content-reuse/shift-view-status-description.md %}

{% include content-reuse/shift-view-status-stop-repeat-copy-job-delete-relationship.md %}


## Troubleshooting Copy Job Issues
Any fatal errors that occur during a copy job cause the job to fail, leaving a partially copied set of files in the directory in your S3 bucket.  However, to let you review the Shift relationship status any failure messages, the Shift relationship continues to exist. You can start a new job to complete the copying of objects to the S3 bucket&#8212;any successfully transferred files from the previous job aren't retransferred from your Qumulo cluster.

Whenever Qumulo Core doesn't complete an operation successfully and returns an error from the API or CLI, the `error` field within the `last_job` field (that the `replication_list_object_relationship_statuses` command returns) contains a detailed failure message. For more troubleshooting details, see `qumulo-replication.log` on your Qumulo cluster.


## Best Practices
We recommend the following best practices for working with Qumulo Shift-To for Amazon S3.
* **Bucket Lifecycle Policy:** To abort any incomplete uploads older than several days and ensure the automatic clean-up of any storage that incomplete parts of large objects (left by failed or interrupted replication operations) use, configure a bucket lifecycle policy. For more information, see [Uploading and copying objects using multipart upload](https://docs.aws.amazon.com/AmazonS3/latest/userguide/mpuoverview.html#mpu-abort-incomplete-mpu-lifecycle-config) in the _Amazon Simple Storage Service User Guide_.
* **VPC Endpoints:** For best performance when using a Qumulo cluster in AWS, configure a [VPC endpoint](https://docs.aws.amazon.com/vpc/latest/privatelink/vpc-endpoints.html) to S3. For on-premises Qumulo clusters, we recommend [AWS Direct Connect](https://docs.aws.amazon.com/whitepapers/latest/aws-vpc-connectivity-options/aws-direct-connect.html) or another high-bandwidth, low-latency connection to S3.
* **Unique Artifacts:** To avoid collisions between different data sets, specify a unique object folder or unique bucket for each replication relationship from a Qumulo cluster to S3.
* **Object Versioning:** To protect against unintended overwrites, enable object versioning. For more information, see [Using versioning in S3 buckets](https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectVersioning.html) in the _Amazon Simple Storage Service User Guide_.
* **Completed Jobs:** If you don't plan to use a Shift relationship to download updates from S3, delete the relationship to free up any storage associated with it.
* **Concurrent Replication Relationships:** To increase parallelism, especially across distinct datasets, use concurrent replication relationships to S3. To avoid having a large number of concurrent operations impact client I/O to the Qumulo cluster, limit the number of concurrent replication relationships. While there is no hard limit, we don't recommend creating more than 100 concurrent replication relationships on a cluster (including both Shift and Qumulo local replication relationships).


## Restrictions
* **Object-Locked Buckets:** You can't use buckets configured with S3 Object Lock and a default retention period for Shift-To. If possible, either remove the defauly retention period and set retention periods explicitly on objects uploaded outside of Shift or use a different S3 bucket without S3 Object Lock enabled. For more information, see [How S3 Object Lock works](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lock-overview.html) in the _Amazon Simple Storage Service User Guide_.
* **File Size Limit:** The size of an individual file can't exceed 5 TiB (this is the maximum object size that S3 supports). There is no limit on the total size of all your files.
* **File Path Limit:** The length of a file path must be shorter than 1,024 characters, including the configured object folder prefix, excluding the local directory path.
* **Hard Links:** Qumulo Core 3.2.3 (and higher) supports hard links, up to the maximum object size that S3 supports.
* **Objects Under the Same Key:** Unless an object contains Qumulo-specific hash metadata that matches a file, any object that exists under the same key that a new relationship replicates _is overwritten_. To retain older versions of overwritten objects, enable versioning for your S3 bucket. For more information, see [Using versioning in S3 buckets](https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectVersioning.html) in the _Amazon Simple Storage Service User Guide_.
* **Object Checksums:** All files replicated using S3 server-side integrity verification (during upload) use a SHA256 checksum stored in the replicated object's metadata.
* **S3-Compatible Object Stores:** S3-compatible object stores aren't supported. Currently, Qumulo Shift-To supports replication only to Amazon S3.
* **HTTP:** HTTP isn't supported. All Qumulo connections are encrypted using HTTPS and verify the S3 server's SSL certificate.
* **Anonymous Access:** Anonymous access isn't supported. You must use valid AWS credentials.
* **Replication without Throttling:** Replication provides no throttling and might use all available bandwidth. If necessary, use Quality of Service rules on your network.
* **Amazon S3 Standard Storage Class:** Qumulo Shift-To supports uploading only objects stored in the Amazon S3 Standard storage class. You can't download objects stored in the Amazon S3 Glacier or Deep Archive storage classes and any buckets that contain such objects cause a copy job to fail.
* **Content-Type Metadata:** Because all objects are stored in S3 using the default `binary/octet-stream` content type, they might be interpreted as binary data if you download them using a browser. To attach content-type metadata to your objects, use the AWS Console.
