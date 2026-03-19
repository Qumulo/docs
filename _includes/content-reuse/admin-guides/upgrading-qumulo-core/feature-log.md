<style>div#toc{height:200px;overflow:auto;}</style>

{% if page.platform == 'on-prem' %}
For information about upgrade types for each release, see <a href='mode-reference.html'>Qumulo Core Upgrade Mode Reference</a>.
{% endif %}

{% capture nexusLink %}<p>{{site.downloadsRelnotes}}{{site.loginRequired}}</p>{% endcapture %}

{% comment %}For boilerplate text, use {{page.varNoPublicChanges}}{% endcomment %}

## Qumulo Core 7.8.2
{{ nexusLink }}
{% capture unexpRest %}This release resolves an issue that could cause nodes in clusters with specific configurations to restart unexpectedly.{% endcapture %}
{% include important.html content=unexpRest %}

* Improved the stability and connectivity of portal relationships when multiple peer portal addresses
* Improved the read performance for scenarios with intermittent connectivity issues that can cause a portal quorum event

## Qumulo Core 7.8.1.1
{{ nexusLink }}
{% include important.html content=unexpRest %}

* Enabled **Try it out** functionality on the **APIs & Tools** Web UI page to work with `POST`, `PUT`, and `PATCH` requests after clicking **Use current session**
* Deprecated some `/v1/portal` REST API endpoints and replaced others with `/v2/portal` endpoints that let you retrieve information about and create portals with multiple root directories

## Qumulo Core 7.8.0.1 (Quarterly)
{{ nexusLink }}
{% capture inconTrigg %}This release resolves an issue where an uncommon operational sequence could trigger an internal encoding inconsistency.{% endcapture %}
{% include important.html content=inconTrigg %}

* Improved the performance of Cloud Data Fabric (CDF) writes from the hub portal to a spoke portal
* Added Host-Managed Networking Mode for all Qumulo Core Product Package installations of Qumulo Core 7.8.0.1 (and higher)
* Added support for the `STREAMING-AWS4-HMAC-SHA256-PAYLOAD` and `STREAMING-AWS4-HMAC-SHA256-PAYLOAD-TRAILER` authentication types to the S3 API
* Changed Authoritative DNS (QDNS) configuration to:
  * Serve `A` records for the first Qumulo network on the cluster's base domain
  * Provide improved support for Windows Server DNS and stricter DNS resolvers
* Added support for accepting and returning security identifiers (SIDs) with the `IdentifierAuthority` value larger than `255`

## Qumulo Core 7.7.5.1
{{ nexusLink }}
{% include important.html content=inconTrigg %}

* Added expansion of the placeholder `%U` to a username for SMB shares
* Added the ability to handle NFSv4.1 user identities in the `<principal>@<domain>` format when a domain name is different from the Active Directory domain to which your Qumulo cluster is joined
* Made additions and revisions associated with these changes to `qq` CLI commands and REST API endpoints
* Resolved an issue with creating new files and then writing them to a spoke portal over SMB
* Resolved an issue with the NFSv4.1 server not presenting the `INHERITED` flag on an Access Control Entry if the entry was inherited from a parent directory

## Qumulo Core 7.7.4.1
{{ nexusLink }}
{% include important.html content=inconTrigg %}

* {{page.varNoPublicChanges}}
* Added the `/v1/portal/ping` REST API endpoint and the `qq portal_ping` command
* Changed how the `qq ad_cancel`, `ad_join`, `ad_leave`, and `ad_reconfigure` commands return the status of in-progress background operations

## Qumulo Core 7.7.3
{{ nexusLink }}

* Updated the `/v3/smb/share/` REST API endpoint
* Made Nexus security improvements

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
* Made improvements to the Network Configuration V3 REST APIs:
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
## Qumulo Core 7.5.5.2
{{ nexusLink }}
{% include important.html content="This release resolves an issue identified in Qumulo Core 7.5.4 where, under certain conditions, a node could become unavailable during an update." %}

