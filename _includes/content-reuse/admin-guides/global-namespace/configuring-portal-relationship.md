{{site.data.alerts.important}}
<ul>
  <li>Before you begin to implement Global Namespace in your organization, we strongly recommend reviewing <a href="how-portal-creation-enables-global-namespace.html">How Portal Relationships between Qumulo Clusters Enable a Global Namespace in Qumulo Core</a>, especially the <a href="how-portal-creation-enables-global-namespace.html#known-limitations">Known Limitations</a> section.</li>
  <li>For any questions, {{site.contactQumuloCare}}.</li>
</ul>
{{site.data.alerts.end}}

## Configuring a Portal Relationship Between Two Qumulo Clusters
This section explains how to configure a portal relationship between two Qumulo clusters by using the `qq` CLI.

### Prerequisites
* Two clusters with the same version of Qumulo Core

* Network connectivity on TCP port 3713 from the cluster that shares a portion of its file system for the [spoke portal root directory](how-portal-creation-enables-global-namespace.html#portal-root-directory) to the cluster that will share a portion of its file system for the [hub portal root directory](how-portal-creation-enables-global-namespace.html#portal-root-directory)

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
This section explains how to create the [spoke portal](how-portal-creation-enables-global-namespace.html#spoke-portal) on one cluster and propose the creation of a [portal relationship](how-portal-creation-enables-global-namespace.html#portal-relationship) to another cluster (which creates the [hub portal](how-portal-creation-enables-global-namespace.html#hub-portal)).

1. On one cluster, choose a location for the spoke [portal root directory](how-portal-creation-enables-global-namespace.html#portal-root-directory). For example, `/remote/projects`.

1. To propose an initial portal relationship, run the {% include qq.html command="portal_create" %} command and specify the spoke portal root directory, the IP address of the proposed hub portal host cluster, and the proposed hub portal root directory on that cluster. For example:

   ```bash
   qq portal_create \
     --spoke-root /remote/projects \
     --hub-address {{site.exampleIP0}} \
     --hub-root /projects
   ```

   The spoke portal enters the `Pending` state. The following is example output from the command.

   ```
   ID  State    Hub          Spoke Root        Hub Root ID
   ==  =======  ===========  ================  ===========
   2   Pending  {{site.exampleIP0}}  /remote/projects  3
   ```

   If Qumulo Core can't establish a connection from the cluster with the spoke portal portion to the cluster with the hub portal portion, it displays an error message and the spoke portal enters the `Unlinked` state.

   To propose a portal relationship at a later time, do the following:

   1. To find the spoke portal ID, run the {% include qq.html command="portal_list" %} command.

   1. <a id="establish-portal-relationship-qq-cli"></a>Run the {% include qq.html command="portal_propose_hub" %} command and specify the spoke ID, the IP address of a prospective Qumulo cluster with the hub portal portion, and the proposed hub portal root directory on that cluster. For example:

      ```bash
      qq portal_propose_hub \
        --spoke-id 2 \
        --hub-address {{site.exampleIP0}} \
        --hub-root /projects
      ```

      {{site.data.alerts.note}}
      <ul>
         <li>We recommend using floating IP addresses.</li>
         <li>Qumulo Core doesn't support fully qualified domain names (FQDNs) for this operation.</li>
         <li>{{site.gns.uniquePortalIDs}}</li>
      </ul>
      {{site.data.alerts.end}}

   1. When the portal relationship is established, both spoke portal and hub portal enter the `Pending` state.

      {% include note.html content="In this state, the spoke portal root directory is empty and Qumulo Core doesn't transfer any data until the hub portal authorizes the portal relationship." %}

      You can check the status of a cluster by using the {% include qq.html command="portal_list" %} command. The following is example output from the command that shows the portal ID, state, role, and root directory.

      * From the spoke portal host cluster

        ```
        ID  State     Role   Local Root
        ==  ========  =====  ================
        2   Pending   Spoke  /remote/projects
        ```

      * From the hub portal host cluster

        ```
        ID  State     Role   Local Root
        ==  ========  =====  ==========
        4   Pending   Hub    /projects/
        ```

### Step 2: Authorize the Portal Relationship
This section explains how to authorize the [portal relationship](how-portal-creation-enables-global-namespace.html#portal-relationship) from the [hub portal](how-portal-creation-enables-global-namespace.html#hub-portal) to the [spoke portal](how-portal-creation-enables-global-namespace.html#spoke-portal).

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

   The following is example output from the command that shows that the portal relationship for the hub portal is in the `Active` state.

   ```
   ID  State   Root       Peer Address  Peer Name
   ==  ======  =========  ============  =========
   4   Active  /projects  {{site.exampleIP1}}   qfsd-edge
   ```

   After a few seconds, the spoke portal enters the `Active` state as well. You can now use the spoke portal root directory.

{% capture varQuorumBounce %}{{site.gns.quorumBounce}}{% endcapture %}
{% include caution.html content=varQuorumBounce %}
