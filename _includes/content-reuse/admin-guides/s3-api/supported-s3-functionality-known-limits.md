## Supported S3 API Actions
The following table lists the S3 API actions that Qumulo Core supports and the version from which support begins. For the full list of S3 API actions, see [Actions]({{site.s3.docs.actions}}) in the Amazon Simple Storage Service API Reference.

{{site.data.alerts.note}}
<ul>
  <li>The S3 API became generally available in Qumulo Core 5.3.3. This guide doesn't document enabling or using API actions that became available with preview functionality in versions of Qumulo Core lower than 5.3.3.</li>
  <li>The Qumulo S3 protocol creates data that supports all file system functionality, such as quotas, snapshots, replication, and Cloud Data Fabric functionality.</li>
</ul>
{{site.data.alerts.end}}

  <table>
    <thead>
      <tr>
        <th>API Action</th>
        <th>Supported from Qumulo Core Version</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><code>AbortMultipartUpload</code></td>
        <td>5.3.3</td>
      </tr>
      <tr>
        <td><code>CompleteMultipartUpload</code></td>
        <td>5.3.3</td>
      </tr>
      <tr>
        <td><code>CopyObject</code></td>
        <td>5.3.3</td>
      </tr>
      <tr>
        <td><code>CreateBucket</code></td>
        <td class="fade-row">5.2.3</td>
      </tr>
      <tr>
        <td><code>CreateMultipartUpload</code></td>
        <td>5.3.3</td>
      </tr>
      <tr>
        <td><code>DeleteBucket</code></td>
        <td class="fade-row">5.2.4</td>
      </tr>
      <tr>
        <td><code>DeleteBucketPolicy</code></td>
        <td>7.0.1.1</td>
      </tr>    
      <tr>
        <td><code>DeleteBucketVersioning</code></td>
        <td>7.1.2</td>
      </tr>
      <tr>
        <td><code>DeleteObject</code></td>
        <td class="fade-row">5.2.1</td>
      </tr>
      <tr>
        <td><code>DeleteObjects</code></td>
        <td class="fade-row">5.2.2</td>
      </tr>
      <tr>
        <td><code>DeleteObjectTagging</code></td>
        <td>6.3.2</td>
      </tr>
      <tr>
        <td><code>GetBucketAcl</code></td>
        <td>6.1.1</td>
      </tr>
      <tr>
        <td><code>GetBucketLocation</code></td>
        <td class="fade-row">5.1.2</td>
      </tr>
      <tr>
        <td><code>GetBucketPolicy</code></td>
        <td>7.0.0.1</td>
      </tr>    
      <tr>
        <td><code>GetBucketVersioning</code></td>
        <td>7.1.2</td>
      </tr>
      <tr>
        <td><code>GetObject</code></td>
        <td class="fade-row">5.0.4</td>
      </tr>
      <tr>
        <td><code>GetObjectAcl</code></td>
        <td>6.1.1</td>
      </tr>    
      <tr>
        <td><code>GetObjectLegalHold</code></td>
        <td>7.2.3.2</td>
      </tr>
      <tr>
        <td><code>GetObjectLockConfiguration</code></td>
        <td>7.0.0.1</td>
      </tr>    
      <tr>
        <td><code>GetObjectRetention</code></td>
        <td>7.2.1.1</td>
      </tr>
      <tr>
        <td><code>GetObjectTagging</code></td>
        <td>7.1.2</td>
      </tr>
      <tr>
        <td><code>HeadBucket</code></td>
        <td class="fade-row">5.1.2</td>
      </tr>
      <tr>
        <td><code>HeadObject</code></td>
        <td class="fade-row">5.0.4</td>
      </tr>
      <tr>
        <td><code>ListBuckets</code></td>
        <td class="fade-row">5.0.4</td>
      </tr>
      <tr>
        <td><code>ListMultipartUploads</code></td>
        <td>5.3.3</td>
      </tr>
      <tr>
        <td><code>ListObjects</code></td>
        <td class="fade-row">5.0.5</td>
      </tr>
      <tr>
        <td><code>ListObjectsV2</code></td>
        <td class="fade-row">5.0.4</td>
      </tr>
      <tr>
        <td><code>ListParts</code></td>
        <td>5.3.3</td>
      </tr>
      <tr>
        <td><code>PutBucketPolicy</code></td>
        <td>7.0.1.1</td>
      </tr>
      <tr>
        <td><code>PutBucketVersioning</code></td>
        <td>7.1.2</td>
      </tr>
      <tr>
        <td><code>PutObject</code></td>
        <td class="fade-row">5.2.1</td>
      </tr>
      <tr>
        <td><code>PutObjectLegalHold</code></td>
        <td>7.2.3.2</td>
      </tr>    
      <tr>
        <td><code>PutObjectLockConfiguration</code></td>
        <td>7.2.3.2</td>
      </tr>
      <tr>
        <td><code>PutObjectRetention</code></td>
        <td>7.2.1.1</td>
      </tr>
      <tr>
        <td><code>PutObjectTagging</code></td>
        <td>6.3.2</td>
      </tr>
      <tr>
        <td><code>UploadPart</code></td>
        <td>5.3.3</td>
      </tr>
      <tr>
        <td><code>UploadPartCopy</code></td>
        <td>6.0.2</td>
      </tr>
    </tbody>
  </table>

