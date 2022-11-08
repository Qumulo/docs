---
title: "Using Qumulo Core Access Tokens"
summary: "This section describes how to create and use access tokens to authenticate external services to Qumulo Core."
permalink: /administrator-guide/qumulo-core/using-access-tokens.html
keywords: auth, authentication, access token, bearer token, token, Authorization
sidebar: administrator_guide_sidebar
varAccessTokenWarning: An attacker can use an access token to authenticate as the token's user to Qumulo Core REST API and gain all of the user's privileges.
varAccessTokenBestPractices: Treat access tokens, and the bearer tokens they generate, like passwords&#58; Store your tokens securely, rotate your tokens often, and create a token revocation policy for your organization.
varAccessTokenAdminWarning: To decrease the risk of giving an attacker full administrative access&mdash;including access to cluster data&mdash;avoid generating tokens for accounts with administrative privileges.
varTokenQQcli: To use an access token in the <code>qq</code> CLI, you must use the <code>--file</code> flag when you create the access token.
---

This section explains how to create and use access tokens&mdash;by using the Qumulo REST API, Python SDK, and `qq` CLI&mdash;to authenticate external services to Qumulo Core.

In Qumulo Core 5.3.0 (and higher), _access tokens_ let a user to authenticate to the Qumulo REST API without having to complete repetitive login procedures. Access tokens provide an alternative to session-based authentication that the `qq login` CLI command and the Web UI use

Unlike _user bearer tokens_ (that have a short expiration time and require a password to refresh), access tokens are long-lived. Commonly, access tokens support authentication for services, long-lived automation processes, and programmatic REST API access that doesn't require user input.

{{site.data.alerts.important}}
<ul>
  <li>{{page.varAccessTokenWarning}} {{page.varAccessTokenBestPractices}}</li>
  <li>Because a token allows indefinite authentication to the associated user's account, we strongly recommend against creating tokens for individual Qumulo Core REST API users. For more information, see <a href="#best-practices-using-access-tokens">Best Practices for Using Access Tokens</a>.</li>
</ul>
{{site.data.alerts.end}}


## Creating Access Tokens by Using the qq CLI
This section explains how to create access tokens by using the `qq` CLI.

{% include note.html content="The Qumulo Core privilege `PRIVILEGE_ACCESS_TOKEN_WRITE`, required for creating access tokens, allows creating tokens for all users in the system." %}

To create a token, use the `auth_create_access_token` command and specify the user. For example:

```bash
$ qq auth_create_access_token jane
```
You can:
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
  <li>Although you can create groups for users, access tokens don't support groups.</li>
  <li>{{page.varTokenQQcli}}</li>
</ul>
{{site.data.alerts.end}}

<a name="json-bearer-token"></a>The `auth_create_access_token` command returns a JSON response that contains the bearer token body and the access token ID, which you can use to manage the access token.

```json
{
  "bearer_token": "access-v1:abAcde...==",
  "id": "12345678901234567890123"
}
```

{{site.data.alerts.important}}
<ul>
  <li>As soon as you receive your bearer token, record it in a safe place. You can't retrieve the bearer token at a later time.</li>
  <li>Any user can have a maximum of two access tokens. If a user already has two access tokens, creating new tokens fails until you remove at least one token from the user. We strongly recommend creating a single access token for each user and using the second access token to perform secret rotation.</li>  
  <li>{{page.varAccessTokenBestPractices}}</li>
  <li>{{page.varAccessTokenAdminWarning}}</li>
</ul>
{{site.data.alerts.end}}


