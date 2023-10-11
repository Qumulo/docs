---
title: "Qumulo Core Feature Log"
summary: "This section lists the most important features from each release."
permalink: /administrator-guide/upgrading-qumulo-core/feature-log.html
sidebar: administrator_guide_sidebar
keywords: update, upgrade, feature, log
varNoPublicChanges: The majority of functionality and stability improvements in this Qumulo Core release are internal.
varDownloadsRelnotes: <p><a target="_blank" href="https://nexus.qumulo.com/downloads/">Downloads and Release Notes</a></p>
---

For information about upgrade types for each release, see <a href='mode-reference.html'>Qumulo Core Upgrade Mode Reference</a>.

<style>div#toc{height:200px;overflow:auto;}</style>

## Qumulo Core 6.2.2.1
{{page.varDownloadsRelnotes}}
{{site.data.alerts.important}}
<ul>
  <li>This release resolves an issue in Qumulo 6.2.1.1 that interrupted the functioning of cross- realm Kerberos authentication when the system returns CNAMEs for PTR records while performing reverse DNS lookups.</i>
  <li>This release resolves an issue with caching NFS hostnames from the NFS allowed list.</li>
</ul>
{{site.data.alerts.end}}
* Added the ability to store master keys for at-rest encryption in an external Key Management Server (KMS) and updated the corresponding REST APIs and `qq` CLI commands.
* Added the ability to dismiss errors and warnings on the **Cluster > Active Directory** page in the Web UI by clicking **X**.
* Configured the drive LEDs for the front (external) storage bays on Quiver 1U All-NVMe Gen 1 platforms to light up red if a drive fails.
* Ensured that certain SMB `qq` CLI commands always output valid JSON.

## Qumulo Core 6.2.1.2
{{page.varDownloadsRelnotes}}
{{site.data.alerts.important}}
<ul>
  <li>This release resolves an issue in Qumulo 6.2.1.1 that interrupted the functioning of cross-realm Kerberos authentication when the system returns CNAMEs for PTR records while performing reverse DNS lookups.</li>
  <li>This release resolves an issue in Qumulo Core 6.2.1 that affected the persistence of cluster network settings configured by using the Web UI.</li>
  <li>This release removes the flag <code>--dns-config-id</code> that was added in Qumulo Core 6.2.1. This flag prevents the normal functioning of the <code>qq fs_list_locks</code> command.</li>
  <li>This release resolves an issue that we have identified in Qumulo Core 6.1.0 (and higher), where a potential session impersonation exploit was possible when a client accesses a Qumulo cluster by using the SMB protocol.</li>
</ul>
{{site.data.alerts.end}}

* Configured Qumulo Core 6.0.0 (and higher) to have replication compatibility with all quarterly and non-quarterly releases up to 8 quarters in the future (previously, compatibility was for 2 quarters)
* Improved the functionality of S3 `ListObjects`, `ListObjectsV2`, and `PutObject` API actions
* Added support for the SMB `ATTR_OFFLINE` extended file attribute
* Replaced deprecated REST API and `qq` CLI command pertaining to authentication
* Deprecated and replaced REST API command pertaining to the UID light and PSU information

## Qumulo Core 6.2.0.1 (Quarterly)
{{page.varDownloadsRelnotes}}
{{site.data.alerts.important}}
<p>This release resolves an issue with Qumulo Core’s ability to route return packets back to clients when the following conditions are true for a cluster:</p>
<ul>
  <li>The cluster has a single tenant</li>
  <li>VLAN networks are configured</li>
  <li>Packets are destined for specific VLANs without a configured gateway</li>
</ul>
<p>After upgrading to Qumulo Core 6.2.0.1, you can continue to use the default gateway to route VLAN-specific packets.</p>
{{site.data.alerts.end}}

* Added the ability to specify hostnames in host access rules for NFS exports
* Added the privilege `FILE_READ_ACCESS` to Qumulo Core for roles that require read-only access
* Improved the snapshot deletion process
* Added information about drive bays and disk serial numbers for {{site.q1uag1Long}} and virtual machine nodes
* Disabled the automatic addition of DNS records to an AD domain when you join the domain