## Unsupported S3 Functionality
The following table lists some of the S3 API functionality that Qumulo Core doesn't support.

| Unsupported Feature                       | Description |
| ----------------------------------------- | ----------- |
| BitTorrent                                | &mdash;     |
| Bucket ACLs                               | For comparable functionality, use [inheritable access control entries (ACEs)](managing-access-to-s3-buckets.html#inheritable-aces). |
| Bucket lifecycle configurations           | &mdash;     |
| Bucket notifications                      | &mdash;     |
| Control of server-side encryption         | All Qumulo Core data is encrypted at rest. You can't control this functionality by using the S3 API. |
| Object Lock in governance mode            | Qumulo Core supports only compliance mode. |
| Logging controls                          | &mdash;     |
| Multi-chunk payload signing               | Qumulo Core has partial support for the [streaming variants of AWS Signature Version 4 (SigV4)](https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-streaming.html).|
| AWS Signature Version 2                   | Qumulo Core supports only SigV4 signatures. |
| Storage classes                           | Qumulo Core doesn't use the [storage class](https://aws.amazon.com/s3/storage-classes/) concept. All objects have the same storage class status. |
| Temporary access credentials              | &mdash;     |
| Virtual-hosted bucket addressing          | Qumulo Core supports only [path-style bucket addressing]({{site.s3.docs.pathStyleAddressing}}). |
| Web hosting configuration                 | &mdash;     |


## S3 API Limitations
This section describes the most important S3 API limitations in Qumulo Core.

### Authentication
{{site.data.alerts.important}}
<ul>
  <li>Qumulo Core supports only AWS Signature Version 4 (SigV4). AWS Signature Version 2 (SigV2) is unsupported.</li>
  <li>Attempting to use the <code>CRC32</code> or <code>CRC32C</code> header value or the <code>STREAMING-UNSIGNED-PAYLOAD-TRAILER</code> header value with an unsupported checksum format returns the error <code>QumuloUnsupportedTrailerChecksumFormat</code>.</li>
  <li>Attempting to use the <code>x-amz-content-sha256</code> header with an unsupported value returns the error <code>AuthorizationHeaderMalformed</code>.</li>
</ul>
{{site.data.alerts.end}}

#### Supported STREAMING-UNSIGNED-PAYLOAD-TRAILER Checksum Formats
* `CRC64-NVME`
* `SHA-256`

{% capture actualPayCheck %}<code>&lt;actual payload checksum&gt;</code>{% endcapture %}

#### Supported x-amz-content-sha256 Header Values
* {{ actualPayCheck }}
* `UNSIGNED-PAYLOAD`
* `STREAMING-UNSIGNED-PAYLOAD-TRAILER`
* `STREAMING-AWS4-HMAC-SHA256-PAYLOAD`
* `STREAMING-AWS4-HMAC-SHA256-PAYLOAD-TRAILER`

#### Use Cases for Supported x-amz-content-sha256 Header Values
SigV4 uses the `x-amz-content-sha256` header to specify [the authentication type to perform](https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-auth-using-authorization-header.html). The following table lists the supported values for the `x-amz-content-sha256` header that Qumulo Core supports, the number of chunks for a payload, and the produced signature type.

{% capture supported %}<span class="emoji">✅</span>{% endcapture %}
{% capture unsupported %}<span class="emoji">❌</span>{% endcapture %}
{% capture oneChunk %}Sending a payload in a single chunk{% endcapture %}
{% capture multiChunk %}Sending a payload in multiple chunks{% endcapture %}
{% capture p256sha256 %}Signing the chunks by using the AWS4-ECDSA-P256-SHA256 algorithm{% endcapture %}
{% capture hmacsha256 %}Signing the chunks by using the AWS4-HMAC-SHA256 algorithm{% endcapture %}
{% capture prodSigV4 %}<a target="_blank" href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_sigv.html#how-aws-signing-works">SigV4 signature</a>{% endcapture %}
{% capture prodSigV4a %}<a target="_blank" href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_sigv.html#how-sigv4a-works">SigV4a signature</a>{% endcapture %}
{% capture theresMore %}The digest for the chunks is included as a trailing header.{% endcapture %}
<table>
<thead>
  <tr>
    <th>Header Value</th>
    <th>Qumulo Core Support</th>    
    <th>Use When</th>
    <th>Signature Type</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td><code>CRC32</code></td>
    <td>{{ unsupported }}</td>
    <td>&mdash;</td>
    <td>&mdash;</td>
  </tr>
  <tr>
    <td><code>CRC32C</code></td>
    <td>{{ unsupported }}</td>
    <td>&mdash;</td>
    <td>&mdash;</td>
  </tr>
  <tr>
    <td>{{ actualPayCheck }}</td>
    <td>{{ supported }}</td>
    <td>{{ oneChunk }}</td>
    <td>&mdash;</td>
  </tr>
  <tr>
    <td><code>UNSIGNED-PAYLOAD</code></td>
    <td>{{ supported }}</td>    
    <td>{{ oneChunk }}</td>
    <td>Unsigned</td>
  </tr>
  <tr>
    <td><code>STREAMING-UNSIGNED-PAYLOAD-TRAILER</code></td>
    <td>Partial</td>    
    <td>
      <p>{{ multiChunk }}</p>
      <p>{% include note.html content=theresMore %}</p>
    </td>
    <td>Unsigned</td>
  </tr>
  <tr>
    <td><code>STREAMING-AWS4-HMAC-SHA256-PAYLOAD</code></td>
    <td>{{ supported }}</td>    
    <td>
      <ul>
        <li>{{ multiChunk }}</li>
        <li>{{ hmacsha256 }}</li>
      </ul>
    </td>
    <td>{{ prodSigV4 }}</td>
  </tr>
  <tr>
    <td><code>STREAMING-AWS4-HMAC-SHA256-PAYLOAD-TRAILER</code></td>
    <td>Partial</td>    
    <td>
      <ul>
        <li>
          {{ multiChunk }}
          <p>{% include note.html content=theresMore %}</p>
        </li>
        <li>{{ hmacsha256 }}</li>
      </ul>
    </td>
    <td>{{ prodSigV4 }}</td>
  </tr>
{% comment %}  
  <tr>
    <td><code>STREAMING-AWS4-ECDSA-P256-SHA256-PAYLOAD</code></td>
    <td></td>
    <td>
      <ul>
        <li>{{ multiChunk }}</li>
        <li>{{ p256sha256 }}</li>
      </ul>
    </td>
    <td>{{ prodSigV4a }}</td>
  </tr>
  <tr>
    <td><code>STREAMING-AWS4-ECDSA-P256-SHA256-PAYLOAD-TRAILER</code></td>
    <td></td>    
    <td>
      <ul>
        <li>{{ multiChunk }}</li>
        <li>{{ p256sha256 }}</li>
      </ul>      
    </td>
    <td>{{ prodSigV4a }}</td>
  </tr>
{% endcomment %}  
</tbody>
</table>

### Bucket Addressing Style
Because Qumulo Core supports only [path-style bucket addressing]({{site.s3.docs.pathStyleAddressing}}), you must configure your client applications to use path-style addressing to send S3 API requests to a Qumulo cluster. For more information, see [Configuring the AWS CLI for Use with Qumulo Core](configuring-using-s3-api.html#configuring-aws-cli).

### ETags
RESTful APIs, such as the Qumulo Core S3 API, use HTTP [ETags](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/ETag) to identify different resource versions. When working with files by using Qumulo Core, each time a file's contents change (regardless of protocol), the value of its ETag changes as well.

{{site.data.alerts.note}}
<ul>
  <li>Certain applications might assume that S3 object ETags contain the MD5 checksum of the object's contents. Such applications might not function properly with the Qumulo S3 API.</li>
  <li>
    To maintain data integrity, we recommend that applications do one of the following:
    <ul>
      <li><a href="configuring-using-s3-api.html">Configure HTTPS for the S3 API</a></li>
      <li>Include the <code>Content-MD5</code> header with the checksum of the object's contents</li>
    </ul>
  </li>
</ul>
{{site.data.alerts.end}}

* Qumulo Core doesn't maintain a checksum value for every object in an S3 bucket because other protocols, such as NFS or SMB, can modify portions of the same file, which causes changes to a file to make the checksum inaccurate.

* Amazon S3 uses the MD5 checksum of an object's contents as its ETag.

### Listing Objects
The S3 API supports listing objects in a bucket by using the [`ListObjects`]({{site.s3.actions.ListObjects}}) and [`ListObjectsV2`]({{site.s3.actions.ListObjectsV2}}) API actions.

<table>
<thead>
  <tr>
    <th style="width:33%">Function</th>
    <th style="width:33%">Qumulo Core</th>
    <th style="width:33%">Amazon S3</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>Returning results</td>
    <td>Consistent but non-alphabetical order</td>
    <td>Alphabetical order, by object key</td>
  </tr>
  <tr>
    <td>Arbitrary prefix</td>
    <td>Partial support for <code>Prefix</code>, only if <code>Prefix</code> is a path to a file or directory under the <a href="creating-managing-s3-buckets.html#bucket-root">bucket root directory</a></td>
    <td><code>Prefix</code> limits results to object keys that begin with the prefix</td>
  </tr>
  <tr>
    <td>Arbitrary delimiter</td>
    <td>Only the slash (<code>/</code>) character can act as <code>Delimiter</code></td>
    <td><code>Delimiter</code> groups results into common prefixes</td>
  </tr>
</tbody>
</table>

{% include note.html content="Although Qumulo Core supports `Prefix` and `Delimiter` partially, it fully supports the most common use case: listing the contents of S3 buckets as a hierarchical file." %}

### Object Metadata {#object-metadata}
Qumulo Core stores each kind of S3 object metadata as [{{site.udm.l}}](../metadata/managing-user-defined-metadata.html) in a separate keyspace.

<table>
  <thead>
    <tr>
      <th>S3 Object Metadata</th>
      <th>Appears to S3 Clients As&hellip;</th>
      <th>Qumulo Core Keyspace</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>{{site.udm.t}}</td>
      <td><code>x-amz-meta-&ast;</code> headers</td>
      <td><code>S3</code></td>
    </tr>
    <tr>
      <td>Tags</td>
      <td>
        One of the following:
        <ul>
          <li><code>x-amz-tagging</code> header</li>
          <li><a href="{{site.s3.actions.PutObjectTagging}}"><code>PutObjectTagging</code></a> API action</li>
        </ul>
      </td>
      <td><code>GENERIC</code></td>
    </tr>
    <tr>
      <td>Standard object headers</td>
      <td>
        <ul>
          <li><code>Cache-Control</code></li>
          <li><code>Content-Disposition</code></li>
          <li><code>Content-Encoding</code></li>
          <li><code>Content-Language</code></li>
          <li><code>Content-Type</code></li>
          <li><code>Expires</code></li>
        </ul>
      </td>
      <td><code>WELL_KNOWN</code></td>
    </tr>
  </tbody>
</table>

### Special Considerations for Standard Object Headers in Qumulo Core {#standard-object-headers-special-considerations}
This section describes the special considerations for how default header values, header storage and replication, and response header overrides work in Qumulo Core.

#### Default Header Values
* **`Content-Type`:** If an object has no stored `Content-Type` value (for example, if it is a file written by using NFS or SMB or an object written by using a version of Qumulo Core lower than 7.10.2.1), the [`GetObject`]({{site.s3.actions.GetObject}}) and [`HeadObject`]({{site.s3.actions.HeadObject}}) API actions return `Content-Type: binary/octet-stream`.

* **`Content-Encoding`:** The AWS SDK adds `aws-chunked` to the `Content-Encoding` header of streaming uploads. Following Amazon S3 behavior, Qumulo Core removes `aws-chunked` from the stored value. If no other `Content-Encoding` value remains, Qumulo doesn't store this header.

#### Header Storage
{{site.data.alerts.note}}
<ul>
  <li>In Qumulo Core 7.10.2.1 (and higher), the S3 API stores the <a target="_blank" href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingMetadata.html#SysMetadata">system-defined metadata headers that users can control</a> and returns them in the responses of <a href="{{site.s3.actions.GetObject}}"><code>GetObject</code></a> and <a href="{{site.s3.actions.HeadObject}}"><code>HeadObject</code></a> API actions.</li>
  <li>Lower versions of Qumulo Core accept these headers, don't store them, and return <code>Content-Type: binary/octet-stream</code> for every object.</li>
</ul>
{{site.data.alerts.end}}

* **Creating Objects:**

  * Qumulo Core stores the headers from the requests of [`PutObject`]({{site.s3.actions.PutObject}}) and [`CreateMultipartUpload`]({{site.s3.actions.CreateMultipartUpload}}) API actions.

  * For multipart uploads, the request headers of [`UploadPart`]({{site.s3.actions.UploadPart}}) API actions don't change the stored values.

* **Copying Objects:**

  * The [`CopyObject`]({{site.s3.actions.CopyObject}}) API action copies the source object's standard headers together with its {{site.udm.l}}.

  * When you set the `x-amz-metadata-directive` header to `REPLACE`, Qumulo Core stores the standard headers and {{site.udm.l}} from the request of the [`CopyObject`]({{site.s3.actions.CopyObject}}) API action.

#### Header Replication
* Qumulo Core [continuous replication](../replicating-data/creating-managing-continuous-replication-relationship.html) copies the stored headers only to target clusters that run Qumulo Core 7.10.2.1 (or higher).

* In Qumulo Core 7.10.2.1&hellip;

  * [Qumulo Shift-To](../replicating-data/shift-to-s3.html) doesn't send the stored headers to Amazon S3.

  * [Qumulo Shift-From](../replicating-data/shift-from-s3.html) doesn't store the headers of the objects that it copies.

#### Response Header Overrides
{{site.data.alerts.important}}
Qumulo Core returns the <code>InvalidRequest</code> error when&hellip;
<ul>
  <li>An anonymous request uses any of the following query parameters</li>
  <li>A request uses any other query parameter that begins with <code>response-</code></li>
</ul>
{{site.data.alerts.end}}

For presigned requests that use the following request types, you can use response header overrides as query parameters for the [`GetObject`]({{site.s3.actions.GetObject}}) and [`HeadObject`]({{site.s3.actions.HeadObject}}) API actions.

* `response-cache-control`
* `response-content-disposition`
* `response-content-encoding`
* `response-content-language`
* `response-content-type`
* `response-expires`

For more information, see the following Amazon S3 documentation:

* [`GetObject`: Overriding response header values through the request](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html#:~:text=Overriding%20response%20header%20values%20through%20the%20request)
* [`HeadObject`: URI Request parameters (`response-&ast;`)](https://docs.aws.amazon.com/AmazonS3/latest/API/API_HeadObject.html#AmazonS3-HeadObject-request-uri-querystring-ResponseCacheControl)

### Request Authentication
* Qumulo Core supports authenticating requests by using only [Amazon Signature Version 4]({{site.s3.docs.signatureV4}}). Most S3 client applications support this authentication type.

  If your application attempts to use a previous Amazon signature version, you receive a `400 Bad Request` response with the error code `AuthorizationHeaderMalformed`.

* {{site.s3.limits.presignedURL}}

### Versioning
* **Object Version Limits:** In Qumulo Core, S3 bucket versioning is consistent with that of Amazon S3, with the exception of individual object versions. Qumulo Core limits directories to approximately 4.3 billion child files. The approach that Qumulo Core takes to indexing files in a directory might cause object creation commands to output the `QumuloDirectoryEntryLimitReached` error when a directory gets close to its capacity. Because Qumulo Core gives object versions unique identifiers, it might be possible to retry the command successfully. However, if you begin to observe this error, we recommend removing previous object versions from your system.

* **Creating Empty Versioned Directories:** Qumulo Core doesn't support creating empty, versioned directories.

* **Deleting Versioned Objects:** If you don't specify an object version ID, the [`DeleteObject`](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObject.html) and [`DeleteObjects`](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObjects.html) S3 API actions create a _deletion marker_ for an object but don't delete any file system data. Because currently Qumulo Core doesn't support bucket lifecycle policies, the data remains accessible by using S3 API actions and the object version ID. To delete a specific object version permanently, specify its version ID when you use either of these API actions.

### Object Lock
While native Amazon S3 functionality requires Object Lock to be enabled for an S3 bucket to be able to both modify and view locks on objects, Qumulo Core requires [Object Lock to be enabled for an S3 bucket](managing-object-lock-for-s3-buckets.html) only to _modify_ locks on objects.

## Comparison of Known Limits between S3 in Qumulo and Amazon
This section compares the Qumulo Core S3 API limits with native Amazon S3 limits.

### Known Limits for S3 Buckets

<table>
<thead>
  <tr>
    <th style="width:33%">Limit</th>
    <th style="width:33%">Qumulo Core</th>
    <th style="width:33%">Amazon S3</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>Maximum number of buckets</td>
    <td>16,000</td>
    <td>1,000</td>
  </tr>
  <tr>
    <td>Maximum number of objects in one bucket</td>
    <td>Nominally unlimited</td>
    <td>Unlimited</td>
  </tr>
  <tr>
    <td>Minimum bucket name length</td>
    <td colspan="2" class="joined-cell">3 characters</td>
  </tr>
  <tr>
    <td>Maximum bucket name length</td>
    <td colspan="2" class="joined-cell">63 characters</td>
  </tr>
</tbody>
</table>

{% include note.html content="If all objects in a bucket are under the same directory&mdash;none of the object keys have the slash (`/`) character in them&mdash;the maximum number of objects in the bucket is limited to the maximum number of files in a directory. For more information, see [Supported Configurations and Known Limits for Qumulo Core](../getting-started/supported-configurations-known-limits.html)." %}

### Known Limits for S3 Objects
This section lists the known minimum and maximum limits for S3 objects.

#### Minimum Limits

<table>
<thead>
  <tr>
    <th style="width:60%">Limit</th>
    <th style="width:20%">Qumulo Core</th>
    <th style="width:20%">Amazon S3</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>Object size</td>
    <td colspan="2" class="joined-cell">0 bytes</td>
  </tr>
  <tr>
    <td>Object key length</td>
    <td colspan="2" class="joined-cell">1 character</td>
  </tr>
</tbody>
</table>

#### Maximum Limits

{{site.data.alerts.note}}
<ul>    
  <li>The size limits for {{site.udm.l}} and for standard object headers are completely separate.</li>
  <li>In Qumulo Core 7.10.2.1 (and higher), a request whose {{site.udm.l}} or standard object headers exceed the size limit returns the <code>MetadataTooLarge</code> error.</li>
  <li>A request with more than 100 {{site.udm.l}} entries returns the <code>QumuloUserMetadataLimitExceeded</code> error.</li>
</ul>   
{{site.data.alerts.end}}

<table>
<thead>
  <tr>
    <th style="width:40%">Limit</th>
    <th style="width:30%">Qumulo Core</th>
    <th style="width:30%">Amazon S3</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>Object size when using the <a href="{{site.s3.actions.PutObject}}"><code>PutObject</code></a> API action</td>
    <td colspan="2" class="joined-cell">5 GiB</td>
  </tr>
  <tr>
    <td>Object size when using the <a href="{{site.s3.actions.MultipartUpload}}"><code>MultipartUpload</code></a> API action</td>
    <td colspan="2" class="joined-cell">48.8 TiB (10,000 * 5 GiB)</td>
    </tr>
  <tr>
    <td>Object key length</td>
    <td>1,530 characters, if there are no slash (<code>/</code>) characters in the key</td>
    <td>1,024 characters</td>
  </tr>
  <tr>
    <td>Object versions</td>
    <td>4,294,967,296 (theoretical)</td>
    <td>Unlimited</td>
  </tr>
  <tr>
    <td>Number of {{site.udm.l}} (<code>x-amz-meta-&ast;</code>) entries</td>
    <td>100</td>
    <td>&mdash;</td>
  </tr>
  <tr>
    <td>Size of {{site.udm.l}} (<code>x-amz-meta-&ast;</code>) headers</td>
    <td colspan="2" class="joined-cell">2 KiB (2,048 bytes) combined key bytes and value bytes</td>
  </tr>
  <tr>
    <td>Size of <a href="#special-considerations-standard-object-headers">standard object headers</a></td>
    <td colspan="2" class="joined-cell">2 KiB (2,048 bytes) combined header name bytes and value bytes</td>
  </tr>
</tbody>
</table>

### Known Limits for S3 Multipart Uploads

<table>
<thead>
  <tr>
    <th style="width:33%">Limit</th>
    <th style="width:33%">Qumulo Core</th>
    <th style="width:33%">Amazon S3</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>Minimum part ID</td>
    <td colspan="2" class="joined-cell">1</td>
  </tr>
  <tr>
    <td>Maximum part ID</td>
    <td colspan="2" class="joined-cell">10,000</td>
  </tr>
  <tr>
    <td>Minimum number of parts for each upload</td>
    <td colspan="2" class="joined-cell">1</td>
  </tr>
  <tr>
    <td>Maximum number of parts for each upload</td>
    <td colspan="2" class="joined-cell">10,000</td>
  </tr>
  <tr>
    <td>Minimum part size</td>
    <td colspan="2" class="joined-cell">5 MiB (except for the last part of an upload)</td>
  </tr>
  <tr>
    <td>Maximum part size</td>
    <td colspan="2" class="joined-cell">5 GiB</td>
  </tr>
  <tr>
    <td>Additional part size requirements</td>
    <td>Must be a multiple of 4 KiB (4,096 bytes), except for the last part of an upload</td>
    <td>&mdash;</td>
  </tr>
</tbody>
</table>

### Known Limits for S3 API Requests

<table>
<thead>
  <tr>
    <th style="width:33%">Maximum Limit</th>
    <th style="width:33%">Qumulo Core</th>
    <th style="width:33%">Amazon S3</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>Object keys that the <a href="{{site.s3.actions.DeleteObjects}}"><code>DeleteObjects</code></a> API action specifies</td>
    <td>Nominally unlimited</td>
    <td>1,000</td>
  </tr>
  <tr>
    <td>Buckets that the <a href="{{site.s3.actions.ListBuckets}}"><code>ListBuckets</code></a> API action returns</td>
    <td>16,000</td>
    <td>1,000</td>
  </tr>
  <tr>
    <td>Objects that the <a href="{{site.s3.actions.ListObjects}}"><code>ListObjects</code></a> and <a href="{{site.s3.actions.ListObjectsV2}}"><code>ListObjectsV2</code></a> API actions return</td>
    <td colspan="2" class="joined-cell">1,000</td>
  </tr>
  <tr>
    <td>Parts that the <a href="{{site.s3.actions.ListParts}}"><code>ListParts</code></a> API action returns</td>
    <td>Unlimited</td>
    <td>1,000</td>
  </tr>
  <tr>
    <td>Uploads that the <a href="{{site.s3.actions.ListMultipartUploads}}"><code>ListMultipartUploads</code></a> API action returns</td>
    <td colspan="2" class="joined-cell">1,000</td>
  </tr>
</tbody>
</table>

{% include note.html content="`DeleteObjects` is subject to a 10 MiB request payload limit in Qumulo Core. This provides a practical upper limit on the number of object keys that the API action can specify." %}

In addition, the following API actions have the Qumulo-specific maximum payload size limit of 10 MiB.

* [`CompleteMultipartUpload`]({{site.s3.actions.CreateMultipartUpload}})
* [`CreateBucket`]({{site.s3.actions.CreateBucket}})
* [`DeleteObjects`]({{site.s3.actions.DeleteObjects}})
