{{site.data.alerts.tip}}
<ul>
  <li>{{site.gns.nameChange}}</li>
  <li>For a general conceptual introduction, see <a target="_blank" href="https://www.cbtnuggets.com/blog/technology/networking/what-is-hub-and-spoke-topology">What is Hub and Spoke Topology?</a></li>
  <li>For specific implementation of the Cloud Data Fabric functionality in Qumulo Core, see <a href="#example-cloud-data-fabric-scenarios">Example Cloud Data Fabric Scenarios</a>.</li>
</ul>
{{site.data.alerts.end}}

{% comment %}In{% endcomment %}Qumulo {% comment %}Core 7.2.0 (and higher),{% endcomment %} clusters can take advantage of the Cloud Data Fabric functionality that lets clusters across disparate geographic or infrastructural locations (on-premises and in the cloud) access the same data while maintaining independent namespace structures on each cluster (for example, by setting only a portion of the cluster's file system as the _portal root directory)._

To enable Cloud Data Fabric functionality, you must define a [_spoke portal_](#spoke-portal) on one cluster, a [_hub portal_](#hub-portal) on another cluster, and then propose a [_portal relationship_](#portal-relationship) between the two.

{{site.data.alerts.important}}
<ul>
  <li>Before you begin to implement Cloud Data Fabric in your organization, we strongly recommend reviewing this page, especially the <a href="#known-limitations">Known Limitations</a> section.</li>
  <li>For any questions, {{site.contactQumuloCare}}.</li>
</ul>
{{site.data.alerts.end}}

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

  According to the file system permissions that a hub portal might impose, you can access a spoke portal root directory by using NFSv3, SMB, or the Qumulo REST API.

### Portals
* <a id="spoke-portal"></a>**Spoke Portal:** An interface point on a Qumulo cluster that accesses a portion of the file system on another cluster (which has a _hub portal)_. {{site.gns.dirOnCluster}} spoke portal. {{site.gns.spokePortalInitiates}}

  * <a id="read-write-portal"></a>**Read-Write Portal:** A spoke portal that can access, modify, and create any files or directories within the hub portal root directory according to the file system permissions.

  * <a id="read-only-portal"></a>**Read-Only Portal:** A spoke portal that can access any files or directories within the hub portal root directory according to the file system permissions, but can't modify or create any files or directories regardless of file system permissions.

* <a id="hub-portal"></a>**Hub Portal:** An interface point on a Qumulo cluster that shares a portion of its file system with another cluster (which has a _spoke portal)_. {{site.gns.dirOnCluster}} hub portal. {{site.gns.spokePortalInitiates}} You can configure multiple portal relationships, with the same hub portal root directory, with nested directories, or with independent ones.

  {{site.data.alerts.note}}
  <ul>
    <li>It isn't possible to create hub portal without a spoke portal. For example, a spoke portal on Cluster A can propose a portal relationship to Cluster B. This action initiates the creation of a hub portal in a <code>Pending</code> state on Cluster B.</li>
    <li>You must authorize the portal relationship before you can use it.</li>
    <li>While a spoke portal can be either <em>read-only</em> or <em>read-write</em>, a hub portal is always read-write.</li>
  </ul>
  {{site.data.alerts.end}}

* <a id="portal-relationship"></a>**Portal Relationship:** A proposal that a spoke portal on one Qumulo cluster issues to another Qumulo cluster (with a _hub portal)_, which the Qumulo cluster with the hub portal _authorizes_.

#### Portal States
A _portal state_ indicates the stages of the [_spoke portal_](#spoke-portal) creation process, and the proposal or deletion of a [_portal relationship_](#portal-relationship).

<table>
  <thead>
    <tr>
      <th>State</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><p><code>Unlinked</code></p></td>
      <td>
        <p>Qumulo Core created the spoke portal, but couldn't establish a relationship for it or clean up the spoke portal automatically.</p>
        <p>Before trying to re-establish the portal relationship, use the {% include qq.html command="portal_delete_spoke" %} command to clean up the spoke portal manually.</p>
      </td>
    </tr>
    <tr>
      <td><p><code>Pending</code></p></td>
      <td>
        <p>Qumulo Core established a relationship between the spoke portal and a hub portal, but the hub portal did not give its authorization.</p>
        <p>Use the {% include qq.html command="portal_authorize_hub" %} command to give the authorization.</p>
      </td>
    </tr>
    <tr>
      <td><p><code>Authorized</code></p></td>
      <td><p>The portal relationship is approved by both clusters and the spoke portal root directory is accessible, if full connectivity is established.</p></td>
    </tr>
    <tr>
      <td><p><code>Deleting</code></p></td>
      <td><p>The spoke portal root directory is inaccessible because the relationship between the hub portal and spoke portal was removed.</p></td>
    </tr>
  </tbody>
</table>


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


## Working with the Cloud Data Fabric Functionality
When the [hub portal](#hub-portal) _authorizes_ the [portal relationship](#portal-relationship), the contents of the hub portal root directory become available to the [spoke portal](#spoke-portal) immediately.

The first time a client accesses a spoke portal root directory, the spoke portal begins to read and cache data from the hub portal. Subsequent access to the same data accesses the cache of the spoke portal host cluster, with performance characteristics equivalent to access to non-portal data on the spoke portal host cluster. Caching takes place on demand, when a client with access to the spoke portal retrieves new portions of the namespace that the hub portal provides. For more information, see [Configuring Cache Management for Spoke Portals in Qumulo Core](configuring-cache-management-for-spoke-portals.html).

For read-write portals, data synchronization is bidirectional, asychronous, and strictly consistent upon access. For example, when a client creates or modifies files or directories in the spoke portal root directory, the spoke portal synchronizes these changes to the hub portal in the background. Clients that access the hub portal can see these changes immediately.

To ensure that any changes on one portal become available immediately to any client that reads data from the portal's peers, Qumulo Core uses a proprietary locking synchronization mechanism.

{% capture varEphemeralCache %}{{site.gns.ephemeralCache}}{% endcapture %}
{% include caution.html content=varEphemeralCache %}

Qumulo Core enforces permissions in the same way for files and directories in the spoke portal root directory and the hub portal root directory.

{{site.data.alerts.important}}
<ul>
  <li>Deleting the portal relationship never affects the data on the hub portal.</li>
  <li>{{site.gns.accessConnectivity}}</li>
</ul>
{{site.data.alerts.end}}

You can remove the portal relationship from either the spoke or hub portal.

* If you remove the spoke portal, Qumulo Core also deletes its root directory and reclaims the capacity consumed by cached data.

* If you remove the hub portal, all data transfer to the spoke portal stops immediately.

* When you remove a portal relationship, any files or directories on the hub portal that were inaccessible, due to _both_ connectivity loss and outstanding spoke portal modifications, become accessible.


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


<a id="known-limitations"></a>
## Known Limitations of the Cloud Data Fabric Functionality in Qumulo Core

### General
* Currently, it is possible to configure and manage Cloud Data Fabric functionality only by using the `qq` CLI.

### File System
* {{site.gns.singleRelationship}}
* {{site.gns.crossFileSystem}}

### Data Caching
* {{site.gns.firstTimeAccess}}

* {{site.gns.ephemeralCache}}

### Portal Connectivity
* {{site.gns.accessConnectivity}}

* {{site.gns.versionRequirement}}

### Protocols
* {{site.gns.protocolLimitations}}

* {{site.gns.protocolLocking}}
