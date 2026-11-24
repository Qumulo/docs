## How Portal Relationship Types Work {#how-types-work}
When establishing the initial [portal relationship](how-portal-creation-enables-cloud-data-fabric.html#portal-relationship), the [spoke portal](how-portal-creation-enables-cloud-data-fabric.html#spoke-portal) administrator proposes the initial _portal relationship type:_ read-write or read-only. In Qumulo Core 7.11.0 (and higher), the [hub portal](how-portal-creation-enables-cloud-data-fabric.html#hub-portal) administrator can change the portal relationship type whenever the portal relationship is in the `Accepted` state.

{% capture currently %}Currently, it is possible to change the portal relationship type only by using the Qumulo REST API or the `qq` CLI. For any questions, {{site.contactQumuloCare}}.{% endcapture %}
{% include note.html content=currently %}

### Portal Relationship Types
There are four portal relationship types that limit the operations that spoke portal clients can perform. Portal relationship types never restrict hub portal clients.

{% include content-reuse/admin-guides/cloud-data-fabric/portal-relationship-types.md %}

As with every portal type, the hub portal records the changes that the spoke portal requires and the spoke portal applies these changes.

{{site.data.alerts.important}}
<ul>
  <li><code>Read-Write</code>, <code>Read-Only</code>, and <code>Paused</code> portal relationship types remain connected and apply changes as they happen.</li>
  <li>For the <code>Paused</code>  portal relationship type, spoke portal host cluster network outages always interrupt the hub portal host cluster and its other spoke portals.</li>
  <li>For the <code>Suspended</code> portal relationship type, the spoke portal host cluster disconnects from the hub portal host cluster and applies changes when the relationship resumes. Network outages on </li>
</ul>
{{site.data.alerts.end}}

### How Portal Relationship Type Changes Work {#how-changes-work}
{% include important.html content="When you change the portal relationship type, both clusters become unavailable for less than 30 seconds while reconfiguring their systems." %}

Portal relationship types are ordered from most to least restrictive:

1. `Suspended`
2. `Paused`
3. `Read-Only`
4. `Read-Write`

#### Changing to a Less Restrictive Portal Relationship Type
Qumulo Core applies the portal relationship type change immediately. Because a more restrictive type has already kept spoke portal clients from making changes, the spoke portal has no outstanding changes to synchronize

#### Changing to a More Restrictive Portal Relationship Type
Qumulo Core synchronizes any outstanding changes from the spoke portal to the hub portal and then applies the portal relationship type change.

{{site.data.alerts.important}}
<ul>
  <li>
    When the portal relationship type change begins&hellip;
    <ul>
      <li>Spoke portal client lose any access that the new portal relationship type restricts</li>
      <li>Any read-write portal relationships report as read-only</li>
      <li>All other portal relationship types keep reporting as before until the current change is complete</li>
      <li>It isn't possible to change the portal relationship type until the current change is complete</li>
    </ul>
  </li>
  <li>While the portal relationship type change is in progress, the portal relationship enters the <code>Quiescing</code>, <code>Pausing</code>, or <code>Suspending</code> state.</li>
</ul>
{{site.data.alerts.end}}


## Changing the Portal Relationship Type
This section explains how to suspend a portal relationship during network maintenance, how to make a portal relationship read-only at the conclusion of a project, and how to make a portal relationship read-write.

### Prerequisites
* Two clusters running the same Qumulo Core version (7.11.0 or higher)

* A portal relationship in the `Accepted` state

* `PRIVILEGE_PORTAL_HUB_WRITE` on the hub portal host cluster

### To Change the Portal Relationship Type to Suspended
In scenarios such as when the spoke portal host cluster's network undergoes planned maintenance during which spoke portal clients don't require access, the best practice is to change the relationship type to suspended, because the hub portal host cluster is in a relationship with many other spoke portals and because suspending the relationship keeps the network outage from disrupting these other relationships.

{{site.data.alerts.important}}
<ul>
  <li>Spoke portal clients lose access as soon as you begin the portal relationship type change.</li>     
  <li>Similarly to deleting a portal relationship, Qumulo Core first synchronizes outstanding changes from the spoke portal. This can take some time.</li>
  <li>A suspended relationship always reports the <code>Inactive</code> status because the spoke portal host cluster is disconnected from the hub portal host cluster.</li>
  <li>Don't begin planned maintenance until the suspended relationship reports the <code>Suspended</code> type and the <code>Accepted</code> state.</li>
</ul>
{{site.data.alerts.end}}

1. Before planned maintenance begins, on the hub portal host cluster, run the {% include qq.html command="portal_modify_hub" %} command and specify the hub portal ID and the `suspended` type. For example:

   ```bash
   qq portal_modify_hub \
     --id 4 \
     --type suspended
   ```

1. To check whether the portal relationship type change is complete, run the {% include qq.html command="portal_get_hub" %} command.

   {{site.exampleOutput}}

   ```
   Role  ID  Type       State     Status    Peer
   ====  ==  =========  ========  ========  =========
   Hub   4   Suspended  Accepted  Inactive  cluster-a

   Peer Addresses
   ==============
   {{site.exampleIP5}}

   Root State  Local Path
   ==========  ==========
   Authorized  /projects/
   ```

1. When the spoke portal host cluster network comes online, resume the relationship by running the {% include qq.html command="portal_modify_hub" %} command and specifying the relationship type. In this example, we specify `read-write`.

   ```bash
   qq portal_modify_hub \
     --id 4 \
     --type read-write
   ```

   This change takes effect immediately.

   {% include note.html content="The process during which the spoke portal works in the background to apply the changes that it missed while it was suspended can take some time." %}

1. To check that the previous relationship type (in this example, `read-write`) has been restored, run the {% include qq.html command="portal_get_hub" %} command.

   {{site.exampleOutput}}

   ```
   Role  ID  Type  State     Status  Peer
   ====  ==  ====  ========  ======  =========
   Hub   4   RW    Accepted  Active  cluster-a

   Peer Addresses
   ==============
   {{site.exampleIP5}}

   Root State  Local Path
   ==========  ==========
   Authorized  /projects/
   ```

   {% include note.html content="Similarly to [first access to any data](how-portal-creation-enables-cloud-data-fabric.html#data-caching) on a spoke portal, until the spoke portal finishes applying the changes it missed, first client access to a file or directory that changed while the relationship was suspended can take longer than usual." %}

### To Change the Portal Relationship Type to Read-Only
In scenarios such as when a project comes to a close, the best practice is to change a read-write relationship to read-only, to allow spoke portal clients to read the project data.

1. On the hub portal host cluster, run the {% include qq.html command="portal_modify_hub" %} command and specify the hub portal ID and the `read-only` type. For example:

   ```bash
   qq portal_modify_hub \
     --id 4 \
     --type read-only
   ```

   While Qumulo Core synchronizes outstanding changes from the spoke portal, the relationship reports the `Quiescing` state.

   {{site.exampleOutput}}

   ```
   Role  ID  Type  State      Status  Peer
   ====  ==  ====  =========  ======  =========
   Hub   4   RW    Quiescing  Active  cluster-a

   Peer Addresses
   ==============
   {{site.exampleIP5}}

   Root State  Local Path
   ==========  ==========
   Authorized  /projects/
   ```

1. To check whether the portal relationship type change is complete, run the {% include qq.html command="portal_get_hub" %} command.

   The relationship becomes read-only when it reports the `RO` type and the `Accepted` state.

   {{site.exampleOutput}}

   ```
   Role  ID  Type  State     Status  Peer
   ====  ==  ====  ========  ======  =========
   Hub   4   RO    Accepted  Active  cluster-a

   Peer Addresses
   ==============
   {{site.exampleIP5}}

   Root State  Local Path
   ==========  ==========
   Authorized  /projects/
   ```

### To Change the Portal Relationship Type to Read-Write
Run the {% include qq.html command="portal_modify_hub" %} command and specify the `read-write` type.

```bash
qq portal_modify_hub \
  --id 4 \
  --type read-write
```
   
This change takes effect immediately.
