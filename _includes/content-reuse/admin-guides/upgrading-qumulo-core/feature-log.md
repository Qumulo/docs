<style>div#toc{height:200px;overflow:auto;}</style>

{% if page.platform == 'on-prem' %}
For information about upgrade types for each release, see <a href='mode-reference.html'>Qumulo Core Upgrade Mode Reference</a>.
{% endif %}

{% capture nexusLink %}<p>{{site.downloadsRelnotes}}{{site.loginRequired}}</p>{% endcapture %}

## Qumulo Core 7.7.2
{{ nexusLink }}
{% capture genoaFix %}This release resolves a kernel incompatibility with hardware platforms that use AMD EPYC 9004 Series (AMD Genoa and later) CPUs.{% endcapture %}
{% include important.html content=genoaFix %}

Significantly improved the performance of the incremental replication process for directories

## Qumulo Core 7.7.1.1
{{ nexusLink }}
{% include important.html content=genoaFix %}

* Changed how NFS export host restrictions use `KRB*` keywords in Qumulo Core by allowing an additional match for hosts that authenticate by using a specific Kerberos flavor
* Added REST API endpoints and qq CLI commands to support specifying a registration key that associates your Qumulo cluster with your Qumulo Nexus account
* Changed `qq` CLI error messages to write to `stderr` instead of `stdout`
* Resolved an S3 API issue with applications placing a trailing whitespace in the signed header field

## Qumulo Core 7.7.0.2 (Quarterly)
{{ nexusLink }}
{{site.data.alerts.important}}
<ul>
  <li>{{ genoaFix }}</li>
  <li>This release resolves an issue where previously it was possible for QFSD to crash when system clock time was moved "backwards" while Cloud Data Fabric (CDF) is enabled for a Qumulo cluster.</li>
  <li>To prevent Qumulo Core from consuming a large amount of memory when an Intel NIC is installed in a node, we have blacklisted the <code>irdma</code> kernel module in Qumulo Core 7.7.0 (and higher).</li>
</ul>
{{site.data.alerts.end}}

* Added Non-VPN Remote Support for self-managed Cloud Native Qumulo (CNQ) and on-premises clusters
* Removed and replaced `qq` CLI commands related to Snapshots functionality
* Resolved an issue with case sensitivity in Domain Controller lists

## Qumulo Core 7.6.4.1 
{{ nexusLink }}
{% include important.html content="This release resolves an issue that affects Azure Native Qumulo (ANQ) and Cloud Native Qumulo (CNQ) clusters. While this issue did not affect cluster data, it caused the system to not delete unneeded backing data. When certain accounts retained this data incorrectly, there was a potential increase in consumption of cloud resources." %}

* Improved Cloud Data Fabric portal data synchronization speeds
* Moved a number of `/v3/network/*` REST APIs out of preview status
* Added a number `qq network_*`, `qq portal_authorize_hub`, and `qq_snapshot_*` CLI commands

## Qumulo Core 7.6.3.1
{{ nexusLink }}
{% include important.html content="This release resolves an issue with Cloud Data Fabric where previously it was possible for a client connected through SMB to perform an operation on a file from a spoke portal after the same file was deleted from the hub portal, causing the cluster to become unavailable." %}

* Made EdgeConnect (unprotected, single-node edge) clusters publicly available as bare-metal and VM deployments
  * Added the `cluster_type` metric to the Qumulo OpenMetrics API Specification
* Improved Cloud Data Fabric (CDF):
  * Increased portal data synchronization IOPS and throughput for many CDF workloads
  * Added full support for SMB Read Lease and Write Lease functionality to CDF
  * Resolved an issue related to audit logging and spoke portal file path resolution
* Improved the S3 API:
  * Added support for the `STREAMING-UNSIGNED-PAYLOAD-TRAILER` authentication type with the `CRC64-NVME` and `SHA-256` checksum formats
  * Added Qumulo Core support for the default authentication type that the AWS CLI uses for the `PutObject` and `UploadPart` API actions
