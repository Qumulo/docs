---
title: "Configuring SAML Single Sign-On (SSO) for Your Qumulo Cluster"
summary: "This section explains how to configure SAML Single Sign-On (SSO) for your Qumulo cluster."
permalink: /administrator-guide/qumulo-core/configuring-saml-single-sign-on-sso.html
sidebar: administrator_guide_sidebar
keywords: SAML, SAML 2.0, authentication, single sign-on, SSO
---

This section explains how to integrate your Qumulo cluster with your organization's single sign-on (SSO) service by configuring Security Assertion Markup Language (SAML) 2.0 for Qumulo Core 5.2.5 (and higher).

For more information about the SAML standard for exchanging authentication information, see [SAML 2.0](https://en.wikipedia.org/wiki/SAML_2.0).

## Prerequisites
Before you begin, make sure that you have done the following.

* Join your cluster to an Active Directory (AD) domain. For more information, see [Join Your Qumulo Cluster to Active Directory](https://care.qumulo.com/hc/en-us/articles/115007276068) on Qumulo Care.

  {% include note.html content="Qumulo Core supports SAML authentication only for AD users." %}

* To allow the cluster to find group memberships for SAML-authenticated users, configure the Base DN in your AD configuration, even if you don't use POSIX attributes.

* <a name="identity-provider"></a>Ensure that your SAML Identity Provider (IdP) is linked to the same AD. An _identity provider_ (such as OneLogin, Okta, Duo, or an on-premises instance) is a system that authenticates users to a system (for example, by using passwords).

  <a name="service-provider"></a>Typically, an IT department manages an IdP centrally and the IdP is linked with AD. Before you can enable SSO, your IT department must register a new Service Provider (SP) in your IdP. A _service provider_ is the server which users access, in this case a Qumulo cluster.

  {% include note.html content="You can use trusts, as long as the Base DN covers all users that might require access to your cluster." %}
  
* Configure your IdP to return AD User Principal Names (UPNs, for example `alice@example.com`) or an email address as a NameID. A _NameID_ is an identifier for an authenticated user. Typically, a NameID uses the format of an email address.


## To Configure SAML SSO for Your Qumulo Cluster
This process requires coordination between the cluster administrator and SSO administrator.

1. The cluster administrator contacts the SSO administrator and asks the SSO administrator to create a SAML integration for the Qumulo cluster.

1. The SSO administrator creates a SAML integration with your organization's SSO [identity provider](#identity-provider) (IdP) and uses the cluster's fully qualified domain name (FQDN) format for the [service provider](#service-provider) (SP) endpoint (also known as the _assertion consumer service URL_), in the following format:

   ```
   https://my-cluster.my-org.com/saml
   ```
   
   {% include note.html content="Because the user's browser performs DNS resolution (for example, in a VPN-only scenario), it isn't necessary for an external DNS server to be able to resolve the cluster's FQDN." %}

1. If prompted, the SSO administrator specifies the HTTP POST binding for the SP endpoint. Typically, this binding is specified by default.

1. After creating the SAML integration, the SSO administrator provides the following information to the cluster administrator.

   * The certificate (public key) of the identity provider, in a `.pem` file.
   
     This certificate lets the cluster verify the authenticity of the messages from the IdP.
   
   * The IdP SSO URL&mdash;to which the Qumulo cluster can send authentication requests&mdash;in the following format:

     ```
     https://my-org.sso-provider.com/foo
     ```
     
   * The IdP issuer or EntityID. For example:

     ```
     http://www.sso-provider.com/abc12de34fgAB5CDh6i7
     ```
   
   * The FQDN of the cluster, in the following format:

     ```
     qumulo-cluster.my-org.com
     ```

1. To configure and enable SAML login to the Qumulo cluster, the cluster administrator runs the `qq saml_modify_settings` command. For example:

   ```bash
   qq saml_modify_settings --enable \
     --idp-certificate-file ~/certificate.pem \
     --cluster-dns-name qumulo-cluster.my-org.com \
     --idp-entity-id http://www.sso-provider.com/abc12de34fgAB5CDh6i7 \
     --idp-sso-url https://my-org.sso-provider.com/abc12de34fgAB5CDh6i7/saml \
   ```
   
   {{site.data.alerts.note}}
   <ul>
     <li>To view the current SAML configuration, the cluster administrator can use the <code>qq saml_get_settings</code> command.</li>
     <li>To allow specific changes (for instance, correct a typo, update a DNS name or an expired certificate, or temporarily disable SAML SSO without losing any of the other settings), the <code>qq saml_modify_settings</code> command permits changing individual SAML settings independently.</li>
     <li>For first-time SAML configurations, you must provide all settings.</li>
     <li>Aside from a basic check of the IdP certificate, Qumulo Core doesn't verify the configuration parameters. It is the cluster administrator's responsibility to ensure that IdP-initiated SAML logins work correctly. (These logins initate when the user clicks <strong>Continue to SSO login</strong> in the Web UI or selects the Qumulo cluster on the SSO portal.)</li>
   </ul>
   {{site.data.alerts.end}}
   

## Supported SAML SSO Workflows
Qumulo Core supports two SAML SSO workflows: [IdP](#identity-provider)-initiated and [SP](#service-provider)-initiated.

{{site.data.alerts.note}}
<ul>
  <li>Members of the built-in Administrators role always have access to the Web UI.</li>
  <li>To allow other users to access the Web UI, you must assign the built-in Observers role to the users.</li>
  <li>Depending on policy, additional verification might be necessary for users. For example, the SSO administrator can enforce mandatory two-factor authentication (2FA) for certain clusters.</li>
  <li>If the user accesses the Web UI by connecting to a node physically, the login page doesn't show doesn't show <strong>Continue to SSO login</strong> on the Web UI login page, even if SSO is configured.</li>
</ul>
{{site.data.alerts.end}}

### IdP-Initiated SSO Worfklow
1. A user authenticates to her organization's SSO portal and then selects the Qumulo cluster on the SSO portal.
   
1. The SSO portal redirects the user to the cluster's endpoint.

   If the user has sufficient privileges, the Web UI logs the user in. Otherwise, the Web UI displays an error message.

### SP-Initiated SSO Workflow
1. A user navigates to the Qumulo cluster's Web UI endpoint in a browser.

1. If the Qumulo cluster has SAML SSO configured, the user can click **Continue to SSO login** on the Web UI login page.

   The Web UI redirects the user to the configured SSO portal. Because the authentication request uses HTTP-Redirect Binding, the login link appears as follows:
   
   ```
   https://my-org.sso-provider.com/abc12de34fgAB5CDh6i7/saml?SAMLRequest=abcdefgh1234567890...
   ```
   
1. The user clicks the login link and the SSO portal authenticates the user.

1. The SSO portal redirects the user to the cluster's endpoint.

### SSO for qq CLI
Starting with 5.3.0, customers can authenticate a `qq` CLI session with SSO. This works as below:

1. A user invokes `qq [--host <cluster-address>] sso_login` in a terminal and receives a login URL in the form of `https://qumulo-cluster.my-org.com/saml-login?login-id=12345678-1234-1234-1234-123456789012`. `qq` will pause awaiting authenticaion. The user will have 5 minutes to complete the next step.

1. The user opens the provided URL in the browser. The URL redirects the user to the configured SSO portal. When authentication is complete, the browser shows a message that asks the user to return to the terminal. Otherwise, the browser displays an appropriate error message.

1. The paused `qq sso_login` recognizes the completed authentication and prints the username for confirmation. The user can now continue with using `qq` commands normally.

In case of any errors, the user needs to start over by running `qq sso_login` again.

## Requiring SSO for management access

**Warning**: If you turn require-sso on, you will lose the ability to do `qq login` with your AD account password. Use `qq sso_login` instead as described above. Also make sure you know the local admin user’s password for emergency access.

Starting with 5.3.0 you can require Active Directory users to use SSO to manage the cluster by turning on the following setting.
```
qq saml_modify_settigs --require-sso {true|false}
```

If set, the cluster will reject password-based authentication from AD users in WebUIthe , qq CLI, and REST API. This setting does not restrict access over file protocols such as SMB. Keep in mind that FTP is inherently insecure as it sends passwords in plaintext. Many FTP clients either do not support TLS at all or silently fallback to the plaintext protocol. Qumulo clusters have FTP disabled by default.


## Known Issues and Limitations
* Local users (built-in `admin` user and any additionally created users) can always use their passwords to authenticate to the Web UI and the `qq` CLI.

  We recommend setting a strong password for the built-in `admin` user and save it only for emergencies.
* Qumulo Core doesn't support:
  * **SAML Single Logout (SLO):** We recommend clicking **Sign out** in the Web UI.
  * **Automatic Configuration from Metadata XML:** You must specify each parameter by using the `qq` CLI.
  * **Returning to Previous Web UI Page:** You can't return to a previous page after re-authenticating (for example, after a timeout).


## Troubleshooting SAML SSO Authentication
This section explains troubleshooting common and uncommon SAML SSO authentication issues.

### Common Issues
Typically, if SAML authentication fails, Qumulo Core's in-browser error message explains the reasons for failure and you can resolve the issue by setting the right configuration by using the `qq saml_modify_settings` command. Examples of this issue type include the following scenarios:

* SAML isn't enabled on the Qumulo cluster.

* There is clock skew between the IdP and the Qumulo cluster (the SSO service sets the clock skew tolerance, typically to 5 minutes).

* The `cluster-dns-name` or `idp-entity-id` on the Qumulo cluster aren't configured correctly.

* A user isn't a member of the Observers role that Qumulo Core requires for granting access to the Web UI.

### Uncommon Issues
In more complex cases, the in-browser errors are less informative for security reasons. For example, if you configure an incorrect IdP certificate on your cluster, the **Signature validation failed. SAML Response rejected.** error appears.

Several AD configuration issues can cause a **User not found** error:

* The Qumulo cluster isn't joined to AD.

* The Qumulo cluster is joined to AD that isn't connected to the IdP.

* IdP sends usernames (NameID) in an unusual format.

  To verify that you can use a username, run the `qq auth_find_identity` command. For example:

  ```bash
  qq auth_find_identity --name MyUsername
  ```

* The Configured Base DN doesn't include all users.

  To find a security identifier (SID), run the `qq auth_find_identity` command. For example:
  
  ```bash
  qq auth_find_identity --name MyUsername
  ```
  
  To verify that a username is discoverable, run the `qq ad_sid_to_account` command. For example:

  ```bash
  qq ad_sid_to_account --sid S-1-5-32-544
  ```
  
  If an error occurs, contact your AD administrator and request the correct Base DN. For more information, see [Specifying the Base Distinguished Name (Base DN)](../kerberos/kerberos-prerequisites-joining-cluster-active-directory.md#specifying-the-base-distinguished-name-base-dn).
