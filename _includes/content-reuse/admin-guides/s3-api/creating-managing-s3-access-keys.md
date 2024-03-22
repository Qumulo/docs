i% include note.html content="You can configure an S3 bucket to allow [read-only, anonymous access](managing-access-to-s3-buckets.html#enabling-anonymous-access-for-an-s3-bucket). This approach requires no credentials but limits users to non-modifying operations. For more information, see [To Enable Anonymous Access to S3 Buckets by Using the qq CLI](managing-access-to-s3-buckets.html#to-enable-anonymous-access-to-an-s3-bucket-by-using-the-qq-cli)." %}


## Prerequisites
Managing S3 access keys requires the following [role-based access control (RBAC)](../authorization-qumulo-core/managing-role-based-access-control-rbac.html) privileges:

  * `PRIVILEGE_S3_BUCKETS_WRITE`: Create and delete S3 access keys
  
  * `PRIVILEGE_S3_BUCKETS_READ`: List S3 access keys


## How S3 Access Keys Work in Qumulo Core
<a id="identity"></a>

An _identity_ is a single principal from an identity provider (IdP). Examples of identities include SMB security identifiers (SIDs), Active Directory user principal names (UPNs), POSIX user identifiers (UIDs), and local users in a Qumulo cluster.

{% include important.html content="It isn't possible to create access keys for UIDs in an Active Directory environment that has POSIX extensions enabled. However, it is possible to use Active Directory identity identifiers (SIDs, UPNs, and so on)." %}

An _access key_ (or _access key pair)_ is comprised of an S3 access key ID and an S3 secret access key.

* <a id="access-key-id"></a>

  The _access key ID_ is the public component of an S3 access key pair. It identifies the user that performs an S3 request.

* <a id="secret-access-key"></a>

  The _secret access key_ (or _secret key)_ is the private component of an S3 access key pair. The client uses the secret access key to sign requests and the server uses the secret access key to validate request signatures.

{{site.data.alerts.important}}
<ul>
  <li>Qumulo Core uses a cryptographically secure source, certified according to FIPS 140-2 requirements, to derive secret access keys.</li>
  <li>Because access keys are cluster-local, you can't use an access key for an identity in one Qumulo cluster on a different Qumulo cluster.</li>
</ul>
{{site.data.alerts.end}}

