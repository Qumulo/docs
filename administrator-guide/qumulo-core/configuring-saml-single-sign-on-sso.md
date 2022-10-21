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

* To allow SAML-authenticated users to find group memberships, configure the Base DN in your AD configuration, even if you don't use POSIX attributes.

* <a name="identity-provider"></a>Ensure that your SAML Identity Provider (IdP) is linked to the same AD. An _identity provider_ (such as OneLogin, Okta, Duo, or an on-premises instance) is a system that authenticates users to a system (for example, by using passwords).

  <a name="service-provider"></a>Typically, an IT department manages an IdP centrally and the IdP is linked with AD. Before you can enable SSO, your IT department must register a new Service Provider (SP) in your IdP. A _service provider_ is the server which users access, in this case a Qumulo cluster.

  {% include note.html content="You can use trusts, as long as the Base DN covers all users that might require access to your cluster." %}
  
* Configure your IdP to return AD User Principal Names (UPNs, for example `alice@example.com`) or an email address as a NameID. A _NameID_ is an identifier for an authenticated user. Typically, a NameID uses the email format.


## To Configure SAML SSO for Your Qumulo Cluster
Configuring SAML SSO for your Qumulo Cluster requires coordination between the cluster administrator and your organization's SSO administrator.

1. The cluster administrator contacts the SSO administrator and asks the SSO administrator to create a SAML integration for the Qumulo cluster.

1. The SSO administrator creates a SAML integration with your organization's SSO [identity provider](#identity-provider) (IdP) and uses the cluster's fully qualified domain name (FQDN) format for the [service provider](#service-provider) (SP) endpoint (also known as the _assertion consumer service URL_), in the following format:

   ```
   https://my-cluster.my-org.com/saml
   ```
   
   {% include note.html content="Because the user's browser performs DNS resolution (for example, in a VPN-only scenario), it isn't necessary for an external DNS server to be able to resolve the cluster's FQDN." %}

1. If prompted, the SSO administrator specifies an HTTP POST binding for the SP endpoint. Typically, the default binding is sufficient.

1. After creating the SAML integration, the SSO administrator provides the following information to the cluster administrator.

   * The certificate (public key) of the identity provider, in a `.pem` file.
   
     This certificate lets you verify the authenticity of the messages from the IdP.
   
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
     <li>To allow specific changes (for instance, correct a typo, update a DNS name or an expired certificate, or temporarily disable SAML SSO without losing any of the other settings), the <code>qq saml_modify_settings</code> command permits changing individual SAML settings independently.</li>
     <li>To let the cluster validate the authentication messages from the IdP and make sure that the IdP issued them to the cluster, first-time SAML configurations require providing all configuration settings.</li>
     <li>Aside from a basic check of the IdP certificate, Qumulo Core doesn't verify the configuration parameters. It is the cluster administrator's responsibility to ensure that IdP-initiated SAML logins work correctly. (These logins initate when the user clicks <strong>Continue to SSO login</strong> in the Web UI.)</li>
   </ul>
   {{site.data.alerts.end}}

1. (Optional) To view the current SAML configuration, the cluster administrator can use the `qq saml_get_settings` command.


## Supported SAML SSO Workflows
Qumulo Core supports two SAML SSO workflows: [IdP](#identity-provider)-initiated and [SP](#service-provider)-initiated.

{{site.data.alerts.note}}
<ul>
  <li>Members of the built-in Administrators role always have access to the Web UI.</li>
  <li>To allow other users to access the Web UI, you must assign the built-in Observers role to the users.</li>
  <li>Depending on policy, additional verification might be necessary for users. For example, the SSO administrator can enforce mandatory two-factor authentication (2FA) for certain clusters.</li>
  <li>If the user accesses the Web UI by connecting to a node physically, the login page doesn't show doesn't show **Continue to SSO login** on the Web UI login page, even if SSO is configured.</li>
</ul>
{{site.data.alerts.end}}

### IdP-Initiated SSO Worfklow
1. A user authenticates to her organization's SSO portal and then selects the Qumulo cluster in the portal.
   
1. The SSO portal redirects to the cluster's endpoint.

   If the user has sufficient privileges, the Web UI logs her in. Otherwise, the Web UI displays an error message.

### SP-Initiated SSO Workflow
1. A user navigates to the Qumulo cluster's Web UI endpoint in a browser.

1. If the Qumulo cluster has SAML SSO configured, the user can click **Continue to SSO login** on the Web UI login page.

   The Web UI redirects the user to the configured SSO portal. Because the authentication request uses HTTP-Redirect Binding, the login link appears. For example:
   
   ```
   https://my-org.sso-provider.com/abc12de34fgAB5CDh6i7/saml?SAMLRequest=abcdefgh1234567890...
   ```
   
1. The user clicks the login link and the SSO portal authenticates the users.

1. The SSO portal redirects to the cluster's endpoint.


## Known Issues and Limitations
* Currently, AD users can still use their passwords to authenticate to the Web UI and the `qq` CLI.
* Qumulo Core doesn't support:
  * **SAML Single Logout (SLO):** We recommend clicking **Sign out** in the Web UI.
  * **Automatic Configuration from Metadata XML:** You must specify each parameter by using the `qq` CLI.
  * **Returning to Previous Web UI Page:** You can't return to a previous page after re-authenticating (for example, after a timeout).
  * **Suggesting Usernames to the SSO Service**


## Troubleshooting SAML SSO Authentication
This section explains troubleshooting common and uncommon SAML SSO authentication issues.

### Common Issues
Typically, if SAML authentication fails, Qumulo Core's in-browser error message explains the reasons for failure and you can resolve the issue by setting the right configuration by using the `qq saml_modify_settings` command. Examples of this issue type include the followingscenarios:

* SAML isn't enabled on the Qumulo cluster.

* There is clock skew between the IdP and the Qumulo cluster (the SSO service sets the clock skew tolerance, typically to 5 minutes).

* The `cluster-dns-name` or `idp-entity-id` on the Qumulo cluster aren't configured correctly.

* A user isn't a member of the Observers role that Qumulo Core requires for granting access to the Web UI.

### Uncommon Issues
In more complex cases the in-browser errors are somewhat less informative, for security reasons. For example, if you configure an incorrect IdP certificate on your cluster, the **Signature validation failed. SAML Response rejected.** error appears.

Several AD configuration issues can cause a **User not found** error:

* The Qumulo cluster isn't joined to AD.

* The Qumulo cluster is joing to AD that isn't connected to the IdP.

* IdP sends usernames (NameID) in an unusual format.

  To verify that you can use a username, run the `qq auth_find_identity` command. For example:

  ```bash
  qq auth_find_identity --name MyUsername
  ```

* The Configured Base DN doesn't include all users.

  1. To find the security identifier (SID), run the `qq auth_find_identity` command. For example:
  
  ```bash
  qq auth_find_identity --name MyUsername
  ```
  
  1. To verify that the username is discoverable, run the `qq ad_sid_to_account` command. For example:

  ```bash
  qq ad_sid_to_account --sid S-1-5-32-544
  ```
  
  If an error occurs, contact your AD administrator and request the correct Base DN. For more information, see [Specifying the Base Distinguished Name (Base DN)](../kerberos/kerberos-prerequisites-joining-cluster-active-directory.md#specifying-the-base-distinguished-name-base-dn).