* Added the ability to specify a list of Active Directory domain controllers that overrides the default auto-discovery process
* Limited the number of `bind_uri` entries to 3 for standalone LDAP queries
* Made `qq` CLI and REST API changes to support the new EdgeConnect, CDF, S3 API, Active Directory, and LDAP functionality

## Qumulo Core 7.6.2
{{ nexusLink }}
* Made improvements to Cloud Data Fabric:
  * Added the ability to configure up to 32 spoke portal root directories for each portal relationship
  * Made corresponding `/v2/portal/*` REST API and `qq portal_*` CLI changes
  * Changed some of the terminology concerning _portal relationship states_ and _portal root directory states_
* Ensured that the `ListObjectsV2` S3 API action supports the `start-after` parameter

## Qumulo Core 7.6.1.1
{{ nexusLink }}
{{site.data.alerts.note}}
This release of Qumulo Core adds Illumio Policy Compute Engine (PCE) and Virtual Enforcement Node (VEN) functionality that ensures network security within the container.
<ul>
  <li>If your cluster doesn't use Illumio, there is no need to upgrade to this release.</li>
  <li>To connect each node in your cluster to a VEN, run the <code>illumio-ven-ctl</code> command within the container on every node in your cluster. For more information, see <a target="_blank" href="https://product-docs-repo.illumio.com/Tech-Docs/Core/24.2/Install-Upgrade-Admin/out/en/ven-install-and-upgrade/reference/ven-activate-command-reference.html">VEN Activate Command Reference</a> in the Illumio documentation.</li>
</ul>
{{site.data.alerts.end}}

* Added the ability to apply the `private` policy to an S3 bucket at creation time
* For Cloud Native Qumulo (CNQ), replaced two OpenMetrics metrics for node and drive failure
* Resolved an issue with the REST API endpoint for unconfigured nodes

## Qumulo Core 7.6.0.2 (Quarterly)
{{ nexusLink }}
{{site.data.alerts.important}}
<ul>
  <li>This release resolves an issue with the Qumulo Core upgrade process.</li>
  <li>This release resolves unexpected behavior in the latest host operating system which can block the Qumulo Core upgrade process due to temporary storage becoming unavailable.</li>
  <li>This release resolves an issue identified in Qumulo Core 7.5.4 where, under certain conditions, a node could become unavailable during an update.</li>
</ul>
{{site.data.alerts.end}}

* {{page.varNoPublicChanges}}
* Resolved an issue with the location of S3 buckets created from the Qumulo Core Web UI

{% unless page.platform == 'cnq-gcp' %}
## Qumulo Core 7.5.0.3 (Quarterly)
{{ nexusLink }}
{{site.data.alerts.important}}
<ul>
  <li>This release resolves an issue with Authoritative DNS (QDNS) by reducing the amount of logging for the feature.</li>
  <li>This release resolves a rare issue where previously, under certain conditions, concurrent quorum-related activity could result in file system data being overwritten.</li>
  <li>This release resolves an issue that previously occurred after a spoke portal was deleted.</li>
  <li>
    This release resolves the following on-premises cluster issues:
    <ul>
      <li>For clusters with certain erasure coding configurations deployed before July 4, 2020, this release resolves an issue that previously could occur during quorum formation, resulting in internal metadata being in an inconsistent state.</li>
      <li>This release resolves unexpected SAS controller behavior on hardware nodes, where previously hot-plugging drives could cause cluster instability.</li>
    </ul>
  </li>
</ul>
{{site.data.alerts.end}}

* Made improvements to Cloud Data Fabric:
  * Enabled the creation of up to 32 spoke portals on a single Qumulo cluster
  * Improved file creation latency and throughput for spoke portals
  * Added the Priority Sync feature for read-write spoke portals
