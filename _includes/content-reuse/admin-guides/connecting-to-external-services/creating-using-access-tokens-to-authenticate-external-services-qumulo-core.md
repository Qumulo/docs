{% capture differentTerms %}It is possible to confuse the terms _access token_ and _session token_. Unlike access tokens, session tokens are short-lived and require a password to refresh, for example, to authenticate by using the {% include qq.html command="login" %} command. Access tokens are the focus of this section.{% endcapture %}
{% include tip.html content=differentTerms %}

In Qumulo Core 5.3.0 (and higher), you can use _access tokens_ to let a user authenticate to the Qumulo REST API without having to complete repetitive login procedures.

Access tokens are long-lived. They provide an alternative to session-based authentication that the {% include qq.html command="login" %} command and the Qumulo Core Web UI use. They also support support authentication for services, long-lived automation processes, and programmatic REST API access that doesn't require user input.

{{site.data.alerts.caution}}
<ul>
  <li>{{page.varAccessTokenWarning}} {{page.varAccessTokenBestPractices}}</li>
  <li>Because a token allows indefinite authentication to the associated user's account, we strongly recommend against creating tokens for individual Qumulo REST API users. For more information, see <a href="#best-practices-using-access-tokens">Best Practices for Using Access Tokens</a>.</li>
</ul>
{{site.data.alerts.end}}


## Prerequisites
<ul>
  <li>{{page.varPrereqWrite}}</li>
  <li>{{site.varPrereqRead}}</li>
</ul>

{{site.data.alerts.note}}
<ul>
  <li>These RBAC privileges grant administrative access to view, modify, create and delete keys for any user in the system.</li>
  <li>Qumulo Core access tokens can also use a <em>self service</em> permissions model that allows any system user to view, modify, create, or and delete their own access keys.</li>
</ul>
{{site.data.alerts.end}}

## Creating and Using Access Tokens {#creating-using-access-tokens}
This section explains how to create access tokens without or with an expiration time by using the `qq` CLI.

{{page.varPrereqWrite}}

### To create an Access Token for Yourself
Run the {% include qq.html command="auth_create_access_token" %} command with the <code>--self</code> flag. For example:

```bash
$ qq auth_create_access_token --self
```

<a id="json-bearer-token"></a>

The {% include qq.html command="auth_create_access_token" %} command returns a JSON response that contains the bearer token body and the access token ID, which you can use to manage the access token.

```json
{
  "bearer_token": "access-v1:abAcde...==",
  "id": "{{site.exampleAccessTokenID1}}"
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

### To Create an Access Token For a Specific User
Run the {% include qq.html command="auth_create_access_token" %} command and specify the user. For example:

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
  * `SID:{{site.everyoneGroupSID}}`

{{site.data.alerts.note}}
<ul>
  <li>Although you can create groups for users, you can't create access tokens for groups.</li>
  <li>{{page.varTokenQQcli}}</li>
</ul>
{{site.data.alerts.end}}

### To Create an Access Token with an Expiration Time {#create-token-expiration-time}
In Qumulo Core 5.3.2 (and higher), you can run the {% include qq.html command="auth_create_access_token" %} command and specify the expiration time. You can specify the expiration time in different formats. For example:

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
A Qumulo Core access token [returns a _bearer token_](#json-bearer-token), an item in the `Authorization` HTTP header which acts as the authentication mechanism for the Qumulo REST API.

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

## Listing Access Tokens
This section explains how to list access tokens for yourself, a specific user, or all users by using the `qq` CLI.

{{site.varPrereqRead}}

* To list access tokens for yourself, run the {% include qq.html command="auth_list_access_tokens" %} command with <code>--self</code> flag. For example:

  ```bash
  $ qq auth_list_access_tokens --self
  ```

* To list access tokens for a specific user, run the {% include qq.html command="auth_list_access_tokens" %} command and use the <code>--user</code> flag to specify a user. For example:

  ```bash
  $ qq auth_list_access_tokens --user jane
  ```

* To list access tokens for all users, run the {% include qq.html command="auth_list_access_tokens" %} command without any additional parameters. For example:

  ```bash
  $ qq auth_list_access_tokens
  ```

## Retrieving Metadata for Access Tokens
This section explains how to get metadata for a specific access token or all access tokens by using the `qq` CLI.

{{site.varPrereqRead}}

### To Retrieve Metadata for a Specific Access Token
Run the `auth_get_access_token` command and specify the access token ID. For example:

```bash
$ qq auth_get_access_token {{site.exampleAccessTokenID1}}
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
    "sid": "{{site.exampleSID1}}",
    "uid": null
  },
  "enabled": true,
  "expiration_time": "2023-01-01T00:00:00Z",
  "id": "{{site.exampleAccessTokenID1}}",
  "user": {
    "auth_id": "1002",
    "domain": "LOCAL",
    "gid": null,
    "name": "svc",
    "sid": "{{site.exampleSID2}}",
    "uid": null
  }
}
```

### To Retrieve Metadata for All Access Tokens
Run the `qq auth_list_access_tokens` command.

{{site.data.alerts.important}}
Listing access tokens <em>doesn't</em> return the bearer token required for authentication. {{site.varBearerTokenWarning}}
{{site.data.alerts.end}}

The `auth_list_access_tokens` command returns:

{{page.varTokenReturn}}

For example:

```
id                      user   creator  creation time
======================  =====  =======  ==============================
{{site.exampleAccessTokenID1}}  svc    admin    2022-10-27T15:18:09.725513764Z
{{site.exampleAccessTokenID2}}  svc    admin    2022-10-27T15:18:24.997572918Z

