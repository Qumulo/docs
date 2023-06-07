---
title: "Configuring the Search Trusted Domains Option in Active Directory for a Qumulo Cluster"
summary: "This section explains how to fine-tune the behavior of your Qumulo cluster joined to an Active Directory (AD) domain by restricting the scope of LDAP queries with the Search Trusted Domains configuration option."
permalink: /administrator-guide/authentication-qumulo-core/configuring-search-trusted-domains-active-directory.html
sidebar: administrator_guide_sidebar
keywords: authentication, search_trusted_domains, trusted_domains, active_directory, ad, ldap
---

During normal AD domain operations, a Qumulo cluster often encounters _LDAP referrals_ that indicate to the cluster in what alternative locations within an AD domain it might locate the requested information. Often, these referrals are hints to other trusted AD domains that a cluster accesses through a Domain Trust, such as a Parent Domain Trust or an external Domain Trust.

In Qumulo Core 6.1.0 (and lower), to permit Qumulo clusters to follow LDAP referrals, the *Search Trusted Domains* configuration option is enabled by default.


## Reducing Latency by Disabling Search Trusted Domains
In Qumulo Core 6.1.1 (and higher), to reduce the potential latency of AD domain operations that might trigger and follow LDAP referrals unnecessarily (particularly for large, complex AD environments with multiple DOmain Trusts), you can disable the *Search Trusted Domains* configuration option.

Disabling the Search Trusted Domains configuration option might benefit your system if can determine that all relevant user and group accounts&mdash;that you might expect to use POSIX attributes, logings with SAML Single Sign-On (SSO), or logins with NFS4.1 and Kerberos&mdash;are located entirely in the current domain.


## The Base DN Path and LDAP Queries
The Base DN (Distinguished Name) configuration option specifies the path that limits LDAP queries. When you set the Base DN to the top-level domain (TLD) or bae path of a domain, LDAP searches span the entire domain LDAP structure, inclding LDAP referrals to alternative domains that have a Trust with the currently joined domain.

Often, the Base DN configuration ensures that the system searches all Organizational Units (OUs) in the domain, for example when the Administrator team might not have control over the OUs that contains the user accounts to be retrieved. (This is common in a dynamic environment that an external team manages.)

Qumulo Core lets you configure multiple Base DNs by providing their paths in a semicolon-separated list that includes the paths of other trusted domains, which allows them to use POSIX attributes and SAML SSO logins.

{% include important.html content="Disabling Search Trusted Domains disregards any trusted tomains that you add to the Base DN in Qumulo Core." %}


## Ignoring LDAP Referrals and Qumulo Core Operations
To decide whether to ignore LDAP referrals, consider the Qumulo Core operations that might be affected.

### Operations that Trigger LDAP Queries
* Identity mapping from NTFS to POSIX (SMB to NFS) by using the *Use Active Directory for POSIX attributes* AD configuration option
* [SAML SSO Integration](configuring-saml-single-sign-on-sso.html)
* [Authentication with NFSv4.1 and Kerberos](../kerberos/)
* [REST API access tokens](../external-services/using-access-tokens.html)
* [S3 access keys](../s3-api/creating-managing-s3-access-keys.html)

### Operations Unaffected by Search Trusted Domains Configuration
* Kerberos SMB SSO logins from Domain Local or Trusted Domain users
* NTMLv2 SMB logins (with username and password) from Domain Local or Trusted Domain users.
* Use of Domain Local groups that contain users and groups from other Trusted Domains
* Adding users or groups to SMB share permissions by using the Qumulo Core Web UI or `qq` CLI
* Resolving Security Identifiers (SIDs) to usernames by using client dialog boxes, for example in macOS Finder or Windows File Explorer
