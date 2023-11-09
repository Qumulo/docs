{% include tip.html content="It is possible to confuse the terms _access token_ and _session token_. Unlike access tokens, session tokens are short-lived and require a password to refresh, for example, to authenticate by using the `qq login` command. Access tokens are the focus of this section." %}

In Qumulo Core 5.3.0 (and higher), you can use _access tokens_ to let a user authenticate to the Qumulo REST API without having to complete repetitive login procedures.

Access tokens are long-lived. They provide an alternative to session-based authentication that the `qq login` command and the Web UI use. They also support support authentication for services, long-lived automation processes, and programmatic REST API access that doesn't require user input.

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

<a id="create-token-format"></a>

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
  <li>Although you can create groups for users, you can't create access tokens for groups.</li>
  <li>{{page.varTokenQQcli}}</li>
</ul>
{{site.data.alerts.end}}

<a id="json-bearer-token"></a>

The `auth_create_access_token` command returns a JSON response that contains the bearer token body and the access token ID, which you can use to manage the access token.

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
$ curl https://{{site.exampleIP0}}:8000/v1/session/who-am-i -H 'Authorization: Bearer access-v1:abAcde...=='
```

#### Python SDK
When you use the Qumulo Python SDK, add the bearer token to a `RestClient` object. For example:

```python
from qumulo.rest_client import RestClient
from qumulo.lib.auth import Credentials
client = RestClient('{{site.exampleIP0}}', 8000, Credentials('access-v1:abAcde...=='))
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

## Getting Metadata for Access Tokens
{{page.varPrereqRead}} This section explains how to get metadata for a specific access token or all access tokens by using the `qq` CLI.

### To Get Metadata for a Specific Access Token
Use the `auth_get_access_token` command and specify the access token ID. For example:

```bash
$ qq auth_get_access_token 1234567890123456789012
```

This command returns a JSON object that lists:
{{page.varTokenReturn}}

For example:

```json
{
  "creation_time": "2022-12-06T01:14:39.56621474Z",
  "creator": {
    "auth_id": "500",
    "domain": "LOCAL",
    "gid": null,
    "name": "admin",
    "sid": "S-1-1-12-12345678-1234567890-1234567890-500",
    "uid": null
  },
  "enabled": true,
  "expiration_time": "2023-01-01T00:00:00Z",
  "id": "12345678901234567890123",
  "user": {
    "auth_id": "1002",
    "domain": "LOCAL",
    "gid": null,
    "name": "svc",
    "sid": "S-1-1-12-12345678-1234567890-1234567890-1002",
    "uid": null
  }
}
```

### To Get Metadata for All Access Tokens
Use the `qq auth_list_access_tokens` command.

{{site.data.alerts.important}}
Listing access tokens <em>doesn't</em> return the bearer token required for authentication. {{site.varBearerTokenWarning}}
{{site.data.alerts.end}}

The `auth_list_access_tokens` command returns:
{{page.varTokenReturn}}

For example:

```
id                      user   creator  creation time                   
======================  =====  =======  ==============================  
1234567890123456789012  svc    admin    2022-10-27T15:18:09.725513764Z
0987654321098765432109  svc    admin    2022-10-27T15:18:24.997572918Z

expiration time       enabled
====================  =======
                      True
2023-01-01T00:00:00Z  False
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


<a id="disabling-access-token"></a>
## Disabling an Access Token
To help you check your system's security posture, Qumulo Core lets you disable an access token without deleting it. This is a good way to check for dependencies on the access token before you delete the token permanently.

{{page.varPrereqWrite}} This section explains how to disable an access token by using the `qq` CLI.

{% capture content_disable_token %}After you disable an access token, {{page.varBearerToken}}{% endcapture %}
{% include important.html content=content_disable_token %}

To disable an access token, use the `auth_modify_access_token` command, specify the access token ID, and use the `-d` flag. For example:

```bash
$ qq auth_modify_access_token 1234567890123456789012 -d
```

To enable an access token, use the `auth_modify_access_token` command, specify the access token ID, and use the `-e` flag. For example:

```bash
$ qq auth_modify_access_token 1234567890123456789012 -e
```


## Deleting Access Tokens
{{page.varPrereqWrite}} This section explains how to delete an access token by using the `qq` CLI.

{% capture content_disable_token %}After you delete an access token, {{page.varBearerToken}}{% endcapture %}
{% include important.html content=content_disable_token %}

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

   1. Click **Cluster > Local Users & Groups**.

   1. In the **Users** section, click **Create**.

   1. In the **Create user** dialog box, enter a **User name** and **Password**, re-enter the password, and then click **Create**.

1. Create a role with privileges.

   1. Click **Cluster > Role Management**.

   1. In the **Role Management** section, click **Create Role**.

   1. On the **Create Role** page, enter a **Name** and **Description**, click the **Privileges** for the user, and then click **Save**.

1. Assign the service user to the role.

   1. On the **Role Management** page, find the name of the role you created and then click **Add Member**.

   1. In the **Add Member to &lt;MyRoleName&gt;** dialog box, for **Trustee**, enter the name of the user you created and then click **Yes, Add Member**.

1. [Create access tokens](#creating-using-access-tokens) for your service account.

### Rotating Access Tokens
We strongly recommend rotating access tokens for a service account at a regular interval.

#### To Rotate an Access Token for a Service Account

1. To ensure that there is only one access token for each service account, use the `qq auth_list_access_tokens` command.

   If multiple access tokens exist, delete any unused access tokens.

1. To create a new access token for the service account, use the `qq auth_create_access_token` command.

1. In the credential store of your service, replace the old access token with the new one.

1. Test that your service account can access the Qumulo Core REST API.

1. Confirm that there is nothing else relying on the old access token by disabling it first. If this causes any disruptions then you can re-enable it while you resolve the issue.

1. To delete the old access token, use the `qq auth_delete_access_token` command.