* Added the ability to specify a comma-separated list of bind URIs when configuring LDAP
* Changed the error message when a user attempts to write to a read-only S3 bucket on a spoke portal
* Resolved an issue with unexpected SAS controller behavior on hardware nodes
* Added the ability for CNQ clusters to use the REST API and `qq` CLI to modify cloud monitoring settings

## Qumulo Core 7.5.4.2
{{ nexusLink }}
{{site.data.alerts.important}}
<ul>
  <li>This release resolves an issue identified in Qumulo Core 7.5.4 where, under certain conditions, a node could become unavailable during an update.</li>
  <li>This release resolves an issue where File Explorer becomes unresponsive and then displays the <strong>Unable to create shortcut</strong> error when a user attempts to create a shortcut inside an SMB share on a Qumulo cluster.</li>
  <li>This release resolves unexpected SAS controller behavior on hardware nodes, where previously hot-plugging drives could cause cluster instability.</li>
</ul>
{{site.data.alerts.end}}

* Improved the efficiency of parallel operations for workloads that perform a high number of small transactions on the spoke portal
* Modified the `PutObject` S3 API action to accept the `x-amz-tagging` header that contains properly encoded key-value pairs

## Qumulo Core 7.5.3
{{ nexusLink }}
* Made improvements to the S3 API:
  * Added the ability for the S3 API to access spoke portal data
  * Removed the requirement to have the `ObjectLockEnabled` setting for an S3 bucket from the `GetObjectRetention` and `GetObjectLegalHold` S3 API actions
* Made significant improvements to NFSv4.1 `readdir` operation performance for:
  * Clusters with numerous export host restrictions
  * Active Directory for POSIX attributes where files have AD owners with numerous group memberships
* Added an OpenMetrics metric for tracking shared data for a hub portal root directory

## Qumulo Core 7.5.2
{{ nexusLink }}
* Added the ability to upgrade NeuralCache on Azure Native Qumulo (ANQ) and Cloud Native Qumulo (CNQ) instances deployed on Qumulo Core versions lower than 7.4.1
* Added the ability to configure up to 32 hub portals and up to 32 spoke portals on the same cluster at the same time
* Made improvements to the S3 API:
  * Extended the expiration of presigned S3 URLs
  * Changed the `PutObject` S3 API action to accept all valid HTTP header keys
  * Resolved issues with the `CopyObject` S3 API action
* Added OpenMetrics for self-managed, on-premises clusters and CNQ instances
* Added support for latest Western Digital Ultrastar DC SN640 SSD firmware

## Qumulo Core 7.5.1.2
{{ nexusLink }}
{% include important.html content="This release resolves an issue that previously caused an increase in logging output levels on CNQ and ANQ." %}

* For CNQ on Oracle Cloud Infrastructure (OCI), added support for Cold clusters with an object tier for infrequent access to files and directories
* Made improvements to the S3 API:
  * Resolved an issue with S3 directory deletion
  * Modified the XML response bodies for S3 API actions to return the canonical XML header
* Modified `files` REST APIs to return entity tag (ETag) values correctly
* Added support for latest Western Digital Ultrastar DC SN640 SSD firmware
* 
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

## Qumulo Core 7.4.4
{{ nexusLink }}
{{site.data.alerts.important}}
<p>Qumulo Core 7.4.4 is a <em>platform upgrade for on-premises clusters</em> which includes an update of the underlying Ubuntu operating system, from version 20.04 to 24.04.</p>
<ul>
  <li><strong>HPE hardware platforms users:</strong> We strongly recommend downloading and installing the latest HPE Service Pack (SPP) from the <a target="_blank" href="https://support.hpe.com/">HPE Support Center</a>. Lab testing of the upgrade process has shown that certain components (such as NICs and transceivers) can experience compatibility issues when running older firmware on Ubuntu 24.04.</li>
  <li><strong>All hardware platform users:</strong> You must perform a rolling reboot (rebooting the nodes in your cluster one at a time) in order to avoid the interruption of connectivity between nodes in your cluster.</li>
