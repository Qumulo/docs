## To Configure LDAP by Using the Qumulo Core Web UI
1. {{site.logIntoWebUI}}.

1. Click **Cluster > LDAP**.

1. On the **LDAP Configuration** page, click **Edit** and then do the following:

   1. For **Use LDAP features**, click **Yes**.

   1. Enter the **LDAP URI**.

   1. For **Base DN**, enter the Distinguished Name (DN) from which the LDAP server searches for users.

   1. For **Bind Username**, enter the username for logging in to LDAP services.

      {% include note.html content="This username must have the permission to search within the provided DN." %}

   1. For **Bind Password**, enter the password that corresponds to the username.

   1. (Optional) For **Encrypt Connection**, click **Yes**.

      {{site.data.alerts.important}}
      <ul>
        <li>By default, Qumulo requires an encrypted connection to connect to LDAP (either LDAPS or StartTLS). If you disable the option to connect without TLS, you might expose credentials over your network.</li>
        <li>To use encrypted connections, you must <a href="../encryption-data-security/installing-signed-ssl-certificate.html">install a valid certificate for your LDAP server</a>.</li>
      </ul>
      {{site.data.alerts.end}}

   1. Click **Save**.
