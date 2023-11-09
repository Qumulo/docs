During normal AD domain operations, a Qumulo cluster often encounters _LDAP referrals_ that indicate to the cluster in what other locations within an AD domain it might locate requested information. Often, these referrals are hints to other trusted AD domains which a cluster accesses through a Domain Trust, such as a Parent Domain Trust or an external Domain Trust.


## Reducing Latency by Disabling Search Trusted Domains
In Qumulo Core 6.1.0.3 (and lower), to permit Qumulo clusters to follow LDAP referrals, the **Search Trusted Domains** configuration option is enabled by default.

In Qumulo Core 6.1.1 (and higher), to reduce the potential latency of AD domain operations that might trigger and follow LDAP referrals unnecessarily (particularly for large, complex AD environments with multiple Domain Trusts), you can disable the **Search Trusted Domains** configuration option.

Disabling this option might benefit your system if you can determine that all relevant user and group accounts&mdash;which you might expect to use POSIX attributes, logins with SAML Single Sign-On (SSO), or logins with NFS4.1 and Kerberos&mdash;are located entirely in the current domain.


## Limitations of Disabling Search Trusted Domains
This section explains the limitations of disabling the **Search Trusted Domains** configuration option.

### Trusted Domains Specified in the Base DN
The **Base DN** (Distinguished Name) configuration option specifies the path that limits LDAP queries. When you set the Base DN to the top-level domain or base path of a domain, LDAP searches span the entire domain's LDAP structure, including LDAP referrals to other domains that have a Trust with the currently joined domain.

Often, the Base DN configuration ensures that the system searches all Organizational Units (OUs) in the domain, for example when the Administrator team might not have control over the OUs that contain the user accounts to be retrieved. (This is common in a dynamic environment that an external team manages.)

Qumulo Core lets you configure multiple Base DNs by providing their paths in a semicolon-separated list that includes the paths of other trusted domains. This configuration permits the trusted domains to use POSIX attributes and SAML SSO logins.

{% include important.html content="Disabling Search Trusted Domains disregards any trusted domains specified in the Base DN." %}


### Ignoring LDAP Referrals and Qumulo Core Authentication Processes
To decide whether your system should ignore LDAP referrals, consider the Qumulo Core authentication processes that this might affect.

#### Authentication Processes that Trigger LDAP Queries
* Identity mapping from NTFS to POSIX (SMB to NFS) by using the **Use Active Directory for POSIX attributes** AD configuration option
* [SAML single sign-on (SSO)](configuring-saml-single-sign-on-sso.html)
* [NFSv4.1 and Kerberos](../kerberos/kerberos-with-qumulo-core.html)
* [REST API access tokens](../external-services/using-access-tokens.html)
* [S3 access keys](../s3-api/creating-managing-s3-access-keys.html)

#### Unaffected Authentication Processes
* Kerberos SMB SSO logins from Domain Local or Trusted Domain users
* NTMLv2 SMB logins (username and password) from Domain Local or Trusted Domain users
* Domain Local groups that contain users and groups from other Trusted Domains
* Users or groups added to SMB share permissions by using the Qumulo Core Web UI or `qq` CLI
* Security Identifiers (SIDs) resolved to usernames by using client dialog boxes, for example in macOS Finder or Windows File Explorer
