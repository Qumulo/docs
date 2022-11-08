---
title: "Using Qumulo Core Access Tokens"
summary: "This section describes how to create and use access tokens to authenticate external services to Qumulo Core."
permalink: /administrator-guide/qumulo-core/using-access-tokens.html
keywords: auth, authentication, access token, token
sidebar: administrator_guide_sidebar
varAccessTokenWarning: An attacker can use an access token to authenticate as the token's user to Qumulo Core REST API and gain all of the user's privileges.
varAccessTokenBestPractices: Treat access tokens, and the bearer tokens they generate, like passwords&#58; Store your tokens securely, rotate your tokens often, and create a token revocation policy for your organization.
varAccessTokenAdminWarning: To decrease the risk of giving an attacker full administrative access&mdash;including access to cluster data&mdash;avoid generating tokens for accounts with administrative privileges.
---

This section explains how to create and use access tokens&mdash;by using the Qumulo REST API, Python SDK, and `qq` CLI&mdash;to authenticate external services to Qumulo Core.

Unlike _user bearer tokens_ (that have a short expiration time and require a password to refresh), _access tokens_ are long-lived tokens that let a user to authenticate to the Qumulo REST API without having to complete repetitive login procedures. An access token returns a _bearer token_&mdash;an item in the Authorization HTTP header which acts as the authentication mechanism for the REST API. Commonly, access tokens enable authentication for services, long-lived automation processes, and programmatic REST API access that doesn't require user input.

Qumulo Core 5.3.0 (and higher) supports using access tokens as an alternative to session-based authentication that the `qq login` CLI command and the Web UI use. 

{{site.data.alerts.important}}
<ul>
  <li>{{page.varAccessTokenWarning}}{{page.varAccessTokenBestPractices}}</li>
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
 
{% include note.html content="Although you can create groups for users, access tokens don't support groups." %}

The `auth_create_access_token` command returns a JSON response that contains the bearer token body and the access token ID, which you can use to manage the access token.

```json
{
  "bearer_token": "access-v1:abAcde...==",
  "id": "12345678901234567890123"
}
```

{{site.data.alerts.important}}
<ul>
  <li>{{page.varAccessTokenBestPractices}}</li>
  <li>{{page.varAccessTokenAdminWarning}}</li>
  <li>As soon as you receive your bearer token, record it in a safe place. You can't retrieve the bearer token at a later time.</li>
  <li>Any user can have a maximum of two access tokens. If a user already has two access tokens, creating new tokens fails until you remove at least one token from the user. We strongly recommend creating a single access token for each user and using the second access token to perform secret rotation.</li>
</ul>
{{site.data.alerts.end}}


## Using Bearer Tokens for Authorization

Access tokens can be used to authenticate to the Qumulo Core REST API using [Bearer Token](https://oauth.net/2/bearer-tokens/) authorization.

### REST API

Use the bearer token returned from the `auth_create_access_token` in an `Authorization` HTTP header like so:

```
Authorization: Bearer <bearer token>
```

For example, you can set the authorization header for `curl` like this:

```bash
$ curl https://qumulo-hostname:8000/v1/session/who-am-i -H 'Authorization: Bearer <bearer token>'
```

### Python SDK

Using [Qumulo Core Python SDK](https://pypi.org/project/qumulo-api/) you can create a `RestClient` object using the bearer token.

```python
from qumulo.rest_client import RestClient
from qumulo.lib.auth import Credentials
client = RestClient('qumulo-hostname', 8000, Credentials('<bearer token>'))
```

### qq CLI

To use access tokens in the qq CLI, you must create the access token with the `--file` option. This option accepts a file path to save the credential in a format that can be used by the qq CLI.

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
