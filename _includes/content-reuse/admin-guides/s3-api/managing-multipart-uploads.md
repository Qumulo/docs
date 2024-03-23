Qumulo Core supports the [multipart upload functionality]({{site.s3.docs.multipartUpload}}) of the S3 API, which lets you upload objects to a bucket in parts and then, at a later time, combine these parts into a single object.

{% include note.html content="For objects above a certain size (typically, larger than 100 MiB), applications often use the multipart S3 uploads, rather than the `PutObject` S3 API action. The limitation for the `PutObject` action is 5 GiB. For more information about how Qumulo handles this type of operation, see [System-Initiated Multipart S3 Uploads](#system-initiated-uploads)." %}


## Prerequisites
To manage multipart S3 uploads by using the `qq` CLI, you need the following [role-based access control (RBAC)](../authorization-qumulo-core/managing-role-based-access-control-rbac.html) privileges:

* `PRIVILEGE_S3_SETTINGS_WRITE`: Configure frequency of multipart upload cleanup

* `PRIVILEGE_S3_UPLOADS_READ`: List multipart uploads

* `PRIVILEGE_S3_UPLOADS_WRITE`: Abort multipart uploads


## How Multipart S3 Uploads Affect Usable Capacity on a Qumulo Cluster
The following conditions are true for multipart S3 uploads in Qumulo Core.

* To let you resume large uploads in the event of an outage, Qumulo Core stores data on the cluster durably.

* Multipart upload data isn't visible in the Qumulo file system, and isn't included in file system snapshots, until you complete the upload successfully by making a call to the `CompleteMultipartUpload` S3 API.

  {% include note.html content="When you view the breakdown of a Qumulo cluster's capacity by using the Qumulo Core Web UI, REST API, or `qq` CLI, Qumulo Core doesn't distinguish between capacity that the file system and incomplete multipart uploads use." %}

* Qumulo Core doesn't delete multipart data unless it [aborts and cleans up the multipart upload automatically](#cleaning-up-uploads-automatically) or you [abort and clean up the multipart upload manually](#cleaning-up-uploads-manually).

