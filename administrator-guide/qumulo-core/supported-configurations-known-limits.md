---
title: "Supported Configurations and Known Limits for Qumulo Core"
summary: "This section provides an overview of supported configurations and known limits for Qumulo Core."
permalink: /administrator-guide/qumulo-core/supported-configurations-known-limits.html
sidebar: administrator_guide_sidebar
keywords: limit, limits, limitations, known limits, known limitations, config, configuration, supported config, supported configuration
---

This section provides an overview of supported configurations and known limits for Qumulo Core.

## Supported Configurations

<table>
  <thead>
    <tr>
      <th>Configuration Type</th>
      <th>Supported Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Protocols</td>
      <td>
        <ul>
          <li>FTP</li>
          <li>NFSv3</li>
          <li>NFSv4.1</li>
          <li>SMB 2.002</li>
          <li>SMB 2.1</li>
          <li>SMB 3.0</li>
          <li>SMB 3.1</li>
        </ul>
        For more information, see <a href="../protocols/nfsv4.1-enabling-using.html">Enabling and Using NFSv4.1 on a Qumulo Cluster</a> and <a href="../protocols/nfsv4.1-acls.html">Managing File Access Permissions by Using NFSv4.1 Access Control Lists (ACLs)</a>.
      </td>
    </tr>
    <tr>
      <td>Browser</td>
      <td>Google Chrome 80 (and higher)</td>
    </tr>
    <tr>
      <td>Clients over SMB</td>
      <td>
        <ul>
          <li>macOS 10.14 (and higher)</li>
          <li>Windows 7 (and higher)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>Clients over NFS</td>
      <td>
        <ul>
          <li>macOS 10.14 (and higher)</li>
          <li>Linux Kernel 2.6.X (and higher)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>Linux Configuration</td>
      <td>Qumulo Core is up to date with all Ubuntu 18.04 security updates.</td>
    </tr>
    <tr>
      <td>Domain-Functional Level</td>
      <td>Microsoft Windows Server 2008 R2 (and higher) {% include note.html content="Qumulo Core doesn't support Samba Domain Controllers." %}</td>
    </tr>
    <tr>
      <td>Kerberos V5 Encryption Types</td>
      <td>
         <ul>
           <li>RC4-HMAC-MD5</li>
           <li>AES256-CTS-HMAC-SHA1</li>
           <li>AES128-CTS-HMAD-SHA1</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>LDAP Servers</td>
      <td>OpenLDAP for Group Expansion</td>
    </tr>
    <tr>
      <td>Python Version for <code>qq</code> CLI</td>
      <td>3.8 (and higher)</td>
    </tr>
  </tbody>
</table>

## Known Limits

<table>
  <thead>
    <tr>
      <th>Limit Type</th>
      <th>Maximum Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>On-Premises Cluster Size</td>
      <td>275 nodes</td>
    </tr>
    <tr>
      <td>Cloud Cluster Size</td>
      <td>100 nodes</td>
    </tr>
    <tr>
      <td>Floating IP Addresses per Node</td>
      <td>10</td>
    </tr>
    <tr>
      <td>NFS Exports</td>
      <td>64,000</td>
    </tr>
    <tr>
      <td>SMB Shares</td>
      <td>40,000</td>
    </tr>
    <tr>
      <td>Access Control Entries (ACEs) in an Access Control List (ACL)</td>
      <td>200</td>
    </tr>
    <tr>
      <td>NFS Groups</td>
      <td>16 without <a href="https://www.rfc-editor.org/rfc/rfc2307.html">RFC 2307</a> with Kerberos</td>
    </tr>
    <tr>
      <td>Combined Users and Groups</td>
      <td>4 billion</td>
    </tr>
    <tr>
      <td>Characters in Cluster Name</td>
      <td>2-15, alphanumeric and hyphen (<code>-</code>)</td>
    </tr>
    <tr>
      <td>Characters in Full Path (Path Name)</td>
      <td>32,760 (protocol-limited)</td>
    </tr>
    <tr>
      <td>Characters in File Path Component (File or Directory)</td>
      <td>255</td>
    </tr>
    <tr>
      <td>Files in a Directory</td>
      <td>4.3 billion</td>
    </tr>
    <tr>
      <td>File Size</td>
      <td>9 exabytes</td>
    </tr>
    <tr>
      <td>Number of Files</td>
      <td>18 quintillion</td>
    </tr>
    <tr>
      <td>Hard Links per File</td>
      <td>1,024</td>
    </tr>
    <tr>
      <td>LDAP Domains</td>
      <td>1</td>
    </tr>
    <tr>
      <td>Active Directory Domains</td>
      <td>1</td>
    </tr>
    <tr>
      <td>DNS Servers</td>
      <td>3</td>
    </tr>
    <tr>
      <td>Snapshots</td>
      <td>40,000</td>
    </tr>
    <tr>
      <td>Quotas</td>
      <td>Not specified</td>
    </tr>
    <tr>
      <td>Number of Replication Relationships</td>
      <td>100 {% include note.html content="If a directory is more than 100 levels below the file system root directory, you can't use it as a replication source." %}</td>
    </tr>
  </tbody>
</table>