## Using Bearer Tokens for Authorization
A Qumulo Core access token [returns a _bearer token_](#json-bearer-token), an item in the `Authorization` HTTP header which acts as the authentication mechanism for the Qumulo Core REST API. 

### REST API
When you use the Qumulo REST API, add the bearer token to the `Authorization` HTTP header. For example:

```
Authorization: Bearer access-v1:abAcde...==
```

You can also add the bearer token to a `curl` command. For example:

```bash
$ curl https://my-qumulo-cluster:8000/v1/session/who-am-i -H 'Authorization: Bearer access-v1:abAcde...=='
```

### Python SDK
When you use the Qumulo Python SDK, add the bearer token to a `RestClient` object. For example:

```python
from qumulo.rest_client import RestClient
from qumulo.lib.auth import Credentials
client = RestClient('my-qumulo-cluster', 8000, Credentials('access-v1:abAcde...=='))
```

For more information, see the [Qumulo Core Python SDK](https://pypi.org/project/qumulo-api/).

### qq CLI
{{page.varTokenQQcli}} This option accepts a file path to save the credential in a format that can be used by the qq CLI.

Once the credentials file has been created, it can be pass to the qq CLI using the `--credentials-store` option. Here is an example that creates an access token saved to a file, and uses it in a subsequent call to qq.

```bash
$ qq auth_create_access_token USER --file ./qumulo_credentials
$ qq --credentials-store ./qumulo_credentials who_am_i
```

## Listing Access Tokens

Access tokens can be listed using `qq auth_list_access_tokens`.

```bash
$ qq auth_list_access_tokens
id                      user   creator  creation time
======================  =====  =======  ==============================
9226266821531216810715  svc    admin    2022-10-27T15:18:09.725513764Z
9230454060595080992940  svc    admin    2022-10-27T15:18:24.997572918Z
```

Listing access tokens gives the access token ID, the user that the access token represents, the creator of the access token, and the time that the access token was created.

The `auth_list_access_tokens` command can filter by user with the `--user` argument, which takes an argument in the same form as `auth_create_access_token`.

{% include important.html content="Listing access tokens _doesn't_ return the bearer token needed for authentication. If you have lost the bearer token associated with an access token, you will need to create a new access token." %}

Listing access tokens requires the privilege `PRIVILEGE_ACCESS_TOKEN_READ`.

## Deleting Access Tokens

Access tokens can be deleted using `qq auth_delete_access_tokens`.

```bash
$ qq auth_delete_access_token <access token ID>
```

Once an access token is deleted, the bearer token associated with it will no longer work for authentication.

Deleting access tokens requires the privilege `PRIVILEGE_ACCESS_TOKEN_WRITE`.


<a name="best-practices-using-access-tokens"></a>
## Best Practices for Using Access Tokens

### Avoid Generating Tokens for Administrative Accounts

{{page.varAccessTokenWarning}}

{{page.varAccessTokenAdminWarning}}

### Generate Tokens for Service Accounts

When connecting external services up to the Qumulo Core REST API, we recommend creating a service account with limited privileges for that individual service and generating an access token for that account.
This limits the exposure if an access token is ever leaked or stolen, as the service account should only have privileges that the service required.

#### To Create a New Service Account

1. Log in to Qumulo Core.

1. Create a service account:

    a. Click **Cluster > Local Users & Groups**.

    b. On the **Users** page, click **Create** and enter a **User name** and **Password**.

1. Create a role with privileges:

    a. Click **Cluster > Role Management**.

    b. Click **Create Role**.

    c. Fill out a **Name**, **Description**, and select all appropriate **Privileges** for the user.

    d. Click **Save**.

1. Assign the service user to the role:

    a. Find the role you just created in the list and click **Add Member**.

    b. Type the name of the user you created above into the **Trustee** field.

    c. Click **Yes, Add Member**.

You can now follow the steps above in [Creating Access Tokens](#creating-access-tokens) to create an access token for the account.

{% include note.html content="We recommend creating a separate account for each service. This helps limit exposure if the credentials are ever leaked." %}

### Rotate Access Tokens

In order to limit exposure from leaked or stolen credentials, we recommend rotating access tokens on some regular interval.

#### To Rotate an Access Token for a Service

1. Ensure that there is only one access token for the service account using `qq auth_list_access_tokens`.

    a. If there are multiple access tokens, delete any old access tokens that are not in use.

1. Create a new access token for the service account using `qq auth_create_access_token`.

1. Replace the old access token in your service's credential store with the new one.

1. Test that your service can still access the Qumulo Core API.

1. Delete the old access token using `qq auth_delete_access_token`.
