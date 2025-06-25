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
          <li>FTPS</li>
          <li>NFSv3</li>
          <li><a href="../nfs/nfsv4.1-enabling-using.html">NFSv4.1</a></li>
          <li><a href="../s3-api/configuring-using-s3-api.html">S3 API</a> ({{site.supportAWScliShort}})</li>
          <li>SMB 2.002</li>
          <li>SMB 2.1</li>
          <li>SMB 3.0</li>
          <li>SMB 3.1</li>
          <li>SMB 3.1.1</li>
        </ul>
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
          <li>Linux Kernel 2.6.x (and higher)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>Linux configuration</td>
      <td>Qumulo Core is up to date with all Ubuntu 24.04 security updates.</td>
    </tr>
    <tr>
      <td>Domain functional level</td>
      <td>
        Microsoft Windows Server 2008 R2 (and higher)
        {% include note.html content="Qumulo Core doesn't support Samba Domain Controllers." %}
      </td>
    </tr>
    <tr>
      <td>Kerberos V5 encryption types</td>
      <td>
         <ul>
           <li>RC4-HMAC-MD5</li>
           <li>AES256-CTS-HMAC-SHA1</li>
           <li>AES128-CTS-HMAD-SHA1</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>LDAP servers</td>
      <td>OpenLDAP for Group Expansion</td>
    </tr>
    <tr>
      <td>Python version for <code>qq</code> CLI</td>
      <td>3.8 (and higher)</td>
    </tr>
  </tbody>
</table>

{% if page.platform == 'on-prem' %}
## Supported Switches

Qumulo Core requires switches that meet the following criteria:

* Enterprise-grade
* Fully non-blocking
* Managed
* Supports IPv6
{% endif %}

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
      <td>Cluster size</td>
{% if page.platform != 'anq' %}
      <td>265 nodes</td>
{% else %}
      <td>100 nodes</td>
{% endif %}
    </tr>
    <tr>
      <td>Hub portals or spoke portals for each node</td>
      <td>32 hub portals or 32 spoke portals (Qumulo Core 7.5.0.2 and higher)</td>
    </tr>
    <tr>
      <td>NFS exports</td>
      <td>64,000</td>
    </tr>
    <tr>
      <td>SMB shares</td>
      <td>40,000</td>
    </tr>
    <tr>
      <td>Access Control Entries (ACEs) in an Access Control List (ACL)</td>
      <td>200</td>
    </tr>
    <tr>
      <td>NFS groups</td>
      <td>16, when not using LDAP or Active Directory for {% include rfc.html rfc='2307' %} attributes</td>
    </tr>
    <tr>
      <td>Characters in a cluster name</td>
      <td>2-15, alphanumeric and hyphen (<code>-</code>)</td>
    </tr>
    <tr>
      <td>Characters in a full path (path name)</td>
      <td>32,760 (limited by protocol)</td>
    </tr>
    <tr>
      <td>Characters in a file path component (file or directory)</td>
      <td>255 (limited by protocol)</td>
    </tr>
    <tr>
      <td>Files in a directory</td>
      <td>4.3 billion</td>
    </tr>
    <tr>
      <td>File size</td>
      <td>9 exabytes</td>
    </tr>
    <tr>
      <td>Total files</td>
      <td>18 quintillion</td>
    </tr>
    <tr>
      <td>Hard links for each file</td>
      <td>1,024</td>
    </tr>
    <tr>
      <td>LDAP domains</td>
      <td>1</td>
    </tr>
    <tr>
      <td>Active Directory domains</td>
      <td>1</td>
    </tr>
    <tr>
      <td>DNS servers</td>
      <td>3</td>
    </tr>
    <tr>
      <td>Snapshots</td>
      <td>40,000</td>
    </tr>
    <tr>
      <td>Quotas</td>
      <td>
        4.3 billion
        {% include note.html content="This approximate value of 2<sup>32</sup> is equivalent to the possible maximum of directories or the entire inode space." %}
      </td>
    </tr>
    <tr>
      <td>S3 Bucket object versions</td>
      <td>Unlimited (4,294,967,296 theoretical)</td>
    </tr>
    <tr>
      <td>Total replication relationships</td>
      <td>
        100
        {% include note.html content="If a directory is more than 100 levels below the file system root directory, you can't use it as a replication source." %}
      </td>
    </tr>
{% if page.platform == 'on-prem' %}
    <tr>
      <td>Usable provisioned capacity on cluster</td>
      <td>100%</td>
    </tr>
{% endif %}   
    <tr>
      <td>NFS sockets</td>
      <td>
        8,000 TCP sockets for each node
        {% include note.html content="A client configured with the NFS <code>nconnect</code> mount option uses multiple sockets." %}
      </td>
    </tr>    
    <tr>
      <td>SMB sockets</td>
      <td>
        5,000 TCP sockets for each node
        {% include note.html content="A client configured with the SMB Multichannel feature uses multiple sockets." %}
      </td>
    </tr>
    <tr>
      <td>S3 API sockets</td>
      <td>
        8,000 TCP sockets for each node
        {% include note.html content="By default, a maximum of 5,000 connections can execute actively." %}
      </td>
    </tr>
    <tr>
      <td>REST API sockets</td>
      <td>1,000 TCP sockets for each node</td>
    </tr>     
  </tbody>
</table>
