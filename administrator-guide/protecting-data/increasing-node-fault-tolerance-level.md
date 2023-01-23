---
title: "Increasing the Node-Fault-Tolerance Level for Your Qumulo Cluster During Node-Add Operations"
summary: "This section explains how to increase the node-fault-tolerance level for your Qumulo cluster during node-add operations."
permalink: /administrator-guide/protecting-data/increasing-node-fault-tolerance-level.html
redirect_from:
  - /administrator-guide/protecting-data/node-fault-tolerance-level.html
  - /administrator-guide/qumulo-core/node-fault-tolerance-level.html
sidebar: administrator_guide_sidebar
keywords: node-fault-tolerance level, node failure, fault tolerance, node add, node-add, cluster expansion, expand, reconfiguration
varPostExpansion: After the cluster expansion process finishes, Qumulo Core begins data protection reconfiguration automatically.
varValidateReconfig: When the restriper completes the provisioning of additional usable capacity and data protection reconfiguration, the **Data Protected** section shows the increased node-fault-tolerance level.
varValidateNoReconfig: When the restriper completes the provisioning of additional usable capacity, the **Data Protected** section shows the same node-fault-tolerance level as before the node-add operation.
---

## Reconfiguring Your Cluster's Node-Fault-Tolerance Level
While in previous versions of Qumulo Core you couldn't modify the node-fault-tolerance level for your cluster after creating it, in Qumulo Core 5.1.3 (and higher) you can increase the node-fault-tolerance level for an existing cluster during the _cluster expansion_ process. In addition to this, in Qumulo Core 5.3.4 (and higher), you can [change the adaptive data protection configuration](changing-adaptive-data-protection-configuration.md) to manage the disk- and node-fault-tolerance level during the cluster expansion process.

{{site.data.alerts.important}}
<ul>
  <li>{{site.protectingData.contactQumuloCare}}</li>
  <li>In the following scenarios, Qumulo Core maximizes the usable capacity by default but offers the option to increase the node-fault-tolerance level during the node-add operation by means of a trade-off in the increase of usable capacity.
    <ul>
      <li>Your cluster is already heterogeneous.</li>
      <li>Your cluster becomes heterogeneous after a node-add operation.</li>
    </ul>
  </li>
</ul>
{{site.data.alerts.end}}

## Cluster Expansion Scenarios
The following sections describe node-add scenarios for various cluster configurations. Identify the scenario that applies to the cluster expansion option that you selected during the purchasing process.

### Your Cluster Won't Support an Increased Node-Fault-Tolerance Level
{{site.protectingData.followAddNodeInstructions}}

{{site.protectingData.checkCapacity}}

{{site.protectingData.monitorProcess}}

{{page.varValidateNoReconfig}}

### Your Cluster Will Support an Increased Node-Fault-Tolerance Level without a Trade-Off in the Increase of Usable Capacity
{{site.protectingData.followAddNodeInstructions}}

{{site.protectingData.checkCapacity}}

   {{page.varPostExpansion}}

{{site.protectingData.monitorProcess}}

{{page.varValidateReconfig}}

### Your Cluster Will Support an Increased Node-Fault-Tolerance Level with a Trade-Off in the Increase of Usable Capacity
This scenario lets you choose one of the following strategies.

#### Maintain the Current Node-Fault-Tolerance Level
{{site.protectingData.followAddNodeInstructions}}

{{site.protectingData.checkCapacity}}

{{site.protectingData.monitorProcess}}

{{page.varValidateNoReconfig}}

#### Increase the Node-Fault-Tolerance Level
1. To begin the node-add operation, contact <a href="https://care.qumulo.com/hc/en-us/articles/115008409408">Qumulo Care</a>.

   {{page.varPostExpansion}}

{{site.protectingData.monitorProcess}}

{{page.varValidateReconfig}}
