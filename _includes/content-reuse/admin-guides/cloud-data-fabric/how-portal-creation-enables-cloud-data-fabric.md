{{site.gns.functionality762note}} To enable Cloud Data Fabric functionality, you must define a [_spoke portal_](#spoke-portal) on one cluster, a [_hub portal_](#hub-portal) on another cluster, and then propose a [_portal relationship_](#portal-relationship) between the two.

* For a general conceptual introduction, see [What is Hub and Spoke Topology?](https://www.cbtnuggets.com/blog/technology/networking/what-is-hub-and-spoke-topology).

* For specific implementations of the Cloud Data Fabric functionality in Qumulo Core, see [Example Cloud Data Fabric Scenarios](#example-cloud-data-fabric-scenarios).

{{site.data.alerts.important}}
<ul>
  <li>Qumulo Core 7.6.2 (and higher) adds the ability to have multiple root directories for each relationship and changed some of the existing terminology concerning <a href="#portal-relationship-states"><em>portal relationship states</em></a> and <a href="#portal-root-directory-states"><em>portal root directory states</em></a>. For more information, see <a href="#multiple-root-directories">How Multiple Root Directories Work in Qumulo Core 7.2.0 (and Higher)</a>.</li>
  <li>Before you begin to implement Cloud Data Fabric in your organization, we strongly recommend reviewing the <a href="#key-terms">key terms</a>, <a href="#functionality-explanation">functionality explanation</a>, <a href="#example-scenarios">example scenarios</a>, and the <a href="known-limits.html">known limits</a>.</li>
  <li>For any questions, {{site.contactQumuloCare}}.</li>
</ul>
{{site.data.alerts.end}}


<a id="key-terms"></a>
## Key Terms
The following key terms help define the components of Cloud Data Fabric functionality in Qumulo Core.

### Clusters and Root Directories
* <a id="cluster"></a>**Cluster:** Any Qumulo cluster that shares a portion of its file system for a hub portal or a spoke portal. {{site.gns.dirOnCluster}} a spoke portal or a hub portal.

  {{site.data.alerts.tip}}
  <p>Because <em>a portion</em> of a Qumulo cluster's file system can hold the hub portal root directory or spoke portal root directory, using the correct terminology can help avoid confusion:</p>
  <ul>
    <li><span class="emoji">❌</span> hub cluster</li>
    <li><span class="emoji">✅</span> hub portal host cluster</li>
    <li><span class="emoji">❌</span> spoke cluster</li>
    <li><span class="emoji">✅</span> spoke portal host cluster</li>
  </ul>
  {{site.data.alerts.end}}

* <a id="portal-root-directory"></a>**Spoke Portal Root Directory, Hub Portal Root Directory:** A directory on a cluster that uses a portion of its file system for the _hub portal_ or _spoke portal_.

  According to the file system permissions that a hub portal might impose, you can access a spoke portal root directory by using NFSv3, NFSv4.1 (Qumulo Core 7.4.3 and higher), SMB, the S3 API (7.5.3 and higher) or the Qumulo REST API.
  
  {% capture fyi762 %}{{site.gns.functionality762}}{% endcapture %}
  {% include note.html content=fyi762 %}

  * <a id="hub-portal-data"></a>**Hub Portal Data:** Accessible to other Qumulo clusters through a [portal relationship](#portal-relationship) or through replication, and to clients that connect to the [hub portal host cluster](#cluster)

  * <a id="spoke-portal-data"></a>**Spoke Portal Data:** Accessible only to clients that connect to the [spoke portal host cluster](#cluster)

  * <a id="cluster-local-data"></a>**Cluster-Local Data:** Data on a [hub portal host cluster or spoke portal host cluster](#cluster) which is located outside of the corresponding [portal root directory](#portal-root-directory), accessible to clients that connect to the cluster or to other Qumulo clusters through replication

  The following table illustrates the various content types and ways in which this data can be accessed.

  <table class="info-matrix">
    <thead>
      <tr>
        <th style="vertical-align:middle" rowspan="2">Data Type</th>
        <th style="text-align:center" colspan="4">Data Accessible Through&hellip;</th>
      </tr>
      <tr>
        <th style="width:20%">Other Qumulo clusters through portal relationships</th>
        <th style="width:20%">Other Qumulo clusters through replication</th>
        <th style="width:20%">Clients that access the spoke portal host cluster</th>
        <th style="width:20%">Clients that access the hub portal host cluster</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th scope="row">Hub Portal Data</th>
        <td><span class="emoji">✅</span></td>
        <td><span class="emoji">✅</span></td>
        <td><span class="emoji">❌</span></td>
        <td><span class="emoji">✅</span></td>
      </tr>
      <tr>
        <th scope="row">Spoke Portal Data</th>
        <td><span class="emoji">❌</span></td>
        <td><span class="emoji">❌</span></td>
        <td><span class="emoji">✅</span></td>
        <td><span class="emoji">❌</span></td>
      </tr>
      <tr>
        <th scope="row">Cluster-Local Data</th>
        <td><span class="emoji">❌</span></td>
        <td><span class="emoji">✅</span></td>
        <td><span class="emoji">✅</span></td>
        <td><span class="emoji">✅</span></td>
      </tr>
    </tbody>
  </table>

<a id="multiple-root-directories"></a>
#### How Multiple Root Directories Work in Qumulo Core 7.2.0 (and Higher)
In Qumulo Core 7.2.0 (and higher), clusters can take advantage of the Cloud Data Fabric functionality that lets clusters across disparate geographic or infrastructural locations (on-premises and in the cloud) access the same data while maintaining independent namespace structures on each cluster (by setting a portion of the cluster's file system as the _portal root directory)._

{{site.gns.functionality762}} {{site.gns.functionality762note}}

In addition, Qumulo Core 7.6.2 introduces the following changes:

* We refer to _portal states_ as _portal relationship states_ and the `Authorized` portal state has become the `Accepted` portal relationship state.

* We have added the `Authorized` and `Unauthorized` _portal root directory states_ to indicate the stages of the root directory approval process, to support the ability to add up to {{site.gns.portalRelationshipsMax}}.

* Although Qumulo Core still doesn't support more than one relationship between two clusters, it is now possible to have a variety of configurations involving spoke portal root directories and hub portal root directories, for example:
 
  * **One-to-One Mapping:** A single spoke portal root directory maps to a unique hub portal root directory (with multiple one-to-one mappings in parallel, as necessary)
    
  * **Many-to-One Mapping:** Multiple spoke portal root directories map to a shared hub portal root directory
    
  * **Combined One-to-One and Many-to-One Mapping:** Multiple spoke portal root directories map to both unique and shared hub portal root directories

### Portals
* <a id="spoke-portal"></a>**Spoke Portal:** An interface point on a Qumulo cluster that accesses a portion of the file system on another cluster (which has a _hub portal)_. {{site.gns.dirOnCluster}} spoke portal. {{site.gns.spokePortalInitiates}} You can configure multiple spoke portals on the same Qumulo cluster, as long as the spoke portal root directories don't overlap and the host cluster for each portal relationship is unique.

  * <a id="read-write-portal"></a>**Read-Write Portal:** A spoke portal that can access, modify, and create any files or directories within one or more corresponding hub portal root directories (in the `Authorized` state) according to file system permissions.

  * <a id="read-only-portal"></a>**Read-Only Portal:** A spoke portal that can access any files or directories within one or more corresponding hub portal root directories (in the `Authorized` state) according to file system permissions, but can't modify or create any files or directories regardless of file system permissions.

* <a id="hub-portal"></a>**Hub Portal:** An interface point on a Qumulo cluster that shares a portion of its file system with another cluster (which has a _spoke portal)_. {{site.gns.dirOnCluster}} hub portal. {{site.gns.spokePortalInitiates}} You can configure multiple portal relationships, with the same hub portal root directory, with nested directories, or with independent ones.

  {{site.data.alerts.note}}
  <ul>
    <li>It isn't possible to create a hub portal without a spoke portal. For example, a spoke portal on Cluster A can propose a portal relationship to Cluster B. This action initiates the creation of a hub portal in a <code>Pending</code> state on Cluster B.</li>
    <li>You must accept the portal relationship and then authorize any hub portal root directories before you can use them.</li>
    <li>While a spoke portal can be either <em>read-only</em> or <em>read-write</em>, a hub portal is always read-write.</li>
  </ul>
  {{site.data.alerts.end}}

* <a id="portal-relationship"></a>**Portal Relationship:** A proposal that a spoke portal on one Qumulo cluster issues to another Qumulo cluster (with a _hub portal)_, which the Qumulo cluster with the hub portal _authorizes_.

<a id="portal-relationship-states"></a>
#### Portal Relationship States
A _portal relationship state_ indicates the stages of the [_spoke portal_](#spoke-portal) creation process, and the proposal or deletion of a [_portal relationship_](#portal-relationship).

<table>
  <thead>
    <tr>
      <th>State</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><p><code>Pending</code></p></td>
      <td>
        <p>Qumulo Core has established a relationship between the spoke portal and a hub portal, but the hub portal hasn't yet given its <a href="#portal-root-directory-authorized">authorization</a>.</p>
        <p>Run the {% include qq.html command="portal_authorize_hub" %} command to give the authorization.</p>
      </td>
    </tr>
    <tr>
      <td><p><code>Accepted</code></p></td>
      <td><p>Both Qumulo clusters have acknowledged the portal relationship. Data in <a href="#portal-root-directory-authorized">authorized</a> hub portal root directories is accessible, if full connectivity between Qumulo clusters is established.</p></td>
    </tr>
    <tr>
      <td><p><code>Deleting</code></p></td>
      <td><p>Qumulo Core is in process of synchronizing any outstanding changes from the spoke portal to the hub portal. When synchronization is complete, Qumulo Core removes the portal relationship from each cluster.</p></td>
    </tr>
  </tbody>
</table>

<a id="portal-root-directory-states"></a>
#### Portal Root Directory States
A _portal root directory state_ indicates the stages of the [_hub portal root directory_](#portal-root-directory) approval process.

{% capture portalRootDirState %}{{site.gns.functionality762}} Each unique hub portal root directory has its own state.{% endcapture %}
{% include note.html content=portalRootDirState %}

<table>
  <thead>
    <tr>
      <th>State</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><p><code>Unauthorized</code></p></td>
      <td>
        <p>The spoke portal has requested access to a hub portal root directory. The hub portal hasn't yet authorized access.</p>
        <p>Run the {% include qq.html command="portal_authorize_hub_root" %} command to give authorization.</p>
      </td>
    </tr>
    <tr>
      <td id="portal-root-directory-authorized"><p><code>Authorized</code></p></td>
      <td>
        <p>The hub portal has authorized access to the hub portal root directory. Data in the hub portal root directory is accessible, if full connectivity between Qumulo clusters is established.</p>
        <p>Run the {% include qq.html command="portal_deny_hub_root" %} command to remove authorization.</p>
      </td>
    </tr>
  </tbody>
</table>

<a id="portal-statuses"></a>
#### Portal Statuses
A _portal status_ indicates the accessibility of a [_spoke portal_](#spoke-portal) or [_hub portal_](#hub-portal).

<table>
  <thead>
    <tr>
      <th>Status</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><p><code>Inactive</code></p></td>
      <td>
        <p>The <a href="#portal-relationship">portal relationship</a> is in process of being configured.</p>
        <ul>
          <li>Full connectivity isn't required at this time.</li>
          <li>The portal is inaccessible.</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><p><code>Active</code></p></td>
      <td>
        <p>All required connections between the <a href="#spoke-portal">spoke portal</a> and <a href="#hub-portal">hub portal</a> are established.</p>
        <ul>
          <li>The portal requires full connectivity.</li>
          <li>The portal is fully accessible.</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td><p><code>Degraded</code></p></td>
      <td>
        <p>Some or all required connections between the spoke portal and hub portal are missing.</p>
        <ul>
          <li>Qumulo Core is attempting to restore connectivity.</li>
          <li>The portal might be inaccessible.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>


<a id="functionality-explanation"></a>
## How Cloud Data Fabric Functionality Works
This section explains the creation of portal relationships, data caching and synchronization, permissions in portal root directories, and the deletion of portal relationships.

### Portal Relationship Creation
When you accept the portal relationship, the [hub portal](#hub-portal) also _authorizes_ access to a hub portal root directory, whose contents become available to the [spoke portal](#spoke-portal) immediately.

### Data Synchronization
{% capture varEphemeralCache %}{{site.gns.ephemeralCache}}{% endcapture %}
{% include caution.html content=varEphemeralCache %}

For read-write portals, data synchronization is bidirectional, asynchronous, and strictly consistent upon access. For example, when a client creates or modifies files or directories in the spoke portal root directory, the spoke portal synchronizes these changes to the hub portal in the background. Clients that access the hub portal can see these changes immediately.

To ensure that any changes on one portal become available immediately to any client that reads data from the portal's peers, Qumulo Core uses a proprietary locking synchronization mechanism.

{% include tip.html content="In Qumulo Core 7.6.3 (and higher), if two Qumulo clusters use a load balancer or if the portal relationship is configured by using the IP addresses of peer portals, portal data synchronization can achieve higher IOPS and throughput by making full use of all nodes in both Qumulo clusters in a portal relationship." %}

### Data Caching
The first time a client accesses a spoke portal root directory, the spoke portal begins to read and cache data from the hub portal. Subsequent access to the same data accesses the cache of the spoke portal host cluster, with performance characteristics equivalent to access to non-portal data on the spoke portal host cluster.

Caching takes place on demand, when a client with access to the spoke portal retrieves new portions of the namespace that the hub portal provides. For more information, see [Configuring Cache Management for Spoke Portals in Qumulo Core](configuring-cache-management-for-spoke-portals.html).

### Portal Root Directory Permissions
Qumulo Core enforces permissions in the same way for files and directories in the spoke portal root directory and the hub portal root directory.

{{site.data.alerts.important}}
<ul>
  <li>Deleting the portal relationship never affects the data on the hub portal.</li>
  <li>{{site.gns.accessConnectivity}}</li>
</ul>
{{site.data.alerts.end}}

### Portal Relationship Deletion
This section explains the sequence of events when you request the removal of the portal relationship from the spoke portal or the hub portal.

1. When you request the removal of the spoke portal, the relationship becomes read-only and enters the `Deleting` state and Qumulo Core begins to synchronize any outstanding changes from the spoke portal to the hub portal.

1. During deletion, the relationship requires connectivity to make progress, indicated by the Active status.

1. After deletion completes, Qumulo Core:

   1. Removes the spoke portal and hub portal configuration entries automatically

   1. Deletes the spoke portal root directory and reclaims the capacity previously consumed by cached data.

{% include note.html content="When you remove a portal relationship, any files or directories on the hub portal that were inaccessible, due to _both_ connectivity loss and outstanding spoke portal modifications, become accessible." %}

### Portal Operation Audit Logging
* For clients accessing [spoke portal data](#spoke-portal-data), audit logging is determined by the configuration on the spoke portal host cluster.

* For clients accessing [hub portal data](#hub-portal-data), audit logging is determined by the configuration on the hub portal host cluster.


<a id="example-scenarios"></a>
## Example Cloud Data Fabric Scenarios
The following are examples of some of the most common scenarios for workloads that use Cloud Data Fabric functionality.

### Edge Clusters
In this scenario, you deploy a single, large central cluster at your organization's data center and multiple, small edge clusters at your organization's branch offices or in remote locations.

{% capture workflowEdge %}A diagram for an example scenario that uses the Cloud Data Fabric functionality for an edge cluster{% endcapture %}
{% include shared_image.html alt=workflowEdge file="shared-images/admin-guides/cloud-data-fabric/cloud-data-fabric-workflow-edge.png" %}

The Cloud Data Fabric functionality lets you make the data on the central cluster available to the remote clusters without the need to replicate data to each location. The data remains available to the edge clusters even if their capacity is lower than that of the central cluster. While a read-write portal lets the edge clusters create or modify data on the central cluster, a read-only portal lets only the edge clusters read data from the central cluster.

### Active Workload with Archive
In this scenario, several clusters serve active workloads but require access to a large data archive after the initial workflow completes.

{% include shared_image.html alt="Active Workload with Archive" file="shared-images/admin-guides/cloud-data-fabric/cloud-data-fabric-workflow-active-workload-with-archive.png" %}

The Cloud Data Fabric functionality lets you:

* Move your cold (infrequently accessed) data to a central archive cluster and then provide access to this data by using a portal on the original cluster.

  The active workload clusters can reclaim most of the data set capacity that was tiered to the data archive cluster. This makes it possible to access all of the data as before, while using only the capacity on the active workload clusters for the data that your system reads through the portal.

* Serve specific archive capacity and performance needs by scaling the archive cluster independently of any active workflow clusters.
