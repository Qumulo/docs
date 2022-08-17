---
title: "Configuring a Linux Client for NFSv4.1 with Kerberos"
summary: "This section describes how to configure a Linux client for using NFSv4.1 with Kerberos."
permalink: /administrator-guide/kerberos/kerberos-configuring-linux-client.html
sidebar: administrator_guide_sidebar
keywords: NFS, NFS4.1, NFSv.4.1, Kerberos, Linux, Linux client, configure, configuration, krb5, krb5.conf, samba, net ads join, smb.conf, sssd, sssd.conf, imapd, imapd.conf, idmapd, idmapd.conf, nfsidmap, nfsidmap.conf, kinit, autofs, machine account, ntp
varConfig: Configure the `sssd` and `idmapd` tools manually. For more information, see [Mapping External Identities to Linux Identities](#mapping-external-identities-to-linux-identities).
varGSSDflag: The `use-machine-creds` flag specifies whether authentication uses machine credentials when `sudo mount` is invoked for NFSv4.1 with Kerberos.
varMountKRB5: Mount your cluster by using the `krb5` security mechanism. For example&#58;
varLimitedUsefulness: Both machine account authentication and <code>kinit</code> have limited usefulness because they limit the mount point to a single authenticated user. Between the two authentication options, <code>kinit</code> has an advantage because of the way it handles ID mapping.
---

This section describes how to configure a Linux client for using NFSv4.1 with Kerberos.

{% include note.html content="Qumulo Core supports only Linux for using NFSv4.1 with Kerberos." %}

Linux systems implement Kerberos support as a series of loosely related packages and configuration files. For this reason, configuration depends on the Linux distribution and version. This section refers to tools, packages, d&aelig;mons, configuration files, and other elements in Ubuntu 18.04 LTS.


## Joining a Linux Client to a Domain
There are two common ways of joining a Linux client to an Active Directory (AD) domain automatically, by using `samba` or `realmd`. Both methods require creating the [/etc/krb5.conf configuration file](https://web.mit.edu/kerberos/krb5-1.12/doc/admin/conf_files/krb5_conf.html) and defining a default domain and the relationships between domains and realms.

### Configuring the /etc/krb5.conf File
The following is an example configuration for joining a domain.

```
[libdefaults]
    default_realm = MY-DOMAIN.EXAMPLE.COM

[realms]
    MY-DOMAIN.EXAMPLE.COM = {
        kdc = my-domain.example.com:88
        admin_server = my-domain.example.com:749
    }

[domain_realm]
    my-domain.example.com = MY-DOMAIN.EXAMPLE.COM
    .my-domain.exmaple.com = MY-DOMAIN.EXAMPLE.COM
```

### To Join a Linux Client to a Domain by using samba
[samba](https://www.samba.org/samba/docs/current/man-html/net.8.html) is a suite of Linux tools that provides Windows-like functionality on Linux. The `net ads join` command creates a machine account on the domain.

1. To specify how the domain-join process behaves, edit the `/etc/samba/smb.conf` file. For example:

   ```
   workgroup = my-domain
   server role = member server
   realm = my-domain.example.com
   kerberos method = system keytab
   ```

1. To join the domain, run the `net ads join` command. For example:

   ```bash
   $ net ads join my-domain.example.com -U Administrator
   ```

1. `samba` doesn't create configuration files. {{page.varConfig}}

### To Join a Linux Client to a Domain by using realmd
[realmd](https://manpages.debian.org/testing/realmd/realm.8.en.html) is a tool that allows managing realm-based authentication. It can be somewhat more difficult to use than `samba`. However, it creates a more complete configuration. For example, it configures the `sssd` tool during the domain-join process.

1. To join a domain, use the `realm join` command. For example:

   ```bash
   $ realm join my-domain.example.com -U Administrator
   ```

1. {{page.varConfig}}


## To Configure DNS and Service Principal Name (SPN)
{{site.varKerberosDns}}

1. After you configure DNS, check DNS resolution from your client. For example:

   ```bash
   $ nslookup my-client-machine.my-domain.example.com
   ```

1. In addition to DNS configuration, Linux clients require a standard host SPN on the machine account created while joining the domain. We recommend configuring the SPN by using the `setspn` command on the domain controller after the join procedure. For example:

   {% include note.html content="Running this command resets the SPN to the default value for your machine." %}

   ```bash
   setspn -r my-client_machine
   ```


## Mapping External Identities to Linux Identities
During the _ID mapping_ process, a Linux system converts external identities to Linux identities.

* For Qumulo Core, _external identities_ are equivalent to _Kerberos principals_.
* For Linux, _identities_ are simple integers: UIDs and GIDs.

{% include note.html content="Because Linux can't use complex external identities in system calls, a Linux system must perform identity conversion before operating on files." %}

ID mapping is bidirectional. A system call, such as `chown`, that takes a UID or GID as input requires mapping the UID or GID be mapped to a domain user or group _before_ passing it to your Qumulo cluster over NFS.

A system call, such as `stat`, that returns a UID or GID, requires that the domain user or group that returned from your Qumulo cluster over NFS be converted to a UID or GID before the system can present it to the user.

### Configuring Active Directory Authentication by using sssd
[sssd (System Security Services Daemon)](https://linux.die.net/man/8/sssd) is a tool responsible for managing authentication with external providers in Linux. To use NFSv4.1 with Kerberos, you must configure `sssd` with AD as the identity provider.

* If you join domains by using `samba`, you must create the [/etc/sssd.conf](https://linux.die.net/man/5/sssd.conf) file.
* If you join domains by using `realmd`, you might already have a `/etc/sssd.conf` file. For detailed configuration information, see [sssd-ldap](https://linux.die.net/man/5/sssd-ldap) in the Linux documentation.

In the following example, the `sssd.conf` file configures basic ID mapping for AD.

```
[sssd]
domains = my-domain.example.com
config_file_version = 2
services = nss, pam

[domain/my-domain.example.com]
ad_domain = my-domain.example.com
krb5_realm = MY_DOMAIN.EXAMPLE.COM
cache_credentials = True
id_provider = ad
krb5_store_password_if_offline = True
default_shell = /bin/bash
ldap_id_mapping = False
use_fully_qualified_names = False
fallback_homedir = /home/%u@%d
access_provider = ad
```
### Configuring LDAP Queries against the Domain Controller (DC) by using sssd
Like Qumulo clusters, Linux systems can resolve details about user and group objects by querying the DC over LDAP. In particular, a Linux system looks for an object with a matching `sAMAccountName` (user) or `CN` (group)

1. To toggle [RFC 2307](https://datatracker.ietf.org/doc/html/rfc2307) for mappings in the `sssd.conf` file, configure the [ldap_id_mapping field](https://linux.die.net/man/5/sssd-ad).

   * When you set the field to `False`, the client checks whether the RFC 2307 `uidNumber` or `gidNumber` are set on an object.
  
     * If the number is set, it becomes the Linux UID or GID for the operation.

       {% include important.html content="AD doesn't prevent duplicate UID or GID numbers from being added to RFC 2307 values. For this reason, incorrect configuration can lead or UID or GUID collisions. When a Linux system determines that a collision has occurred, it chooses the first UID or GID it finds." %}
  
     * Otherwise, the UID or GID becomes `nobody` or `nogroup` (`65534`).

       {% include note.html content="In most cases, an owner or group becomes 65534 as a result of incorrect user mapping configuration in the client. To understand which LDAP queries run and why they have trouble finding the correct information, check your logs." %}

   * When you set the field to `True`, the client assigns locally a new unique UID or GID to each `objectSID` that it finds on the DC.

     {% include note.html content="This is a more flexible approach than requiring RFC 2307. However, this also means that UIDs and GIDs aren't the same across different Linux systems within the same domain." %}

   In both cases, the client communicates with the DC by using its machine account.

1. To pick up changes to the `/etc/sssd.conf` file on a live system, restart the `sssd` service.

### Configuring the Conversion of Local Identities to NFS Representations by Using idmapd
[idmapd (or nfsidmap)](https://linux.die.net/man/5/idmapd.conf), is a tool that lets you convert local identities to their on-the-wire NFS representations. Although `idmapd` works with `sssd`, it has additional configuration options.

In the following example, the `/etc/idmapd.conf` file configures a Linux client joined to AD:

```
[General]
Domain = my-domain.example.com
Verbosity = 0
Pipefs-Directory = /run/rpc_pipefs

[Mapping]
Nobody-User = nobody
Nobody-Group = nogroup
```

{% include note.html content="Depending on your Linux distribution and configuration, you might have to add the `Domain` field to the default configuration file." %}


## Authenticating as an AD User and Mounting Your Qumulo Cluster
Qumulo Core supports three methods of authenticating as an AD user and mounting your cluster over NFSv4.1 as the AD user. These methods, from least to most complex, and in an increasing order of utility, are:

* By using a machine account
* By using manual authentication with the `kinit` tool
* By using the `autofs` tool

### To Authenticate as an AD User by Using a Machine Account and Mount Your Qumulo Cluster
Machine account authentication uses one AD user for each Linux system. This _machine account user_ is the same as the _machine account_ created on the domain during the domain-join operation. Any user on the Linux system who has access to the machine account mount point can operate as the machine account user on a Qumulo cluster.

Machine account authentication can be useful for simple scenarios in which trusted users on trusted Linux machines require a secure mechanism for communicating with a Qumulo cluster. Because this is also the easiest authentication method to configure, it can be a good starting point for administrators who configure NFSv4.1 with Kerberos for the first time.

{{site.data.alerts.note}}
{{page.varLimitedUsefulness}}
{{site.data.alerts.end}}

1. Confirm that your [/etc/nfs.conf file](https://man7.org/linux/man-pages/man8/rpc.gssd.8.html), contains the following flag.

   ```
   [gssd]
   use-machine-creds=true
   ```

   {{page.varGSSDflag}} When you set the flag to `true`, `gssd` authenticates as the machine account for the system on behalf of the NFS client. (It performs a `kinit` operation as the machine account). The [credential cache](https://web.mit.edu/kerberos/krb5-1.12/doc/basic/ccache_def.html) that results from the `kinit` is usually located in `/tmp`. To search for the cache, use the `ls /tmp/*krb5*` command.

   {{site.data.alerts.note}}
   {{site.varNfsConf}}
   {{site.data.alerts.end}}

1. {{page.varMountKRB5}}

   ```bash
   $ sudo mount -o vers=4.1,sec=krb5 my-cluster.my-domain.example.com:/ /mnt/point
   ```

1. Use the Qumulo file system.

   ```bash
   $ cd /mnt/point
   $ touch filename
   $ ls -l filename
   -rw-r--r--    1 MY_MACHINE$    domain computers         0 Jun  9 23:18 filename
   ```

{% include important.html content="The machine account is the owner of any new files." %}

If the machine name isn't visible, make sure that the AD container holds this machine in the Qumulo cluster's Base DN configuration (typically, `CN=Computers,DC=...`). If the machine name is still not visible, configure the Linux client ID mapper to provide local mappings when no RFC 2307 mapping is available. It is uncommon for machine accounts to have RFC 2307 mappings.

### To Authenticate as an AD User Manually by Using kinit and Mount Your Qumulo Cluster
[kinit](https://linux.die.net/man/1/kinit) authentication is very similar to machine account authentication. The main difference is that you must create the credentials for the mount manually. You can use any user in the AD domain. However (this is also true for machine accounts), any local Linux user that can access the mount point can operate on the Qumulo cluster as this single user.

{{site.data.alerts.note}}
{{page.varLimitedUsefulness}}
{{site.data.alerts.end}}

In environments where Linux systems map exactly to end users that have `kinit`-based Kerberos mounts on their Qumulo clusters, `kinit` might be sufficient.

1. Authenticate by using `kinit`. For example:

   ```bash
   $ sudo kinit my-user
   ```

1. When prompted for a password, use the AD domain password for the user.

1. To confirm the result of the authentication operation, use the `sudo klist` command.

1. Confirm that the [/etc/nfs.conf file](https://man7.org/linux/man-pages/man8/rpc.gssd.8.html) contains the following flag:

   ```
   [gssd]
   use-machine-creds=false
   ```

   {{page.varGSSDflag}} When you set the flag to `false`, `gssd` searches for an existing [credential cache](https://web.mit.edu/kerberos/krb5-1.12/doc/basic/ccache_def.html) (which you created by running `kinit`) in `/tmp/krb5cc_0` for authenticating with the Qumulo cluster.

1. {{page.varMountKRB5}}

   ```bash
   $ sudo mount -o vers=4.1,sec=krb5 my-cluster.my-domain.example.com:/ /mnt/point
   ```

1. Use the Qumulo file system. 

   ```bash
   $ cd /mnt/point
   $ touch filename
   $ ls -l filename
   -rw-r--r--    1 my-user    domain users         0 Jun  9 23:18 filename
   ```

{% include important.html content="The `kinit` user is the owner of any new files." %}


### To Authenticate as an AD User Manually by Using autofs and Mount Your Qumulo Cluster
[autofs](https://man7.org/linux/man-pages/man5/autofs.5.html) is a d&aelig;mon that manages mount points for individual Linux users. For this reason, Linux users have different views of a mount point. `autofs` can authenticate an AD user through `ssh`, the Linux filesystem, or a Qumulo cluster mounted on a Linux system.

{% include important.html content="When you use `autofs`, the Linux system maps the root user to the machine account user for the Linux system on the Qumulo cluster. However, the machine account user doesn't have all the privileges of the root user, such as special permissions for the Qumulo cluster. You must specify all permissions in ACLs." %}

1. Log in to an AD domain and configure `sssd` to authenticate with this domain. For example:

   ```bash
   $ sudo login my-domain-user
   ```

   Alternatively, you can use the following command.

   ```bash
   $ ssh my-domain_user@my-linux-system
   ```

1. Configure the `autofs` mappings. For more information, see [auto.master](https://man7.org/linux/man-pages/man5/auto.master.5.html) in the Linux documentation. The following is an example of a simple configuration that provides a single (direct) mount point which authenticates AD users automatically.

   a. To define a mount point and the path to its map file, add the following line to the `/etc/auto.master` file.

   ```
   /- /etc/auto.kerberos_nfs_mount_example --timeout 60
   ```

   For more information, see [Autofs](https://help.ubuntu.com/community/Autofs) in the Ubuntu documentation.

   b. Add the following line to the `/etc/auto.kerberos_nfs_mount_example` map file.

   ```
   /mnt/qumulo_mount_point -vers=4.1,sec=krb5 my-qumulo-cluster.my-domain.example.com:/
   ```

1. Restart `autofs`.

   ```bash
   $ sudo systemctl restart autofs
   ```

   `autofs` creates the `/mnt/qumulo_mount_point` directory and mounts it as necessary for any user. For example:

   ```
   $ ssh domain_user_1@my-linux-system touch /mnt/qumulo_mount_point/user1_file
   $ ssh domain_user_2@my-linux-system touch /mnt/qumulo_mount_point/user2_file
   $ ssh domain_user_3@my-linux-system ls -l /mnt/qumulo_mount_point
   -rw-r--r--    1 user1    domain users         0 Jun  9 23:18 user1_file
   -rw-r--r--    1 user2    domain users         0 Jun  9 23:18 user2_file
   ```

{% include important.html content="The user you logged in to the AD domain with is the owner of any new files." %}

## Network Time Protocol (NTP) Server
{% include content-reuse/kerberos-ntp-server.md %}

There are many NTP d&aelig;mons for Linux. For example, Ubuntu uses the [NTP functionality in systemd](https://ubuntu.com/server/docs/network-ntp) (`timedatectl` and `timesyncd`).
