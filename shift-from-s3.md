---
title: Using Qumulo Shift-From to Copy Objects from Amazon S3
permalink: shift-from-s3.html
tags:
  - shift_from
  - copy
  - copy_objects
  - copy_files
  - object_copy
  - amazon_s3
  - s3
  - iam_permissions
  - iam
  - cli_commands
  - cli
  - shift_relationships
  - shift
  - relationships
  - configuration_details
  - status
---

# Using Qumulo Shift-From for Amazon S3 to Copy Objects
This guide explains how you can use Qumulo Shift-From to copy objects from a folder in an Amazon Simple Storage Service (Amazon S3) bucket (cloud object store) to a directory in a Qumulo cluster. For more information about copying objects from Qumulo to S3, see [Qumulo Shift for Amazon S3](https://care.qumulo.com/hc/en-us/articles/360053162273-Qumulo-Shift-for-Amazon-S3) in Qumulo Care.

The guide describes how a Shift-From relationship works and includes information about the prerequisites, IAM permissions, and CLI commands that you can use to copy files and manage Shift relationships.

## Prerequisites
* A Qumulo cluster with:

  * Qumulo Core 4.2.3 (or higher)

  * HTTPS connectivity to `s3.<region>.amazonaws.com` though one of the following means:

    * Public Internet

    * [VPC endpoint](https://docs.aws.amazon.com/vpc/latest/privatelink/vpc-endpoints.html)

    * [AWS Direct Connect](https://docs.aws.amazon.com/whitepapers/latest/aws-vpc-connectivity-options/aws-direct-connect.html)
    
    For more information, see [AWS IP address ranges](https://docs.aws.amazon.com/general/latest/gr/aws-ip-ranges.html) in the AWS General Reference.

* Membership in a Qumulo role with the following privileges:

  * `PRIVILEGE_REPLICATION_OBJECT_WRITE`

  * `PRIVILEGE_REPLICATION_OBJECT_READ`

* An existing bucket with contents in Amazon S3

* AWS credentials (access key ID and secret access key) with the following permissions:

  * `s3:GetObject`

  * `s3:ListBucket`

  For more information, see [Understanding and getting your AWS credentials](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html) in the AWS General Reference
  
### Example IAM Policy
In the following example, the IAM policy gives permission to read from and write to the `my-folder` folder in the `my-bucket`. This policy can give users the minimal set of permissions required to run Shift-From jobs. (Shift-To jobs require a less-restrictive policy. For more information and an example, see [Qumulo Shift for Amazon S3](https://care.qumulo.com/hc/en-us/articles/360053162273) in Qumulo Care.

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
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::my-bucket/my-folder/*"
    }
  ]
}
```


## How Shift-From Relationships Work
Qumulo Core performs the following steps when it creates a Shift-From relationship.

1. Verifies that the directory exists on the Qumulo cluster and that the specified S3 bucket exists, is accessible using the specified credentials, and contains downloadable objects.

1. Creates the Shift-From relationship.

1. Starts a job using one of the nodes in the Qumulo cluster.

   **Note:** If you perform multiple Shift operations, Qumulo Core uses multiple nodes.

1. Lists the contents of the S3 folder and downloads the objects to the specified directory on your Qumulo cluster.

1. Forms the full path of the file on the Qumulo custer by appending the path of the object (relative to the S3 folder) to the directory path on the Qumulo cluster.

   For example, the following object is downloaded to `/my-dir/my-project/file.text`, where `my-folder` is the specified S3 folder and `my-dir` is the directory on your Qumulo cluster.

   ```
   https://my-bucket.s3.us-west-2.amazonaws.com/my-folder/my-project/file.txt
   ```

   **Note:** This process doesn't encode or transform your data in any way. Shift-From attempts only to map every S3 object in the specified folder to a file on your Qumulo cluster.

1. Avoids redownloading an unchanged object in a subsequent job by tracking the information about an object and its replicated object.

   **Note:** If you rename or move an object or local file between jobs, or if there are any metadata changes in S3 or Qumulo, the object is replicated again.

### Storing and Reusing Relationships
To let you monitor the completion status of a job, start new jobs for a relationship after the initial job finishes, and delete the relationship (when you no longer need the S3-folder-Qumulo-directory pair), the Shift-From relationship remains on the Qumulo cluster. To avoid redownloading objects that a previous copy job downloaded, relationships take up approximately 100 bytes per object. To free this storage, you can delete relationships that you no longer need.

If you repeatedly download from the same S3 folder, you can speed up the download process (and skip already downloaded files) by using the same relationship.

A new relationship for subsequent downloads doesn't share any tracking information with previous relationships associated with a directory and recopy data that might be already downloaded.


## Using the Qumulo WebUI and CLI to Copy Files and Manage Relationships
This section describes how you can use the Qumulo CLI to copy files from Amazon S3 to a Qumulo cluster, review Shift relationship details, abort a running copy job, repeat a completed copy job, and delete a relationship.

### Copying Files from Amazon S3
To copy files, use the `replication_create_object_relationship` command and specify the following:
* Local directory path on Qumulo cluster
* Copy direction (copy-from)
* S3 object folder
* S3 bucket
* AWS region
* AWS access key ID
* AWS secret access key

The following example shows how you can create a relationship between the directory `/my-dir/` on a Qumulo cluster and the S3 bucket `my-bucket` and folder `/my-folder/` in the `us-west-2` AWS region. The secret access key is associated with the access key ID.

```bash
qq replication_create_object_relationship \
  --local-directory-path /my-dir/ \
  --direction COPY_FROM_OBJECT \
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
  "local_directory_id": "3",
  "direction": "COPY_FROM_OBJECT",
}
```

With Qumulo Core 4.2.5 and higher, you can create and manage Shift-from copy using the Web UI. To do so, navigate to `Cluster` -> `Copy to/from S3` and then click `Create Copy`.

![title](administrator-guide/images/administrator-shift-from-create-copy1.png)

On the next screen select `Remote` to `Local` direction and then input path, region, folder, bucket, and key parameters like shown on the screen below. 

![title](administrator-guide/images/administrator-shift-from-create-copy2.png)

Select `Advanced S3 Server Settings` for additional S3 server configuration.

![title](administrator-guide/images/administrator-shift-from-create-copy3.png)

In order to proceed next click `Create Copy` on the bottom of the screen. A confirmation dialog will appear to highlight details of the copy relationship. If everything is correct, click `Yes, Create` to confirm.

![title](administrator-guide/images/administrator-shift-from-create-copy4.png)

### Viewing Configuration Details and Status of Shift Relationships
* To view configuration details for all Shift relationships, use the `replication_list_object_relationships` command.

* To view configuration details for a specific relationship, use the `replication_get_object_relationship` command followed by the `--id` and the Shift relationship ID (GUID), for example:

   ```bash
   qq replication_get_object_relationship --id 1c23b4ed-5c67-8f90-1e23-a4f5f6ceff78
   ```

* To view the status of a specific relationship, use the `replication_get_object_relationship_status` command followed by the `--id` and the Shift relationship ID.

* To view the status of all relationships, use the `replication_list_object_relationship_statuses` command.

  The CLI returns the details of all relationships in JSON format, for example:

  ```json
  [
    {
      "direction": "COPY_FROM_OBJECT",
      "access_key_id": "AKIAIOSFODNN7EXAMPLE",
      "bucket": "my-bucket",
      "object_store_address": "s3.us-west-2.amazonaws.com",
      "id": "1c23b4ed-5c67-8f90-1e23-a4f5f6ceff78",
      "object_folder": "my-folder/",
      "port": 443,
      "ca_certificate": null,
      "region": "us-west-2",
      "local_directory_id": "3",
      "local_directory_path": "/my-dir/",
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
          "percent_complete": 0.890368314738253,
          "throughput_current": "12330689",
          "throughput_overall": "12330689"
        }
      },
      "last_job": null
    }
  ]
  ```

  The `state` field indicates a `REPLICATION_RUNNING` status and `current_job` shows ongoing progress. When Qumulo Core copies files from S3, details for the most recent completed job become available in the `last_job` field, the `state` field changes to `REPLICATION_NOT_RUNNING` and the `current_job` field reverts to `null`.

  **Note:** If you already ran a job for a relationship, it is possible for both the `current_job` and `last_job` fields to be non-null while you run a new job.

### Stopping a Copy Job in Progress
To stop a copy job already in progress, use the `replication_abord_object_relationship` command followed by the `--id` and the Shift relationship ID.

### Repeating a Completed Copy Job
To repeat a completed copy job, use the `replication_start_object_relationship` command followed by the `--id` and the Shift relationship ID.

This command begins a new job for the existing relationship and downloads any content that changed in the S3 bucket or on the Qumulo cluster since the time the previous job ran.

### Deleting a Shift Relationship
After your copy job is complete, you can delete your Shift relationship. To do this, run the `replication_delete_object_relationship` command followed by the `--id` and the Shift relationship ID.

**Note:** You can run this command only against a relationship that doesn't have any active jobs running.

This command removes the copy job's record, leaving locally stored objects unchanged. Any storage that the relationship used to track downloaded objects becomes available when you delete the relationship.


## Troubleshooting Copy Job Issues
Any fatal errors that occur during a copy job cause the job to fail, leaving a partially copied set of files in the directory on your Qumulo cluster.  However, to let you review the Shift relationship status any failure messages, the Shift relationship continues to exist. You can start a new job to complete the copying of objects from the S3 bucket&#8212;any successfully transferred files from the previous job aren't retransferred to your Qumulo cluster.

Whenever Qumulo Core doesn't complete an operation successfully and returns an error from the API or CLI, the `error` field within the `last_job` field (that the `replication_list_object_relationship_statuses` command returns) contains a detailed failure message. For more troubleshooting details, see `qumulo-replication.log` on your Qumulo cluster.


## Best Practices
We recommend the following best practices for working with Qumulo Shift-From for Amazon S3.
* **Inheritable Permissions:** Because the system user creates the files copied using Shift-From for S3, the system owns these files by default. To assign the necessary permissions to copied files, you must assign the necessary inheritable permissions to the root directory of the relationship. This ensures that the copied subdirectories and files inherit the permissions.
* **VPC Endpoints:** For best performance when using a Qumulo cluster in AWS, configure a [VPC endpoint](https://docs.aws.amazon.com/vpc/latest/privatelink/vpc-endpoints.html) to S3. For on-premises Qumulo clusters, we recommend [AWS Direct Connect](https://docs.aws.amazon.com/whitepapers/latest/aws-vpc-connectivity-options/aws-direct-connect.html) or another high-bandwidth, low-latency connection to S3.
* **Repeated Synchronization:** If you need to repeatedly synchronize an S3 folder with a Qumulo directory, we recommend reusing the same relationship. This lets you avoid repeated downloading of unchanged objects that already exist locally.
* **Completed Jobs:** If you don't plan to use a Shift relationship to download updates from S3, delete the relationship to free up any storage associated with it.
* **Concurrent Replication Relationships:** To increase parallelism, especially across distinct datasets, use concurrent replication relationships from S3. To avoid having a large number of concurrent operations impact client I/O to the Qumulo cluster, limit the number of concurrent replication relationships. While there is no hard limit, we don't recommend creating more than 100 concurrent replication relationships on a cluster (including both Shift and Qumulo source replication relationships).


## Restrictions
* **S3-Compatible Object Stores:** S3-compatible object stores aren't supported. Currently, Qumulo Shift-From supports replication only from Amazon S3.
* **HTTP:** HTTP isn't supported. All Qumulo connections are encrypted using HTTPS and verify the S3 server's SSL certificate.
* **Anonymous Access:** Anonymous access isn't supported. You must use valid AWS credentials.
* **Replication without Throttling:** Replication provides no throttling and might use all available bandwidth. If necessary, use Quality of Service rules on your network.
* **Amazon S3 Standard Storage Class:** Qumulo Shift-From supports downloading only objects stored in the Amazon S3 Standard storage class. You can't download objects stored in the Amazon S3 Glacier or Deep Archive storage classes and any buckets that contain such objects cause a copy job to fail.
* **Disallowed Amazon S3 Paths in Qumulo Clusters:** Certain allowed Amazon S3 paths can't be copied to Qumulo clusters and cause a copy job to fail. Disallowed paths contain:
  * A trailing slash (`/`) character (with non-zero object content length)
  * Consecutive slash (`/`) characters
  * Single and double period (`.`, `..`) characters
  * The path component `.snapshot`
* **Disallowed conflicting types:** When content in the Amazon S3 bucket or the Qumulo directory changes over time, it is possible to have other conflicts related to type mismatches. For example, a conflict occurs when a remote object maps to a local file system directory entry which is not a regular file (e.g. directory or a special file) or which is a regular file with two or more links. In those cases, the Shift-from job fails with an error message providing details about the conflict.
* **Disallowed Amazon S3 Path Configurations:** Because of conflicting type requirements, Qumulo Core can't recreate certain allowed Amazon S3 path configurations on Qumulo clusters. For example, if an S3 bucket contains objects `a/b/c` and `a/b`, then path `a/b` must be both a file and directory on a Qumulo cluster. Because this isn't possible, this configuration causes a copy job to fail.
* **Directories in Multiple Relationships:** A directory on a Qumulo cluster for one Shift relationship can't overlap with a directory used for another Shift relationship, or with a directory that acts as a target for a Qumulo-to-Qumulo replication relationship. This causes the relationship creation to fail.
* **Changes to S3 Folder During Copy Job:** Currently, Shift-From assumes that the S3 folder remains unchanged throughout the copy job. Any changes (deleting, archiving, or modifying an object) during the copy job might cause a copy job to fail.
* **Read-Only Target Directory:** When the Shift-From copy job begins, the target directory on the Qumulo cluster becomes read-only. While no external clients can modify anything in the directory or its subdirectories, all content remains readable. When the copy job is complete, the directory reverts to its previous permissions.
* **Partially Downloaded Files:** If a copy job is interrupted or encounters a fatal error (that can't be resolved by retrying the operation), Qumulo Core attempts to delete partially downloaded files. Because this is a best-effort process, certain interruptions can prevent the cleanup of partially downloaded files.
