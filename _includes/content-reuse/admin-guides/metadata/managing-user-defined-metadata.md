## How {{site.udm.t}} Works in Qumulo Core

Qumulo Core lets you add _{{site.udm.l}}_ to any file type stored in its file system. {{site.udm.s}} comprises user-specified key-value pairs that have the following requirements:

* The key must be a Unicode string.
* The value must be a sequence of bytes.
* The total size of each key-value pair must be under 400 KB.


<a id="keyspace"></a>
## Keyspace Types and Functions
{{site.udm.s}} in Qumulo Core is divided into `GENERIC` and `S3` _keyspaces_. Keyspaces work like _containers_ for key-value pairs. The `S3` keyspace primarily supports the [S3 API](https://docs.aws.amazon.com/AmazonS3/latest/API/Welcome.html), which requires all files to have two sets of metadata in separate keyspaces.

Keyspaces can hold approximately 17 trillion key-value pairs and have the following requirements:

* All keys within a keyspace must be unique.
* The keyspace and key are required to create or access a {{site.udm.l}} entry.


## Managing {{site.udm.t}} by Using the qq CLI
This section explains how to create, retrieve, list, and delete {{site.udm.l}} by using the `qq` CLI.

{{site.data.alerts.note}}
<ul>
  <li>All <code>qq</code> CLI commands default to using the <a href="#keyspace"><code>GENERIC</code> keyspace</a>. For the <code>S3</code> keyspace, use the <code>--s3</code> flag.</li>
  <li>In the following examples, you can specify the file path by using the <code>--path</code> flag or the file ID by using the <code>--id</code> flag.</li>
</ul>
{{site.data.alerts.end}}

### Prerequisites
Managing {{site.udm.l}} requires the following privileges:

* `READ_EA`: Read the {{site.udm.l}} from a file
* `WRITE_EA`: Write to, or delete, the {{site.udm.l}} of a file

### To Create a Generic {{site.udm.t}} Entry for a File by Using the qq CLI
Use the `fs_set_user_metadata` command and specify the path to the file, the key, and the value. For example:

```bash
qq fs_set_user_metadata \
  --path my-file \
  --key my-key \
  --value my-value
```

{{site.udm.hex}}

For more information, see [`qq fs_set_user_metadata`](https://docs.qumulo.com/qq-cli-command-guide/fs/fs_set_user_metadata.html) in the {{site.guides.cli}}.

### To Retrieve a Generic {{site.udm.t}} Entry for a File by Using the qq CLI
Use `fs_get_user_metadata` command and specify the path to the file and the key. For example:

```bash
qq fs_get_user_metadata \
  --path my-file \
  --key my-key
```

* {{site.udm.hex}}
* {{site.udm.snap}}

For more information, see [`qq fs_get_user_metadata`](https://docs.qumulo.com/qq-cli-command-guide/fs/fs_get_user_metadata.html) in the {{site.guides.cli}}.

### To List All Generic {{site.udm.t}} Entries for a File by Using the qq CLI
Use the `fs_list_user_metadata` command and specify the path to the file. For example:

```bash
qq fs_list_user_metadata \
  --path my-file
```

* {{site.udm.hex}}
* {{site.udm.snap}}

For more information, see [`qq fs_list_user_metadata`](https://docs.qumulo.com/qq-cli-command-guide/fs/fs_list_user_metadata.html) in the {{site.guides.cli}}.

### To Delete a Generic {{site.udm.t}} Entry for a File by Using the qq CLI
Use the `fs_delete_user_metadata` command and specify the path to the file and the key. For example:

```bash
  qq fs_delete_user_metadata \
    --path my-file \
    --key my-key
```

For more information, see [`qq fs_delete_user_metadata`](https://docs.qumulo.com/qq-cli-command-guide/fs/fs_delete_user_metadata.html) in the {{site.guides.cli}}.


## Managing {{site.udm.t}} by Using the S3 API
S3 categorizes metadata as:

* **Metadata**
  
  * Immutable metadata that remains for the life of the object.
    
  * Qumulo Core maps metadata to the [`S3` keyspace](#keyspace).
    
* **Tags**
  
  * Mutable metadata that doesn't impact the object's entity tag.

    {% include important.html content="Tag values that can't be encoded by using UTF-8 aren't visible to S3." %}
    
  * Qumulo Core maps tags to the [`GENERIC` keyspace](#keyspace).
 
In Qumulo Core 6.3.2 (and higher) the [Qumulo S3 API](../s3-api) supports {{site.udm.l}} fully. For more information about how to access metadata by using the S3 API, see the [Amazon Simple Storage Service
API Reference](https://docs.aws.amazon.com/AmazonS3/latest/API/Welcome.html).
