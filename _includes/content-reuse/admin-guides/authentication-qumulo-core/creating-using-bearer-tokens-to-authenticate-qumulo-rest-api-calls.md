When you use the Qumulo Core REST API, you begin an authentication session by logging in to a Qumulo cluster. Different REST endpoints require different types of authentication: For example, certain REST API endpoints, such as `/v1/version`, don't require any authentication, while the `/v1/session/login` API endpoint requires a username and a password.

Calling the login API gives you a _bearer token_ (or _access token_)&mdash;a temporary credential that Qumulo Core sends together with subsequent API calls as proof of authentication. A bearer token is valid for 10 hours. After a bearer token expires, you must create a new bearer token.


## Creating a Bearer Token
To create a bearer token, you can use the Qumulo Core REST API or Qumulo Core Web UI.

{% include important.html content="Only administrative users (or users with `PRIVILEGE_ACCESS_TOKENS_WRITE`) can create bearer tokens." %}

### To Create a Bearer Token by Using the REST API
Begin an authentication session by calling the `/v1/session/login` REST API endpoint and specify the username and password. For example:

```bash
curl -k -X POST https://{{site.exampleIP0}}:8000/v1/session/login \
  -H "Content-Type: application/json" \
  -d '{ "username": "Alice", "password": "rbFAYMdtGrwTAV4TR0cZ"}'
```
   
{{site.exampleOutput}}

```json
{ "bearer_token": "1:EXAMPLElSnp6MVZvUXhRQUViN2RCYUFVZy9zTElB..." }
```

### To Create a Bearer Token by Using the Qumulo Core Web UI
1. {{site.logIntoWebUI}}

1. Click **APIs & Tools**.

1. Under **Interactive API documentation**, enter your username and password and click **Apply credentials**.

   The **Authentication succeeded.** message appears.

1. Expand the **Access Tokens** section and then the **POST /v1/auth/access-tokens/** section.

1. On the upper-right side, click **Try it out**, ensure that the **Request body** is correct, and then click **Execute**.

   {{site.exampleOutput}}

   ```
   { "bearer_token": "1:EXAMPLElSnp6MVZvUXhRQUViN2RCYUFVZy9zTElB..." }
   ```


## To Use a Bearer Token to Authenticate a Qumulo Core REST API Call
Place the bearer token in your request header. In the following example, the API call lists the nodes in a cluster.

```bash
curl -k -X GET https://{{site.exampleIP0}}:8000/v1/cluster/nodes/ \
  -H "Authorization: Bearer 1:EXAMPLElSnp6MVZvUXhRQUViN2RCYUFVZy9zTElB..."
```

{{site.exampleOutput}}

```json
{
  "id": 1,
  "node_status": "online",
  "node_name": "my-node-name",
  "uuid": "{{site.exampleUUID41}}",
  "label": "a1:23:45:6b:70:80",
  "model_number": "Q0626",
  "capacity_in_bytes": "25605032656896",
  "serial_number": "1234567890",
  "mac_address": "00:00:1a:00:23:bc"
},
...
```
