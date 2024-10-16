## Prerequisites
Before you can enable Object Lock for an S3 bucket, you must first [enable S3 Bucket versioning](managing-s3-bucket-versioning.html).


## How Object Lock for S3 Buckets Works in Qumulo Core
You can configure Object Lock for an S3 Bucket in three ways:

* **Lock with manual retention period:** This configuration specifies a fixed period of time during which an object remains locked. Qumulo Core supports _compliance mode,_ a type of retention period which prevents a protected object version from being overwritten or deleted by any user.

  {% include note.html content="Currently, Qumulo Core doesn't support governance mode." %}

  To configure a lock with a manual compliance mode retention period, use the [`PutObjectRetention`]({{site.s3.actions.PutObjectRetention}}) S3 API action or specify the configuration in the headers of the [`CreateMultipartUpload`]({{site.s3.actions.CreateMultipartUpload}}), [`CopyObject`]({{site.s3.actions.CopyObject}}), or [`PutObject`]({{site.s3.actions.PutObject}}) S3 API action.

* **Lock with default retention period:** This configuration is similar to that of a lock with a manual retention period. It ensures that the S3 bucket locks any new object added to it.

  {% include note.html content="Specifying a manual retention period while creating a new object in an S3 bucket overrides the default retention period." %}

* **Legal hold:** This configuration ensures that an object remains locked without an expiration date, until you remove the hold.

  To configure a legal hold, use the [`PutObjectLegalHold`]({{site.s3.actions.PutLegalHold}}) S3 API action or specify the configuration in the headers of the [`CreateMultipartUpload`]({{site.s3.actions.CreateMultipartUpload}}), [`CopyObject`]({{site.s3.actions.CopyObject}}), or [`PutObject`]({{site.s3.actions.PutObject}}) S3 API action.

It isn't possible to change any data or attributes of an object with a valid lock (with a manual or default retention period) or with a legal hold by using any of the protocols which Qumulo Core supports.

{{site.data.alerts.note}}
<ul>
  <li>Because Qumulo Core uses hardlinks for changing the location of S3 bucket versions, it is possible to remove links from locked objects through any protocol. However, attempting to delete the last remaining link to a locked object results in a read-only error.</li>
  <li>Even if a cross-protocol user deletes the hardlink that points to the latest version of a locked object, the object remains accessible by its version ID.</li>
</ul>
{{site.data.alerts.end}}


## Enabling S3 Object Lock Configuration
You can configure S3 bucket locking {{site.s3.permissions.APIorCLI}}. For more information, see {% include qq.html command="s3_modify_bucket" %} and {% include qq.html command="s3_add_bucket" %} in the {{site.guides.cli}}. {{site.s3.permissions.directAPI}}


## Viewing S3 Object Lock Configuration
You can view the Object Lock configuration for an S3 bucket in two ways:

* Run the {% include qq.html command="fs_file_get_attr" %} command and use the `--retrieve-file-lock` flag. For example:

  ```bash
  $ qq fs_file_get_attr --retrieve-file-lock --path /demo
  ```

  {{site.exampleOutput}} (Only part of the output is shown).

  ```json
  {
    "lock": {
      "legal_hold": false,
      "retention_period": "2024-10-08T21:53:46.493886743Z"
    }
  }
  ```

* Run the `s3api get-object-retention` command and specify your bucket name, and your S3 access key. For example:

  ```bash
  $ aws s3api get-object-retention \
    --bucket my-bucket \
    --key {{site.exampleAWSaccessKeyID}}
  ```

  {{site.exampleOutput}}

  ```json
  {
    "Retention": {
      "Mode": "COMPLIANCE",
      "RetainUntilDate": "2024-10-08T21:53:46.493Z"
    }
  }
  ```
