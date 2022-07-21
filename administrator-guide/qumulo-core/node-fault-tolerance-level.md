---
title: "Increasing the Node-Fault-Tolerance Level for Your Cluster During Node-Add Operations"
summary: "This topic explains how you can increase the node-fault-tolerance level for your cluster during node-add operations."
permalink: /administrator-guide/qumulo-core/node-fault-tolerance-level.html
sidebar: administrator_guide_sidebar
keywords: node-fault-tolerance level, node failure, fault tolerance, node add, node-add, cluster expansion, expand, reconfiguration
varAddNode: 1. Follow the instructions in [Add a New Node to an Existing Qumulo Cluster](https://care.qumulo.com/hc/en-us/articles/360001070307) on Qumulo Care.
varCheckCapacity: 1. Before you click **Yes** in the **Add &lt;N&gt; nodes to cluster &lt;MyCluster&gt;?** dialog box, check that the projected capacity matches the expected capacity.
varPostExpansion: After the cluster expansion process finishes, Qumulo Core begins data protection reconfiguration automatically.
varMonitorProgress: To monitor this process, click **Cluster > Overview**. On the **Cluster** page, in the protection status section, you can view the rebalance phase status and the estimated time to completion.
varValidateReconfig: When the restriper completes the provisioning of additional usable capacity and data protection reconfiguration, the **Data Protected** section shows the increased node-fault-tolerance level.
varValidateNoReconfig: When the restriper completes the provisioning of additional usable capacity, the **Data Protected** section shows the same node-fault-tolerance level as before node-add.
---

This topic explains how you can increase the node-fault-tolerance level for your cluster during node-add operations.

## Reconfiguring Your Cluster's Node-Fault-Tolerance Level
* In Qumulo Core 5.1.2 (and lower), you must configure the node-fault-tolerance level for your cluster when you create the cluster. You can't modify this setting afterwards.
* In Qumulo Core 5.1.3 (and higher), you can reconfigure data protection to increase the node-fault-tolerance level for an existing cluster during the _cluster expansion_ process.

{{site.data.alerts.important}}
<ul>
  <li>We strongly recommend contacting <a href="https://care.qumulo.com/hc/en-us/articles/115008409408">Qumulo Care</a> before proceeding with cluster expansion.</li>
  <li>In the following scenarios, Qumulo Core maximizes the usable capacity by default but offers the option to increase the node-fault-tolerance level during the node-add operation by means of a trade-off in the increase of usable capacity.
    <ul>
      <li>Your cluster is already heterogeneous.</li>
      <li>Your cluster becomes heterogeneous after a node-add operation.</li>
    </ul>
  </li>
</ul>
{{site.data.alerts.end}}

## Adding Nodes to Your Cluster
The following sections describe node-add scenarios for various cluster configurations. Identify the scenario that applies to the cluster expansion option that you selected during the purchasing process.

### Your Cluster Won't Support an Increased Node-Fault-Tolerance Level
{{page.varAddNode}}

{{page.varCheckCapacity}}

{{page.varMonitorProgress}}

{{page.varValidateNoReconfig}}

### Your Cluster Will Support an Increased Node-Fault-Tolerance Level without a Trade-Off in the Increase of Usable Capacity
{{page.varAddNode}}

{{page.varCheckCapacity}}

{{page.varPostExpansion}}

{{page.varMonitorProgress}}

{{page.varValidateReconfig}}

### Your Cluster Will Support an Increased Node-Fault-Tolerance Level with a Trade-Off in the Increase of Usable Capacity
This scenario lets you choose one of the following options.

#### Maintain the Current Node-Fault-Tolerance Level
{{page.varAddNode}}

{{page.varCheckCapacity}}

{{page.varMonitorProgress}}

{{page.varValidateNoReconfig}}

#### Increase the Node-Fault-Tolerance Level
To begin the node-add operation, contact <a href="https://care.qumulo.com/hc/en-us/articles/115008409408">Qumulo Care</a>.

{{page.varPostExpansion}}

{{page.varMonitorProgress}}

{{page.varValidateReconfig}}