* Added the Qumulo Authoritative DNS (QDNS) to Qumulo Core
* Added support for latest Western Digital Ultrastar DC SN640 SSD firmware
* Resolved an issue with incorrect drive types for nodes in on-premises clusters
* Modified the `ListBuckets` S3 API action to use the `BucketPolicy` permission together with Role-Based Access Control (RBAC) in Qumulo Core

## Qumulo Core 7.4.0.4 (Quarterly)
{{ nexusLink }}
{{site.data.alerts.important}}
<ul>
  <li>
    This release resolves the following on-premises cluster issues:
    <ul>
      <li>This release resolves unexpected SAS controller behavior on hardware nodes, where previously hot-plugging drives could cause cluster instability.</li>
      <li>For clusters with certain erasure coding configurations deployed before July 4, 2020, this release resolves an issue that previously could occur during quorum formation, resulting in internal metadata being in an inconsistent state.</li>
    </ul>
  </li>
  <li>This release resolves a rare issue where previously, under certain conditions, concurrent quorum-related activity could result in file system data being overwritten.</li>
  <li>This release resolves an issue that previously occurred after a spoke portal was deleted.</li>
</ul>
{{site.data.alerts.end}}

* Added support for latest Western Digital Ultrastar DC SN640 SSD firmware
* Improved UID and GID sorting in the Qumulo Core Web UI
* Resolved an issue with `PutObject` and `CopyObject` S3 API actions

## Qumulo Core 7.3.0.3 (Quarterly)
{{ nexusLink }}
{{site.data.alerts.important}}
This release resolves the following on-premises cluster issues:
<ul>
  <li>This release resolves unexpected SAS controller behavior on hardware nodes, where previously hot-plugging drives could cause cluster instability.</li>
  <li>For clusters with certain erasure coding configurations deployed before July 4, 2020, this release resolves an issue that previously could occur during quorum formation, resulting in internal metadata being in an inconsistent state.</li>
</ul>
{{site.data.alerts.end}}

* Added the _self-service_ permission model to Qumulo REST API access tokens and made changes to corresponding `qq` CLI commands
* Made it possible for a user to perform operations on their own access keys without having RBAC privileges
* Resolved issues concerning cached data on a spoke portal host cluster, directory metadata block updates made by S3 API actions, and the `GetObject` S3 API action with the Veeam client
{% endunless %}

{% if page.platform == 'on-prem' or page.platform == 'cnq-aws' %}
## Qumulo Core 7.2.0.4 (Quarterly)
{{ nexusLink }}
{{site.data.alerts.important}}
<ul>
  <li>
    This release resolves the following on-premises cluster issues:
    <ul>
      <li>This release resolves unexpected SAS controller behavior on hardware nodes, where previously hot-plugging drives could cause cluster instability.</li>
      <li>For clusters with certain erasure coding configurations deployed before July 4, 2020, this release resolves an issue that previously could occur during quorum formation, resulting in internal metadata being in an inconsistent state.</li>
      <li>This release resolves a memory leak issue on HPE Apollo 4200 Gen 10 36T, 90T, 192T, and 336T Encrypted nodes when querying for system data.</li>
    </ul>
  </li>
  <li>This release resolves an issue in Qumulo Core 7.2.0 and 7.2.0.1 that could cause a cluster to become unresponsive due to incorrectly closed LDAP connections.</li>
</ul>
{{site.data.alerts.end}}

* {{page.varNoPublicChanges}}
* Made CNQ on AWS available on Qumulo Nexus
* Resolved an issue with the **APIs & Tools** page in the Qumulo Core Web UI not showing certain REST endpoints correctly
{% endif %}

