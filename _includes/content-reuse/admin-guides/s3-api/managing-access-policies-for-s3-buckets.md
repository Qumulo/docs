Access policies let you control specific sets of S3 API actions that each user or group can perform. They provide an _additional_ layer of access management for S3 buckets by adding further restrictions to those of access keys, pre-signed URLs, and file system [access control lists](managing-access-to-s3-buckets.html#inheritable-aces).

Managing access policies for S3 buckets in Qumulo clusters is similar to managing SMB share access, only with a larger set of items that you can specify in the [`Actions`](#actions) field of the [policy statement](#access-policy-statements).

For information about working with access policies for S3 buckets and for `qq` CLI examples, see the following sections in the {{site.guides.cli}}:
* [`qq s3_get_bucket_policy`](https://docs.qumulo.com/qq-cli-command-guide/s3/s3_get_bucket_policy.html)
* [`qq s3_set_bucket_policy`](https://docs.qumulo.com/qq-cli-command-guide/s3/s3_set_bucket_policy.html)
* [`qq s3_modify_bucket_policy`](https://docs.qumulo.com/qq-cli-command-guide/s3/s3_modify_bucket_policy.html)
* [`qq s3_delete_bucket_policy`](https://docs.qumulo.com/qq-cli-command-guide/s3/s3_delete_bucket_policy.html)


## Default No-Policy State
By default, S3 buckets have _no policy_ in a Qumulo cluster. In this state, there are no additional restrictions for authenticated users and any user with a valid access key and file system permissions can perform any S3 API action on the S3 bucket. However, the access control list (ACL) of the S3 bucket's root directory must grant a user some amount of access.

{{site.data.alerts.note}}
<ul>
  <li>In the default non-policy state, Qumulo Core disallows unsigned, anonymous requests and the <a href="https://docs.qumulo.com/qq-cli-command-guide/s3/s3_get_bucket_policy.html"><code>qq s3_get_bucket_policy</code></a> command returns <code>{}</code>. To enable anonymous access, use the <a href="https://docs.qumulo.com/qq-cli-command-guide/s3/s3_set_bucket_policy.html"><code>qq s3_set_bucket_policy</code></a> command with an <code>Allow</code> statement that targets the <code>local:guest</code> account.</li>
  <li>To remove an access policy from an S3 bucket, use the <a href="https://docs.qumulo.com/qq-cli-command-guide/s3/s3_delete_bucket_policy.html"><code>qq s3_delete_bucket_policy</code></a> command.</li>
</ul>
{{site.data.alerts.end}}


## Prerequisites
The following prerequisites let you manage the access policy for an S3 bucket effectively.

* Grant your users access to the S3 bucket by using [S3 access keys](creating-managing-s3-access-keys.html) or [presigned URLs](managing-access-to-s3-buckets.html#presigned-urls), or enable [read-only, anonymous access](managing-access-to-s3-buckets.html#enabling-anonymous-access-for-an-s3-bucket) to the S3 bucket.

* Configure [inheritable file ACLs](managing-access-to-s3-buckets.html#inheritable-aces) by using the `qq` CLI, SMB, or [NFSv4.1 access control lists (ACLs)](../nfs/nfsv4.1-acls.html).

* Ensure that you have the following required [role-based access control (RBAC)](../authorization-qumulo-core/managing-role-based-access-control-rbac.html) privileges. 
  
  * `PRIVILEGE_S3_BUCKETS_READ`
    
  * `PRIVILEGE_S3_BUCKETS_WRITE`
  
* (Optional) To delegate the management of an access policy for an S3 bucket to another user, grant the `s3:PutBucketPolicy` and `s3:DeleteBucketPolicy` S3 API actions to that user in the [`Actions`](#actions) field of a policy statement.


<a id="access-policy-statements"></a>
## How Policy Statements for S3 Buckets are Structured
Policy statements for S3 buckets use the JSON format. For example:

```json
{
  "Id": "Example overall access policy description",
  "Statements": [{
    "Action": [
      "s3:GetBucketPolicy",
      ...
    ],
    "Effect": "Allow",
    "Index": 1,
    "Principal": {
      "Qumulo": ["Everyone"]
     },
    "Sid": "Example policy statement description"
  },{
    ...
  }],
  "Version": "2012-10-17"
}
```

To retrieve an example policy file, run the `qq s3_get_bucket_policy --example` command.

The S3 bucket policy statement contains the following fields.

<table>
  <thead>
    <tr>
      <th width="22%">Field Name</th>
      <th width="78%">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>(Optional)<code>Id</code></td>
      <td>Describes the functionality of your overall policy</td>
    </tr>
    <tr>
      <td><code>Statements</code></td>
      <td>
        <p>Contains a list of statements, and the following fields for each policy statement</p>
        {% include note.html content="The order of the fields has no effect on the permissions that an access policy grants for an S3 bucket." %}
        <ul>
          <li><code>Action</code>: Specifies a list of <a href="#actions">API actions supported in Qumulo clusters</a> to which the policy statement applies</li>
          <li>
            <p><code>Effect</code>: Specifies either <code>Allow</code> or <code>Deny</code></p>
            {{site.data.alerts.note}}
            <ul>
              <li>Unless the policy statement has at least one matching <code>Allow</code> statement and no <code>Deny</code> statements for an action, the system outputs the <code>AccessDeniedByBucketPolicy</code> error.</li>
              <li>{{site.RBACoverrides}}</li>
              <li>The <code>ListBuckets</code> S3 API action has no associated access policy permission in Qumulo Core. Instead, this S3 API action checks each S3 bucket's policy and includes the S3 bucket in the enumeration if <em>any</em> action is allowed for a user.</li>
            </ul>
            {{site.data.alerts.end}}
          </li>
          <li>
            <p><code>Index</code>: The system ignores this field when you configure the access policy for an S3 bucket.</p>
            {{site.data.alerts.note}}
            <ul>
              <li>To retrieve index for a policy statement, use the <a href="https://docs.qumulo.com/qq-cli-command-guide/s3/s3_get_bucket_policy.html"><code>qq s3_get_bucket_policy</code></a> command.</li>
              <li>You can target a specific policy statement by specifying its index for the <code>--index</code> flag with the <a href="https://docs.qumulo.com/qq-cli-command-guide/s3/s3_modify_bucket_policy.html"><code>qq s3_modify_bucket_policy modify_statement</code></a> command.</li>
            </ul>
            {{site.data.alerts.end}}
          </li>
          <li>
            <p><code>Principal</code>: Specifies a list of users or groups (<a href="#principals">in various formats</a>) to which the policy statement applies</p>
            <p>This field uses the same identity specification as the <code>identifier</code> field of the <a href="https://docs.qumulo.com/qq-cli-command-guide/auth/auth_find_identity.html"><code>qq auth_find_identity</code></a> command.</p>
          </li>
          <li><code>Sid</code>: Describes the functionality of your policy statement</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>(Optional) <code>Version</code></td>
      <td>If you specify this field, enter <code>2012-10-17</code>, the latest policy version from Amazon. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_version.html">IAM JSON Policy Elements: Version</a>.</td>
    </tr>
  </tbody>
</table>

<a id="actions"></a>
## Actions Supported in Qumulo Core
The following table describes the subset of the [Amazon S3 API Actions](https://docs.aws.amazon.com/AmazonS3/latest/userguide/list_amazons3.html#amazons3-actions-as-permissions) which Qumulo Core supports.

{{site.data.alerts.note}}
<ul>
  <li>Certain permissions (such as <code>s3:AbortMultipartUpload</code>) grant permission to both S3 API and Qumulo Core REST API variants of an API call.</li>
  <li>Certain permissions (such as <code>s3:GetBucketAcl</code>) grant permission to S3 APIs that are currently implemented partially within Qumulo Core.</li>
  <li><code>s3:*</code> matches all S3 API actions.</li>
</ul>
{{site.data.alerts.end}}

<table>
  <thead>
    <tr>
      <th width="39%">API Action</th>
      <th width="61%">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>s3:AbortMultipartUpload</code></td>
      <td>Abort a multipart upload to the S3 bucket</td>
    </tr>
    <tr>
      <td><code>s3:DeleteBucket</code></td>
      <td>Delete the S3 bucket</td>
    </tr>
    <tr>
      <td><code>s3:DeleteBucketPolicy</code></td>
      <td>Remove the access policy from the S3 bucket</td>
    </tr>
    <tr>
      <td><code>s3:DeleteObject</code></td>
      <td>Delete any object from the S3 bucket</td>
    </tr>
    <tr>
      <td><code>s3:DeleteObjectTagging</code></td>
      <td>Delete all tags from any object in the S3 bucket</td>
    </tr>
    <tr>
      <td><code>s3:GetBucketAcl</code></td>
      <td>Retrieve the access control list (ACL) for the S3 bucket</td>
    </tr>
    <tr>
      <td><code>s3:GetBucketLocation</code></td>
      <td>
        <p>Retrieve the region in which the S3 bucket is located</p>
        {% include note.html content="Currently, because Qumulo Core doesn't use regions, the system always returns `local`." %}
      </td>
    </tr>
    <tr>
      <td><code>s3:GetBucketNotification</code></td>
      <td>Retrieve the notification configuration for the S3 bucket</td>
    </tr>
    <tr>
      <td><code>s3:GetBucketObjectLockConfiguration</code></td>
      <td>Retrieve the object lock configuration for the S3 bucket</td>
    </tr>
    <tr>
      <td><code>s3:GetBucketPolicy</code></td>
      <td>Retrieve the bucket policy for the S3 bucket</td>
    </tr>
    <tr>
      <td><code>s3:GetBucketReplication</code></td>
      <td>Retrieve the replication state for the S3 bucket</td>
    </tr>
    <tr>
      <td><code>s3:GetBucketVersioning</code></td>
      <td>Retrieve the versioning state for the S3 bucket</td>
    </tr>
    <tr>
      <td><code>s3:GetEncryptionConfiguration</code></td>
      <td>Retrieve the encryption state for the S3 bucket</td>
    </tr>
    <tr>
      <td><code>s3:GetLifecycleConfiguration</code></td>
      <td>Retrieve the lifecycle configuration for the S3 bucket</td>
    </tr>
    <tr>
      <td><code>s3:GetObject</code></td>
      <td>
        <p>Download any object from the S3 bucket</p>
        {% include note.html content="The file system permissions take precedence over this permission." %}
      </td>
    </tr>
    <tr>
      <td><code>s3:GetObjectAcl</code></td>
      <td>Download the access control list (ACL) for any object in the S3 bucket</td>
    </tr>
    <tr>
      <td><code>s3:GetObjectAttributes</code></td>
      <td>Retrieve the attributes for any object in the S3 bucket</td>
    </tr>
    <tr>
      <td><code>s3:GetObjectTagging</code></td>
      <td>Retrieve the tags for any object in the S3 bucket</td>
    </tr>
    <tr>
      <td><code>s3:ListBucket</code></td>
      <td>Enumerate all objects in the S3 bucket</td>
    </tr>
    <tr>
      <td><code>s3:ListBucketMultipartUploads</code></td>
      <td>Enumerate all multipart uploads to the S3 bucket</td>
    </tr>
    <tr>
      <td><code>s3:ListMultipartUploadParts</code></td>
      <td>Enumerate all multipart upload parts in the S3 bucket</td>
    </tr>
    <tr>
      <td><code>s3:PutBucketPolicy</code></td>
      <td>Configure the access policy for the S3 bucket</td>
    </tr>
    <tr>
      <td><code>s3:PutObject</code></td>
      <td>Write or overwrite any object in the S3 bucket</td>
    </tr>
    <tr>
      <td><code>s3:PutObjectTagging</code></td>
      <td>Configure tags for any object in the S3 bucket</td>
    </tr>
  </tbody>
</table>

<a id="principals"></a>
## Principals Supported in Qumulo Core
The following table describes examples of principals which Qumulo Core supports.

<table>
  <thead>
    <tr>
      <th width="38%">Identity Specification Example</th>
      <th width="62%">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>Mary Lou</code></td>
      <td>A username or group name</td>
    </tr>
    <tr>
      <td><code>local:Jane</code></td>
      <td>A user or group created by using the Qumulo Core REST API in the <code>local</code> domain, prefixed by <code>local:</code></td>
    </tr>   
    <tr>
      <td><code>local:guest</code></td>
      <td>An anonymous connection</td>
    </tr>
    <tr>
      <td><code>world:Everyone</code></td>
      <td>Any user connected to Qumulo Core, including unauthenticated, anonymous connections</td>
    </tr>
    <tr>
      <td><code>Authenticated Users</code></td>
      <td>Any authenticated user, excluding guest or anonymous connections</td>
    </tr>
    <tr>
      <td><code>EXAMPLE_DOMAIN\Jose Ramirez</code></td>
      <td>A user or group in a specific Active Directory domain, prefixed by the domain name</td>
    </tr>
    <tr>
      <td><code>ad:Company Name</code></td>
      <td>A user or group in any connected Active Directory domain, prefixed by <code>ad:</code></td>
    </tr>
    <tr>
      <td><code>uid:1234</code></td>
      <td>A POSIX UID that identifies users by their {% include rfc.html rfc='2307' %}, prefixed by <code>uid:</code></td>
    </tr>
    <tr>
      <td><code>gid:1234</code></td>
      <td>A Posix GID that identifies users by their {% include rfc.html rfc='2307' %}, prefixed by <code>gid:</code></td>
    </tr>
    <tr>
      <td><code>auth_id:12345678</code></td>
      <td>The numeric <code>auth_id</code> of a user or group</td>
    </tr>
    <tr>
      <td>
        <ul>
          <li><code>S-1-5-1234</code></li>
          <li><code>sid:S-1-5-5678</code></li>
        </ul>
      </td>
      <td>A <a href="https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/understand-security-identifiers">Windows-style security identifier (SID)</a>, optionally prefixed by <code>sid:</code></td>
    </tr>
  </tbody>
</table>

<a id="rbac-overrides"></a>
## Role-Based Access Control (RBAC) Overrides
{{site.RBACoverrides}}

The following table describes the relationship between Qumulo Core privileges and the S3 API actions associated with them.

<table>
  <thead>
    <tr>
      <th>Qumulo Core Privilege</th>
      <th>Associated S3 API Actions</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>S3_BUCKETS_READ</code></td>
      <td><code>s3:GetBucketPolicy</code></td>
    </tr>
    <tr>
      <td><code>S3_BUCKETS_WRITE</code></td>
      <td>
        <ul>
          <li><code>s3:DeleteBucket</code></li>
          <li><code>s3:DeleteBucketPolicy</code></li>
          <li><code>s3:PutBucketPolicy</code></li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><code>S3_UPLOADS_READ</code></td>
      <td>
        <ul>
          <li><code>s3:ListMultipartUploadParts</code></li>
          <li><code>s3:ListBucketMultipartUploads</code></li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><code>S3_UPLOADS_WRITE</code></td>
      <td><code>s3:AbortMultipartUpload</code></td>
    </tr>
  </tbody>
</table>
