## Configuring a Portal Relationship Between Two Qumulo Clusters
This section explains how to configure a [portal relationship](how-portal-creation-enables-cloud-data-fabric.html#portal-relationship) between two Qumulo clusters by using the `qq` CLI.

{{site.data.alerts.important}}
<ul>
  <li>Before you begin to implement Cloud Data Fabric in your organization, we strongly recommend reviewing the <a href="how-portal-creation-enables-cloud-data-fabric.html">How Portal Relationships between Qumulo Clusters Enable Cloud Data Fabric in Qumulo Core</a> and <a href="known-limits.html">Known Limits</a> sections.</li>
  <li>For any questions, {{site.contactQumuloCare}}.</li>
</ul>
{{site.data.alerts.end}}

### Prerequisites
* Two clusters with the same Qumulo Core version

* Network connectivity on TCP port 3713 from the cluster that shares a portion of its file system for the [spoke portal root directory](how-portal-creation-enables-cloud-data-fabric.html#portal-root-directory) to the cluster that will share a portion of its file system for the [hub portal root directory](how-portal-creation-enables-cloud-data-fabric.html#portal-root-directory)

* `PRIVILEGE_PORTAL_GLOBAL_READ` for viewing the status for a hub portal or spoke portal and retrieving general portal information

* Spoke portals

  * `PRIVILEGE_PORTAL_SPOKE_EVICT`: [Control automatic cache management for active spoke portals by configuring a free threshold](configuring-cache-management-for-spoke-portals.html#configure-automated-removal)

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

   The spoke portal enters the `Pending` portal relationship state. {{site.exampleOutput}}

   ```
   Role   ID  Type  State    Status   Peer
   =====  ==  ====  =======  ======== ==========
   Spoke  2   RW    Pending  Inactive {{site.exampleIP0}}

   Root State    Local Path         Remote ID
   ============  =================  ==============================
   Unauthorized  /remote/projects/  107592715270601080910970355714
   ```

   Hub Portal ID `4` is the ID that the hub portal host cluster allocates for this portal relationship. You can use it to accept the relationship on the hub portal host cluster as described later.

   {{site.data.alerts.note}}
   <ul>
     <li>We recommend using floating IP addresses.</li>
     <li>Qumulo Core doesn't support fully qualified domain names (FQDNs) for this operation.</li>
     <li>{{site.gns.uniquePortalIDs}}</li>
   </ul>
   {{site.data.alerts.end}}

   When Qumulo Core can't establish a connection from the spoke portal host cluster to the hub portal host cluster, it displays an error message. Try re-establishing the portal relationship.

   When the portal relationship is established, both spoke portal and hub portal enter the `Pending` portal relationship state.

   {% include note.html content="In this state, the spoke portal root directory is empty and Qumulo Core doesn't transfer any data until the hub portal authorizes access to the hub portal root directory." %}

1. To check the status of a cluster, run the {% include qq.html command="portal_list" %} command. {{site.exampleOutput}}

   * From the spoke portal host cluster

     ```
     Role   ID  Type  State    Status    Peer         Root Count
     =====  ==  ====  =======  ========  ===========  ==========
     Spoke  2   RW    Pending  Inactive  {{site.exampleIP0}}  1
     ```

   * From the hub portal host cluster

     ```
     Role  ID  Type  State    Status    Peer         Root Count
     ====  ==  ====  =======  ========  ===========  ==========
     Hub   4   RW    Pending  Inactive  {{site.exampleIP1}}  1
     ```

### Step 2: Accept the Portal Relationship
This section explains how to accept the [portal relationship](how-portal-creation-enables-cloud-data-fabric.html#portal-relationship) from the [hub portal](how-portal-creation-enables-cloud-data-fabric.html#hub-portal) to the [spoke portal](how-portal-creation-enables-cloud-data-fabric.html#spoke-portal).

{% capture varQuorumBounce %}{{site.gns.quorumBounce}}{% endcapture %}
{% include caution.html content=varQuorumBounce %}

1. To find the hub portal ID, run the {% include qq.html command="portal_list" %} command.

   {% capture retrievePortalConfig %}To retrieve portal configuration information, run the {% include qq.html command="portal_list_spokes" %} and {% include qq.html command="portal_list_hubs" %} commands.{% endcapture %}
   {% include tip.html content=retrievePortalConfig %}

1. To accept the proposed portal relationship, run the {% include qq.html command="portal_accept_hub" %} command, specify the hub portal ID and the IP address that the current cluster can use to contact the cluster that proposed the relationship, and use the `--authorize-hub-roots` flag to also authorize all pending hub root directories. For example:

   ```bash
   qq portal_accept_hub \
     --id 4 \
     --authorize-hub-roots \
     --spoke-address {{site.exampleIP1}}
   ```

   {% capture uniquePortalIDs %}{{site.gns.uniquePortalIDs}}{% endcapture %}
   {% include note.html content=uniquePortalIDs %}

   {{site.exampleOutput}}

   ```
   Role  ID  Type  State     Status  Peer
   ====  ==  ====  ========  ======  ===========
   Hub   4   RW    Accepted  Active  {{site.exampleIP1}}

   Root State  Local Path
   ==========  ==========
   Authorized  /projects/
   ```

   After a few seconds, the spoke portal enters the `Authorized` portal root directory state as well. You can now use the spoke portal root directory.


## Configuring Additional Spoke Portal Root Directories for an Existing Portal Relationship
{{site.gns.functionality762}} This section explains how to configure an additional spoke portal root directory, how to remove access from a hub portal root directory, and how to remove a spoke portal root directory by using the `qq` CLI.

{% include tip.html content="Configuring an additional spoke portal root directory can be useful when it is necessary to provide access to individual directories rather than the contents of the entire file system on the hub portal host cluster." %}

### Prerequisites
* `PRIVILEGE_PORTAL_SPOKE_WRITE` for modifying a spoke portal

* `PRIVILEGE_PORTAL_HUB_WRITE` for modifying a hub portal

### To Configure an Additional Spoke Portal Root Directory
For portal relationships in the `Pending` or `Accepted` state, you can configure an additional spoke portal root directory by proposing the additional spoke portal root directory and then authorizing the corresponding hub portal root directory.

1. To propose the additional spoke portal root directory from the spoke portal host cluster, run the {% include qq.html command="portal_propose_spoke_root" %} command and specify the portal ID, the spoke portal root directory path, and the hub portal root directory path. For example:


   ```bash
   qq portal_propose_spoke_root \
     --id 2 \
     --spoke-root-path /remote/archive \
     --hub-root-path /archive
   ```

   {{site.exampleOutput}}


   ```
   Role   ID  Type  State     Status  Peer
   =====  ==  ====  ========  ======  ==========
   Spoke  2   RW    Accepted  Active  {{site.exampleIP0}}

   Root State    Local Path         Remote ID
   ============  =================  ==============================
   Authorized    /remote/projects/  107592715270601080910970355714
   Unauthorized  /remote/archive/   107592715270601080910970355715
   ```

1. To authorize the corresponding hub portal root directory from the hub portal host cluster, run the {% include qq.html command="portal_authorize_hub_root" %} command and specify the portal ID and the hub portal root directory path. For example:

   {% include note.html content="It is possible to use an existing hub portal root directory which you have already authorized. In this scenario, the additional spoke portal root directory will be in the `Authorized` state immediately." %}


   ```bash
   qq portal_authorize_hub_root \
     --id 4 \
     --hub-root-path /archive
   ```

   {{site.exampleOutput}}


   ```
   Role  ID  Type  State     Status  Peer
   ====  ==  ====  ========  ======  ===========
   Hub   4   RW    Accepted  Active  {{site.exampleIP1}}

   Root State  Local Path
   ==========  ==========
   Authorized  /projects/
   Authorized  /archive/
   ```

### To Remove Access from a Hub Portal Root Directory
Run the {% include qq.html command="portal_deny_hub_root" %} command and specify the portal ID and the hub portal root directory path.

{% include important.html content="It isn't possible to use the `portal_deny_hub_root` command to restrict access to a subdirectory of a hub portal root directory. For example, if hub portal root directories are nested, removing access from a child hub portal root directory doesn't deny access from the corresponding parent hub portal root directory." %}

For example:

```bash
qq portal_deny_hub_root \
 --id 4 \
 --hub-root-path /archive
```

Qumulo Core removes the authorization from the hub portal root directory. {{site.exampleOutput}}

```
Role  ID  Type  State     Status  Peer
====  ==  ====  ========  ======  ===========
Hub   4   RW    Accepted  Active  {{site.exampleIP1}}

Root State    Local Path
============  ==========
Unauthorized  /archive/
Authorized    /projects/
```

### To Remove a Spoke Portal Root Directory
Run the {% include qq.html command="portal_delete_spoke_root" %} command and specify the portal ID and the spoke portal root directory path.

{{site.data.alerts.important}}
<ul>
 <li>This operation doesn't affect any data on the hub portal host cluster, any unsynchronized data in the spoke portal root directory, or the portal relationship.</li>
 <li>To restore the spoke portal root directory, you can propose a new spoke portal root directory.</li>
 <li>When there are no more spoke portal root directories that correspond to a particular hub portal root directory, Qumulo Core removes that hub portal root directory from the portal relationship automatically.</li>
</ul>
{{site.data.alerts.end}}

For example:

```bash
qq portal_delete_spoke_root \
 --id 2 \
 --spoke-root-path /remote/archive
```

Qumulo Core removes access to the hub portal root directory for any spoke portal host cluster clients. {{site.exampleOutput}}

```
Role   ID  Type  State     Status  Peer
=====  ==  ====  ========  ======  ==========
Spoke  2   RW    Accepted  Active  {{site.exampleIP0}}

Root State    Local Path         Remote ID
============  =================  ==============================
Authorized    /remote/projects/  107592715270601080910970355714
 ```

## Deleting a Portal Relationship Between Two Qumulo Clusters
When you delete the [spoke portal](how-portal-creation-enables-cloud-data-fabric.html#spoke-portal) and the [hub portal](how-portal-creation-enables-cloud-data-fabric.html#hub-portal) (in any order), the [portal relationship](how-portal-creation-enables-cloud-data-fabric.html#portal-relationship) is deleted completely. This section explains how to delete a portal relationship between two Qumulo clusters by using the `qq` CLI.

{% capture varQuorumBounce %}{{site.gns.quorumBounce}}{% endcapture %}
{% include caution.html content=varQuorumBounce %}

### Prerequisites
* A spoke portal or hub portal in any portal relationship state

* `PRIVILEGE_PORTAL_SPOKE_WRITE` for deleting a spoke portal

* `PRIVILEGE_PORTAL_HUB_WRITE` for deleting a hub portal

### Step 1: Delete the Spoke Portal
You can initiate the deletion of a spoke portal in the `Pending` or `Accepted` portal relationship state. This section explains how to delete the spoke portal from a portal relationship.

1. To find the spoke portal ID, run the {% include qq.html command="portal_list" %} command. {{site.exampleOutput}}

   ```
   Role   ID  Type  State     Status  Peer         Root Count
   =====  ==  ====  ========  ======  ===========  ==========
   Spoke  2   RW    Accepted  Active  {{site.exampleIP0}}  1
   ```

1. To initiate the deletion of the spoke portal, run the {% include qq.html command="portal_delete_spoke" %} command and specify the spoke portal ID. For example:

   ```bash
   qq portal_delete_spoke --id 2
   ```

   {{site.gns.portalDeleteProcess}}

1. To monitor the deletion progress, run the {% include qq.html command="portal_get_spoke" %} command and specify the spoke portal ID. For example:

   ```bash
   qq portal_get_spoke --id 2
   ```

   {{site.exampleOutput}}

   ```
   Role   ID  Type  State     Status  Peer
   =====  ==  ====  ========  ======  ===========
   Spoke  2   RO    Deleting  Active  {{site.exampleIP0}}

   Root State  Local Path         Remote ID
   ==========  =================  ==============================
   Authorized  /remote/projects/  107592715270601080910970355715
   ```

   When the synchronization process is complete and the spoke portal configuration is removed, Qumulo Core begins to reclaim the spoke portal's cluster capacity in the background.

   {{site.data.alerts.important}}
   <ul>
     <li>A spoke portal with connectivity issues receives the <a href="how-portal-creation-enables-cloud-data-fabric.html#portal-statuses"><code>Degraded</code></a> status, which in turn can cause the deletion of a portal relationship to stall in the <a href="how-portal-creation-enables-cloud-data-fabric.html#portal-relationship-states"><code>Deleting</code></a> state.</li>
     <li>If it isn't possible to restore connectivity between portals, you can delete a spoke portal with any status and in any state by running the {% include qq.html command="portal_delete_spoke" %} command with the <code>--force</code> flag. At the end of this operation, Qumulo Core keeps all synchronized changes on the hub portal and discards all unsynchronized changes from the spoke portal.</li>
   </ul>
   {{site.data.alerts.end}}

### Step 2: Delete the Hub Portal
You can delete a hub portal in either the `Pending` or `Accepted` portal relationship state.

{% include caution.html content="This action makes the spoke portal root directory and all cached data inaccessible." %}

1. To find the hub portal ID, run the {% include qq.html command="portal_list" %} command. {{site.exampleOutput}}

   ```
   Role  ID  Type  State     Status  Peer         Root Count
   ====  ==  ====  ========  ======  ===========  ==========
   Hub   4   RW    Accepted  Active  {{site.exampleIP1}}  1
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
   Role  ID  Type  State     Status  Peer
   ====  ==  ====  ========  ======  ===========
   Hub   4   RO    Deleting  Active  {{site.exampleIP1}}

   Root State  Local Path
   ==========  ===========
   Authorized  /projects/
   ```

   {% include note.html content=deleteStalled %}