{% if page.platform == 'on-prem' %}
## Qumulo Core 7.1.0.3 (Quarterly)
{{ nexusLink }}
{{site.data.alerts.important}}
This release resolves the following on-premises cluster issues:
<ul>
  <li>This release resolves unexpected SAS controller behavior on hardware nodes, where previously hot-plugging drives could cause cluster instability.</li>
  <li>For clusters with certain erasure coding configurations deployed before July 4, 2020, this release resolves an issue that previously could occur during quorum formation, resulting in internal metadata being in an inconsistent state.</li>
  <li>This release resolves an issue in Qumulo Core 7.1.0 that previously prevented Broadcom NIC firmware from being updated correctly.</li>
</ul>
{{site.data.alerts.end}}

* Improved NFSv4.1 performance for writes and reads
* Configured Qumulo Core to move a minimal number of IP addresses
* Configured S3 and HTTP servers to accept HTTP headers with empty values

## Qumulo Core 7.0.0.1 (Quarterly)
{{ nexusLink }}
{% include important.html content="To install Qumulo Core on HPE Alletra 4110 platforms, you must use the 7.0.0.1 release." %}
* Added support for NFSv4.1 cross-connection write combining
* Made significant improvements in SMB random small-write performance
* Added partial support for new S3 API actions
* Configured Qumulo Core to take daily snapshots at regular intervals throughout the day
* Made changes to the Qumulo REST API and the `qq` CLI to accommodate improvements in snapshot and at-rest encryption functionality
* Revised permissions for SMB `copychunk` requests
* Resolved a minor issue with AD authentication, an issue with `.snapshot` directories in Windows Command Prompt, and an issue with SMB copy operations and long share names and volume labels

## Qumulo Core 6.3.0.1 (Quarterly)
{{ nexusLink }}
{{site.data.alerts.important}}
<ul>
  <li>This release resolves an issue with memory utilization during secure credential handling.</li>
  <li>This release resolves an issue in Qumulo 6.2.1.1 that interrupted the functioning of cross-realm Kerberos authentication when the system returns CNAMEs for PTR records while performing reverse DNS look-ups.</li>
</ul>
{{site.data.alerts.end}}
* Configured nodes to remain powered on after Transparent Platform Refresh operations
* Changed the behavior of static IP addresses when a cluster's networking configuration changes or nodes are replaced
* Improved the Qumulo Core Web UI by making accessibility improvements, renaming headings on the **Dashboard** page, and added physical drive bay locations to the **Node Details** page for {{site.all4110}} and {{site.q1uag1Long}} node types
* Improved compatibility between Qumulo Core and the Auth0 SSO provider, increased the replication speed for large numbers of deleted files, updated the `smartpqi` driver for the {{site.a4200g10}} and {{site.a4200g10p}} node types, and resolved an issue with misreported temperatures for AMD CPUs

## Qumulo Core 6.2.0.1 (Quarterly)
{{ nexusLink }}
{{site.data.alerts.important}}
<ul>
  <li>The removal of the deprecated <code>/v1/smb/shares</code> REST API endpoints in this release can affect certain third-party backup or migration workflows.</li>
  <li>
    <p>This release resolves an issue with Qumulo Core's ability to route return packets back to clients when the following conditions are true for a cluster:</p>
    <ul>
      <li>The cluster has a single tenant</li>
      <li>VLAN networks are configured</li>
      <li>Packets are destined for specific VLANs without a configured gateway</li>
    </ul>
    <p>After upgrading to Qumulo Core 6.2.0.1, you can continue to use the default gateway to route VLAN-specific packets.</p>
  </li>
</ul>
{{site.data.alerts.end}}

* Added the ability to specify hostnames in host access rules for NFS exports
* Added the privilege `FILE_READ_ACCESS` to Qumulo Core for roles that require read-only access
* Improved the snapshot deletion process
* Added information about drive bays and disk serial numbers for {{site.q1uag1Long}} and virtual machine nodes
* Disabled the automatic addition of DNS records to an AD domain when you join the domain

