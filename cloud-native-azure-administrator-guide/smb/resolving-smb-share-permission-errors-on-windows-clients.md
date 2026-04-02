---
title: "Resolving Access Issues When Mapping a Network Drive to an SMB Share on a Qumulo Cluster"
summary: "When a domain user maps a network drive to an SMB share on a Qumulo cluster, her account might not have the permissions required for adding users or groups or changing permissions on that share, which causes Windows to display a message similar to the following: <blockquote><strong>An error occurred while applying security information to:<br>Z&#58;&#92;<br>Failed to enumerate objects in the container. Access is denied.</strong></blockquote> This section explains how to resolve access issues when mapping a network drive to an SMB share on a Qumulo cluster by disconnecting existing shares, mapping a new network drive, and testing adding users or groups to the SMB share on client running Windows 7 (or higher)."
permalink: /cloud-native-azure-administrator-guide/smb/resolving-smb-share-permission-errors-on-windows-clients.html
sidebar: cloud_native_azure_administrator_guide_sidebar
include_content: content-reuse/admin-guides/smb/resolving-smb-share-permission-errors-on-windows-clients.md
---