## Qumulo Core 6.1.2.2
{{page.varDownloadsRelnotes}}
{{site.data.alerts.important}}
<ul>
  <li>
    <p>This release resolves:</p>
    <ul>
      <li>An issue that affects parsing Kerberos principal names that contain special characters in Active Directory Kerberos authentication in Qumulo Core 6.1.2. This issue doesn’t prevent access to SMB shares by using NTLM-based authentication.</li>
      <li>An issue that affects upgrading Qumulo Core on the Quiver 1U Hybrid Gen2 platform in Qumulo Core 6.1.1.</li>
      <li>An issue that affects getting a useful core dump in Qumulo Core 6.1.1.</li>
   </ul>
  </li>
  <li>We’ve identified a known issue that affects event processing in the Cloud-Based Monitoring (CBM) service Qumulo Core 6.1.0.3. This issue is resolved in Qumulo Core 6.2.0.1.</li>
</ul>
{{site.data.alerts.end}}

* Added Adaptive Data Protection to the REST API and `qq` CLI and made performance improvements
* Added Transparent Platform Refresh to the REST API and `qq` CLI
* Added S3 configuration settings to the Web UI
* Improved hard link creation

## Qumulo Core 6.1.1
{{page.varDownloadsRelnotes}}
* Added support for new S3 API actions, snapshot locking for replication target relationships, and lock configuration to the Web UI
* Enabled the Search Trusted Domains Active Directory configuration option by default
* Upgraded the host and container images
* Revised the REST API for snapshots
* Added `qq` CLI commands for lock key functionality
* Added a `qq` CLI command for viewing blocked upgrade status
* Updated the OpenMetrics API Specification
* Made general improvements to Qumulo Core

## Qumulo Core 6.1.0.3 (Quarterly)
{{page.varDownloadsRelnotes}}
{% include important.html content="This release resolves an issue where, under certain circumstances, while using Adaptive Data Protection in Qumulo Core 6.1.0 (and lower), it becomes impossible to add nodes to a cluster during normal cluster expansion or Transparent Platform Refresh operations, until you upgrade the cluster to version 6.1.0.3 (or higher)." %}

* Configured Qumulo Core to use recursive change notifications by default
* Enabled SMB multichannel by default
* Added snapshot locking functionality by using the `qq` CLI
* Made usability changes to event logging and the Web UI
* Removed beta multitenancy REST APIs and `qq` CLI commands

## Qumulo Core 6.0.2
{{page.varDownloadsRelnotes}}
* Added support for streaming file change notifications
* Improved the S3 API
* Made improvements to the Qumulo Core allocation algorithm
* Added audit logging and REST API and `qq` CLI commands for streaming file change notifications
* Removed v2 Python bindings for NFS export and SMB share APIs
* Added new fields to the OpenMetrics API
* Fixed issues with creating SMB shares, transparent platform refresh, vSphere clusters, upgrades in the Web UI, making SMB2 copies by using ODX, and creating snapshot policies

## Qumulo Core 6.0.1.1
{{page.varDownloadsRelnotes}}
* Added new SMB2 `CHANGE_NOTIFY` functionality
  * Full support for recursive watch-tree notifications
  * Alternate Data Streams
  * Numerous performance improvements
  * Elimination of missed events
* Added read combining for NFSv4.1
* Improved the S3 API
  * S3 API action traversal rights
  * S3 traffic in the Web UI and in `qq` CLI output
  * Presigned URL functionality
  * HTTP identity transfer encoding for the `GetObject` API action
* Added operational information to audit logging in JSON format
* Made numerous updates to the multitenancy and S3 `qq` CLI commands and REST APIs
* Fixed an issue with Network Interface Card (NIC) addressing on 240TB and 480TB General Purpose models of the {{site.a4200g10p}} node

## Qumulo Core 6.0.0.2 (Quarterly)
{{page.varDownloadsRelnotes}}
{{site.data.alerts.important}}
<ul>
  <li>This release resolves an issue with transparent platform refresh that we discovered in Qumulo Core 6.0.0 and 6.0.0.1.</li>
  <li>This release restores the status of the <code>/v1/smb/shares</code> REST API endpoints (previously removed in Qumulo Core 5.3.4) to deprecated. We strongly recommend changing over to <code>/v2/smb/shares</code> endpoints as soon as possible.</li>
