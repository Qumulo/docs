{{site.data.alerts.tip}}
<ul>
  <li>For a general conceptual introduction, see <a target="_blank" href="https://www.cbtnuggets.com/blog/technology/networking/what-is-hub-and-spoke-topology">What is Hub and Spoke Topology?</a></li>
  <li>For specific implementation of the Global Namespace functionality in Qumulo Core, see <a href="#example-global-namespace-scenarios">Example Global Namespace Scenarios</a>.</li>
</ul>
{{site.data.alerts.end}}

{% comment %}In{% endcomment %}Qumulo {% comment %}Core 7.2.0 (and higher),{% endcomment %} clusters can take advantage of the Global Namespace functionality that lets clusters across disparate geographic or infrastructural locations (on-premises and in the cloud) access the same data while maintaining independent namespace structures on each cluster (for example, by setting only a portion of the cluster's file system as the _portal root directory_).

To enable Global Namespace functionality, you must define a [_spoke portal_](#spoke-portal) on one cluster, a [_hub portal_](#hub-portal) on another cluster, and then propose a [_portal relationship_](#portal-relationship) between the two.

{{site.data.alerts.important}}
<ul>
  <li>Before you begin to implement Global Namespace in your organization, we strongly recommend reviewing this page, especially the <a href="#known-limitations">Known Limitations</a> section.</li>
  <li>For any questions, {{site.contactQumuloCare}}.</li>
</ul>
{{site.data.alerts.end}}

## Key Terms
The following key terms help define the components of Global Namespace functionality in Qumulo Core.

* <a id="portal-root-directory"></a>**Spoke Portal Root Directory, Hub Portal Root Directory:** A directory on a cluster that uses a portion of its file system for the _hub portal_ or _spoke portal_.

  According to the file system permissions that a hub portal might impose, you can access a portal root directory by using NFSv3, SMB, or the Qumulo Core REST API.

  {% capture spokePortalsReadOnly %}{{site.gns.spokePortalsReadOnly}}{% endcapture %}
  {% include note.html content=spokePortalsReadOnly %}

* <a id="spoke-portal"></a>**Spoke Portal:** An interface point on a Qumulo cluster that accesses a portion of the file system on another cluster (which has a _hub portal)_. {{site.gns.dirOnCluster}} spoke portal. {{site.gns.spokePortalInitiates}}

* <a id="hub-portal"></a>**Hub Portal:** An interface point on a Qumulo cluster that shares a portion of its file system with another cluster (which has a _spoke portal)_. {{site.gns.dirOnCluster}} hub portal. {{site.gns.spokePortalInitiates}}

  {% include note.html content="It isn't possible to create hub portal without a spoke portal. For example, a spoke portal on Cluster A can propose a portal relationship to Cluster B. This action initiates the creation of a hub portal in a `Pending` state on Cluster B. You must authorize the portal relationship before you can use it." %}

* <a id="portal-relationship"></a>**Portal Relationship:** A proposal that a spoke portal on one Qumulo cluster issues to another Qumulo cluster (which will have a _hub portal)_, which the Qumulo cluster with the hub portal _authorizes_.

* <a id="cluster"></a>**Cluster:** Any Qumulo cluster that shares a portion of its file system for a hub portal or a spoke portal. {{site.gns.dirOnCluster}} a spoke portal or a hub portal.

  {{site.data.alerts.tip}}
  <p>Because part of a Qumulo cluster's file system can hold the hub portal root directory or spoke portal root directory, using the correct terminology can help avoid confusion:</p>
  <ul>
    <li><span class="emoji">❌</span> hub cluster</li>
    <li><span class="emoji">✅</span> hub portal host cluster</li>
    <li><span class="emoji">❌</span> spoke cluster</li>
    <li><span class="emoji">✅</span> spoke portal host cluster</li>
  </ul>
  {{site.data.alerts.end}}

### Portal States
Throughout the process of creating a [_spoke portal_](#spoke-portal) and proposing a [_portal relationship_](#portal-relationship), either portal type can be in one of the following states.

<table>
  <thead>
    <tr>
      <th>State</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>Unlinked</code></td>
      <td>Qumulo Core has created the spoke portal, but hasn't established a relationship for it. Use the {% include qq.html command="portal_propose_hub" %} command.</td>
    </tr>
    <tr>
      <td><code>Pending</code></td>
      <td>Qumulo Core has established a relationship between the spoke portal and a hub portal, but the hub portal hasn't given its authorization. Use the {% include qq.html command="portal_authorize_hub" %} command.</td>
    </tr>
    <tr>
      <td><code>Active</code></td>
      <td>The portal relationship is operational for both clusters and the spoke portal root directory is accessible if full connectivity is established.</td>
    </tr>
    <tr>
      <td><code>Ended</code></td>
      <td>The spoke portal root directory is inaccessible because the relationship between the hub portal and spoke portal was removed.</td>
    </tr>
  </tbody>
</table>


## Working with the Global Namespace Functionality
When the [hub portal](#hub-portal) _authorizes_ the [portal relationship](#portal-relationship), the contents of the hub portal root directory become available to the [spoke portal](#spoke-portal) immediately.

The first time a client accesses a spoke portal root directory, the spoke portal begins to read and cache data from the hub portal. Subsequent access to the same data accesses the cache of the spoke portal host cluster, with performance characteristics equivalent to access to non-portal data on the spoke portal host cluster. Caching takes place on demand, when a client with access to the spoke portal accesses new portions of the namespace that the hub portal provides. For more information, see [Configuring Cache Management for Spoke Portals in Qumulo Core](configuring-cache-management-for-spoke-portals.html).

To ensure strict consistency, the system uses a proprietary locking synchronization mechanism to ensure that any changes made on the hub portal become available immediately to any client reading this data from the spoke portal.

{% capture varEphemeralCache %}{{site.gns.ephemeralCache}}{% endcapture %}
{% include caution.html content=varEphemeralCache %}

Qumulo Core enforces permissions in the same way for files and directories in the spoke portal root directory and the hub portal root directory.

{{site.data.alerts.important}}
<ul>
  <li>{{site.gns.adminAccess}}</li>
  <li>Deleting the portal relationship doesn't affect the data on the hub portal.</li>
  <li>{{site.gns.spokeConnectivity}}</li>
</ul>
{{site.data.alerts.end}}

You can remove the portal relationship from either the spoke or hub portal.

* If you remove the spoke portal, Qumulo Core also deletes its root directory, reclaims the capacity consumed by cached data, and the hub portal enters the `Ended` state.

* If you remove the hub portal, all data transfer to the spoke portal stops immediately and the spoke portal enters the `Ended` state (however, its cached data is present but inaccessible).


## Example Global Namespace Scenarios
The following are examples of some of the most common scenarios for workloads that use Global Namespace functionality.

### Edge Clusters
In this scenario, you deploy a single, large central cluster at your organization's data center and multiple, small edge clusters at your organization's branch offices or in remote locations.

{% include shared_image.html alt="A diagram for an example scenario that uses the Global Namespace functionality for an edge cluster" file="shared-images/admin-guides/global-namespace/global-namespace-workflow-edge.png" %}

The Global Namespace functionality lets you make the data on the central cluster available to the remote clusters without the need to replicate data to each location. The data remains available to the edge clusters even if their capacity is lower than that of the central cluster.

### Active Workload with Archive
In this scenario, several clusters serve active workloads but require access to a large data archive after the initial workflow completes.

{% include shared_image.html alt="Active Workload with Archive" file="shared-images/admin-guides/global-namespace/global-namespace-workflow-active-workload-with-archive.png" %}

The Global Namespace functionality lets you:

* Move your cold (infrequently accessed) data to a central archive cluster and then provide access to this data by using a portal on the original cluster.

  The active workload clusters can reclaim most of the data set capacity that was tiered to the data archive cluster. In other words, it is possible to access all the data as before, while using only the capacity on the active workload clusters for the data that your system reads through the portal.

* Serve specific archive capacity and performance needs by scaling the archive cluster independently of any active workflow clusters.


<a id="known-limitations"></a>
## Known Limitations of the Global Namespace Functionality in Qumulo Core

### General
* Currently, it is possible to configure and manage Global Namespace functionality only by using the `qq` CLI.

### File System
* {{site.gns.singleRelationship}}

* {{site.gns.spokePortalsReadOnly}}

* {{site.gns.adminAccess}}

### Data Caching
* {{site.gns.firstTimeAccess}}

* {{site.gns.ephemeralCache}}

* {{site.gns.upgradeCacheDrop}}

### Portal Connectivity
* {{site.gns.spokeConnectivity}}

* {{site.gns.versionRequirement}}

### Protocols
* {{site.gns.protocolLimitations}}

* {{site.gns.protocolLocking}}

* {{site.gns.changeNotify}}
