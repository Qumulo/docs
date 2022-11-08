---
title: "Using Qumulo Core Access Tokens"
summary: "This section describes how to create and use access tokens to authenticate external services to Qumulo Core."
permalink: /administrator-guide/qumulo-core/using-access-tokens.html
keywords: auth, authentication, access token, token
sidebar: administrator_guide_sidebar
varAccessTokenWarning: An attacker can use an access token to authenticate as the token's user to Qumulo Core REST API and gain all of the user's privileges. Treat access tokens like passwords&#58; Store your tokens securely, rotate your tokens often, and create a token revocation policy for your organization.
---

This section explains how to create and use access tokens&mdash;by using the Qumulo REST API, Python SDK, and `qq` CLI&mdash;to authenticate external services to Qumulo Core.

Unlike _user bearer tokens_ (that have a short expiration time and require a password to refresh), _access tokens_ are long-lived tokens that let a user to authenticate to the Qumulo REST API without having to complete repetitive login procedures. An access token returns a _bearer token_&mdash;an item in the Authorization HTTP header which acts as the authentication mechanism for the REST API. Commonly, access tokens enable authentication for services, long-lived automation processes, and programmatic REST API access that doesn't require user input.

Qumulo Core 5.3.0 (and higher) supports using access tokens as an alternative to session-based authentication that the `qq login` CLI command and the Web UI use. 

{% capture content_tag %}{{page.varAccessTokenWarning}}{% endcapture %}
{% include important.html content=content_tag %}

{{site.data.alerts.important}}
<ul>
  <li>{{page.varAccessTokenWarning}}</li>
  <li>Because a token allows indefinite authentication to the associated user's account, we strongly recommend against creating tokens for individual Qumulo Core REST API users. For more information, see <a href="#best-practices-using-access-tokens">Best Practices for Using Access Tokens</a>.</li>
</ul>
{{site.data.alerts.end}}


## Creating Access Tokens by Using the qq CLI

```bash
$ qq auth_create_access_token USER
{
    "bearer_token": "access-v1:abKvmz5uGfNZQO8WrlOzVXD5NAxRo3nC5+iISIXhDRcBAAAABwQAAAAAAABW8Yro4FWwKMlzWGMAAAAAYYTACg==",
    "id": "19021525077776428364118"
}
```

`USER` can be specified as a name, optionally qualified with a domain prefix (for example, `local:user`, `ad:user`, or `AD\user`.
It also accepts ID types such as `auth_id:1234` or `SID:S-1-1-0`. Groups are not supported for access tokens; they can only be created for a user.


The returned JSON contains the access token's ID and the bearer token. The bearer token is used for authentication; it should be treated like a password. See [Using Access Tokens](#using-access-tokens) to learn how to use the bearer token. The access token ID is used for further administration of the access token. See [Deleting Access Tokens](#deleting-access-tokens) to learn more.

Only two access tokens can exist for any user at a time. If a user already has two access tokens, creating new ones will fail until existing access tokens are deleted. We recommend only creating a single access token for a user and using the second access token to perform secret rotation, see [Rotating Access Tokens](#rotating-access-tokens)

{% include note.html content="Save the bearer token somewhere safe after you run the command. There is no way to retreive the bearer token later." %}

{% include important.html content="Never create access tokens for users with administration privileges. A compromised access token will give an attacker full access to the Qumulo Core REST API as that user." %}

Creating access tokens requires the privilege PRIVILEGE_ACCESS_TOKEN_WRITE and allows creating access tokens for **all users** in the system.

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

{% include important.html content="Never generate tokens for accounts with administrative privileges." %}

{{page.varAccessTokenWarning}}

For this reason, it is **highly discouraged** to create an access token for users with administrative privileges.
Such tokens can give full administrator access to attackers if leaked, including access to cluster data.

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
