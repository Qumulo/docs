## Prerequisites
* Administrative access to your organization's Nexus account

* A subdomain for your organization

## Step 1: Perform Initial Single Sign-On (SSO) Configuration in Qumulo Nexus {#initial-sso-configuration}
{% if page.persona contains 'sysadmin' %}Before you can configure{% else %}Before you ask a system administrator to configure{% endif %} the identity provider (IdP), you must perform the initial SSO configuration in Qumulo Nexus.

### To Perform Initial SSO Configuration in Nexus

1. {{site.nexus.logIn}}

1. {{site.nexus.sso.orgSet}}

1. {{site.nexus.sso.confSSO}}

1. On the **Configure SAML SSO page**, enter a **Nexus login subdomain** and then click **Save & Continue**.

   The {{site.nexus.entityID}} and {{site.nexus.acsURL}} are displayed. For example:

   > **https://mysubdomain.nexus.qumulo.com**
   > **https://mysubdomain.nexus.qumulo.com/api/v1/auth/saml/acs/**

   {% capture sysadmin %}and provide them to the system administrator who manages your organization's IdP{% endcapture %}
   {% capture stradmin %}for the next step{% endcapture %}
   {{site.data.alerts.note}}
   <ul>
    <li>Record these values {% if page.persona contains 'sysadmin' %}{{sysadmin}}{% else %}{{stradmin}}{% endif %}.</li>
    <li>If the subdomain that you want to use is unavailable, choose another subdomain or {{site.contactQumuloCare}}.</li>
   </ul>
   {{site.data.alerts.end}}
