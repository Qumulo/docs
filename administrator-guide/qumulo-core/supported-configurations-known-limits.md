---
title: "Supported Configurations and Known Limits for Qumulo Core"
summary: "This section provides an overview of supported configurations and known limits for Qumulo Core."
permalink: /administrator-guide/qumulo-core/supported-configurations-known-limits.html
sidebar: administrator_guide_sidebar
keywords: limit, limits, limitations, known limits, known limitations, config, configuration, supported config, supported configuration
---

This section provides an overview of supported configurations and known limits for Qumulo Core.

## Supported Configurations
Qumulo Core supports the following protocols, browsers, clients over SMB and NFS, domain-functional level, and Kerberos V5 encryption types.

### Protocols
* FTP
* NFSv3
* NFSv4.1
* SMB 2.002
* SMB 2.1
* SMB 3.0
* SMB 3.1

For more information, see [Enabling and Using NFSv4.1 on a Qumulo Cluster](../protocols/nfsv4.1-enabling-using.md) and [Managing File Access Permissions by Using NFSv4.1 Access Control Lists (ACLs)](../protocols/nfsv4.1-acls.md).

### Browser
Google Chrome 80 (and higher)

### Clients over SMB
* macOS 10.14 (and higher)
* Windows 7 (and higher)

### Clients over NFS
* macOS 10.14 (and higher)
* Linux Kernel 2.6.X (and higher)

### Linux Configuration
Qumulo Core is up to date with all Ubuntu 18.04 security updates.

### Domain-Functional Level
Microsoft Windows Server 2008 R2 (and higher)
{% include note.html content="Qumulo Core doesn't support Samba Domain Controllers." %}

### Kerberos V5 Encryption Types
* RC4-HMAC-MD5
* AES256-CTS-HMAC-SHA1
* AES128-CTS-HMAD-SHA1