</ul>
{{site.data.alerts.end}}

* Added Transparent Platform Refresh for node replacement
* Enabled concurrent node reboots for rolling upgrades
* Added write combining for NFSv4.1
* Introduced optional HTTP mode for the S3 API
* Made SSL certificate changes for the S3 API without a cluster restart
* Added audit syslog in JSON format
* Made corresponding changes and additions to the REST API and `qq` CLI
* Fixed issues with the Web UI, directory access by non-root users on Linux, and changed caching for some OpenMetrics API metrics

## Qumulo Core 5.3.4
{{page.varDownloadsRelnotes}}
{% include important.html content="The removal of the deprecated <code>/v1/smb/shares</code> REST API endpoints in this release can affect certain third-party backup or migration workflows." %}

* Added data protection configuration, multitenancy, tenant-aware SMB and NFS, and automatic clean-up of stale multipart S3 uploads
* Removed all REST API endpoints under `/v1/smb/shares`
* Improved and added REST APIs and `qq` CLI commands for restriper, multitenancy, and tenant-aware SMB and NFS operations
* Improved the OpenMetrics APIs
* Fixed an issue with SMB2 attributes for symlinks and a potential security issue with REST API session tokens

## Qumulo Core 5.3.3.1
{{page.varDownloadsRelnotes}}
{% include note.html content="This release resolves an issue that we discovered in Qumulo Core 5.3.3." %}

* Put out the initial release of the S3 Protocol Server
* Added support for NFSv4.1 with KRB5i
* Added the ability to disable access tokens
* Removed `/v1/session/kv` REST API endpoints
* Fixed a bug with listing trustees for a role and a bug with LDAP connections

## Qumulo Core 5.3.2
{{page.varDownloadsRelnotes}}
* Added distributed multi-AZ clustering to Qumulo clusters on AWS
* Added SMB2 `CHANGE_NOTIFY` parity with Windows
* New Qumulo OpenMetrics API metrics
* Added expiration time for access tokens
* Improved the REST API

## Qumulo Core 5.3.1
{{page.varDownloadsRelnotes}}
* Added support for watching for changes in file attributes and directory entries with SMB2 `CHANGE_NOTIFY` filters
* Updated all firmware for all variants of Mellanox CX5 and CX6 and Broadcom NICs
* Added metrics to the Qumulo OpenMetrics API
* Added two-factor authentication for qq-CLI-initiated SAML SSO workflows
* Improved REST API and `qq` CLI
* Added a missing library dependency that allows SAML SSO to work on cloud platforms

## Qumulo Core 5.3.0 (Quarterly)
{{page.varDownloadsRelnotes}}
* Added interactive SAML SSO login and SSO for Active Directory users who manage clusters
* Identified a known issue with SAML SSO on cloud platforms
* Improved SMB `CHANGE_NOTIFY` requests
* Released the Qumulo OpenMetrics API
* Released the Access Tokens API
* Improved the Web UI
* Added REST APIs for node identification
* Improved `qq` CLI commands

## Qumulo Core 5.2.5.1
{{page.varDownloadsRelnotes}}
{% include note.html content="This release resolves an issue that we discovered in Qumulo Core 5.2.5." %}

* Allowed clusters joined to Active Directory to use SAML 2.0 SSO
* Added support for displaying NFSv4.1 quotas
* Created a more balanced usage of free space on clusters after the addition of nodes
* Improved the Web UI
* Added a flag to a `qq` CLI command
* Fixed bugs related to quotas and Alternative Data Streams

## Qumulo Core 5.2.4
{{page.varDownloadsRelnotes}}
{{page.varNoPublicChanges}}

## Qumulo Core 5.2.3
{{page.varDownloadsRelnotes}}
{{page.varNoPublicChanges}}

## Qumulo Core 5.2.2
{{page.varDownloadsRelnotes}}
* Made improvements to the Web UI on the NFS Exports and Role Management pages
* Adjusted the REST API endpoint `/v1/smb/sessions` and the corresponding `qq` CLI command
* Fixed an issue that occurs during NFSv4.1 failover
* Fixed an issue that prevents a cluster from forming due to an incorrect HDD-SSD ratio.

