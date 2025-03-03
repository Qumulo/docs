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

   The spoke portal enters the `Pending` state. The following is example output from the command.

   ```
   ID  State    Status    Type  Spoke Root        Hub Host     Hub Portal ID
   ==  =======  ========  ====  ================  ===========  =============
   2   Pending  Inactive  RW    /remote/projects  {{site.exampleIP0}}  4
   ```

   Hub Portal ID `4` is the ID that the hub portal host cluster allocates for this portal relationship. You can use it to authorize the relationship on the hub portal host cluster as described later.

   If Qumulo Core can't establish a connection from the cluster with the spoke portal portion to the cluster with the hub portal portion, it displays an error message and configuration can be attempted again.

      {{site.data.alerts.note}}
      <ul>
         <li>We recommend using floating IP addresses.</li>
         <li>Qumulo Core doesn't support fully qualified domain names (FQDNs) for this operation.</li>
         <li>{{site.gns.uniquePortalIDs}}</li>
      </ul>
      {{site.data.alerts.end}}

   1. When the portal relationship is established, both spoke portal and hub portal enter the `Pending` state.

      {% include note.html content="In this state, the spoke portal root directory is empty and Qumulo Core doesn't transfer any data until the hub portal authorizes the portal relationship." %}

      You can check the status of a cluster by using the {% include qq.html command="portal_list" %} command. The following is example output from the command that shows the portal ID, state, status, role, and root directory.

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

   The following is example output from the command that shows that the portal relationship for the hub portal is in the `Authorized` state.

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
You can delete a spoke portal in any state (`Unlinked`, `Pending`, `Authorized`, or `Deleting`) and without connectivity to the hub portal. This section explains how to delete the spoke portal from a portal relationship.

1. To find the spoke portal ID, run the {% include qq.html command="portal_list" %} command.

   {{site.gns.portalDeleteOutput}}

   ```
   ID  State       Status  Role   Local Root
   ==  ==========  ======  =====  ================
   3   Authorized  Active  Spoke  /remote/projects
   ```

1. To delete the spoke portal run the {% include qq.html command="portal_delete_spoke" %} command and specify the spoke portal ID. For example:

   ```bash
   qq portal_delete_spoke --id 3
   ```

   Qumulo Core deletes the spoke portal and begins to reclaim the spoke portal's cluster capacity in the background.

   If the spoke portal can connect to the hub portal, the hub portal detects the relationship change automatically and enters the `Deleting` state without affecting any of the data on the hub portal host cluster.

### Step 2: Delete the Hub Portal
You can delete a hub portal in any state (`Pending`, `Authorized`, or `Deleting`) and without connectivity to the spoke portal.

{% include caution.html content="This action makes the spoke portal root directory and all cached data inaccessible." %}

1. To find the hub portal ID, run the {% include qq.html command="portal_list" %} command.

   {{site.gns.portalDeleteOutput}}

   ```
   ID  State       Status  Role   Local Root
   ==  ==========  ======  =====  ==========
   4   Authorized  Active  Hub    /projects/
   ```

1. To delete the hub portal, run the {% include qq.html command="portal_delete_hub" %} command and specify the hub portal ID. For example:

   ```bash
   qq portal_delete_hub --id 4
   ```

   Qumulo Core deletes the hub portal without affecting any of the data on the hub portal host cluster.

   If the hub portal can connect to the spoke portal, the spoke portal detects the relationship change and enters the `Deleting` state automatically.
