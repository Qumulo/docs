---
title: "Increasing the Node Fault Tolerance Level for Your Qumulo Cluster during Node-Add Operations"
summary: "This section explains how to increase the node fault tolerance level for your Qumulo cluster during node-add operations."
permalink: /administrator-guide/node-addition-replacement/increasing-node-fault-tolerance-level.html
redirect_from:
  - /administrator-guide/protecting-data/increasing-node-fault-tolerance-level.html
  - /administrator-guide/protecting-data/node-fault-tolerance-level.html
  - /administrator-guide/qumulo-core/node-fault-tolerance-level.html
sidebar: administrator_guide_sidebar
---

* In Qumulo Core 5.1.3 (and higher) you can increase the node fault tolerance level for an existing cluster during the cluster expansion process.

* In Qumulo Core 6.1.0.3 (and higher), you can manage the drive and node fault tolerance levels during the cluster expansion process by [changing the data protection configuration](adding-nodes-adaptive-data-protection.html).

{% capture contactQC %}{{site.protectingData.contactQumuloCare}}{% endcapture %}
{% include important.html content=contactQC %}


## To Reconfigure Your Cluster's Node Fault Tolerance Level
1. Follow the instructions in [Adding Nodes to an Existing Qumulo Cluster](adding-nodes-existing-cluster.html).

   {{site.data.alerts.note}}
   <ul>
     <li>When a tradeoff between increasing node fault tolerance and maximizing usable capacity is available for your cluster, the <strong>Cluster &gt; Add Nodes</strong> page shows the <strong>Accept a trade-off in the increase of usable capacity</strong> checkbox.</li>
     <li>When a tradeoff isn't available, the page shows an message which indicates that it is possible to increase the node fault tolerance level.</li>
   </ul>
   {{site.data.alerts.end}}

{{site.protectingData.checkCapacity}}

1. After the cluster expansion process finishes, Qumulo Core begins data protection reconfiguration automatically.

{{site.protectingData.monitorProcess}}

1. When the restriper completes the data protection reconfiguration, the **Data Protected** section of the **Cluster** page shows the increased node fault tolerance level.