## Qumulo Core 5.2.1
{{page.varDownloadsRelnotes}}
* Added over-the-wire encryption to NFSv4.1 with Kerberos
* Improved performance for SMB Find requests
* Added an optional Web UI login banner
* Removed `/v1/upgrade/` endpoints
* Fixed a bug on the NFS Exports page.

## Qumulo Core 5.2.0.2 (Quarterly)
{{page.varDownloadsRelnotes}}
* Enabled local trustees for NFSv4.1 with Kerberos
* Added support for Amazon EC2 M6i instances and Amazon EBS gp3 volumes
* Removed and replaced REST API endpoints related to shutting down and stopping clusters and nodes
* Fixed an SMB client bug
* Resolved a file system operations latency issue with continuous replication jobs and on clusters with high file creation load
* Resolved an issue that caused a node to enter a reboot loop under certain conditions.

## Qumulo Core 5.1.5
{{page.varDownloadsRelnotes}}
* Enabled creating mounts by using NFSv4.1 with Kerberos
* Improved NLM and NFSv4.1 locking
* Updated Mellanox NIC firmware
* Made improvements to the Web UI on the **APIs & Tools**, **Add Nodes**, and **Active Directory** pages
* Added NFS fields to the REST API and `qq` CLI
* Deprecated the `/v2/upgrade/status` REST API
* Updated security permissions for home directories
* Prohibited the use of the switch-user command
* Added support for user principal (UPN) names

## Qumulo Core 5.1.4.1
{{page.varDownloadsRelnotes}}
* Improved workload read performance for streaming
* Deprecated the `/v1/session/kv/` REST API endpoints
* Fixed an issue on the FTP Settings page
* Fixed a bug where unexpected behavior from an NFS client can cause issues with memory usage on a Qumulo cluster.

## Qumulo Core 5.1.3
{{page.varDownloadsRelnotes}}
* Added NFSv4.1 byte-range locking support for clusters that have NFSv4.1 enabled
* Added custom naming functionality for snapshots
* Made improvements to the Web UI
* Improved node fault tolerance for node-adds
* Updated the time synchronization for cloud clusters
* Added a REST API to calculate node-add capacity
* Fixed bugs about adding S3 privileges, making `OPEN` requests over NFSv4.1, and reassigning floating IP addresses.

## Qumulo Core 5.1.2
{{page.varDownloadsRelnotes}}
* Improved user experience for NFSv4.1 ACL editor
* Made improvements to the Web UI
* Updated time synchronization APIs for QaaS Azure clusters
* Fixed bugs with malformed `RPCBIND` requests and replication relationships.

## Qumulo Core 5.1.1
{{page.varDownloadsRelnotes}}
* Improved time management on QaaS Azure clusters
* Improved resiliency against data center accidents
* Made improvements to the Web UI
* Updated the SDK to Python 3.8
* Disabled time management APIs on QaaS Azure clusters
* Fixed SMB and Web UI form bugs.

## Qumulo Core 5.1.0.1 (Quarterly)
{{page.varDownloadsRelnotes}}
* Improved write performance for workloads on clusters with high-churn, small-file datasets
* Added a new Active Directory capability
* Made a number of pages in the Web UI more clear
* Improved SMB and NFS share, export management, and status APIs
* Added inactivity timeout to the Web UI
* Identified a regression in 5.0.5 and fixed a bug that occurs for rare NFS client applications.

## Qumulo Core 5.0.6
{{page.varDownloadsRelnotes}}
* Improved read performance for previously read large files
* Improved write performance for certain platforms and workloads
* Improved cluster resilience on Azure
* Added support for HPE Broadcom NICs and updated the NIC and SKU reference
* Made improvements to the Web UI
* Fixed bugs pertaining to snapshots of directories with SMB-illegal characters and localized Active Directory installations.

## Qumulo Core 5.0.5
{{page.varDownloadsRelnotes}}
* Increased the tolerance of uncertainty for NTP
* Mapped Isilon-style and Samba-style NFS SIDs to Qumulo SIDs
* Made changes to the Python SDK
* Made an XSS security fix
* Resolved two bugs

