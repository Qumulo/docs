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
          <li><a href="../s3-api/configuring-using-s3-api.html">S3 API</a></li>
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
      <td>Linux Configuration</td>
      <td>Qumulo Core is up to date with all Ubuntu 20.04 security updates.</td>
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
      <td>On-Premises Cluster Size</td>
      <td>265 nodes</td>
    </tr>
    <tr>
      <td>Cloud Cluster Size</td>
      <td>100 nodes</td>
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
      <td>16, when not using LDAP or Active Directory for {% include rfc.html rfc='2307' %} attributes</td>
    </tr>
    <tr>
      <td>Characters in Cluster Name</td>
      <td>2-15, alphanumeric and hyphen (<code>-</code>)</td>
    </tr>
    <tr>
      <td>Characters in Full Path (Path Name)</td>
      <td>32,760 (limited by protocol)</td>
    </tr>
    <tr>
      <td>Characters in File Path Component (File or Directory)</td>
      <td>255 (limited by protocol)</td>
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
      <td>Total Files</td>
      <td>18 quintillion</td>
    </tr>
    <tr>
      <td>Hard Links for Each File</td>
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
      <td><p>4.3 billion</p>{% include note.html content="This approximate value of 2<sup>32</sup> is equivalent to the possible maximum of directories or the entire inode space." %}</td>
    </tr>
    <tr>
      <td>S3 Bucket Object Versions</td>
      <td>Unlimited (4,294,967,296 theoretical)</td>
    </tr>    
    <tr>
      <td>Total Replication Relationships</td>
      <td>100 {% include note.html content="If a directory is more than 100 levels below the file system root directory, you can't use it as a replication source." %}</td>
    </tr>
{% if page.platform == 'on-prem' %}
    <tr>
      <td>Usable Provisioned Capacity on Cluster</td>
      <td>100%</td>
    </tr>
{% endif %}    
  </tbody>
</table>