expiration time       enabled
====================  =======
                      True
2023-01-01T00:00:00Z  False
```

To filter the command's output by user, use the `--user` flag and use the same format for the name as for the {% include qq.html command="auth_create_access_token" %} command.


## Modifying the Expiration Time for an Access Token {#modifying-expiration-time-access-token}
This section explains how to modify access tokens by using the `qq` CLI.

{{page.varPrereqWrite}}

Run the `auth_modify_access_token` command and specify the access token ID and the expiration time. For example:

```bash
$ qq auth_modify_access_token 1234567890123456789012 --expiration-time 'Jan 01 2023'
```

{{page.varTokenExpiration}}

{{site.data.alerts.note}}
{{page.varExpirationUtcNote}}
{{site.data.alerts.end}}


## Disabling an Access Token {#disabling-access-token}
To help you check your system's security posture, Qumulo Core lets you disable an access token without deleting it. This is a good way to check for dependencies on the access token before you delete the token permanently. This section explains how to disable an access token by using the `qq` CLI.

{{page.varPrereqWrite}}

{% capture content_disable_token %}After you disable an access token, {{page.varBearerToken}}{% endcapture %}
{% include important.html content=content_disable_token %}

To disable an access token, run the {% include qq.html command="auth_modify_access_token" %} command, specify the access token ID, and use the `-d` flag. For example:

```bash
$ qq auth_modify_access_token 1234567890123456789012 -d
```

To enable an access token, run the {% include qq.html command="auth_modify_access_token" %} command, specify the access token ID, and use the `-e` flag. For example:

```bash
$ qq auth_modify_access_token 1234567890123456789012 -e
```


## Deleting Access Tokens
This section explains how to delete an access token by using the `qq` CLI.

{{page.varPrereqWrite}}

{% capture content_disable_token %}After you delete an access token, {{page.varBearerToken}}{% endcapture %}
{% include important.html content=content_disable_token %}

To delete an access token, run the {% include qq.html command="auth_delete_access_token" %} command and specify the access token ID. For example:

```bash
$ qq auth_delete_access_token 1234567890123456789012
```

## Best Practices for Using Qumulo Core Access Tokens {#best-practices-using-access-tokens}
This section lists the best practices for limiting the exposure to lost credentials and working with Qumulo Core access tokens securely.

### Avoiding Creation of Tokens for Administrative Accounts
{{page.varAccessTokenWarning}} {{page.varAccessTokenAdminWarning}}

### Generating Tokens for Service Accounts
When you connect external services to the Qumulo REST API, we recommend creating a service account with limited privileges for each individual service and generating an access token for each service account.

#### To Create a New Service Account

1. {{site.logIntoWebUI}}

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

1. To ensure that there is only one access token for each service account, run the {% include qq.html command="auth_list_access_tokens" %} command.

   If multiple access tokens exist, delete any unused access tokens.

1. To create a new access token for the service account, run the {% include qq.html command="auth_create_access_token" %} command.

1. In the credential store of your service, replace the old access token with the new one.

1. Test that your service account can access the Qumulo REST API.

1. Confirm that there is nothing else relying on the old access token by disabling it first. If this causes any disruptions then you can re-enable it while you resolve the issue.

1. To delete the old access token, run the {% include qq.html command="auth_delete_access_token" %} command.
