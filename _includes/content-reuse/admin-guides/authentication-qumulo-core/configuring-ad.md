## Joining your Qumulo Cluster to Active Directory
1. {{site.logIntoWebUI}}.

1. Click **Cluster > Active Directory**.

1. Fill in the following fields:

   1. For **Domain Name**, enter the name of your domain. Example: ad.example.com

   1. For **Domain Username**, enter the user account or service account you will use to authenticate against the domain.

   1. For **Domain Password**, enter the password for the user account or service account.

   1. (Optional) For **NetBIOS Domain Name**, if your Domain’s NetBIOS name is different from your domain name then enter the Domain’s NetBIOS name.

   1. (Optional) For **Organizational Unit**, enter the OU where the cluster's machine account will be created. If unknown, leave it blank and Qumulo will attempt to join the domain without an OU specified.

   1. (Optional) For **Use Active Directory as your primary time server**, click **Yes**. This can also be configured in **Cluster > Date & Time**.

   1. For **Use Active Directory for POSIX attributes**, click **Yes** if 'user objects' in Active Directory are assigned UNIX UID and GID attributes in order to allow the cluster to properly enforce permissions regardless of the protocol used to access the data.

   1. For **Search Trusted Domains**, click **Yes** if you wish to allow Qumulo to follow LDAP referrals for Parent/Child Domains or Domains in the same Forest (Does not impact SMB authentication)

   1. (Optional) For **Base DN**, enter the list of containers in the domain that Qumulo will search for POSIX attributes, S3 and REST API access keys, SSO access to the Web UI, and accounts using Kerberos with NFSv4.1.

   1. Click **Join**.


## To configure your Qumulo Cluster to communicate with specific domain controllers
You can configure your Qumulo Cluster to use a whitelisted set of domain controllers to be used for LDAP queries and Netlogon authentication. This can only be done through the REST API or the `qq` CLI. This section explains how you can specify these domain controllers through `qq`.

### To specify domain controllers when joining a domain
Run the `qq ad_join` command and specify a comma-separated list of domain controllers. For example:

   ```bash
   qq ad_join                \
     --domain example.com    \
     --username example_user \
     --domain-controllers dc1.example.com,dc2.example.com 
   ```

`--domain-controllers` must be either a single fully qualified domain name (FQDN) or a comma-separated list of FQDNs. When multiple domain controllers are specified, the first in the list will be used for the join operation and will act as the primary domain controller your Qumulo Cluster communicates with. The remaining domain controllers will serve as backups, only to be used if the primary domain controller becomes unreachable. At most 3 domain controllers can be specified. Note that each specified domain controllers must reside in the same domain the cluster is joining to.

### To switch to a different set of domain controllers after you have joined a domain
Run the `qq ad_reconfigure` command and specify a comma-separated list of domain controllers. For example:

   ```bash
   qq ad_reconfigure --domain-controllers dc1.example.com,dc2.example.com 
   ```

Note that the specified domain controllers must reside in the same domain the cluster is joined to.