Qumulo Core creates an access key pair whenever an authorized user requests it. For more information, see [Creating S3 Access Keys for a Qumulo Cluster](#creating-s3-access-keys-for-a-qumulo-cluster).

The way in which Qumulo Core access keys let you access your Qumulo cluster makes the process similar to  the way in which [IAM Access Keys](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html) let you access Amazon S3 resources. For this reason, applications that access objects stored in a Qumulo cluster can use the Qumulo S3 API similarly to the native Amazon S3 API.

### How S3 Access Keys work with Identities
An S3 access key doesn't grant any additional permissions. It associates an S3 API request with a specific [identity](#identity) that the Qumulo cluster knows.

When Qumulo Core processes a request, it evaluates permissions by using the Qumulo ACL (QACL) mechanism that operates like the access control list (ACL) mechanism that all file system protocols use. When the QACL grants or denies permissions to an associated identity, it also grants or denies the same permissions to the request being processed.

For more information, see [Managing Access to S3 Buckets in a Qumulo Cluster](managing-access-to-s3-buckets.html).

### How Qumulo Core Stores S3 Access Keys
To authenticate S3 API requests, Qumulo Core retrieves existing access key pairs that it stores securely as configuration metadata in your Qumulo cluster. Qumulo Core encrypts secret access keys on disk and holds decrypted secret access keys in memory only while it processes a request.

{% capture secretAccessKeysOneTime %}Because (unlike _secret access keys)_ your _access key IDs_ aren't a cryptographic secret, Qumulo Core _can_ log and display access key IDs. {{site.s3.permissions.secretAccessKeys}}{% endcapture %}
{% include important.html content=secretAccessKeysOneTime %}

### S3 Access Key Lifecycle in Qumulo Core
Qumulo Core doesn't limit how long you can use an access key pair after you create it. Your system administrators must take responsibility for using the Qumulo Core REST API or `qq` CLI to view the creation dates for access keys and revoke any pair at their discretion.

For more information, see [Listing S3 Access Keys for a Qumulo Cluster](#listing-s3-access-keys).

{{site.data.alerts.note}}
<ul>
 <li>To facilitate key rotation, each user <a href="#identity">identity</a> can have at most two S3 access key pairs associated with it. It is a good practice to delete a user's old access key after you create a new one and test that the new key works.</li>
  <li>If you revoke an access key pair, it isn't possible to restore it. Before you revoke an access key pair, ensure that no critical applications depend on it.</li>
</ul>
{{site.data.alerts.end}}


## Creating S3 Access Keys for a Qumulo Cluster
To make S3 API requests to a Qumulo cluster as a specific user, you must create an S3 access key pair for that user [identity](#identity) {{site.s3.permissions.APIorCLI}}.

To create S3 access keys, you must have an administrator account or have {{page.s3.permissions.bucketsWrite}}.

### To Create an Access Key by Using the qq CLI
To create an S3 access key for a particular user [identity](#identity), run the {% include qq.html command="s3_create_access_key" %} and specify an identity. For example:

```bash
$ qq s3_create_access_key my_identity
```

You can specify an identity by using:

* A name, optionally qualified with a domain prefix:

  * `ad:MY_NAME`

  * `AD\MY_NAME`

  * `local:MY_NAME`

  * `MY_NAME`

* An Active Directory Security Identifier. For example: `SID:S-1-1-0`

* <a id="auth-id"></a>

  A Qumulo _auth ID_, Qumulo Core's common representation for identities, in the form of a numeric identifier. For example: `auth_id:513`

{% include important.html content="Currently, it isn't possible to associate an S3 access key with a POSIX group ID (GID)." %}

{{site.exampleOutput}}

{% capture createAccessKeyResponse %}{
  "access_key_id": "{{site.exampleAWSaccessKeyID}}",
  "creation_time": "2022-12-12T21:37:53.553457928Z",
  "owner": {
    "auth_id": "501",
    "domain": "LOCAL",
    "gid": null,
    "name": "guest",
    "sid": "S-0-1-23-4567890123-456789012-345678901-234",
    "uid": null
  },
  "secret_access_key": "{{site.exampleAWSsecretKey}}"
}{% endcapture %}

```json
{{createAccessKeyResponse}}
```

{{page.varResultKeys}}

{% capture noRecover %}{{site.s3.permissions.secretAccessKeys}}{% endcapture %}
{% include important.html content=noRecover %}

### To Create an S3 Access Key by Using the Qumulo Core REST API
Send a `POST` request to the `/v1/s3/access-keys/` endpoint with the following body. You must include at least one of the following keys:

* `auth_id`

* `sid`

* `uid`

For example:

```json
{
  "user": {
    "sid": "S-0-1-23-4567890123-456789012-345678901-234"
  }
}
```

{{site.exampleOutput}}

```json
{{createAccessKeyResponse}}
```

{{page.varResultKeys}}

{% capture noRecover %}{{site.s3.permissions.secretAccessKeys}}{% endcapture %}
{% include important.html content=noRecover %}

<a id="listing-s3-access-keys"></a>
## Listing S3 Access Keys for a Qumulo Cluster
You can list every S3 access key that your Qumulo cluster knows, {{page.varKeyDoAlso}}, {{site.s3.permissions.APIorCLI}}.

To list S3 access keys, you must have {{site.s3.permissions.bucketsRead}}.

{% include note.html content="Qumulo Core doesn't list access keys in any particular order. To sort keys according to fields such as `creation_time` or `owner` you must process or filter the response." %}

{% capture listAccessKeysResponse %}```json
{
  "entries": [
    {
      "access_key_id": "{{site.exampleAWSaccessKeyID}}",
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
}
```{% endcapture %}

### To List S3 Access Keys by Using the qq CLI

* To list the S3 access keys that your Qumulo cluster knows, run the {% include qq.html command="s3_list_access_keys" %}:

  {{site.exampleOutput}} {{site.s3.permissions.timesUTC}}

  ```
  access_key_id         owner  creation_time
  ====================  =====  ==============================
  000000000001fEXAMPLE  Guest  2022-12-12T21:37:53.553457928Z
  ```

* For JSON output, use the `--json` flag.

  {{site.exampleOutput}} The command returns a single JSON object that contains the combined responses from calls to the `/v1/s3/access-keys/` Qumulo Core REST API endpoint. 

{{listAccessKeysResponse}}

### To List S3 Access Keys by Using the Qumulo Core REST API
To list the S3 access keys that your Qumulo cluster knows, send a `GET` request to the `/v1/s3/access-keys/` endpoint.

{% capture restrictResults %}To restrict the number of returned results, up to the maximum of {{page.varListMax}} access keys (this is the default limit), include the optional `limit` query parameter in the request.{% endcapture %}
{% include note.html content=restrictResults %}

{{site.exampleOutput}} {{page.varPaginatedResponsePart1}} {{page.varListMax}}. {{page.varPaginatedResponsePart2}}

{{listAccessKeysResponse}}

## Revoking S3 Access Keys for a Qumulo Cluster
To revoke an S3 access key, you must delete the access key from your Qumulo cluster. You can delete an S3 access key {{site.s3.permissions.APIorCLI}}.

To revoke an access key, you must have {{site.s3.permissions.bucketsWrite}}.

### To Delete an S3 Access Key by Using the qq CLI
Run the `qq s3_delete_access_key` command and specify the access key ID. For example:

```bash
$ qq s3_delete_access_key \
  --id 000000000001fEXAMPLE
```

### To Delete an S3 Access Key by Using the Qumulo Core REST API
Send a `DELETE` request to the `/v1/s3/access-keys/<access-key-id>` Qumulo Core REST API endpoint and specify the access key ID.


## Configuring Active Directory (AD) for S3
{% include note.html content="To be able to create access keys for a user in a joined AD domain, the user must exist within the domain's base DN." %}

For users that exist in an AD domain that has a trust relationship with the joined domain, you must append that domain's base DN to the base DN in your Qumulo cluster's AD configuration.

To append the trusted base DN to the base DN in use&mdash;with a semicolon (`;`) separating the two&mdash;use the Qumulo Core Web UI or the {% include qq.html command="ad_reconfigure" %} command. For example:

```bash
$ qq ad_reconfigure \
  --base-dn 'CN=Users,DC=joined_domain,DC=example,DC=com;CN=Users,DC=trusted_domain,DC=example,DC=com'
```

For more information, see [Configuring Cross-Domain Active Directory Trusts](../kerberos/kerberos-configuring-cross-domain-active-directory-trusts.html)
