When you use the Qumulo Core REST API, you begin an authentication session by logging in to a Qumulo cluster. Different REST endpoints require different types of authentication: For example, certain REST API endpoints, such as `/v1/version`, don't require ay authentication, while the `/v1/session/login` API endpoint requires a username and a password. Calling the login API gives you a _bearer token_&mdash;a temporary credential that Qumulo Core sends together with subsequent API calls as proof of authentication.

{% include note.html content=""Only administrative users have access to all REST API endpoints. %}

## Creating a Bearer Token by Using the Qumulo Core REST API

1. Begin an authentication session by calling the `/v1/session/login` REST API endpoint and specify the username and password. For example:

   ```bash
   curl -k -X POST https://{{site.exampleIP0}}:8000/v1/session/login \
     -H "Content-Type: application/json" \
     -d '{"username":"myusername", "password":"mypassword"}'
   ```
   
   {{site.exampleOutput}}

   ```
   { "bearer_token": "1:ATwAAABlSnp6MVZvUXhRQUViN2RCYUFVZy9zTElB..." }
   ```
