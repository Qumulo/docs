## To Join a Qumulo Cluster to Active Directory (AD) by Using the Qumulo Core Web UI
1. {{site.logIntoWebUI}}

1. Click **Cluster > Active Directory**.

1. On the **Active Directory** page, click **Edit** and then do the following:

   1. Enter the **Domain Name**.

   1. For **Domain Username**, enter the name of a user account or service account.

   1. Enter the **Domain Password**.

   1. If the NetBIOS name of your domain is different from your domain name, enter the **NetBIOS Domain Name**.

   1. (Optional) Enter the **Organizational Unit for Machine Account**.

   1. (Optional) For **Use Active Directory as your primary time server**, click **Yes**.

   1. If your AD deployment can **Use Active Directory for POSIX attributes** assigning Unix UID and GID attributes to user objects, click **Yes**.

      {% include tip.html content="Assigning Unix UID and GID attributes to user objects allows a Qumulo cluster to enforce permissions correctly regardless of the protocol that a client uses to access cluster data." %}

   1. To allow Qumulo Core to follow LDAP referrals to Parent Domains, Child Domains, or Domains in the same Forest, for **Search Trusted Domains**, click **Yes**.

   1. (Optional) For **Base DN (Distinguished Name) for User and Group Accounts**, enter the list of containers in the domain that Qumulo Core searches for POSIX attributes, S3 and REST API access keys, SSO access for the Qumulo Core Web UI, and accounts that use Kerberos with NFSv4.1. For example:

      ```
      OU=Staff;DC=ad;DC=example;DC=com
      ```

      {% include note.html content="This setting doesn't affect SMB authentication." %}

   1. Click **Join**.


## Configuring a Qumulo Cluster to Use Specific Domain Controllers (DCs)
You can configure your Qumulo cluster to use an allowlist of DCs for LDAP queries and Netlogon authentication by using the Qumulo REST API or the `qq` CLI.

### To Specify DCs When Joining a Domain
Run the {% include qq.html command="ad_join" %} command, specify the domain name, the username, and a comma-separated list of DCs. For example:

```bash
qq ad_join \
  --domain example.com \
  --username example_user \
  --domain-controllers dc1.example.com,dc2.example.com
```

{% capture eachDC %}The DCs that you specify must reside in the same domain that you cluster joins to.{% endcapture %}

{{site.data.alerts.note}}
<ul>
  <li>You can specify a maximum of 3 DCs.</li>
  <li>{{eachDC}}</li>
</ul>
{{site.data.alerts.end}}

### To Change DCs After Joining a Domain
Run the {% include qq.html command="ad_reconfigure" %} command and specify a comma-separated list of DCs. For example:

```bash
qq ad_reconfigure \
  --domain-controllers dc1.example.com,dc2.example.com
```

{% include note.html content=eachDC %}
