When you use the Qumulo REST API, you begin an authentication session by logging in to a Qumulo cluster. Different REST endpoints require different types of authentication: For example, certain REST API endpoints, such as `/v1/version`, don't require ay authentication, while the `/v1/session/login` API endpoint requires a username and a password.

Calling the login API gives you a _bearer token_ (or _access token_)&mdash;a temporary credential that Qumulo Core sends together with subsequent API calls as proof of authentication.

{% include note.html content="Only administrative users have access to all REST API endpoints." %}

## Acquiring a Bearer Token
To acquire a bearer token, you can use the Qumulo REST API or Qumulo Core Web UI.

### To Acquire a Bearer Token by Using the REST API
Begin an authentication session by calling the `/v1/session/login` REST API endpoint and specify the username and password. For example:

```bash
curl -k -X POST https://{{site.exampleIP0}}:8000/v1/session/login \
  -H "Content-Type: application/json" \
  -d '{ "username": "Alice", "password": "rbFAYMdtGrwTAV4TR0cZ"}'
```
   
{{site.exampleOutput}}

```
{ "bearer_token": "1:EXAMPLElSnp6MVZvUXhRQUViN2RCYUFVZy9zTElB..." }
```

### To Create a Bearer Token by Using the Qumulo Core Web UI
{% include note.html content="You must have `PRIVILEGE_ACCESS_TOKENS_WRITE` to perform " %}

1. Log in to Qumulo Core.

1. Click **APIs & Tools**.

1. Under **Interactive API documentation**, enter your username and password and click **Apply credentials**.

   The **Authentication succeeded.** message appears.

1. Expand the **Access Tokens** section and then the **POST /v1/auth/access-tokens/** section.

1. On the upper-right side, click **Try it out**, ensure that the **Request body** is correct, and then click **Execute**.

   {{site.exampleOutput}}

   PRIVILEGE_ACCESS_TOKENS_WRIT
