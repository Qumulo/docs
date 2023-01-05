---
title: "How NFSv4.1 Works with Kerberos in Qumulo Core"
summary: "This section provides an overview of how NFSv4.1 works with Kerberos in Qumulo Core."
permalink: /administrator-guide/kerberos/kerberos-with-qumulo-core.html
redirect_from:
  - /nfsv4.1-kerberos.html
  - /administrator-guide/protocols/nfsv4.1-kerberos.html
sidebar: administrator_guide_sidebar
keywords: NFS, NFS4.1, NFSv4.1, Kerberos, Active Directory, AD, domain, krb5
---

{% include in_page_toc.html %}

Kerberos is a network authentication protocol that works by using a three-way trust between a key distribution center (KDC), a service server (for example, NFSv4.1 on Qumulo Core), and a client system (for example, a Linux system). This section of the Qumulo Administrator Guide explains how to configure and use the three entities involved in the trust and provides troubleshooting directions. For more information, see [Kerberos](https://en.wikipedia.org/wiki/Kerberos_(protocol)) on Wikipedia and the [MIT Kerberos documentation](https://web.mit.edu/kerberos/krb5-latest/doc/).

Active Directory (AD) simplifies Kerberos requirements by providing [a globally unique security identifier for every user and group (SID)](https://docs.microsoft.com/en-us/windows/security/identity-protection/access-control/security-identifiers) and a KDC implementation with a [ticket-granting service (TGS)](https://docs.microsoft.com/en-us/windows/win32/secauthn/ticket-granting-service-exchange) and an [authentication service (AS)](https://docs.microsoft.com/en-us/windows/win32/secauthn/authentication-service-exchange).

## Configuring Kerberos for Qumulo Core
Qumulo Core 5.1.5 (and higher) supports Kerberos for authenticating AD users over NFSv4.1. The following is an overview of the Kerberos configuration process following the configuration of your AD domain.

1. Join your Qumulo cluster to your AD domain.
1. Join Linux systems to your AD domain.
1. Log in to a Linux system and mount the Qumulo cluster by using the `-o sec=krb5` mount option.

## Known Kerberos Limitations for Qumulo Core
Qumulo Core supports only the following features:

* NFSv4.1

* Linux clients

* AES-128 and AES-256 encryption algorithms&mdash;for more information, see [Network security: Configure encryption types allowed for Kerberos](https://docs.microsoft.com/en-us/windows/security/threat-protection/security-policy-settings/network-security-configure-encryption-types-allowed-for-kerberos) in the Microsoft documentation

* Microsoft Windows Active Directory (Windows Server 2008 and higher)
