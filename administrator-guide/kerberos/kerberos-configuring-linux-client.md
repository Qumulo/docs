---
title: "Configuring a Linux Client for NFSv4.1 with Kerberos"
summary: "This section describes how to configure a Linux client for using NFSv4.1 with Kerberos."
permalink: /administrator-guide/kerberos/kerberos-configuring-linux-client.html
sidebar: administrator_guide_sidebar
keywords: NFS, NFS4.1, NFSv.4.1, Kerberos, Linux, Linux_client, configure, configuration, krb5, krb5.conf, samba, net_ads_join, smb.conf, sssd, sssd.conf, imapd, imapd.conf, idmapd, idmapd.conf, nfsidmap, nfsidmap.conf, kinit, autofs, machine_account, ntp
varConfig: Configure the `sssd` and `idmapd` tools manually. For more information, see [Mapping External Identities to Linux Identities](#mapping-external-identities-to-linux-identities).
varGSSDflag: The `use-machine-creds` flag specifies whether authentication uses machine credentials when `sudo mount` is invoked for NFSv4.1 with Kerberos.
varMountKRB5: Mount your cluster by using the `krb5` security mechanism. For example&#58;
varLimitedUsefulness: Both machine account authentication and <code>kinit</code> have limited usefulness because they limit the mount point to a single authenticated user. Between the two authentication options, <code>kinit</code> has an advantage because of the way it handles ID mapping.
---

{% include content-reuse/admin-guides/kerberos/kerberos-configuring-linux-client.md %}
