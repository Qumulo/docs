---
title: Configuring and Using Exports for NFS4
permalink: nfs4-exports.html
tags:
  - nfs4
  - qumulo_core
  - exports
---

# Configuring and Using Exports for NFS4

Qumulo's NFS exports allow presenting a view of the cluster over NFS that potentially differs from the contents of the underlying filesystem. NFS exports can also be accessible to only limited IP addresses, or can only allow users to authenticate as the root user from a limited set of IP addresses. See [Create an NFS Export](https://care.qumulo.com/hc/en-us/articles/360000723928-Create-an-NFS-Export) for a guide on creating and configuring NFS exports.

While your NFS exports configuration is shared between NFS3 and NFS4, exports behave somewhat differently when accessed with NFS4. This page will explain the differences and new requirements for exports configurations with NFS4 enabled.
