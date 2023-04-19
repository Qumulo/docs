---
title: "Supported Functionality and Known Limits for S3 in Qumulo Core"
summary: "This section documents Qumulo Core support for S3 API functionality and S3 API limits."
permalink: /administrator-guide/s3-api/supported-s3-functionality-known-limits.html
sidebar: administrator_guide_sidebar
keywords: s3, api, action, limit, limitation, known, functionality, supported, unsupported, bucket, addressing style, path-style addressing, listing objects, object, request authentication, part, key, upload, AbortMultipartUpload, CompleteMultipartUpload, CopyObject, CreateMultipartUpload, ListMultipartUploads, ListParts, UploadPart
---

## Supported S3 API Actions
The following table lists the S3 API actions that Qumulo Core supports and the version from which support begins. For the full list of S3 API actions, see [Actions]({{site.s3.docs.actions}}) in the Amazon Simple Storage Service API Reference.

{% include note.html content="The S3 API became generally available in Qumulo Core 5.3.3. This guide doesn't document enabling or using API actions that became available with preview functionality in versions of Qumulo Core lower than 5.3.3." %}

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
    <td><code>DeleteObject</code></td>
    <td class="fade-row">5.2.1</td>
  </tr>  
  <tr>
    <td><code>DeleteObjects</code></td>
    <td class="fade-row">5.2.2</td>
  </tr>   
  <tr>
    <td><code>GetBucketLocation</code></td>
    <td class="fade-row">5.1.2</td>
  </tr>    
  <tr>
    <td><code>GetObject</code></td>
    <td class="fade-row">5.0.4</td>
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
    <td><code>PutObject</code></td>
    <td class="fade-row">5.2.1</td>
  </tr>  
  <tr>
    <td><code>UploadPart</code></td>
    <td>5.3.3</td>
  </tr>  
  <tr>
    <td><code>UploadPartCopy</code></td>
    <td>6.1.0</td>
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
| Logging controls                          | &mdash;     |
| Multi-chunk payload signing               | Qumulo Core doesn't support the [streaming version of Amazon Signature Version 4 (SigV4)](https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-streaming.html), only the [single-chunk version](https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-header-based-auth.html). |
| Object locks                              | &mdash;     |
| Object tagging and custom object metadata | &mdash;     |
| Object versioning                         | Qumulo objects have one object version. To preserve previous object contents in Qumulo Core, use snapshots. |
| Policies                                  | &mdash;     |
| Signature Version 2                       | Qumulo Core supports only SigV4 signatures. |
| Storage classes                           | Qumulo Core doesn't use the [storage class](https://aws.amazon.com/s3/storage-classes/) concept. All objects have the same storage class status. |
| Retention policies                        | &mdash;     |
| Temporary access credentials              | &mdash;     |
| Virtual-hosted bucket addressing          | Qumulo Core supports only [path-style bucket addressing]({{site.s3.docs.pathStyleAddressing}}). |
| Web hosting configuration                 | &mdash;     |


## S3 API Limitations
This section describes the most important S3 API limitations in Qumulo Core.