</ul>
{{site.data.alerts.end}}

* Made improvements to Cloud Data Fabric:
  * Added the ability to enable the S3 protocol for a spoke portal host cluster
  * Removed previous restrictions from the placement of replication targets
  * Enabled compression for data transferred between clusters in a portal relationship
  * Made significant performance improvements for small-I/O workloads on the hub portal and for locally cached files on the spoke portal
* Added Qumulo Core Web UI notifications about SSD endurance levels and a corresponding REST API endpoint
* Resolved an issue that previously affected read leases in the hub portal root directory

## Qumulo Core 7.4.3.1
{{ nexusLink }}
{% include important.html content="This release resolves unexpected SAS controller behavior on hardware nodes, where previously hot-plugging drives could cause cluster instability." %}

* Added the ability to use the NFSv4.1 protocol with spoke portals
* Added the ability to perform punch hole operations on spoke portals by using the `qq` CLI and REST API
* Added automatic functionality that cleans up portal relationships after synchronizing spoke portal changes
* Improved NeuralCache (formerly Predictive Read Cache) intelligent data ingestion and retention policy
* Added support for using EBS volumes for NeuralCache in AWS Local Zones
* Resolved an issue with NTLM authentication for certain image scanning devices and SMB shares
* Resolved an issue with the SMB server and showing previous versions for files and directories

## Qumulo Core 7.4.2.1
{{ nexusLink }}

{% include important.html content="This release resolves an issue that can occur while following a non-standard upgrade path." %}

* Added support for {{site.cnqLong}} ({{site.cnqShort}}) clusters with 1, 3, or more nodes
* Made improvements to Cloud Data Fabric:
  * Moved the REST APIs out of preview
  * Removed a `qq` CLI command in favor of automatic clean-up of partially configured portal relationships
  * Added support for FTP communications for spoke portals
  * Changed the names of _portal states,_ which indicate the stages of the spoke portal creation process and the proposal or deletion of a portal relationship
  * Added new _portal statuses,_ which indicate the accessibility of a spoke portal or a hub portal
* Updated the default configuration for new NFS exports
* Added a REST API and `qq` CLI command to facilitate deleting files from directories without constructing full paths

## Qumulo Core 7.4.1.1
{{ nexusLink }}
{{site.data.alerts.important}}
<ul>
  <li>This release resolves an issue where previously Qumulo hub portal host clusters that communicated with read-write spoke portals crashed if the portal contained files with very large file IDs.</li>
  <li>This release resolves an issue that we identified in Qumulo Core releases 7.3.1.2 to 7.4.0.3, where making changes to networking configuration by using the <strong>API Tools</strong> page in the Qumulo Core Web UI or by using the <code>qq</code> CLI caused the default gateway to not populate.</li>
  <li>To enable upgrades to this version of Qumulo Core, you must delete any existing spoke portals or hub portals from your cluster and then wait for any related tree-delete operations to complete before beginning the upgrade process.</li>
  <li>To enable the QFSD API to distinguish between cluster-local and spoke-cached data, from this release of Qumulo Core onward, 64-bit integers can no longer represent QFSD API file identifiers. API integrations must treat them as variable-length strings, in accordance with the OpenMetrics API schema. Although this change affects all REST API endpoints the Qumulo REST API continues to accept old-style identifiers for backwards compatibility.</li>
</ul>
{{site.data.alerts.end}}

* Made _read-write spoke portals_ available by default
* Eliminated the REST APIs for manual removal of cached data from spoke portals (no changes to automatic cached data removal)
* Improved file identifiers to distinguish between cluster-local and spoke-cached data
* Implemented NeuralCache architecture for new cloud clusters
* Renamed the designation `preview` (previously, `beta`) which marks REST APIs under development
* Made public the REST API endpoints and `qq` CLI commands that manage a cluster's DNS configuration

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

## Qumulo Core 7.3.2.1
{{ nexusLink }}
* Removed the limit from the number of floating IP addresses per cluster
* Added support for sharing S3 objects with presigned URLs to additional S3 API actions

