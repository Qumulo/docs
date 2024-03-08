---
title: "Configuring a Linux Client for NFSv4.1 with Kerberos"
summary: "This section describes how to configure a Linux client for using NFSv4.1 with Kerberos."
permalink: /azure-administrator-guide/kerberos/kerberos-configuring-linux-client.html
sidebar: azure_administrator_guide_sidebar
varConfig: Configure the `sssd` and `idmapd` tools manually. For more information, see [Mapping External Identities to Linux Identities](#mapping-external-identities-to-linux-identities).
varGSSDflag: The `use-machine-creds` flag specifies whether authentication uses machine credentials when `sudo mount` is invoked for NFSv4.1 with Kerberos.
varMountKRB5: Mount your cluster by using the `krb5` security mechanism. For example&#58;
varLimitedUsefulness: Both machine account authentication and <code>kinit</code> have limited usefulness because they limit the mount point to a single authenticated user. Between the two authentication options, <code>kinit</code> has an advantage because of the way it handles ID mapping.
include_content: content-reuse/admin-guides/kerberos/kerberos-configuring-linux-client.md
---

