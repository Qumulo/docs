---
title: "Supported S3 Functionality and Known Limits for Qumulo Core"
summary: "This section documents the S3 API functionality that Qumulo Core does and does not support, along with various numeric limits for the S3 API."
permalink: /administrator-guide/s3-api/supported-s3-functionality-known-limits.html
sidebar: administrator_guide_sidebar
keywords: s3, action

creatingBuckets: <a href="./creating-managing-s3-buckets.html">Creating and Managing S3 Buckets in Qumulo Core</a>

errorCodes: <a href="https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html#ErrorCodeList">Amazon S3 Error Codes</a>
signingRequests: <a href="https://docs.aws.amazon.com/general/latest/gr/signing-aws-api-requests.html">Signing AWS API Requests</a>
addressingStyles: <a href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/RESTAPI.html#virtual-hosted-path-style-requests">Bucket Addressing Styles</a>

qumuloKnownLimits: <a href="/administrator-guide/getting-started-qumulo-core/supported-configurations-known-limits.html">Supported Configurations and Known Limits for Qumulo Core</a>
---

## Supported S3 API Actions

The following table lists all S3 API actions that Qumulo Core supports and the version in which support was added. For the full list of S3 API actions, see [Amazon's documentation]({{site.s3.docs.actions}}).

| Action | Supported Since |
| --- | --- |
| `AbortMultipartUpload` | 5.3.3 |
| `CompleteMultipartUpload` | 5.3.3 |
| `CopyObject` | 5.3.3 |
| `CreateBucket` | 5.2.3\* |
| `CreateMultipartUpload` | 5.3.3 |
| `DeleteBucket` | 5.2.4\* |
| `DeleteObject` | 5.2.1\* |
| `DeleteObjects` | 5.2.2\* |
| `GetBucketLocation` | 5.1.2\* |
| `GetObject` | 5.0.4\* |
| `HeadBucket` | 5.1.2\* |
| `HeadObject` | 5.0.4\* |
| `ListBuckets` | 5.0.4\* |
| `ListMultipartUploads` | 5.3.3 |
| `ListObjects` | 5.0.5\* |
| `ListObjectsV2` | 5.0.4\* |
| `ListParts` | 5.3.3 |
| `PutObject` | 5.2.1\* |
| `UploadPart` | 5.3.3 |

\* The S3 API became generally available in Qumulo Core version 5.3.3. Some S3 API actions were available in preview mode in prior versions. The functionality of these actions in versions prior to 5.3.3 &mdash; and the process required to enable the S3 API in those versions &mdash; is not documented.

## Unsupported S3 Functionality

The following table contains a non-exhaustive list of S3 API functionality that is not supported in Qumulo Core.

| Unsupported Feature | Comments |
| --- | --- |
| **BitTorrent** | |
| **Bucket ACLs** | These can be imitated by [using inheritable ACEs](./creating-managing-s3-buckets.html#inheritable-aces). |
| **Bucket lifecycle configurations** |  |
| **Bucket notifications** |  |
| **Control of server-side encryption** | All data is encrypted at rest in Qumulo Core, but this cannot be controlled via the S3 API. |
| **Logging controls** |  |
| **Multi-chunk payload signing** | The [streaming version](https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-streaming.html) of Amazon Signature Version 4 is not supported. Only the [single chunk](https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-header-based-auth.html) version is supported. |
| **Object locks** |  |
| **Object tagging and custom object metadata** |  |
| **Object versioning** | Qumulo objects have only a single version. Qumulo Snapshots can be used to preserve the previous contents of objects. |
| **Policies** |  |
| **Signature version 2** | Only version 4 signatures are accepted by Qumulo Core. |
| **Storage classes** | Qumulo Core has no concept of [storage classes](https://aws.amazon.com/s3/storage-classes/). All objects have the same storage class status. |
| **Retention policies** |  |
| **Temporary access credentials** |  |
| **Virtual-hosted bucket addressing** | Only [path-style bucket addressing](https://docs.aws.amazon.com/AmazonS3/latest/userguide/VirtualHosting.html#path-style-access) is supported. |
| **Web hosting configuration** |  |

## Key Differences

This subsection documents the most important limitations that are specific to Qumulo's implementation of the S3 API.

The limitations documented below can be summarized as follows:
* **Bucket addressing style**: Only path-style bucket addressing is supported.
* **ETags**: ETags returned by Qumulo Core are not MD5 checksums; they have no interpretable meaning.
* **Listing objects**:
  * Results are sorted in a consistent but unspecified order (not alphabetically).
  * The only supported delimiter is the slash (`"/"`) character.
  * Only prefixes that correspond exactly to objects in the bucket will function.
* **Request authentication**: Only Amazon Signature Version 4 is supported.

### Bucket Addressing Style

Amazon S3 supports two styles of bucket addressing in requests: virtual-hosted and path-style. See {{page.addressingStyles}}.

Qumulo Core supports only path-style bucket addressing. Therefore, you must configure your client applications to use path-style addressing in order to perform S3 API requests against a Qumulo cluster. We document how to do this for the AWS CLI in the [Getting Started](./getting-started-s3-api.html#configuring-aws-cli) section.

### ETags

RESTful APIs like S3 use HTTP [ETags](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/ETag) to identify different versions of a resource.

Amazon's S3 service uses the MD5 checksum of an object's contents as its ETag. Qumulo Core uses a different, unspecified mechanism to generate an object's ETag.

Well-behaved applications should not attempt to interpret the contents of an ETag. However, there are some applications that assume that S3 object ETags contain the MD5 checksum of the object's contents. Such applications may not function properly against Qumulo's implementation of the S3 protocol.

### Listing Objects

The S3 API supports listing objects in a bucket via the [`ListObjects`]({{site.s3.actions.ListObjects}}) and [`ListObjectsV2`]({{site.s3.actions.ListObjectsV2}}) actions.

Amazon S3 returns results in alphabetical order by object name. Qumulo Core returns results in a consistent but unspecified order (not alphabetical).

Amazon S3 supports using an arbitrary `prefix` to limit results to object names that start with that prefix. Qumulo Core provides partial support for this; it only works if the prefix is a path to some file or directory under the bucket root.

Amazon S3 supports using an arbitrary `delimiter` to group results into common prefixes. Qumulo Core supports only the slash (`"/"`) character as a delimiter.

Although Qumulo Core's support for `delimiter` and `prefix` is partial, it handles the most common use case, which is to treat an S3 bucket as a hierarchical file tree.

### Request Authentication

Qumulo Core supports authenticating requests using [Amazon Signature Version 4]({{site.s3.docs.signatureV4}}) only. Most S3 client applications support this. If your application attempts to use an earlier Amazon signature scheme, you will see a `400 Bad Request` response with error code `AuthorizationHeaderMalformed`.

## Known Limits

The following tables list the various numeric limits of the S3 API for Qumulo Core and how they compare to Amazon S3.

### Limits for S3 Buckets

| Limit | Qumulo Specification | Amazon Specification |
| --- | --- | --- |
| Maximum number of buckets | 16,000 | 1,000 |
| Maximum number of objects in one bucket | Unlimited\* | Unlimited |
| Minimum bucket name length | 3 characters | 3 characters |
| Maximum bucket name length | 63 characters | 63 characters |

\* If all objects in a bucket fall under the same directory (that is, none of the object keys have the `/` character in them), the maximum number of objects in the bucket will be limited to the maximum number of files in a directory. See {{page.knownLimits}}.

### Limits for S3 Objects

| Limit | Qumulo Specification | Amazon Specification |
| --- | --- | --- |
| Minimum object size | 0 bytes | 0 bytes |
| Maximum object size (via `PutObject`) | 5 GiB | 5 GiB |
| Maximum object size (via multipart upload) | 48.8 TiB (10,000 * 5 GiB) | 5 TiB |
| Minimum object key length | 1 character | 1 character |
| Maximum object key length | 1,530 characters if no slash (`/`) characters in the key | 1,024 characters |

### Limits for S3 Multipart Uploads

| Limit | Qumulo Specification | Amazon Specification |
| --- | --- | --- |
| Minimum part ID | 1 | 1 |
| Maximum part ID | 10,000 | 10,000 |
| Minimum number of parts per upload | 1 | 1 |
| Maximum number of parts per upload | 10,000 | 10,000 |
| Minimum part size | 5 MiB (except for the last part in an upload) | 5 MiB (except for the last part in an upload) |
| Maximum part size | 5 GiB | 5 GiB |
| Additional part size requirements | Must be a multiple of 4 KiB (4096 bytes), except for the last part in an upload | N/A |

### Limits for S3 API Requests

| Limit | Qumulo Specification | Amazon Specification |
| --- | --- | --- |
| Maximum number of object keys specified in `DeleteObjects` | Unlimited\* | 1,000 |
| Maximum number of buckets returned from `ListBuckets` | 16,000 | 1,000 |
| Maximum number of objects returned from `ListObjects` or `ListObjectsV2` | 1,000 | 1,000 |
| Maximum number of parts returned from `ListParts` | Unlimited | 1,000 |
| Maximum number of uploads returned from `ListMultipartUploads` | 1,000 | 1,000 |

There are also Qumulo-specific limits on the request payload size for certain S3 actions.

| Action | Maximum Payload Size |
| --- | --- |
| `CompleteMultipartUpload` | 10 MiB |
| `CreateBucket` | 10 MiB |
| `DeleteObjects` | 10 MiB |

\* `DeleteObjects` is subject to a 10 MiB request payload limit in Qumulo, which provides a practical upper limit on the number of object keys.
