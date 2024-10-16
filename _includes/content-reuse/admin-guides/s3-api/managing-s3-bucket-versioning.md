You can configure S3 bucket versioning {{site.s3.permissions.APIorCLI}}. For more information, see {% include qq.html command="s3_modify_bucket" %} in the {{site.guides.cli}}. {{site.s3.permissions.directAPI}}

For information about S3 bucket versioning limits, see [Supported Functionality and Limits](supported-s3-functionality-known-limits.html#versioning).

## How Bucket Versioning works in Qumulo Core
Qumulo Core stores S3 object versions as independent files in the file system. Qumulo Core names these versions by using their version ID.

In the following example:

* The versioned files are stored in `/dir/.s3-versioning~/obj`.

  {% include important.html content="Because `.s3-versioning~` is a normal, hidden directory, visible and accessible to other protocols. To ensure consistent S3 API behavior, we strongly recommend avoiding the use of other protocols to write to the directory. Any protocol can read from the directory safely." %}

* An object with the object store key `dir/obj` has two versions: `{{site.exampleUUID41}}` and `{{site.exampleUUID42}}`.

  {{site.data.alerts.note}}
  <ul>
    <li>To access a specific version of a file by using CLI or REST API, specify the version ID. </li>
    <li>To access the <em>head version</em> (current version) of a file, omit the version ID.</li>
  </ul>
  {{site.data.alerts.end}}

* The system-created hard link points to the latest version of the object.

* The on-disk representation is as follows:

  ```
  /
  └── dir/
      ├── .s3-versioning~/
      |   └── obj/
      |       ├── {{site.exampleUUID41}}
      |       └── {{site.exampleUUID42}}
      └── obj <hardlink: /dir/.s3-versioning~/obj/{{site.exampleUUID41}}>
  ```
