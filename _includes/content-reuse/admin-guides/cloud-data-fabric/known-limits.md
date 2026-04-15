## General
Currently, it is possible to configure and manage Cloud Data Fabric functionality only by using the `qq` CLI.


## File System
* {{site.gns.crossFileSystem}}

### Spoke Portals
* It is possible to create up to 32 hub portals&mdash;or 32 spoke portals (Qumulo Core 7.5.0.3 and higher)&mdash;on a single Qumulo cluster.

* It isn't possible to nest spoke portal root directories within other spoke portal root directories.

* {{site.gns.functionality762}}

  {% capture functionality762note %}{{site.gns.functionality762note}}{% endcapture %}
  {% include note.html content=functionality762note %}


## Data Caching
* {{site.gns.firstTimeAccess}}

* {{site.gns.ephemeralCache}}


## Portal Connectivity
* {{site.gns.accessConnectivity}}

* {{site.gns.versionRequirement}}


## Portal Relationships
* {{site.gns.multiRelationship}}

  * Currently, Qumulo Core doesn't support a single cluster establishing two portal relationships with the same remote cluster.

* {{site.gns.singleRelationship}}

* Your cluster's Qumulo Core version determines whether the host cluster for each portal relationship must be unique. For example:

  * A spoke portal on Cluster A can propose a relationship to a hub portal on Cluster B.

  * Another spoke portal on Cluster A can propose a relationship to a hub portal on Cluster C.

  * In Qumulo Core 7.5.2 (and higher), it is possible for a spoke portal on Cluster B to propose a relationship to a hub portal on Cluster A or Cluster C (despite Cluster B already having a hub portal).

  * In Qumulo Core versions lower than 7.5.2, another spoke portal on Cluster A can’t propose a relationship to a hub portal on Cluster B, because a relationship of that type between portals on the host clusters already exists.


## Protocols
### S3
* Currently, Qumulo Core allows only partial access to portal data through the S3 protocol, including:

  *  Full read and write access to [cluster-local data](how-portal-creation-enables-cloud-data-fabric.html#cluster-local-data) and [hub portal data](how-portal-creation-enables-cloud-data-fabric.html#hub-portal-data)

  *  Read-only access to [spoke portal data](how-portal-creation-enables-cloud-data-fabric.html#spoke-portal-data)

     {% include note.html content="Attempting to modify [spoke portal data](how-portal-creation-enables-cloud-data-fabric.html#spoke-portal-data) returns an error." %}

* S3 buckets are always _local_ to the Qumulo cluster on which they are created.

  {{site.data.alerts.important}}
  <ul>
    <li>An S3 bucket created in a portal root directory cannot be viewed or accessed from the cluster with which the current cluster has a portal relationship.</li>
    <li>To access <a href="how-portal-creation-enables-cloud-data-fabric.html#spoke-portal-data">spoke portal data</a> through the S3 protocol, it is necessary to create a new bucket on the spoke portal host cluster, even if the corresponding <a href="how-portal-creation-enables-cloud-data-fabric.html#hub-portal-data">hub portal data</a> is already present in an S3 bucket on the hub portal host cluster.</li>
  </ul>
  {{site.data.alerts.end}}

### NFS
* While NFSv3 is a stateless protocol, NFSv4.1 is a stateful protocol which permits open file handles to remain open after a file is unlinked. However, Qumulo Core doesn't always maintain access to files deleted from a portal in a relationship. For example, if you open a file on the spoke portal host cluster and then delete the same file on the hub portal host cluster, an application that uses the file on the spoke portal host cluster will lose access to the file unexpectedly.

* When you authenticate over NFSv4.1 by using Kerberos, you can use Kerberos principals only from the Active Directory domain associated with the Qumulo cluster to which you are connected. It isn't possible to use principals from a remote Qumulo cluster."

* When you edit ACLs over NFSv4.1 by using `editfacl` or similar tools, you can use only Kerberos principals from the Active Directory domain associated with the Qumulo cluster to which you are connected. It isn't possible to use principals from a remote Qumulo cluster.

* {{site.gns.protocolLocking}}
