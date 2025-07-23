<a id="final-sso-configuration"></a>
## Step 3: Perform Final Single Sign-On (SSO) Configuration in Qumulo Nexus
{% capture fromAdmin %}provided by your system administrator{% endcapture %}
{% if page.persona contains 'sysadmin' %}After you configure{% else %}After your system administrator configures{% endif %} the identity provider (IdP), you must perform the final SSO configuration in Qumulo Nexus by using the IdP Metadata URL {% if page.persona contains 'sysadmin' %}{{fromAdmin}}{% endif %}.

1. {{site.nexus.logIn}}

1. {{site.nexus.sso.orgSet}}

1. {{site.nexus.sso.confSSO}}

1. On the **Configure SAML SSO**, enter the the **IdP Metadata URL** {% if page.persona contains 'sysadmin' %}{{fromAdmin}}{% endif %} and then click **Complete Configuration**.

   **SAML SSO - Enabled** is displayed.

## Next Steps
After you perform the final SSO configuration, you can click **Users** and then add users to your Nexus account. Every user that you add has SSO enabled by default.
