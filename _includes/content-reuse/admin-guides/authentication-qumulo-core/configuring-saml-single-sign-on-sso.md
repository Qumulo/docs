For more information about the SAML standard for exchanging authentication information, see [SAML 2.0](https://en.wikipedia.org/wiki/SAML_2.0).

## Prerequisites
Before you begin, make sure that you have done the following.

* To join your cluster to an Active Directory (AD) domain, log in to the Qumulo Core Web UI and click **Cluster > Active Directory**.

  {% include note.html content="Qumulo Core supports SAML authentication only for AD users." %}

* To allow the cluster to find group memberships for SAML-authenticated users, configure the Base DN in your AD configuration, even if you don't use POSIX attributes.

* <a id="identity-provider"></a>

  Ensure that your SAML Identity Provider (IdP) is linked to the same AD. An _identity provider_ (such as Azure AD, Duo, or Okta) is a system that authenticates users (for example, by using passwords and additional factors).

  <a id="service-provider"></a>

  Typically, an IT department manages an IdP centrally and the IdP is linked with AD. Before you can enable SSO, your IT department must register a new Service Provider (SP) in your IdP. A _service provider_ is the server which users access, in this case a Qumulo cluster.

  {% include note.html content="You can use trusts, as long as the Base DN covers all users that might require access to your cluster." %}
  
* Configure your IdP to return AD User Principal Names (UPNs, for example `alice@example.com`) or an email address as a name identifier for an authenticated user. Typically, a `nameID` uses the format of an email address.


## To Configure SAML SSO for Your Qumulo Cluster
This process requires coordination between the cluster administrator and SSO administrator.

1. The cluster administrator contacts the SSO administrator and asks the SSO administrator to create a SAML integration for the Qumulo cluster.

1. The SSO administrator creates a SAML integration with your organization's SSO [identity provider](#identity-provider) (IdP).

   1. The SSO administrator uses the cluster's fully qualified domain name (FQDN) format for the [service provider](#service-provider) (SP) endpoint (also known as the _assertion consumer service URL_), in the following format:

      ```
      https://<my-cluster>.<my-org>.com/saml
      ```
   
      {% include note.html content="Because the user's browser performs DNS resolution (for example, in a VPN-only scenario), it isn't necessary for an external DNS server to be able to resolve the cluster's FQDN." %}

   1. If prompted, the SSO administrator enters the HTTP POST binding for the SP endpoint. Typically, this binding is specified by default.

   1. If prompted for **SP Entity ID** (alternatively named **Application Identifier** or **Audience**), the SSO administrator enters `https://<my-cluster>.<my-org>.com/saml`.

   1. If **SAML Signing**  (depending on the SSO service, this option is named differently) configuration is available, the SSO administrator sets it to **Sign SAML response and assertion**.
   
      {% include note.html content="Qumulo Core requires that the IdP sign both the assertion and the entire SAML response." %}

   1. To configure the IdP to use an algorithm based on SHA-256 (certain SSO providers use older algorithms, such as SHA-1, by default), follow the instructions in your SSO provider's documentation.
  
      {% include tip.html content="Commonly, a `signatureAlgorithm` key is set to `rsa-sha256` and the `digestAlgorithm` key is set to `sha256` in the configuration file." %}

1. After creating the SAML integration, the SSO administrator provides the following information to the cluster administrator.

   * The certificate (public key) of the identity provider, in a `.pem` file.
   
     This certificate lets the cluster verify the authenticity of the messages from the IdP.
   
   * The IdP SSO URL&mdash;to which the Qumulo cluster can send authentication requests&mdash;in the following format:

     ```
     https://<my-org>.<sso-provider>.com/foo
     ```

     {% include note.html content="The IdP SSO URL often contains a unique identifier for the SAML integration. We don't recommend using the same identifier on several clusters simultaneously." %}
     
   * The IdP issuer or `EntityId`.

     {% include note.html content="Don't confuse `EntityId` with SP Entity ID." %}

     For example:

     ```
     http://www.<sso-provider>.com/abc12de34fgAB5CDh6i7
     ```
    
   * The FQDN of the cluster, in the following format:

     ```
     <qumulo-cluster>.<my-org>.com
     ```

1. To configure and enable SAML login to the Qumulo cluster, the cluster administrator runs the {% include qq.html command="saml_modify_settings" %} command. For example:

   ```bash
   qq saml_modify_settings
     --enable \
     --idp-certificate-file ~/certificate.pem \
     --cluster-dns-name <qumulo-cluster>.<my-org>.com \
     --idp-entity-id http://www.<sso-provider>.com/abc12de34fgAB5CDh6i7 \
     --idp-sso-url https://<my-org>.<sso-provider>.com/abc12de34fgAB5CDh6i7/saml
   ```
   
   {{site.data.alerts.note}}
   <ul>
     <li>To view the current SAML configuration, the cluster administrator can run the {% include qq.html command="saml_get_settings" %} command.</li>
     <li>To allow specific changes (for example, correct a typo, update a DNS name or an expired certificate, or temporarily disable SAML SSO without losing any of the other settings), the cluster administrator can run the {% include qq.html command="saml_modify_settings" %} command to change individual SAML settings independently.</li>
     <li>For first-time SAML configurations, the cluster administrator must provide all of the required settings.</li>
     <li>Aside from a basic check of the IdP certificate, Qumulo Core doesn't verify the configuration parameters. It is the cluster administrator's responsibility to ensure that IdP-initiated SAML login works correctly. (This login type initiates when the user clicks <strong>Continue to SSO login</strong> in the Qumulo Core Web UI or selects the Qumulo cluster on the SSO portal.)</li>
   </ul>
   {{site.data.alerts.end}}
   

## Supported SAML SSO Workflows
Qumulo Core supports three SAML SSO workflows:

* Standard SAML workflows that the [IdP](#identity-provider) or [SP](#service-provider) initiates
* A workflow that the `qq` CLI initiates

{{site.data.alerts.note}}
<ul>
  <li>Members of the built-in Administrators role always have access to the Qumulo Core Web UI.</li>
  <li>To allow other users to access the Qumulo Core Web UI, you must assign the built-in Observers role to individual users or to groups.</li>
  <li>Depending on policy, additional verification might be necessary for users. For example, the SSO administrator can enforce mandatory two-factor authentication (2FA) for certain clusters.</li>
  <li>If the user accesses the Qumulo Core Web UI by connecting to a node physically, the login page doesn't show doesn't show <strong>Continue to SSO login</strong> on the Qumulo Core Web UI login page, even if SSO is configured.</li>
</ul>
{{site.data.alerts.end}}

### IdP-Initiated SSO Workflow
1. A user authenticates to her organization's SSO portal and then selects the Qumulo cluster on the SSO portal.
   
1. The SSO portal redirects the user to the cluster's endpoint.

   If the user has sufficient privileges, the Qumulo Core Web UI logs the user in. Otherwise, the Qumulo Core Web UI displays an error message.

<a id="sp-inititated-sso-workflow"></a>
### SP-Initiated SSO Workflow
1. A user navigates to the Qumulo cluster's Web UI endpoint in a browser.

1. If the Qumulo cluster has SAML SSO configured, the user can click **Continue to SSO login** on the Qumulo Core Web UI login page.

   the Qumulo Core Web UI redirects the user to the configured SSO portal. Because the authentication request uses HTTP-Redirect Binding, the login URL appears.
   
   ```
   https://<my-org>.<sso-provider>.com/abc12de34fgAB5CDh6i7/saml?SAMLRequest=abcdefgh1234567890...
   ```
   
1. The user clicks the login link and the SSO portal authenticates the user.

1. The SSO portal redirects the user to the cluster's endpoint.

<a id="sso-login"></a>
### qq-CLI-Initiated SSO Workflow
In Qumulo Core 5.3.0 (and higher), a user can authenticate a `qq` CLI session by using SSO.

1. A user uses the {% include qq.html command="sso_login" %} command. For example:

   ```bash
   qq --host {{site.exampleIP0}} sso_login
   ```
   
   The login URL and a prompt appear. The following is an example URL.
   
   ```
   https://<my-cluster>.<my-org>.com/saml-login?login-id=12345678-1234-1234-1234-123456789012
   ```
   
   {% include note.html content="The user must complete the following step within 5 minutes, while the `qq` CLI pauses for authentication." %}
   
1. When the user opens the login URL in a browser, the URL redirects the user to a configured SSO portal and one of the following two scenarios takes place:

   * If authentication succeeds, the browser shows a message that contains an eight-character verification code and asks the user to return to the CLI session.

     The user copies the verification code and enters it into the waiting prompt of the `sso_login` command.
     
     * If the verification code is correct, the command recognizes that authentication is complete and shows the authenticated username.

     * If the verification code is incorrect, the user must retry the workflow.
   
   * If authentication doesn't succeed, the browser displays an error message.

     The user must retry the workflow.


## Requiring SSO Authentication for Cluster Management
{{site.data.alerts.important}}
<ul>
  <li>If you use the <code>--require-sso</code> flag, you can no longer run the {% include qq.html command="login" %} command with your AD account password. Instead, you must run the {% include qq.html command="sso_login" %} command</a>.</li>
  <li>This setting doesn't restrict access through file protocols such as SMB.</li>
  <li>Because the FTP protocol sends passwords in plaintext, it is inherently insecure. In addition, many FTP clients don't support Transport Layer Security (TLS) or fall back quietly to the plaintext protocol. For this reason, all Qumulo clusters have FTP disabled by default.</li>
</ul>
{{site.data.alerts.end}}

In Qumulo Core 5.3.0 (and higher), you can run the {% include qq.html command="saml_modify_settings" %} command to require AD users to use SSO authentication for managing your cluster. For example:

```bash
qq saml_modify_settings --require-sso true
```

When the cluster requires SSO authentication, your cluster rejects password-based authentication from AD users in the Qumulo Core Web UI, REST API, and `qq` CLI.


## Known Issues and Limitations
* Local users (the built-in `admin` user and any additional users) can always use their passwords to authenticate to the Qumulo Core Web UI and the `qq` CLI.

  {% include important.html content="We recommend setting a strong password for the built-in `admin` user and using this account only for emergencies." %} 

* If SSO is required for a Qumulo cluster, it isn't possible to log in to the **Interactive API documentation** section of the **APIs & Tools** page in the Qumulo Core Web UI.

* Qumulo Core doesn't support:
  * **SAML Single Logout (SLO):** We recommend clicking **Sign out** in the Qumulo Core Web UI.
  * **Automatic Configuration from Metadata XML:** You must specify each parameter by using the `qq` CLI.
  * **Returning to Previous Web UI Page:** You can't return to a previous page after re-authenticating (for example, after a timeout).
  * **Azure AD SAML Toolkit:** Currently, due to a configuration deficiency in the toolkit, IdP-initiated SSO isn't operational for Qumulo as a Service. Use the [SP-initiated SSO workflow](#sp-inititated-sso-workflow).


## Troubleshooting SAML SSO Authentication
This section explains troubleshooting common and uncommon SAML SSO authentication issues.

### Common Issues
Typically, if SAML authentication fails, Qumulo Core's in-browser error message explains the reasons for failure and you can resolve the issue by setting the right configuration by using the {% include qq.html command="saml_modify_settings" %} command. Examples of this issue type include the following scenarios:

* SAML isn't enabled on the Qumulo cluster.

* There is clock skew between the IdP and the Qumulo cluster (the SSO service sets the clock skew tolerance, typically to 5 minutes).

* The `cluster-dns-name` or `idp-entity-id` on the Qumulo cluster aren't configured correctly.

* A user isn't a member of the Observers role that Qumulo Core requires for granting access to the Qumulo Core Web UI.

### Uncommon Issues
In more complex cases, the in-browser errors are less informative for security reasons. For example, if you configure an incorrect IdP certificate on your cluster, the **Signature validation failed. SAML Response rejected.** error appears.

Several AD configuration issues can cause a **User not found** error:

* The Qumulo cluster isn't joined to AD.

* The Qumulo cluster is joined to AD that isn't connected to the IdP.

* IdP sends usernames (`nameID`) in an unusual format.

  To verify that you can use a username, run the {% include qq.html command="auth_find_identity" %} command. For example:

  ```bash
  qq auth_find_identity --name MyUsername
  ```

* The Configured Base DN doesn't include all users.

  To find a security identifier (SID), run the {% include qq.html command="auth_find_identity" %} command. For example:
  
  ```bash
  qq auth_find_identity --name MyUsername
  ```
  
  To verify that a username is discoverable, run the {% include qq.html command="ad_sid_to_account" %} command. For example:

  ```bash
  qq ad_sid_to_account --sid S-1-5-32-544
  ```
  
  If an error occurs, contact your AD administrator and request the correct Base DN. For more information, see [Specifying the Base Distinguished Name (Base DN)](../kerberos/kerberos-prerequisites-joining-cluster-active-directory.html#specifying-the-base-distinguished-name-base-dn).
