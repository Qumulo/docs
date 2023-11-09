---
title: "Using Qumulo Core Access Tokens"
summary: "This section explains how to create and use access tokens&mdash;by using the Qumulo REST API, Python SDK, and <code>qq</code> CLI&mdash;to authenticate external services to Qumulo Core."
permalink: /azure-administrator-guide/external-services/using-access-tokens.html
keywords: auth, authentication, access_token, bearer_token, token
sidebar: azure_guide_sidebar
varAccessTokenWarning: An attacker can use an access token to authenticate as the token's user to Qumulo Core REST API (through HTTP, the Python SDK, or the <code>qq</code> CLI) and gain all of the user's privileges.
varAccessTokenBestPractices: Treat access tokens, and the bearer tokens they generate, like passwords. Store your tokens securely, rotate your tokens often, and create a token revocation policy for your organization.
varAccessTokenAdminWarning: To decrease the risk of giving an attacker full administrative access&mdash;including access to cluster data&mdash;avoid generating tokens for accounts with administrative privileges.
varExpirationUtcNote: The <code>--expiration-time</code> flag interprets arguments as timestamps in the UTC time zone.
varTokenQQcli: To use an access token in the <code>qq</code> CLI, you must use the <code>--file</code> flag&mdash;to specify a path for saving your credentials file in a format that the <code>qq</code> CLI can use&mdash;when you create the access token.
varPrereqWrite: <code>PRIVILEGE_ACCESS_TOKEN_WRITE</code> is required for creating, disabling, and deleting access tokens for all users in the system.
varPrereqRead: <code>PRIVILEGE_ACCESS_TOKEN_READ</code> is required for listing access tokens.
varTokenExpiration: When an access token's expiration time elapses, it isn't possible to use the token for authentication. Any attempt to use the token results in an authentication error. To continue the authentication process, you must either [create a new access token](#creating-using-access-tokens) or [update the expiration time for your existing token](#modifying-expiration-time-access-token).
varTokenReturn: <ul><li>The access token ID</li><li>The user that the access token represents</li><li>The access token's creator</li><li>The access token's creation time</li><li>The access token's expiration time</li><li>Whether the access token is enabled</li></ul>
varBearerToken: you can no longer use any bearer tokens associated with the access token to authenticate to Qumulo Core.
---

{% include content-reuse/admin-guides/external-services/using-access-tokens.md %}