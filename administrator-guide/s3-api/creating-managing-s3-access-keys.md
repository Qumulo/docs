---
title: "Creating and Managing S3 Access Keys in Qumulo Core"
summary: "S3 API actions in Qumulo Core require requests to be signed using an access key pair in order to be granted permissions to access file system resources. This section details how to create and manage such credentials."
permalink: /administrator-guide/s3-api/creating-managing-s3-access-keys.html
sidebar: administrator_guide_sidebar
keywords: s3, credential, access, key, authentication

awsAccessKeys: <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html">IAM Access Keys</a>
buckets: <a href="./creating-managing-s3-buckets.html">Creating and Managing S3 Buckets in Qumulo Core</a>
creatingAccessKeys: <a href="#creating-s3-access-keys-for-a-qumulo-cluster">Creating S3 Access Keys for a Qumulo Cluster</a>
listingAccessKeys: <a href="#listing-s3-access-keys-in-a-qumulo-cluster">Listing S3 Access Keys in a Qumulo Cluster</a>
qumuloFilePermissions: <a href="https://care.qumulo.com/hc/en-us/articles/115008211868-Qumulo-File-Permissions-Overview">Qumulo File Permissions Overview</a>
listMax: "10,000"

---

{{site.data.alerts.note}}
<p>It is possible to configure a bucket to allow anonymous access, in which case no credentials are required, however this will limit the user to non-modifying operations. See {{page.buckets}}.</p>
{{site.data.alerts.end}}

## Prerequisites
The following RBAC privileges are required for access key management:
- You must have the `PRIVILEGE_S3_CREDENTIALS_WRITE` privilege to create and delete S3 access keys.
- You must have the `PRIVILEGE_S3_CREDENTIALS_READ` privilege to list S3 access keys.