## Qumulo Core 6.1.0.3 (Quarterly)
{{ nexusLink }}
{% include important.html content="This release resolves an issue where, under certain circumstances, while using Adaptive Data Protection in Qumulo Core 6.1.0 (and lower), it becomes impossible to add nodes to a cluster during normal cluster expansion or Transparent Platform Refresh operations, until you upgrade the cluster to version 6.1.0.3 (or higher)." %}
* Configured Qumulo Core to use recursive change notifications by default
* Enabled SMB multichannel by default
* Added snapshot locking functionality by using the `qq` CLI
* Made usability changes to event logging and the Qumulo Core Web UI
* Removed beta multitenancy REST APIs and `qq` CLI commands

## Qumulo Core 6.0.0.2 (Quarterly)
{{ nexusLink }}
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
* Made corresponding changes and additions to the Qumulo REST API and `qq` CLI
* Fixed issues with the Qumulo Core Web UI, directory access by non-root users on Linux, and changed caching for some OpenMetrics API metrics

## Qumulo Core 5.3.0 (Quarterly)
{{ nexusLink }}
* Added interactive SAML SSO login and SSO for Active Directory users who manage clusters
* Identified a known issue with SAML SSO on cloud platforms
* Improved SMB `CHANGE_NOTIFY` requests
* Released the Qumulo OpenMetrics API
* Released the Access Tokens API
* Improved the Qumulo Core Web UI
* Added REST APIs for node identification
* Improved `qq` CLI commands

## Qumulo Core 5.2.0.2 (Quarterly)
{{ nexusLink }}
* Enabled local trustees for NFSv4.1 with Kerberos
* Added support for Amazon EC2 M6i instances and Amazon EBS gp3 volumes
* Removed and replaced REST API endpoints related to shutting down and stopping clusters and nodes
* Fixed an SMB client issue
* Resolved a file system operations latency issue with continuous replication jobs and on clusters with high file creation load
* Resolved an issue that caused a node to enter a reboot loop under certain conditions.

## Qumulo Core 5.1.0.1 (Quarterly)
{{ nexusLink }}
* Improved write performance for workloads on clusters with high-churn, small-file datasets
* Added a new Active Directory capability
* Made a number of pages in the Qumulo Core Web UI more clear
* Improved SMB and NFS share, export management, and status APIs
* Added inactivity timeout to the Qumulo Core Web UI
* Identified a regression in 5.0.5 and fixed an issue that occurs for rare NFS client applications.

## Qumulo Core 5.0.0.1 (Quarterly)
{{ nexusLink }}
* Changed the Qumulo-to-Qumulo replication compatibility guarantee from 2 to 3 consecutive quarterly releases
* Enforced Kerberos ticket expiration
* Enabled NLM persistence by default
* Added sorting and filtering to the Snapshot Policies page
* Improved speed of deleted snapshot clean-up
* Removed requirements for QaaS clusters
* Added support for Python 3.8
* Improved the API and CLI version and user-querying command
* Resolved an issue that causes an unpredictable node failure if two NFSv4.1 clients have the same hostname.

## Qumulo Core 4.3.0 (Quarterly)
{{ nexusLink }}
* Added Network File System Version 4.1 (NFSv4.1)
* Improved performance for SMB offloaded data transfer (ODX) and SMB directory query
* Allowed AWS Sidecar to handle a new class of EBS failures
* Fixed issues in Shift-From-S3 and the Qumulo Core Web UI

## Qumulo Core 4.2.0 (Quarterly)
{{ nexusLink }}
* Enhanced snapshot performance
* Enhanced Active Directory connections
* Fixed an important issue

## Qumulo Core 4.1.0.1 (Quarterly)
{{ nexusLink }}
* Enhanced the upgrade experience
* Improved the Qumulo Sidecar for AWS
* Fixed several important issues

## Qumulo Core 4.0.0.2 (Quarterly)
{{ nexusLink }}
* Deprecated the Python 2.7 SDK
* Fixed several important issues
{% endif %}
