<a id="configure-identity-provider"></a>
{% if page.persona contains 'sysadmin' %}
## Step 2: Configure an Identity Provider (IdP) for Qumulo Nexus
After you perform the initial SSO configuration in Nexus, you must configure your IdP.

{% include tip.html content="If you work together with a storage administrator who manages your organization's Nexus account, she provides you with the SP Entity ID and ACS URL." %}

### To Configure Your IdP for Nexus

1. Log in to your IdP's console.

1. In the application or service configuration section, take the following steps:

   1. Add Qumulo Nexus as a service provider by using the SP Entity ID and ACS URL from your Nexus account.

      {% include note.html content="If your IdP is joined to Active Directory (AD), configure the IdP to send the User Principal Name (UPN) as the primary name identifier. This lets the Qumulo cluster use the information provided by the IdP to identify an authenticated user and any remote management actions that she performs on the cluster." %}

   1. Map the IdP attributes for user email, first name, and last name to the `email`, `firstName`, and `lastName` Nexus attributes.

For more information specific to your SAML IdP, see the following documentation:

* **Auth0:** [Customize SAML Assertions](https://auth0.com/docs/authenticate/protocols/saml/saml-configuration/customize-saml-assertions) in the Authenticate documentation

* **Microsoft Entra/Azure Active Directory:** [Customize SAML token claims](https://learn.microsoft.com/en-us/entra/identity-platform/saml-claims-customization) in the Microsoft Entra documentation

  {% include note.html content="Because Qumulo Nexus SSO integration requires specifying attributes without a namespace, make sure you clear the **Namespace** field when you specify an attribute in Microsoft Entra." %}

* **Google Workspace:** [Set up your own custom SAML app](https://support.google.com/a/answer/6087519) in the Google Workspace Admin Help documentation

* **Okta:** [Define attribute statements](https://help.okta.com/en-us/content/topics/apps/define-attribute-statements.htm) in the Okta Identity Engine documentation

* **Ping Identity:** [Editing an application - SAML](https://docs.pingidentity.com/pingone/applications/p1_edit_application_saml.html) in the PingOne documentation

{% include tip.html content="If you work together with a storage administrator who manages your organization's Nexus account, provide her with the IdP Metadata URL." %}
{% else %}
## Step 2: Ask a System Administrator to Configure an Identity Provider (IdP) for Qumulo Nexus 
After you perform the initial SSO configuration in Nexus, you must ask a system administrator in your organization to configure the IdP and then provide you with the IdP Metadata URL.

1. Provide your system administrator with the {{site.nexus.entityID}} and {{site.nexus.acsURL}}.

1. Ask the system administrator to [perform the necessary configuration](../authentication/enabling-sso-with-idp-system-administrator-workflow.html#configure-identity-provider).

1. Receive the IdP Metadata URL from your system administrator. For example:

   > **https://my-organization.idp-provider.com/app/abcd12e345fgHIJKLm678/sso/saml/metadata**

   {% include note.html content="The format of the IdP Metadata URL depends on your organization's IdP provider." %}
{% endif %}