## Qumulo Core 5.0.4
{{page.varDownloadsRelnotes}}
* Enabled advanced data integrity for new clusters
* Added a check to confirm whether an upgrade can begin
* Added an initial release of the S3 protocol
* Deprecated reboot `qq` CLI commands
* Added access time (`atime`) API resources and `qq` CLI commands.

## Qumulo Core 5.0.3
{{page.varDownloadsRelnotes}}
* Added Rolling Reboot for platform upgrades (including new APIs and CLI commands)
* Updated the Web UI for both software and platform upgrades
* Made improvements to write performance over NFSv3
* Improved the **Add Nodes** and **Snapshots** pages in the Web UI

## Qumulo Core 5.0.2
{{page.varDownloadsRelnotes}}
* Changed all HPE firmware updates to be performed using the Qumulo installer
* Improved cluster resilience against boot drive failures
* Added the ability to set timestamps through NFSv4.1
* Added the `access_time` field to the attributes REST API resource.

## Qumulo Core 5.0.1
{{page.varDownloadsRelnotes}}
* Enforced the Qumulo-to-Qumulo replication compatibility guarantee to 3 consecutive quarterly releases
  {% include tip.html content="For example, 5.0.1 can't replicate with versions lower than 4.3.0 or higher than 5.2.0." %}
* Made improvements to Shift-to-S3
* Removed unconfigured node APIs

## Qumulo Core 5.0.0.1 (Quarterly)
{{page.varDownloadsRelnotes}}
* Changed the Qumulo-to-Qumulo replication compatibility guarantee from 2 to 3 consecutive quarterly releases
* Enforced Kerberos ticket expiration
* Enabled NLM persistence by default
* Added sorting and filtering to the Snapshot Policies page
* Improved speed of deleted snapshot clean-up
* Removed requirements for QaaS clusters
* Added support for Python 3.8
* Improved the API and CLI version and user-querying command
* Resolved an issue that causes an unpredictable node failure if two NFSv4.1 clients have the same hostname.

## Qumulo Core 4.3.4
{{page.varDownloadsRelnotes}}
{% include important.html content="This release of Qumulo Core resolves a critical security vulnerability. We strongly recommend upgrading your Qumulo cluster to 4.3.4 to resolve this issue." %}

* Added work estimation to Shift-from-S3 relationships
* Added a feature that improves cluster resiliency for unresponsive devices
* Changed the kiosk timeout window to 15 minutes

## Qumulo Core 4.3.3
{{page.varDownloadsRelnotes}}
* Prevented authentication requests with PAC buffers of unknown type from failing
* Improved Saved Snapshots page in the Web UI
* Added a mechanism for monitoring status of front-end network on platforms with separate interfaces.
  
## Qumulo Core 4.3.2
{{page.varDownloadsRelnotes}}
Fixed a bug in Qumulo Core's handling of cross-protocol permissions

## Qumulo Core 4.3.1
{{page.varDownloadsRelnotes}}
* Improved write performance
* Improved speed and duration of terminating outstanding requests to AD Controllers
* Added file system permission checks for SMB shares and NFS exports
* Enabled mounting NFS over UDP with floating IP addresses

## Qumulo Core 4.3.0 (Quarterly)
{{page.varDownloadsRelnotes}}
* Added Network File System Version 4.1 (NFSv4.1)
* Improved performance for SMB offloaded data transfer (ODX) and SMB directory query
* Allowed AWS Sidecar to handle a new class of EBS failures
* Fixed bugs in Shift-From-S3 and the Web UI

## Qumulo Core 4.2.6
{{page.varDownloadsRelnotes}}
* Made an enhancement to Web UI for Qumulo on Azure
* Adjusted  a REST resource
* Made an important change to export names that end with a slash (`/`) or are longer than 64 KiB

## Qumulo Core 4.2.5
{{page.varDownloadsRelnotes}}
Added Web UI management support for Qumulo Shift-from-S3 operations

## Qumulo Core 4.2.4
{{page.varDownloadsRelnotes}}
* Enhanced tree-delete operations
* Made performance improvement for C-72T, C-168T, C-192T, and C-432T platforms
* Enhanced Shift-to-S3
* Made performance improvements
* Made several important bug fixes

## Qumulo Core 4.2.3
{{page.varDownloadsRelnotes}}
* Added Qumulo Shift-from-S3
* Web UI Update for SMB Shares
* Enabled DNS configuration for cloud deployments in the Web UI

