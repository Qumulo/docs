## Supported Configurations

### Protocols

<div class="three-columns" markdown="1">

* FTP

* FTPS

* NFSv3

* NFSv4.1

* S3 API (`aws` CLI)

* SMB 2.002

* SMB 2.1

* SMB 3.0

* SMB 3.1

* SMB 3.1.1

</div>

### Clients and Environments

* **Clients over SMB**

  * macOS 10.14 (and higher)

  * Windows 7 (and higher)

* **Clients over NFS**

  * macOS 10.14 (and higher)

  * Linux Kernel 2.6.x (and higher)

* **Qumulo Core Web UI:** Google Chrome 80 (and higher)

* **`qq` CLI:** Python 3.8 (and higher)

### Authentication and Directory Services

* **Domain Functional Level:** Microsoft Windows Server 2008 R2 (and higher)

  {% include note.html content="Qumulo Core doesn't support Samba Domain Controllers." %}

* **LDAP Servers:** OpenLDAP for Group Expansion

### Encryption in Transit

* **Kerberos V5 Encryption:**

  * AES128-CTS-HMAC-SHA1

  * AES256-CTS-HMAC-SHA1

  * RC4-HMAC-MD5

### Host System Security

Qumulo Core is up to date with all Ubuntu 24.04 security updates


{% if page.platform == 'on-prem' %}
## Supported Switches

Qumulo Core requires switches that meet the following criteria:

* Enterprise-grade

* Fully non-blocking

* Managed

* Supports IPv6
{% endif %}


## Known Maximum Limits

### Authentication
* **Active Directory Domains:** 1

* **LDAP Domains:** 1

### Authorization
**Access Control Entries (ACEs) in an Access Control List (ACL):** 200

### Cluster
{% if page.platform != 'anq' %}
* **Cluster size:** 265 nodes
{% endif %}

* **Characters in a cluster name:** 2-15, alphanumeric and hyphen (`-`)

{% if page.platform == 'on-prem' %}
* **Usable provisioned capacity:** 100%
{% endif %}

### File System
* **Characters in a file path component (file or directory):** 255

  {% include note.html content="Limited by protocol" %}

* **Characters in a full path (path name):** 32,760

  {% include note.html content="Limited by protocol" %}

* **Hard links for each file:** 1,024

* **File size:** 9 exabytes

* **Number of files in a directory:** 4.3 billion

* **Total number of files:** 18 quintillion

* **Replication relationships:** 100

  {% include note.html content="If a directory is more than 100 levels below the file system root directory, it isn't possible to use it as a replication source." %}

* **Snapshots:** 40,000

* **Quotas:** 4.3 billion

  {% include note.html content="This approximate value of 2<sup>32</sup> is equivalent to the possible maximum of directories or the entire inode space." %}

* **S3 Bucket object versions:** Unlimited

  {% include note.html content="Theoretically, 4,294,967,296" %}

### File System Protocols

#### REST API
**TCP Sockets for each node:** 1,000

#### NFS
* **Exports:** 64,000
 
* **Groups:** 16

  {% capture ifNotLDAP %}When not using LDAP or Active Directory for {% include rfc.html rfc='2307' %} attributes{% endcapture %}
  {% include note.html content=ifNotLDAP %}

* **NFSv4.1 connections for each node:** 1,000

* **TCP sockets for each node:** 8,000
    
  {% include note.html content="A client configured by using the NFS `nconnect` mount option uses multiple sockets." %}

#### SMB

* **Shares:** 40,000

* **TCP sockets for each node:** 5,000
    
  {% include note.html content="A client configured with the SMB Multichannel feature uses multiple sockets." %}

#### S3 API
* **TCP sockets for each node:** 8,000

  {% include note.html content="By default, a maximum of 5,000 connections can execute actively." %}

### Cloud Data Fabric (CDF)
* **Portals for each node in a cluster:**

  * **Qumulo Core 7.5.2 (and higher):** 32 hub portals _and_ 32 spoke portals

  * **Qumulo Core 7.5.0.1 to 7.5.1.2:** 32 hub portals _or_ 32 spoke portals

* **Portal root directories for each cluster:** 32 spoke portal root directories for each portal relationship
