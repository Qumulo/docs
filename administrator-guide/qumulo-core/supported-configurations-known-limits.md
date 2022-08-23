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


## Known Limits
The following are the maximum known limits for Qumulo Core.

<table>
  <thead>
    <tr>
      <th>Limit Type</th>
      <th>Maximum Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Number of Replication Relationships</td>
      <td>100 {% include note.html content="Qumulo Core doesn't support Samba Domain Controllers." %}</a> section.</td>
    </tr>
  </tbody>
</table>

| Limit Type | Maximum Value   |
|------------|---|
| On-Premises Cluster Size  | 100 nodes |
| Cloud Cluster Size | 100 nodes |
| Floating IP Addresses per Node | 10 IP addresses |
| NFS Exports | 64,000 |
| SMB Shares | 40,000 |
| Access Control Entries (ACEs) in an Access Control List (ACL) | 200 |
| NFS Groups | 16 without RFC 2307 with Kerberos |
| Combined Users and Groups | 4 billion |
| Characters in Cluster Name | 2-15, alphanumeric and dash (`-`) |
| Characters in Full Path (Path Name) | 32,760 (protocol-limited) |
| Characters in File Path Component (File or Directory) | 255 |
| Files in a Directory | 4.3 billion |
| File Size | 9 exabytes |
| Number of Files | 18 quintillion |
| Number of Hard Links per File | 1,024 |
| Total LDAP Domains | 1 |
| Supported LDAP Servers | OpenLDAP for group expansion |
| Total Active Directory Domains | 1 |
| Total DNS Servers | Up to 3 |
| Snapshots | 40,000 |
| Quotas | Not specified |
| Number of Replication Relationships | 100 {% include note.html content="Qumulo Core doesn't support Samba Domain Controllers." %} |