## Qumulo Core 4.2.2
{{page.varDownloadsRelnotes}}
* Improved the appearance of spinners in the Web UI
* Made a failover procedure bug fix

## Qumulo Core 4.2.1
{{page.varDownloadsRelnotes}}
* Made improvements for security identifiers
  {% include important.html content="We removed this feature for compatibility reasons. For more information, see [the release notes](https://nexus.qumulo.com/downloads/) on Qumulo Nexus." %}
* Upgraded the Linux kernel to 5.4
* Improved multistream throughput for 4U nodes
* Updated `qq` CLI commands for unconfigured node cluster creation
* Fixed a bug

## Qumulo Core 4.2.0 (Quarterly)
{{page.varDownloadsRelnotes}}
* Enhanced snapshot performance
* Enhanced Active Directory connections
* Made an important bug fix

## Qumulo Core 4.1.5
{{page.varDownloadsRelnotes}}
* Added details to the **Node Add** page in the Web UI
* Updated `qq` CLI upgrade commands for unconfigured nodes
* Made improvements to snapshot cleanup
* Made an important bug fix

## Qumulo Core 4.1.4
{{page.varDownloadsRelnotes}}
* Updated user privileges for the quota `qq` CLI commands
* Enhanced autocomplete functionality in the Web UI
* Made several important bug fixes

## Qumulo Core 4.1.3
{{page.varDownloadsRelnotes}}
{{page.varNoPublicChanges}}

## Qumulo Core 4.1.2
{{page.varDownloadsRelnotes}}
* Enhanced security of `qq` CLI commands
* Made several important bug fixes

## Qumulo Core 4.1.1
{{page.varDownloadsRelnotes}}
* Added the ability to repeat completed jobs for Shift
* Enhanced the security flag for SMB connections
* Improved directory-caching performance
* Updated the HPE Field Verification Tool

## Qumulo Core 4.1.0.1 (Quarterly)
{{page.varDownloadsRelnotes}}
* Enhanced the upgrade experience
* Improved the Qumulo Sidecar for AWS
* Made several important bug fixes

## Qumulo Core 4.0.6
{{page.varDownloadsRelnotes}}
Made a platform upgrade for cloud clusters

## Qumulo Core 4.0.5
{{page.varDownloadsRelnotes}}
* Updated the SMB API and CLI
* Made several important bug fixes

## Qumulo Core 4.0.4
{{page.varDownloadsRelnotes}}
* Updated the firmware for C-72T, C-168T, C-192T, C-432T, K-144T, K-168T, and K-432T platforms
* Enhanced `qq` CLI commands
* Fixed an important bug for mixed-node clusters

## Qumulo Core 4.0.3
{{page.varDownloadsRelnotes}}
* Enhanced the web server security
* Fixed an important bug fix for mixed-node clusters

## Qumulo Core 4.0.2
{{page.varDownloadsRelnotes}}
* Improved the performance of SSD clusters
* Made minor performance enhancements
* Fixed an important bug in the Web UI

## Qumulo Core 4.0.1.1
{{page.varDownloadsRelnotes}}
Fixed important bugs in:
* Cloud-Based Monitoring
* SMB file enumeration
* Compound API and `qq` CLI request errors

## Qumulo Core 4.0.0.2 (Quarterly)
{{page.varDownloadsRelnotes}}
* Deprecated the Python 2.7 SDK
* Made several important bug fixes

## Qumulo Core 3.3.5
{{page.varDownloadsRelnotes}}
* Updated mixed-node compatibility
* Made a performance improvement for Qumulo Shift
* Improved the Field Verification Tool for {{site.a4200g10}} clusters
* Adjusted audit logging functionality
* Made a few important bug fixes

## Qumulo Core 3.3.4
{{page.varDownloadsRelnotes}}
* Added support for the {{site.dl325g10p}} platform
* Made general performance enhancements for hybrid clusters

## Qumulo Core 3.3.3
{{page.varDownloadsRelnotes}}
* Added Instant Software Upgrade
* Made Qumulo Shift performance improvements and Web UI enhancements
* Updated the HPE Service Pack Pro (SPP) Update for {{site.a4200g10}} clusters