For more details see [Role-Based Access Control (RBAC) with Qumulo Core](https://care.qumulo.com/hc/en-us/articles/360036591633-Role-Based-Access-Control-RBAC-with-Qumulo-Core).

## Definitions
The following terms will be used:
- **Access key** or **access key pair**: A combination of an S3 access key ID and an S3 secret access key
- **Access key ID**: The public component of an S3 access key pair, which is used to identify the user performing an S3 request.
- **Auth ID**: Qumulo Core's common representation for identities, in the form of a numeric identifier.
- **Identity**: A single principal from an identity provider, e.g., a POSIX UID, an SMB SID, an Active Directory User Principal Name, or a local user on a Qumulo cluster.
- **Secret access key** or **secret key**: The private component of an S3 access key pair, which is used by the client to sign requests and by the server to validate request signatures.

## How S3 Access Keys Work in Qumulo Core

{{site.data.alerts.important}}
<p>Qumulo Core secret access keys are derived from a FIPS 140-2 certified cryptographically secure source.</p>
{{site.data.alerts.end}}

{{site.data.alerts.note}}
<p>Access keys are cluster local, thus an access key for a given identity in one Qumulo cluster will not be able to be used on a different Qumulo cluster.</p>
{{site.data.alerts.end}}

Access key pairs are returned by Qumulo Core when an authorized user requests their creation, see {{page.creatingAccessKeys}}. These are analogous to the {{page.awsAccessKeys}} used to access Amazon S3 resources, but specific to your Qumulo cluster. They should be used in a similar manner by applications when accessing objects stored in a Qumulo cluster via the S3 API.


### Permissions Granted by an S3 Access Key
An S3 access key does not grant any additional permissions. A key simply associates an S3 API request with a specific identity known to the Qumulo cluster.

When a request is processed, permissions are evaluated using the same QACL mechanism that all other file system protocols use. Whichever permissions the QACL grants or denies to the associated identity will be granted or denied to the request being processed.

See "Managing Access to S3 Buckets" in [Creating and Managing S3 Buckets in Qumulo Core](./creating-managing-s3-buckets.html#managing-access-to-s3-buckets) for more details on how to control access to S3 buckets on a Qumulo cluster.

### How Qumulo Core Stores S3 Access Keys
{{site.data.alerts.important}}Secret access keys are not logged or displayed except on initial creation. If the secret access key is lost, it cannot be recovered and a new access key pair will need to be created.{{site.data.alerts.end}}

In order to authenticate S3 API requests, Qumulo Core needs to store and retrieve the access key pairs that have been created.

Access key pairs are stored securely as configuration metadata in the Qumulo cluster. Secret access keys are encrypted on disk, and only held decrypted in memory while processing a request. However, access key IDs are not a cryptographic secret and can be logged and displayed.

### S3 Access Key Lifecycle
There is no limit applied to how long an access key pair can be used after creation. Administrators can use the `qq` CLI or Qumulo REST API to see when they were created and revoke any pair at their own discretion. See {{page.listingAccessKeys}}.

{{site.data.alerts.important}}
<ul>
  <li>A user identity may have at most two S3 access key pairs associated with it at any time.</li>
  <li>If an access key pair is revoked, it can not be restored. Ensure no critical applications depend on an access key pair before revoking it.</li>
</ul>
{{site.data.alerts.end}}

Each user identity can have up to two associated access key pairs to facilitate key rotation. After a new access key pair is created for a user, the user's old access key should be deleted. It is the administrator's responsibility to prescribe and enforce access key rotation policies within their organization.

## Creating S3 Access Keys for a Qumulo Cluster

{% capture createAccessKeyResponse %}{
    "access_key_id": "00000000000001f5b2dd",
    "creation_time": "2022-12-12T21:37:53.553457928Z",
    "owner": {
        "auth_id": "501",
        "domain": "LOCAL",
        "gid": null,
        "name": "guest",
        "sid": "S-1-5-21-1344365498-602363046-412545990-501",
        "uid": null
    },
    "secret_access_key": "TEIT4liMZ8A32iI7JXmqIiLWp5co/jmkjTSv3Rid"
}{% endcapture %}

{% capture secretAccessKeyNote %}
<p>This is the only time the secret access key will be returned or displayed. Make a copy of it and keep it in a safe place.</p>
{% endcapture %}

{{site.data.alerts.note}}
<p>Access keys must be created by an administrator or a user with the <code>PRIVILEGE_S3_CREDENTIALS_WRITE</code> privilege. Users without this privilege cannot create their own access keys.</p>
{{site.data.alerts.end}}

In order to make S3 API requests against a Qumulo cluster as a given user, an S3 access key pair needs to be created for that user identity. You can create an S3 access key pair by using the `qq` CLI or by using the Qumulo REST API directly.

### To Create an Access Key by Using the qq CLI

To create an S3 access key for a particular user identity, use the `s3_create_access_key` command:

```
$ qq s3_create_access_key IDENTITY
```

The `IDENTITY` argument can be specified in a number of different ways:
- A name, optionally qualified with a domain prefix:
    - `MY_NAME`
    - `local:MY_NAME`
    - `ad:MY_NAME`
    - `AD\MY_NAME`
- An Active Directory Security Identifier:
    - `SID:S-1-1-0`
- A Qumulo auth ID:
    - `auth_id:513`

Associating an S3 access key with a POSIX UID or GID is not currently supported.

The command output will have the following form:

```json
{{createAccessKeyResponse}}
```

In this example, the access key id is `00000000000001f5b2dd` and the secret access key is `TEIT4liMZ8A32iI7JXmqIiLWp5co/jmkjTSv3Rid`.

{{site.data.alerts.important}}
{{secretAccessKeyNote}}
{{site.data.alerts.end}}

### To Create an Access Key by Using the Qumulo REST API
To create an access key pair via the Qumulo REST API, send a `POST` request to `/v1/s3/access-keys/` with the following body (only one of `uid`, `sid`, or `auth_id` needs to be present):

```json
{
  "user": {
    "uid": "<my_username>",
    "sid": "<my_sid>",
    "auth_id": "<my_auth_id>",
  }
}
```

The response will have the following form:

```json
{{createAccessKeyResponse}}
```

{{site.data.alerts.important}}
{{secretAccessKeyNote}}
{{site.data.alerts.end}}

## Listing S3 Access Keys in a Qumulo Cluster

You can list the S3 access keys known to the cluster, along with their associated identities and creation times, by using the `qq` CLI or by using the Qumulo REST API directly.

{{site.data.alerts.note}}
<ul>
    <li>You must have the <code>PRIVILEGE_S3_CREDENTIALS_READ</code> privilege to list S3 access keys</li>
    <li>The access keys are listed in a consistent but unspecified order. You will need to do your own processing of the response to order keys by <code>creation_time</code>, <code>owner</code>, or to do other filtering</li>
</ul>
{{site.data.alerts.end}}

{% capture listAccessKeysResponse %}{
    "entries": [
        {
            "access_key_id": "00000000000001f5b2dd",
            "creation_time": "2022-12-12T21:37:53.553457928Z",
            "owner": {
                "auth_id": "501",
                "domain": null,
                "gid": null,
                "name": null,
                "sid": null,
                "uid": null
            }
        },
        ...
    ],
    "paging": {
        "next": null
    }
}{% endcapture %}

### To List Access Keys by Using the qq CLI
To list all access keys known to the cluster, use the `s3_list_access_keys` command:

```
$ qq s3_list_access_keys
```

This outputs the list of access keys in the following form:

```
access_key_id         owner  creation_time
====================  =====  ==============================
00000000000001f5b2dd  Guest  2022-12-12T21:37:53.553457928Z
```

All times returned are in UTC.

#### To output results in JSON format

You can specify the `--json` flag if you would prefer this output to be JSON formatted:

```
$ qq s3_list_access_keys --json
```

This shows the JSON response bodies as returned by calls made to the `/v1/s3/access-keys/` endpoint of the Qumulo REST API. This API only returns up to {{page.listMax}} access keys per request, so if you have more access keys than this, you will see multiple response bodies. The `entries` field lists the access keys returned by the API call, and the `paging.next` field contains the URI used to request the next batch of access keys.

```json
{{listAccessKeysResponse}}
```

### To List Access Keys by Using the Qumulo REST API
To list the S3 access keys known to the cluster, send a `GET` request to `/v1/s3/access-keys/`.

An optional `limit` query parameter can be included in the request, which will restrict the number of results returned, up to a maximum of {{page.listMax}} access keys. If not specified, the limit is {{page.listMax}}.

The response will have the following form:

```json
{{listAccessKeysResponse}}
```

The `entries` list will contain the access keys, limited to the first {{page.listMax}} in the system. The `paging.next` field will contain the URI to which you can send a subsequent `GET` request to retrieve the next page of access keys. By calling `GET` on all `paging.next` values returned, you can iterate all access keys in the cluster.

## Revoking and Deleting S3 Access Keys from a Qumulo Cluster

S3 access keys are revoked by deleting them from the Qumulo cluster. You can delete S3 access keys by using the `qq` CLI or by using the Qumulo REST API directly.

{{site.data.alerts.note}}
<p>You must have the <code>PRIVILEGE_S3_CREDENTIALS_WRITE</code> privilege to delete an S3 access key</p>
{{site.data.alerts.end}}

### To Delete an Access Key by Using the qq CLI
To revoke and delete an S3 access key pair from a Qumulo cluster, use the `s3_delete_access_key` command, replacing `<access-key-id>` with the access key ID that corresponds to the key pair that you wish to delete:

```
$ qq s3_delete_access_key --id <access-key-id>
```

### To Delete an Access Key by Using the Qumulo REST API
To revoke and delete an S3 access key pair via the Qumulo REST API, send a `DELETE` request to `/v1/s3/access-keys/<access-key-id>`, replacing `<access-key-id>` with the access key ID that corresponds to the key pair that you wish to delete.
