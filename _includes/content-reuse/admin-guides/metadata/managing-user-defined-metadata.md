## How {{site.udm.t}} Works in Qumulo Core

Qumulo Core lets you add _{{site.udm.l}}_ to any file type stored in its file system. {{site.udm.s}} comprises user-specified key-value pairs that have the following requirements:

* The key must be a Unicode string.
* The value must be a sequence of bytes.
* The total size of each key-value pair must be under 400 KB.


## Keyspace Types and Functions {#keyspace}
{{site.udm.s}} in Qumulo Core is divided into `GENERIC`, `S3`, and `WELL_KNOWN` _keyspaces_. Keyspaces work like _containers_ for key-value pairs. The `S3` and `WELL_KNOWN` keyspaces primarily support the [S3 API](https://docs.aws.amazon.com/AmazonS3/latest/API/Welcome.html), which requires all files to have separate sets of metadata in separate keyspaces.

The `GENERIC` and `S3` keyspaces can hold approximately 17 trillion key-value pairs and have the following requirements:

* All keys within a keyspace must be unique.
* The keyspace and key are required to create or access a {{site.udm.l}} entry.

### The WELL_KNOWN Keyspace {#well-known-keyspace}
In Qumulo Core 7.10.2 (and higher), the `WELL_KNOWN` keyspace holds the [standard object headers](../s3-api/supported-s3-functionality-known-limits.html#special-considerations-standard-object-headers) that the S3 API stores and returns for an object. The keyspace has the following requirements:

{% capture keyType %}
<ul>
  <li><code>Cache-Control</code></li>
  <li><code>Content-Disposition</code></li>
  <li><code>Content-Encoding</code></li>
  <li><code>Content-Language</code></li>
  <li><code>Content-Type</code></li>
  <li><code>Expires</code></li>
</ul>
{% endcapture %}

<ul>
  <li>
    The key must be one of the following:
    {{ keyType }}
  </li>
  <li>
    The value:
    <ul>
      <li>Can be case-insensitive</li>
      <li>Must contain UTF-8 text valid for the HTTP header field</li>
      <li>Must not contain any control characters, except for the tab character</li>
    </ul>
  </li>
  <li>The combined size of the key and value must not exceed 2,048 bytes.</li>
</ul>


## Managing {{site.udm.t}} by Using the qq CLI
This section explains how to create, retrieve, list, and delete {{site.udm.l}} by using the `qq` CLI.

{{site.data.alerts.note}}
<ul>
  <li>
    All <code>qq</code> CLI commands default to using the <code>GENERIC</code> keyspace.
    <ul>
      <li>For the <code>S3</code> keyspace, use the <code>--s3</code> flag.</li>
      <li>For the <a href="#well-known-keyspace"><code>WELL_KNOWN</code> keyspace</a>, use the <code>--well-known</code> flag.</li>
    </ul>
  </li>
  <li>In the following examples, you can specify the file path by using the <code>--path</code> flag or the file ID by using the <code>--id</code> flag.</li>
</ul>
{{site.data.alerts.end}}

### Prerequisites
Managing {{site.udm.l}} requires the following privileges:

* `READ_EA`: Read the {{site.udm.l}} from a file
* `WRITE_EA`: Write to, or delete, the {{site.udm.l}} of a file

### To Create a Generic {{site.udm.t}} Entry for a File by Using the qq CLI
Run the {% include qq.html command="fs_set_user_metadata" %} command and specify the path to the file, the key, and the value. For example:

```bash
qq fs_set_user_metadata \
  --path my-file \
  --key my-key \
  --value my-value
```

{{site.udm.hex}}

For more information, see {% include qq.html command="fs_set_user_metadata" %} in the {{site.guides.cli}}.

### To Retrieve a Generic {{site.udm.t}} Entry for a File by Using the qq CLI
Use {% include qq.html command="fs_get_user_metadata" %} command and specify the path to the file and the key. For example:

```bash
qq fs_get_user_metadata \
  --path my-file \
  --key my-key
```

* {{site.udm.hex}}
* {{site.udm.snap}}

For more information, see {% include qq.html command="fs_get_user_metadata" %} in the {{site.guides.cli}}.

### To List All Generic {{site.udm.t}} Entries for a File by Using the qq CLI
Run the {% include qq.html command="fs_list_user_metadata" %} command and specify the path to the file. For example:

```bash
qq fs_list_user_metadata \
  --path my-file
```

* {{site.udm.hex}}
* {{site.udm.snap}}

For more information, see {% include qq.html command="fs_list_user_metadata" %} in the {{site.guides.cli}}.

### To Delete a Generic {{site.udm.t}} Entry for a File by Using the qq CLI
Run the {% include qq.html command="fs_delete_user_metadata" %} command and specify the path to the file and the key. For example:

```bash
qq fs_delete_user_metadata \
  --path my-file \
  --key my-key
```

For more information, see {% include qq.html command="fs_delete_user_metadata" %} in the {{site.guides.cli}}.

### To Change Standard Object Headers by Using the qq CLI
In Qumulo Core 7.10.2 (and higher), you can change the [standard object headers](../s3-api/supported-s3-functionality-known-limits.html#special-considerations-standard-object-headers) that the [`GetObject`]({{site.s3.actions.GetObject}}) and [`HeadObject`]({{site.s3.actions.HeadObject}}) S3 API actions returns for an object without rewriting the object.

{% capture delKey %}Deleting the `content-type` key causes [`GetObject`]({{site.s3.actions.GetObject}}) and [`HeadObject`]({{site.s3.actions.HeadObject}}) API actions to return `Content-Type: binary/octet-stream` for the object.{% endcapture %}
{% include note.html content=delKey %}

Run the {% include qq.html command="fs_set_user_metadata" %}, specify the path to the object, the key and value for the headers, and the `--well-known` flag. For example:

```bash
qq fs_set_user_metadata \
 --path /buckets/my-bucket/my-object.json \
 --well-known \
 --key content-type \
 --value application/json
```

### To List Standard Object Headers by Using the qq CLI
In Qumulo Core 7.10.2 (and higher), you can list the [standard object headers](../s3-api/supported-s3-functionality-known-limits.html#special-considerations-standard-object-headers) that the S3 API returns for an object without rewriting the object.

Run the {% include qq.html command="fs_list_user_metadata" %} command, specify the path to the object, and use the `--well-known` flag. For example:

```bash
qq fs_list_user_metadata \
  --path /buckets/my-bucket/my-object.json \
  --well-known
```


## Managing {{site.udm.t}} by Using the S3 API
{% capture fullSupp %}In Qumulo Core 6.3.2 (and higher) the [Qumulo S3 API](../s3-api) supports {{site.udm.l}} fully. For more information about how to access metadata by using the S3 API, see the [Amazon Simple Storage Service
API Reference](https://docs.aws.amazon.com/AmazonS3/latest/API/Welcome.html).{% endcapture %}
{% include note.html content=fullSupp %}

S3 categorizes metadata as follows:

<table>
  <thead>
    <tr>
      <th>Metadata Category</th>
      <th>Description</th>
      <th>Maps To</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Metadata</td>
      <td>Immutable metadata that remains for the life of the object</td>
      <td><a href="#keyspace"><code>S3</code> keyspace</a></td>
    </tr>
    <tr>
      <td>Tags</td>
      <td>
        Mutable metadata that doesn't impact the object's entity tag
        {% include important.html content="Only tag values encoded with UTF-8 are visible to the S3 API." %}
      </td>
      <td><a href="#keyspace"><code>GENERIC</code> keyspace</a></td>
    </tr>
    <tr>
      <td>Standard Object Headers</td>
      <td>
        Headers that the client specifies when it creates an object:
        {{ keyType }}
      </td>
      <td>Qumulo Core 7.10.2 (and higher): <a href="#well-known-keyspace"><code>WELL_KNOWN</code> keyspace</a></td>
    </tr>
  </tbody>
</table>
