Kerberos is a network authentication protocol that works by using a three-way trust between a key distribution center (KDC), a service server (for example, NFSv4.1 on Qumulo Core), and a client system (for example, a Linux system). This section explains how to configure and use the three entities involved in the trust and provides troubleshooting directions. For more information, see [Kerberos](https://en.wikipedia.org/wiki/Kerberos_(protocol)) on Wikipedia and the [MIT Kerberos documentation](https://web.mit.edu/kerberos/krb5-latest/doc/).

Active Directory (AD) simplifies Kerberos requirements by providing [a globally unique security identifier for every user and group (SID)](https://docs.microsoft.com/en-us/windows/security/identity-protection/access-control/security-identifiers) and a KDC implementation with a [ticket-granting service (TGS)](https://docs.microsoft.com/en-us/windows/win32/secauthn/ticket-granting-service-exchange) and an [authentication service (AS)](https://docs.microsoft.com/en-us/windows/win32/secauthn/authentication-service-exchange).

## Choosing a Kerberos Security Flavor
Qumulo Core supports three _flavors_ of Kerberos security that NFSv4.1 clients can use by specifying the following mount options:
* `sec=krb5`: Provides user authentication only.
* `sec=krb5i`: Provides authentication and message integrity by performing message signing for protection against man-in-the-middle attacks and message tampering.
* `sec=krb5bp`: Provides privacy by encrypting all traffic between the client and server. This is the most secure mount option.

## Configuring Kerberos for Qumulo Core
Qumulo Core 5.1.5 (and higher) supports Kerberos for authenticating AD users over NFSv4.1. The following is an overview of the Kerberos configuration process following the configuration of your AD domain.

1. Join your Qumulo cluster to your AD domain.
1. Join Linux systems to your AD domain.
1. Log in to a Linux system and mount the Qumulo cluster by using one of the [available mount options](#choosing-a-kerberos-security-flavor).

## Known Kerberos Limitations for Qumulo Core
Qumulo Core supports only the following features:

* NFSv4.1

* Linux clients

* AES-128 and AES-256 encryption algorithms&mdash;for more information, see [Network security: Configure encryption types allowed for Kerberos](https://docs.microsoft.com/en-us/windows/security/threat-protection/security-policy-settings/network-security-configure-encryption-types-allowed-for-kerberos) in the Microsoft documentation

* Microsoft Windows Active Directory (Windows Server 2008 and higher)