### Bucket Addressing Style
Because Qumulo Core supports only [path-style bucket addressing]({{site.s3.docs.pathStyleAddressing}}), you must configure your client applications to use path-style addressing to send S3 API requests to a Qumulo cluster. For more information, see [Configuring the AWS CLI for Use with Qumulo Core](configuring-using-s3-api.html#configuring-aws-cli).

### ETags
RESTful APIs, such as the S3 API, use HTTP [ETags](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/ETag) to identify different resource versions.

* Qumulo Core uses a proprietary mechanism to generate an object's ETag.

* Amazon S3 uses the MD5 checksum of an object's contents as its ETag.

{% include important.html content="Well-behaved applications shouldn't attempt to interpret the contents of an ETag. However, certain applications do assume that S3 object ETags contain the MD5 checksum of the object's contents. Such applications might not function properly with the Qumulo S3 API." %}

### Listing Objects
The S3 API supports listing objects in a bucket by using the [`ListObjects`]({{site.s3.actions.ListObjects}}) and [`ListObjectsV2`]({{site.s3.actions.ListObjectsV2}}) API actions.

<table>
<thead>
  <tr>
    <th width="33%">Function</th>
    <th width="33%">Qumulo Core</th>
    <th width="33%">Amazon S3</th>    
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

{% include note.html content="Although Qumulo Core supports `Prefix` and `Delimiter` partially, it supports the most common use case&mdash;listing the contents of S3 buckets as a hierarchical file tree&mdash;fully.)))" %}

### Request Authentication
Qumulo Core supports authenticating requests by using only [Amazon Signature Version 4]({{site.s3.docs.signatureV4}}). Most S3 client applications support this authentication type.

If your application attempts to use a previous Amazon signature version, you receive a `400 Bad Request` response with the error code `AuthorizationHeaderMalformed`.


## Comparison of Known Limits between S3 in Qumulo and Amazon
This section compares the Qumulo Core S3 API limits with native Amazon S3 limits.

### Limits for S3 Buckets

<table>
<thead>
  <tr>
    <th width="33%">Limit</th>
    <th width="33%">Qumulo Core</th>
    <th width="33%">Amazon S3</th>    
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

{% include note.html content="If all objects in a bucket are under the same directory&mdash;none of the object keys have the slash (`/`) character in them&mdash;the maximum number of objects in the bucket is limited to the maximum number of files in a directory. For more information, see [Supported Configurations and Known Limits for Qumulo Core](../getting-started-qumulo-core/supported-configurations-known-limits.html)." %}

### Limits for S3 Objects

<table>
<thead>
  <tr>
    <th width="33%">Limit</th>
    <th width="33%">Qumulo Core</th>
    <th width="33%">Amazon S3</th>    
  </tr>
</thead>
<tbody>
  <tr>
    <td>Minimum object size</td>
    <td colspan="2" class="joined-cell">0 bytes</td>
  </tr>
  <tr>
    <td>Maximum object size (by using <code>PutObject</code>)</td>
    <td colspan="2" class="joined-cell">5 GiB</td>
  </tr>
  <tr>
    <td>Maximum object size (by using <code>MultipartUpload</code>)</td>
    <td>48.8 TiB (10,000 * 5 GiB)</td>
    <td>5 TiB</td>
  </tr>
  <tr>
    <td>Minimum object key length</td>
    <td colspan="2" class="joined-cell">1 character</td>    
  </tr>
  <tr>
    <td>Maximum object key length</td>
    <td>1,530 characters, if there are no slash (<code>/</code>) characters in the key</td>    
    <td>1,024 characters</td>
  </tr>    
</tbody>
</table>

### Limits for S3 Multipart Uploads

<table>
<thead>
  <tr>
    <th width="33%">Limit</th>
    <th width="33%">Qumulo Core</th>
    <th width="33%">Amazon S3</th>    
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

### Limits for S3 API Requests

<table>
<thead>
  <tr>
    <th width="33%">Maximum Limit</th>
    <th width="33%">Qumulo Core</th>
    <th width="33%">Amazon S3</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>Object keys that <code>DeleteObjects</code> specifies</td>
    <td>Nominally unlimited</td>
    <td>1,000</td>
  </tr>
  <tr>
    <td>Buckets that <code>ListBuckets</code> returns</td>
    <td>16,000</td>
    <td>1,000</td>
  </tr>
  <tr>
    <td>Objects that <code>ListObjects</code> and <code>ListObjectsV2</code> return</td>
    <td colspan="2" class="joined-cell">1,000</td>
  </tr>
  <tr>
    <td>Parts that <code>ListParts</code> returns</td>
    <td>Unlimited</td>
    <td>1,000</td>
  </tr>  
  <tr>
    <td>Uploads that <code>ListMultipartUploads</code> returns</td>
    <td colspan="2" class="joined-cell">1,000</td>
  </tr>   
</tbody>
</table>


{% include note.html content="`DeleteObjects` is subject to a 10 MiB request payload limit in Qumulo Core. This provides a practical upper limit on the number of object keys that the API action can specify." %}

In addition, the following API actions have the Qumulo-specific maximum payload size limit of 10 MiB.

* `CompleteMultipartUpload`
* `CreateBucket`
* `DeleteObjects`
