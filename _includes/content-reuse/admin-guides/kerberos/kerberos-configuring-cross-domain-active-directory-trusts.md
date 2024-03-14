_Trusts_ are relationships between different AD domains. For more information, see [Trust Technologies](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2003/cc759554(v=ws.10)?redirectedfrom=MSDN) in the Microsoft documentation.

NFSv4.1 with Kerberos and the general AD configuration in Qumulo Core support the same forms of trust relationships.

* Child or parent trusts can:
  * Authenticate as a user from the child domain against the parent domain's AD domain controller (DC).
  * Authenticate as a user from the parent domain against the child domain's AD DC.
* Transitive trusts can authenticate as a user from any of the domains in the transitive trust, against any of the other trusted domains' AD DC.


## Configuring the Base DN
For identity mapping to work, you must configure LDAP Base DNs correctly on your Qumulo cluster and on your client. This helps avoid `nobody` or `66534` identity responses that occur when you inspect files that contain trusted users (stored as identities) from other domains. For more information about configuring the Base DN, see [Using Active Directory for POSIX Attributes](https://care.qumulo.com/hc/en-us/articles/115008011927) on Qumulo Care.

The following example has trust between between `parent.example.com` and `child.example.com`. In order for both domains' identities to authenticate against a Qumulo cluster, you must configure the cluster and your client with the following Base DN.

```
CN=Users,DC=parent,DC=example,DC=com;CN=Users,DC=child,DC=parent,DC=example,DC=com
```

{% capture duplicateNumbers %}AD doesn't prevent duplicate UID or GID numbers from being added to {% include rfc.html rfc='2307' %} values. Such improper configuration can cause UID and GID collisions across trusted domains. On Linux, if any collisions occur, the system chooses the first UID or GID that it finds.{% endcapture %}
{% include note.html content=duplicateNumbers %}

## Enabling More Secure Trust Encryption Types
While Linux systems disallow deprecated encryption types for Kerberos, Windows prefers RC4 for cross-domain traffic (which Linux systems consider to be deprecated).

For certain trust configurations, you must enable a more secure encryption type for trusted traffic. To enable AES-128 (or SHA1) and AES-256 (or SHA1) for a particular trust, use the `ksetup` command in a Windows Administrator console. For example:

```bash
$ ksetup /getenctypeattr <domain>
$ ksetup /setenctypeattr <domain> RC4-HMAC-MD5 AES128-CTS-HMAC-SHA1-96 AES256-CTS-HMAC-SHA1-96
```

{% include note.html content="This example doesn't disable RC4. Instead, it enables new encryption types _in addition_ to RC4. When working with Windows systems, we recommend making additive changes whenever possible. We also recommend staging changes in a safe environment before applying them to a production environment." %}
