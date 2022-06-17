---
title: "Increasing Node Fault Tolerance During Node-Add Operations"
summary: "This topic explains how you can increase node fault tolerance during node-add operations."
permalink: node-fault-tolerance.html
sidebar: administrator_guide_sidebar
keywords: node fault tolerance, node failure, fault tolerance, node add, node-add, cluster expansion, expand, reconfiguration
varAddNode: 1. Follow the instructions in [Add a New Node to an Existing Qumulo Cluster](https://care.qumulo.com/hc/en-us/articles/360001070307) on Qumulo Care.
varCheckCapacity: 1. Before you click **Yes** in the **Add &lt;N&gt; nodes to cluster &lt;MyCluster&gt;?** dialog box, check that the projected capacity matches the expected capacity.
varPostExpansion: After the cluster expansion process finishes, Qumulo Core begins data protection reconfiguration automatically. To monitor this process, click **Cluster > Overview**. On the **Cluster** page, in the protection status section, you can view the rebalance phase status and the estimated time to completion.
---

This topic explains how you can increase node fault tolerance during node-add operations.

## Reconfiguring Your Cluster's Node Fault Tolerance
* In Qumulo Core 5.1.2 (and lower), you must configure your cluster's node fault tolerance level when you create your cluster. You can't modify this setting afterwards.
* In Qumulo Core 5.1.3 (and higher) you can reconfigure data protection to increase an existing cluster's node fault tolerance level during the _cluster expansion_ process.

{{site.data.alerts.important}}
<ul>
  <li>We strongly recommend contacting <a href="https://care.qumulo.com/hc/en-us/articles/115008409408">Qumulo Care</a> to learn more about the cluster expansion process.</li>
  <li>There might be a compromise in usable capacity if your cluster is already is a motley cluster or if, after a node-add operation, it becomes a motley cluster and higher node fault tolerance becomes possible. In these scenarios, Qumulo Core maximizes usable capacity by default and offers the option to have a slighly lower increase capacity to increase the node fault tolerance level at the time of the node-add operation.</li>
</ul>
{{site.data.alerts.end}}

## Adding Nodes to Your Cluster
The following sections describe node-add scenarios for different cluster configurations. Choose the scenario appropriate for the cluster expansion that you decided on during the purchasing process.

### Your Cluster Will not Support Increased Node Fault Tolerance
{{page.varAddNode}}

{{page.varCheckCapacity}}

### Your Cluster Will Support Increased Node Fault Tolerance without Compromise in Usable Capacity
{{page.varAddNode}}

{{page.varCheckCapacity}}

{{page.varPostExpansion}} When the restriper completes the provisioning of additional usable capacity and data protection reconfiguration, the **Data Protected** section shows the increased node fault tolerance level.

### Your Cluster Will Support Increased Node Fault Tolerance with Optional Compromise in Usable Capacity
This scenario lets you choose one of the following options.

#### Current Node Fault Tolerance with Higher Usable Capacity 
{{page.varAddNode}}

{{page.varCheckCapacity}}

{{page.varPostExpansion}} When the restriper completes the provisioning of additional usable capacity and data protection reconfiguration, the **Data Protected** section shows the current node fault tolerance level.

#### Increased Node Fault Tolerance with Slightly Lower Increase in Usable Capacity

{{page.varPostExpansion}} When the restriper completes the provisioning of additional usable capacity and data protection reconfiguration, the **Data Protected** section shows the increased node fault tolerance level.
