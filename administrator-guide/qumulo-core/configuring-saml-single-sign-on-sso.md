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

* <a name="identity-provider"></a>Ensure that your SAML Identity Provider (IdP) is linked to the same AD. An _identity provider_ (such as OneLogin, Okta, Duo, or an on-premises instance) is a system that authenticates users to a system (for instance, by using passwords).

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

   ```Bash
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

## Supported SAML SSO flows
IdP initiated SAML SSO, which works in the following way:
1. A user (presumably a cluster admin but it could be any user) goes to their SSO portal and authenticates there if needed.
1. The user locates and clicks on the application tile for the desired Qumulo cluster. Depending on the company's policy, additional verification may be required. For example, the SSO administrator can configure it so that a 2FA is always used to access certain clusters.
1. SSO portal redirects to the cluster. If the user has sufficient privileges, they will be logged in to WebUI. Otherwise an appropriate error message will appear.

SP initiated SAML SSO, which works in the following way:
1. A user opens the cluster's WebUI in a browser. If SAML is configured on the cluster, the login page will show the "Continue to SSO login" link leading to the configured SSO portal.
The authentication request uses the HTTP Redirect Binding. In other words, the login link will look like this `<idp-sso-url>?SAMLRequest=<very-long-string>`.
1. The user clicks the login link. The SSO portal will verify the user (potentially asking for any additional factors if required by the organization).
1. SSO portal redirects back to the cluster. This is now the same with the step 3 above in the IdP initiated login

If you access WebUI by physically connecting to a node, the login page will not show the SSO prompt even if it is configured.

In general, users need to be assigned the built-in Observers role to access WebUI. Members of the built-in Administrators role always have access to the WebUI.

## Known Issues and Limitations
- AD users can still use their passwords to login to WebUI and CLI. This will be improved in a future software release.
- SAML Single Logout is not supported. Use the Sign out action in WebUI.
- Automatic configuration from metadata XML is not supported. You have to specify each parameter in qq.
- Suggesting a username to the SSO service is not supported.
- Returning to the previous page in WebUI after re-authentication (e.g., after a timeout) is not supported.

## Troubleshooting
In many simple cases, if SAML authentication fails, the error message in the browser will show the exact reason, and the problem should be easy to resolve by setting the right configuration with the qq saml_modify_settings command.

Examples are:
- SAML is not actually enabled on the cluster.
- Clock skew between IdP and the cluster. Clock skew tolerance is dictated by the SSO service, 5 minutes is common.
- Incorrectly set `cluster-dns-name` or `idp-entity-id` on the cluster.
- User is not a member of the Observers role required to access WebUI.

In more complex cases the errors can be less informative (for security reasons). For example, if a wrong IdP certificate is configured on the cluster, the error will simply say "Signature validation failed. SAML Response rejected".

Several AD related reasons can lead to s “User not found” error:
- Cluster is not joined to AD at all.
- Cluster is joined to AD that is not connected to the IdP.
- IdP is sending usernames (NameID) in an unusual format.
  
  To verify that the username can be used, run `qq auth_find_identity --name <NameID>`.
- Configured BaseDN does not include all the users.
  
  To verify that the username is discoverable, run the following commands:
  - First, `qq auth_find_identity --name <NameID>` to find the SID;
  - Then `qq ad_sid_to_account --sid <SID>` to verify that it is discoverable.
If there is an error, contact your Active Directory administrator and ask for the right BaseDN.

While NFSv4.1 with Kerberos is unrelated topic, [this article](../kerberos/kerberos-prerequisites-joining-cluster-active-directory.md#specifying-the-base-distinguished-name-base-dn) has more information about Active Directory and BaseDN.