## Qumulo Core 7.3.1.2
{{ nexusLink }}
{{site.data.alerts.important}}
<ul>
  <li>For clusters that were created in 2016 (or earlier), this release resolves an issue identified in Qumulo Core 7.3.1.1 where, under certain conditions, the cluster was unable to start after being upgraded to 7.3.1.1, resulting in the cluster going offline.</li>
  <li>For clusters that have only tagged VLANs but no untagged networks, this release resolves an issue in Qumulo Core 7.3.1 where it was possible for the default gateways to be copied incorrectly during the upgrade process, resulting in a potential cluster outage.</li>
</ul>
{{site.data.alerts.end}}

* Made it easier to authorize hub portals from the hub portal host cluster by adding information to REST APIs and `qq` CLI commands
* Improved the behavior of NFSv3 and NFSv4.1 `ACCESS` commands
* Increased the S3 connection limit
* Configured Qumulo Core to permit (but ignore) out-of-spec query parameters for S3 API actions
* Reverted floating IP assignment to Qumulo Core functionality prior to version 7.1.0
* Added a REST API and a `qq` CLI command for querying the current fault tolerance of an object-backed cluster
* Resolved an issue with NLM connections
* Resolved an issue with tree deletion operations

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

## Qumulo Core 7.2.3.2
{{ nexusLink }}
{{site.data.alerts.important}}
<ul>
  <li>This release resolves an issue with Cloud Data Fabric functionality in Qumulo Core 7.2.3.1 that could cause files to become unavailable temporarily.</li>
  <li>If your Qumulo cluster's nodes haven't been configured to use static routes, it isn't necessary to upgrade from Qumulo Core 7.2.3 to 7.2.3.1. To determine whether your cluster's nodes use static routes, SSH into the node and run the <code>ip route show</code> command. Typically, static routes do not have tags such as <code>proto dhcp</code> or <code>proto kernel</code>. For further help, {{site.contactQumuloCare}}.</li>
  <li>If your Qumulo cluster's nodes use static routes, this release resolves an issue in Qumulo Core 7.2.3 that, under certain conditions, caused the system to lose its static route configurations after a quorum event.</li>
</ul>
{{site.data.alerts.end}}

* Made CNQ on Azure available on Qumulo Nexus.
* Added support for read-only Cloud Data Fabric functionality between two or more Qumulo clusters.
* Added support for three-node clusters to CNQ on Azure and CNQ on AWS.
* Added support for CNQ clusters that adjust to multi-AZ configurations automatically.
* Improved S3 Object Lock functionality and made changes to corresponding S3 API actions.
* Made improvements in S3 Versioning API actions and the `CopyObject` S3 API action.
* Allowed users without administrative role-based access control (RBAC) roles to modify S3 access keys and made changes to corresponding `qq` CLI commands.
* Updated some of the error types and HTTP status codes that appear during cluster membership operations.
* Added REST API resources and `qq` CLI commands for creation and membership change of CNQ clusters.
* Resolved an issue with an SSL configuration change while the S3 server is in plaintext mode.
{% endunless %}

{% if page.platform == 'on-prem' or page.platform == 'cnq-aws' %}
## Qumulo Core 7.2.2
{{ nexusLink }}
* Configured Qumulo Core to permit more than 10 floating IP addresses for each node
* Added support for floating IP addresses to {{site.cnqLong}} on AWS
* Made improvements to the S3 API
* Added two REST API resources for controlling SSL ciphers

## Qumulo Core 7.2.1.1
{{ nexusLink }}
{% include important.html content="This release resolves an issue in Qumulo Core 7.2.0, 7.2.0.1, and 7.2.1 that could cause a cluster to become unresponsive due to incorrectly closed LDAP connections." %}
* Released the Qumulo Core Product Package in `.deb` and `.rpm` formats
* Allowed Object Lock to be enabled to for newly created S3 buckets
* Added support for resuming TLS sessions over FTP
* Made improvements in SMB session handling
* Made improvements in audit logging

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