To check how much space incomplete multipart uploads use on your cluster, you can list the uploads by using the Qumulo Core REST API or `qq` CLI. For more information, see [Listing Multipart Uploads](#listing-uploads).

<a id="system-initiated-uploads"></a>
### How System-Initiated Multipart S3 Uploads Work
Occasionally, when you [list your multipart uploads](#listing-uploads), you might see uploads that you didn't initiate. These are _system-initiated uploads_ which Qumulo Core uses for `PutObject` and `CopyObject` S3 API actions for objects that exceed a certain size.

If Qumulo Core encounters an error while performing a system-initiated upload, it attempts to abort the upload and clean up the partial upload data immediately.

However, if Qumulo Core is unable to clean up the incomplete upload data immediately, it cleans up the incomplete upload data in the background, [according to the expiry interval](#cleaning-up-uploads-automatically).

{% include note.html content="The process for background clean-up after incomplete and user-initiated uploads is the same. For more information, see [Aborting and Cleaning Up Multipart S3 Uploads Automatically](#cleaning-up-uploads-automatically)." %}


<a id="listing-uploads"></a>
## Listing Incomplete Multipart S3 Uploads
You can list the incomplete multipart uploads for a single S3 bucket by using the Qumulo Core REST API or `qq` CLI.

{{site.data.alerts.note}}
<ul>
  <li>If you use the <code>ListMultipartUploads</code> S3 API action, the system doesn't show <a href="#system-initiated-uploads">system-initiated uploads</a> or how much space the uploads use on your cluster.</li>
  <li>If you use the Qumulo Core REST API or <code>qq</code> CLI, Qumulo Core shows <a href="#system-initiated-uploads">system-initiated uploads</a> and how much space each upload uses on your cluster.</li>
</ul>
{{site.data.alerts.end}}

* To list incomplete uploads by using the `qq` CLI, run the {% include qq.html command="s3_list_uploads" %} command and specify the bucket name. For example:

  ```bash
  $ qq s3_list_uploads \
    --bucket my-bucket
  ```

* To list incomplete uploads by using the Qumulo Core REST API, send a `GET` request to the `/v1/s3/buckets/<bucket-name>/uploads/` endpoint and specify the bucket name.

The output from the `qq` CLI and REST API is the same. The following example output is a single JSON object that contains the list of objects for the specified bucket. The list shows information for each multipart S3 upload, including:

* When each upload was initiated

* Which identity initiated the upload

* When the upload received data last

* How much space the upload uses on the cluster&mdash;by data, by metadata, and in total&mdash;in units of blocks (4,096 bytes per block)

```json
{
  "uploads": [
    {
      "bucket": "my-bucket",
      "completing": false,
      "datablocks": "16384",
      "id": "00000000example1",
      "initiated": "2023-03-02T19:01:00.446468848Z",
      "initiator": {
        "auth_id": "500",
        "domain": null,
        "gid": null,
        "name": null,
        "sid": null,
        "uid": null
      },
      "key": "deployment/data1.dat",
      "last_modified": "2023-03-02T19:03:37.209271702Z",
      "metablocks": "3",
      "system_initiated": false,
      "total_blocks": "16387"
    },
    {
      "bucket": "my-bucket",
      "completing": false,
      "datablocks": "24576",
      "id": "00000000example2",
      "initiated": "2023-03-02T19:09:04.530619255Z",
      "initiator": {
        "auth_id": "500",
        "domain": null,
        "gid": null,
        "name": null,
        "sid": null,
        "uid": null
      },
      "key": "release.dat",
      "last_modified": "2023-03-02T19:09:06.436699236Z",
      "metablocks": "4",
      "system_initiated": true,
      "total_blocks": "24580"
    }
  ]
}
```


<a id="cleaning-up-uploads-automatically"></a>
## Aborting and Cleaning Up Multipart S3 Uploads Automatically
Qumulo Core automatically aborts and cleans up an incomplete multipart S3 if the upload doesn't receive any data after the configured _expiry interval_ (1 day by default).

When Qumulo Core removes a multipart upload, it frees up the space that the upload uses on the cluster. You can configure the expiry interval by using the Qumulo Core REST API or `qq` CLI.

To configure the expiry interval for all current and future multipart uploads by using the `qq` CLI, run the {% include qq.html command="s3_modify_settings" %} command and the `--multipart-upload-expiry-interval` flag and specify one of the following:

* The string `never`.
  
* A string in the format `<quantity><units>` (without a space), where `<quantity>` is a positive integer less than 100 and `<units>` is one of the following strings:
  
  * `days`
  * `hours`
  * `minutes`
  * `months`
  * `weeks`

In the following example, we instruct Qumulo Core to abort and clean up uploads that haven't received data in more than 30 days.

```bash
$ qq s3_modify_settings \
  --multipart-upload-expiry-interval 30days
```

In the following example, we disable automatic cleanup.

```bash
$ qq s3_modify_settings \
  --multipart-upload-expiry-interval never
```


<a id="cleaning-up-uploads-manually"></a>
## Aborting or Cleaning Up Multipart S3 Uploads Manually
Use the Qumulo Core REST API or `qq` CLI to abort and clean up the upload. You need the bucket name and upload ID. For more information about looking up this information, see [Listing Incomplete Multipart S3 Uploads](#listing-uploads).

{% include note.html content="If you are an administrative user or the user who initiated the upload, you can use the `AbortMultipartUpload` S3 API action. In addition to the bucket name and upload ID, you also need the object key for the upload." %}

* To abort an upload by using the `qq` CLI, run the {% include qq.html command="s3_abort_upload" %} command and specify the upload ID. For example:

  ```bash
  $ qq s3_abort_upload \
    --bucket my-bucket \
    --upload-id 000000000example
  ```

* To abort an upload by using the Qumulo Core REST API, send a `DELETE` request to the `/v1/s3/buckets/<bucket-name>/uploads/<upload-ID>` endpoint and specify the upload ID. For example:

  ```
  DELETE /v1/s3/buckets/my-bucket/uploads/000000000example
  ```

There is no response body for both the `qq` CLI and REST API. Qumulo Core returns a `204 No Content` status code when the upload is aborted or the cleanup is complete.
