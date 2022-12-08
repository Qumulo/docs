---
title: "Using Qumulo Core Access Tokens"
summary: "This section explains how to create and use access tokens&mdash;by using the Qumulo REST API, Python SDK, and <code>qq</code> CLI&mdash;to authenticate external services to Qumulo Core."
permalink: /administrator-guide/external-services/using-access-tokens.html
keywords: auth, authentication, access token, bearer token, token
sidebar: administrator_guide_sidebar
varAccessTokenWarning: An attacker can use an access token to authenticate as the token's user to Qumulo Core REST API (through HTTP, the Python SDK, or the <code>qq</code> CLI) and gain all of the user's privileges.
varAccessTokenBestPractices: Treat access tokens, and the bearer tokens they generate, like passwords&#58; Store your tokens securely, rotate your tokens often, and create a token revocation policy for your organization.
varAccessTokenAdminWarning: To decrease the risk of giving an attacker full administrative access&mdash;including access to cluster data&mdash;avoid generating tokens for accounts with administrative privileges.
varExpirationUtcNote: The <code>--expiration-time</code> flag interprets arguments as timestamps in the UTC time zone.
varTokenQQcli: To use an access token in the <code>qq</code> CLI, you must use the <code>--file</code> flag when you create the access token. Use this flag to specify a path for saving your credentials file in a format that the <code>qq</code> CLI can use.
varPrereqWrite: <code>PRIVILEGE_ACCESS_TOKEN_WRITE</code> is required for creating and deleting access tokens for all users in the system.
varPrereqRead: <code>PRIVILEGE_ACCESS_TOKEN_READ</code> is required for listing access tokens.
varTokenExpiration: When an access token's expiration time elapses, it isn't possible to use the token for authentication. Any attempt to use the token results in an authentication error. To continue the authentication process, you must either [create a new access token](#creating-using-access-tokens) or [update the expiration time for your existing token](#modifying-access-tokens).
varTokenReturn: <ul><li>The access token ID</li><li>The user that the access token represents</li><li>The access token's creator</li><li>The access token's creation time</li></ul>
---

In Qumulo Core 5.3.0 (and higher), _access tokens_ let a user to authenticate to the Qumulo REST API without having to complete repetitive login procedures. Access tokens provide an alternative to session-based authentication that the `qq login` command and the Web UI use.

Unlike _session bearer tokens_ (that have a short expiration time and require a password to refresh, for example for authentication by using the `qq login` command), access tokens are long-lived. Access tokens support authentication for services, long-lived automation processes, and programmatic REST API access that doesn't require user input.

{{site.data.alerts.important}}
<ul>
  <li>{{page.varAccessTokenWarning}} {{page.varAccessTokenBestPractices}}</li>
  <li>Because a token allows indefinite authentication to the associated user's account, we strongly recommend against creating tokens for individual Qumulo Core REST API users. For more information, see <a href="#best-practices-using-access-tokens">Best Practices for Using Access Tokens</a>.</li>
</ul>
{{site.data.alerts.end}}


## Prerequisites
<ul>
  <li>{{page.varPrereqWrite}}</li>
  <li>{{page.varPrereqRead}}</li>
</ul>

<a id="creating-using-access-tokens"></a>
## Creating and Using Access Tokens
{{page.varPrereqWrite}} This section explains how to create access tokens without or with an expiration time by using the `qq` CLI.

### To Create an Access Token without an Expiration Time
Use the `auth_create_access_token` command and specify the user. For example:

```bash
$ qq auth_create_access_token jane
```

<a id="create-token-format"></a>You can:
* Specify the user as a name
* Qualify the user by using a domain prefix, for example:
  * `ad:jane`
  * `AD\jane`
  * `local:jane`
* Specify ID types, for example:
  * `auth_id:1234`
  * `SID:S-1-1-0`

{{site.data.alerts.note}}
<ul>
  <li>Although you can create groups for users, you can't create access tokens for groups.</li>
  <li>{{page.varTokenQQcli}}</li>
</ul>
{{site.data.alerts.end}}

<a id="json-bearer-token"></a>The `auth_create_access_token` command returns a JSON response that contains the bearer token body and the access token ID, which you can use to manage the access token.

```json
{
  "bearer_token": "access-v1:abAcde...==",
  "id": "12345678901234567890123"
}
```

{{site.data.alerts.important}}
<ul>
  <li>{{site.varBearerTokenRecommend}} {{site.varBearerTokenWarning}}</li>
  <li>Any user can have a maximum of two access tokens. If a user already has two access tokens, creating new tokens fails until you remove at least one token from the user. We strongly recommend creating a single access token for each user and using the second access token to perform secret rotation.</li>  
  <li>{{page.varAccessTokenBestPractices}}</li>
  <li>{{page.varAccessTokenAdminWarning}}</li>
</ul>
{{site.data.alerts.end}}

<a id="create-token-expiration-time"></a>
### To Create an Access Token with an Expiration Time
In Qumulo Core 5.3.2 (and higher), you can use the `auth_create_access_token --expiration-time` command and specify the expiration time. You can specify the expiration time in different formats. For example:

```bash
$ qq auth_create_access_token jane --expiration-time 'Jan 01 2023'
```

```bash
$ qq auth_create_access_token jane --expiration-time '01/01/2023 00:00'
```

{{page.varTokenExpiration}}

{{site.data.alerts.note}}
{{page.varExpirationUtcNote}}
{{site.data.alerts.end}}

### Using Bearer Tokens for Authentication
A Qumulo Core access token [returns a _bearer token_](#json-bearer-token), an item in the `Authorization` HTTP header which acts as the authentication mechanism for the Qumulo Core REST API.

#### REST API
When you use the Qumulo REST API, add the bearer token to the `Authorization` HTTP header. For example:

```
Authorization: Bearer access-v1:abAcde...==
```

You can also add the bearer token to a `curl` command. For example:

```bash
$ curl https://<qumulo-cluster>:8000/v1/session/who-am-i -H 'Authorization: Bearer access-v1:abAcde...=='
```

#### Python SDK
When you use the Qumulo Python SDK, add the bearer token to a `RestClient` object. For example:

```python
from qumulo.rest_client import RestClient
from qumulo.lib.auth import Credentials
client = RestClient('<qumulo-cluster>', 8000, Credentials('access-v1:abAcde...=='))
```

For more information, see the [Qumulo Core Python SDK](https://pypi.org/project/qumulo-api/).

#### qq CLI
{{page.varTokenQQcli}} For example:

```bash
$ qq auth_create_access_token jane --file ./qumulo_credentials
```

To use the credentials file, specify its location by using the `--credentials-store` flag. For example:

```bash
$ qq --credentials-store ./qumulo_credentials who_am_i
```

<a id="getting-metadata-for-access-tokens"></a>
## Getting Metadata for Access Tokens
{{page.varPrereqRead}} This section explains how to get metadata for a specific access token or all access tokens by using the `qq` CLI.

### To Get Metadata for a Specific Access Token
Use the `auth_get_access_token` command and specify the access token ID. For example:

```bash
$ qq auth_get_access_token 1234567890123456789012
```

This command returns a JSON object that contains:
{{page.varTokenReturn}}

### To Get Metadata for All Access Tokens
Use the `qq auth_list_access_tokens` command.

{{site.data.alerts.important}}
Listing access tokens <em>doesn't</em> return the bearer token required for authentication. {{site.varBearerTokenWarning}}
{{site.data.alerts.end}}

The `auth_list_access_tokens` command returns:
{{page.varTokenReturn}}

```
id                      user   creator  creation time
======================  =====  =======  ==============================
1234567890123456789012  svc    admin    2022-10-27T15:18:09.725513764Z
0987654321098765432109  svc    admin    2022-10-27T15:18:24.997572918Z
```

To filter the command's output by user, use the `--user` flag and use the same format for the name as for the [`auth_create_access_token`](#create-token-format) command.


<a id="modifying-expiration-time-access-token"></a>
## Modifying the Expiration Time for an Access Token
{{page.varPrereqWrite}} This section explains how to modify access tokens by using the `qq` CLI.

Use the `auth_modify_access_token` command and specify the access token ID and the expiration time. For example:

```bash
$ qq auth_modify_access_token 1234567890123456789012 --expiration-time 'Jan 01 2023'
```

{{page.varTokenExpiration}}

{{site.data.alerts.note}}
{{page.varExpirationUtcNote}}
{{site.data.alerts.end}}


## Deleting Access Tokens
{{page.varPrereqWrite}} This section explains how to delete access tokens by using the `qq` CLI.

{% include important.html content="When you delete an access token, you can't use any bearer tokens associated with the access token to authenticate to Qumulo Core." %}

To delete an access token, use the `auth_delete_access_token` command and specify the access token ID. For example:

```bash
$ qq auth_delete_access_token 1234567890123456789012
```

<a id="best-practices-using-access-tokens"></a>
## Best Practices for Using Qumulo Core Access Tokens
This section lists the best practices for limiting the exposure to lost credentials and working with Qumulo Core access tokens securely.

### Avoiding Creation of Tokens for Administrative Accounts
{{page.varAccessTokenWarning}} {{page.varAccessTokenAdminWarning}}

### Generating Tokens for Service Accounts
When you connect external services to the Qumulo Core REST API, we recommend creating a service account with limited privileges for each individual service and generating an access token for each service account.

#### To Create a New Service Account

1. Log in to Qumulo Core.

1. Create a service account.

    a. Click **Cluster > Local Users & Groups**.

    b. In the **Users** section, click **Create**.

    c. In the **Create user** dialog box, enter a **User name** and **Password**, re-enter the password, and then click **Create**.

1. Create a role with privileges.

    a. Click **Cluster > Role Management**.

    b. In the **Role Management** section, click **Create Role**.

    c. On the **Create Role** page, enter a **Name** and **Description**, click the **Privileges** for the user, and then click **Save**.

1. Assign the service user to the role.

    a. On the **Role Management** page, find the name of the role you created and then click **Add Member**.

    b. In the **Add Member to &lt;MyRoleName&gt;** dialog box, for **Trustee**, enter the name of the user you created and then click **Yes, Add Member**.

1. [Create access tokens](#creating-using-access-tokens) for your service account.

### Rotating Access Tokens
We strongly recommend rotating access tokens for a service account at a regular interval.

#### To Rotate an Access Token for a Service Account

1. To ensure that there is only one access token for each service account, use the `qq auth_list_access_tokens` command.

   If multiple access tokens exist, delete any unused access tokens.

1. To create a new access token for the service account, use the `qq auth_create_access_token` command.

1. In the credential store of your service, replace the old access token with the new one.

1. Test that your service account can access the Qumulo Core REST API.

1. To delete the old access token, use the `qq auth_delete_access_token` command.
