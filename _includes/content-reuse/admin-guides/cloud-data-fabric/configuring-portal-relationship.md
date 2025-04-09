{% capture nameChange %}{{site.gns.nameChange}}{% endcapture %}
{% include tip.html content=nameChange %}

## Configuring a Portal Relationship Between Two Qumulo Clusters
This section explains how to configure a [portal relationship](how-portal-creation-enables-cloud-data-fabric.html#portal-relationship) between two Qumulo clusters by using the `qq` CLI.

{{site.data.alerts.important}}
<ul>
  <li>Before you begin to implement Cloud Data Fabric in your organization, we strongly recommend reviewing <a href="how-portal-creation-enables-cloud-data-fabric.html">How Portal Relationships between Qumulo Clusters Enable Cloud Data Fabric in Qumulo Core</a>, especially the <a href="how-portal-creation-enables-cloud-data-fabric.html#known-limitations">Known Limitations</a> section.</li>
  <li>For any questions, {{site.contactQumuloCare}}.</li>
</ul>
{{site.data.alerts.end}}

### Prerequisites
* Two clusters with the same version of Qumulo Core

* Network connectivity on TCP port 3713 from the cluster that shares a portion of its file system for the [spoke portal root directory](how-portal-creation-enables-cloud-data-fabric.html#portal-root-directory) to the cluster that will share a portion of its file system for the [hub portal root directory](how-portal-creation-enables-cloud-data-fabric.html#portal-root-directory)

* `PRIVILEGE_PORTAL_GLOBAL_READ` for viewing the status for a hub portal or spoke portal and retrieving general portal information

* Spoke portals

  * `PRIVILEGE_PORTAL_SPOKE_EVICT`: [Control automatic cache management for active spoke portals by configuring a free threshold](configuring-cache-management-for-spoke-portals.html#configuring-automated-removal-of-cached-data-from-spoke-portals)

  * `PRIVILEGE_PORTAL_SPOKE_READ`: View the status of a single spoke portal

  * `PRIVILEGE_PORTAL_SPOKE_WRITE`: Create a spoke portal and propose a relationship with a hub portal

* Hub portals

  * `PRIVILEGE_PORTAL_HUB_READ`: View the status of a specific hub portal

  * `PRIVILEGE_PORTAL_HUB_WRITE`: Authorize a hub portal and confirm a relationship with a spoke portal

{{site.data.alerts.important}}
<ul>
  <li>If both of the clusters use Active Directory, they must be joined to the same domain or each cluster must be joined to Active Directory domains that have a two-way trust relationship to each other.</li>
  <li>{{site.gns.singleRelationship}}</li>
</ul>
{{site.data.alerts.end}}


### Step 1: Create the Spoke Portal
This section explains how to create the [spoke portal](how-portal-creation-enables-cloud-data-fabric.html#spoke-portal) on one cluster and propose the creation of a [portal relationship](how-portal-creation-enables-cloud-data-fabric.html#portal-relationship) to another cluster (which creates the [hub portal](how-portal-creation-enables-cloud-data-fabric.html#hub-portal)).

1. On one cluster, choose a location for the spoke [portal root directory](how-portal-creation-enables-cloud-data-fabric.html#portal-root-directory). For example, `/remote/projects`.

1. To propose an initial portal relationship, run the {% include qq.html command="portal_create" %} command and specify the spoke portal root directory, the IP address of the proposed hub portal host cluster, and the proposed hub portal root directory on that cluster. For example:

   ```bash
   qq portal_create \
     --spoke-root /remote/projects \
     --hub-address {{site.exampleIP0}} \
     --hub-root /projects
   ```

   The spoke portal enters the `Pending` state. {{site.exampleOutput}}

   ```
   ID  State    Status    Type  Spoke Root        Hub Host     Hub Portal ID
   ==  =======  ========  ====  ================  ===========  =============
   2   Pending  Inactive  RW    /remote/projects  {{site.exampleIP0}}  4
   ```

   Hub Portal ID `4` is the ID that the hub portal host cluster allocates for this portal relationship. You can use it to authorize the relationship on the hub portal host cluster as described later.

   {{site.data.alerts.note}}
   <ul>
     <li>We recommend using floating IP addresses.</li>
     <li>Qumulo Core doesn't support fully qualified domain names (FQDNs) for this operation.</li>
     <li>{{site.gns.uniquePortalIDs}}</li>
   </ul>
   {{site.data.alerts.end}}

   When Qumulo Core can't establish a connection from the spoke portal host cluster to the hub portal host cluster, it displays an error message. Try re-establishing the portal relationship.

   When the portal relationship is established, both spoke portal and hub portal enter the `Pending` state.

   {% include note.html content="In this state, the spoke portal root directory is empty and Qumulo Core doesn't transfer any data until the hub portal authorizes the portal relationship." %}

1. To check the status of a cluster, use the {% include qq.html command="portal_list" %} command. {{site.exampleOutput}}

   * From the spoke portal host cluster

     ```
     ID  State     Status    Role   Local Root
     ==  ========  ========  =====  ================
     2   Pending   Inactive  Spoke  /remote/projects
     ```

   * From the hub portal host cluster

     ```
     ID  State     Status    Role   Local Root
     ==  ========  ========  =====  ==========
     4   Pending   Inactive  Hub    /projects/
     ```

### Step 2: Authorize the Portal Relationship
This section explains how to authorize the [portal relationship](how-portal-creation-enables-cloud-data-fabric.html#portal-relationship) from the [hub portal](how-portal-creation-enables-cloud-data-fabric.html#hub-portal) to the [spoke portal](how-portal-creation-enables-cloud-data-fabric.html#spoke-portal).

{% capture varQuorumBounce %}{{site.gns.quorumBounce}}{% endcapture %}
{% include caution.html content=varQuorumBounce %}

1. To find the hub portal ID, run the {% include qq.html command="portal_list" %} command.

   {% capture retrievePortalConfig %}To retrieve portal configuration information, run the {% include qq.html command="portal_list_spokes" %} and {% include qq.html command="portal_list_hubs" %} commands.{% endcapture %}
   {% include tip.html content=retrievePortalConfig %}

1. <a id="authorize-proposed-relationship-qq-cli"></a> To authorize the proposed portal relationship, run the {% include qq.html command="portal_authorize_hub" %} command and specify the hub portal ID and the IP address that the current cluster can use to contact the cluster that proposed the relationship. For example:

   ```bash
   qq portal_authorize_hub \
     --id 4 \
     --spoke-address {{site.exampleIP1}}
   ```

   {% capture uniquePortalIDs %}{{site.gns.uniquePortalIDs}}{% endcapture %}
   {% include note.html content=uniquePortalIDs %}

   {{site.exampleOutput}}

   ```
   ID  State       Status  Hub Root   Spoke Host   Spoke Name  Spoke Type
   ==  ==========  ======  =========  ===========  ==========  ==========
   4   Authorized  Active  /projects  {{site.exampleIP1}}  qfsd-edge   RW
   ```

   After a few seconds, the spoke portal enters the `Authorized` state as well. You can now use the spoke portal root directory.

## Deleting a Portal Relationship Between Two Qumulo Clusters
When you delete the [spoke portal](how-portal-creation-enables-cloud-data-fabric.html#spoke-portal) and the [hub portal](how-portal-creation-enables-cloud-data-fabric.html#hub-portal) (in any order), the [portal relationship](how-portal-creation-enables-cloud-data-fabric.html#portal-relationship) is deleted completely. This section explains how to delete a portal relationship between two Qumulo clusters by using the `qq` CLI.

{% capture varQuorumBounce %}{{site.gns.quorumBounce}}{% endcapture %}
{% include caution.html content=varQuorumBounce %}

### Prerequisites
* A spoke portal or hub portal in any state

* Privileges
  * `PRIVILEGE_PORTAL_SPOKE_WRITE`: Delete a spoke portal
  * `PRIVILEGE_PORTAL_HUB_WRITE`: Delete a hub portal

### Step 1: Delete the Spoke Portal
You can initiate the deletion of a spoke portal in the `Unlinked`, `Pending`, or `Authorized` state. This section explains how to delete the spoke portal from a portal relationship.

{% capture dataWarning %}{{site.gns.portalDeleteCaution}}{% endcapture %}
{% include caution.html content=dataWarning %}

1. To find the spoke portal ID, run the {% include qq.html command="portal_list" %} command. {{site.exampleOutput}}

   ```
   ID  State       Status  Role   Local Root
   ==  ==========  ======  =====  ================
   3   Authorized  Active  Spoke  /remote/projects
   ```

1. To initiate the deletion of the spoke portal, run the {% include qq.html command="portal_delete_spoke" %} command and specify the spoke portal ID. For example:

   ```bash
   qq portal_delete_spoke --id 3
   ```

   {{site.gns.portalDeleteProcess}}

1. To monitor the deletion progress, run the {% include qq.html command="portal_get_spoke" %} command and specify the spoke portal ID. For example:

   ```bash
   qq portal_get_spoke --id 3
   ```

   {{site.exampleOutput}}

   ```
   ID  State     Status  Type  Spoke Root        Hub Host     Hub Portal ID
   ==  ========  ======  ====  ================  ===========  =============
   2   Deleting  Active  RW    /remote/projects  {{site.exampleIP0}}  4
   ```

   When the synchronization process is complete and the spoke portal configuration is removed, Qumulo Core begins to reclaim the spoke portal's cluster capacity in the background.

   {% capture deleteStalled %}A spoke portal with connectivity issues receives the [`Degraded`](https://docs.qumulo.com/administrator-guide/cloud-data-fabric/how-portal-creation-enables-cloud-data-fabric.html#portal-statuses) status, which in turn can cause the deletion of a portal relationship to stall in the [`Deleting`](https://docs.qumulo.com/administrator-guide/cloud-data-fabric/how-portal-creation-enables-cloud-data-fabric.html#portal-states) state. If it isn't possible to restore connectivity between portals, you can use the {% include qq.html command="portal_get_spoke" %} command with the `--force` flag to delete a spoke portal with any status and in any state.{% endcapture %}
   {% include note.html content=deleteStalled %}

### Step 2: Delete the Hub Portal
You can delete a hub portal in either the `Pending` or `Authorized` state.

{% include caution.html content="This action makes the spoke portal root directory and all cached data inaccessible." %}

1. To find the hub portal ID, run the {% include qq.html command="portal_list" %} command. {{site.exampleOutput}}

   ```
   ID  State       Status  Role   Local Root
   ==  ==========  ======  =====  ==========
   4   Authorized  Active  Hub    /projects/
   ```

1. To delete the hub portal, run the {% include qq.html command="portal_delete_hub" %} command and specify the hub portal ID. For example:

   ```bash
   qq portal_delete_hub --id 4
   ```

   {{site.gns.portalDeleteProcess}}

   Qumulo Core deletes the hub portal without affecting any of the data on the hub portal host cluster.

1. To monitor the deletion process, run the {% include qq.html command="portal_get_hub" %} command and specify the hub portal ID. For example:

   ```bash
   qq portal_get_hub --id 4
   ```

   {{site.exampleOutput}}

   ```
   ID  State     Status  Hub Root   Spoke Host   Spoke Name  Spoke Type
   ==  ========  ======  =========  ===========  ==========  ==========
   4   Deleting  Active  /projects  {{site.exampleIP1}}  qfsd-edge   RO
   ```

   {% include note.html content=deleteStalled %}
