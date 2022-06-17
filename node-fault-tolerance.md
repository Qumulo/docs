---
title: "Increasing Node Fault Tolerance During Node-Add Operations"
summary: "This topic explains how you can increase node fault tolerance during node-add operations."
permalink: node-fault-tolerance.html
sidebar: administrator_guide_sidebar
keywords: node fault tolerance, node failure, fault tolerance, node add, node-add, cluster expansion, expand, reconfiguration
---

This topic explains how you can increase node fault tolerance during node-add operations.

In Qumulo Core 5.1.2 (and lower), you must configure your cluster's node fault tolerance level when you create your cluster. You can't modify this setting afterwards.

In Qumulo Core 5.1.3 (and higher) you can reconfigure data protection to increase an existing cluster's node fault tolerance level during the _cluster expansion_ process.

{{site.data.alerts.important}}
<ul>
  <li>We recommend contacting <a href="https://care.qumulo.com/hc/en-us/articles/115008409408">Qumulo Care</a> to evaluate your expansion options.</li>
  <li>There might be a compromise in usable capacity if, after a node-add operation, your cluster becomes a motley cluster and higher node fault tolerance becomes possible. In this scenario, Qumulo Core maximizes usable capacity by default and offers the option to have a slighly lower increase capacity to increase the node fault tolerance level at the time of the node-add operation.</li>
</ul>
{{site.data.alerts.end}}

## Adding Nodes to Your Cluster after Purchase
The following sections describe node-add operations appropriate for the cluster expansion you decided on during the purchasing process.

### Your Cluster Will not Support Increased Node Fault Tolerance
Follow the instructions to [Add a New Node to an Existing Qumulo Cluster](https://care.qumulo.com/hc/en-us/articles/360001070307) on Qumulo Care. Before you click **Yes** on the **Add &lt;N&gt; nodes to cluster &lt;MyCluster&gt;?**, verify that the projected capacity matches the expected capacity.

### Your Cluster Will Support Increased Node Fault Tolerance without Compromise in Usable Capacity
Follow the instructions to [add nodes to an existing cluster](https://care.qumulo.com/hc/en-us/articles/360001070307). Before clicking the **Yes** button in the Web UI confirmation dialog, verify that the projected capacity matches the expected capacity.

Data protection reconfiguration automatically starts after the expansion succeeds. To monitor the reconfiguration progress, on the **Cluster** > **Overview** page, refer to the rebalance phase status and estimated time to completion. After the restriper completes the provisioning of additional usable capacity and data protection reconfiguration, the data protection status reflects the increased node fault tolerance level.

### Your Cluster Will Support Increased Node Fault Tolerance with Optional Compromise in Usable Capacity

#### Current Node Fault Tolerance with Higher Usable Capacity 
Follow the instructions to [add nodes to an existing cluster](https://care.qumulo.com/hc/en-us/articles/360001070307). Before clicking the **Yes** button in the web UI confirmation dialog, verify that the projected capacity matches the expected capacity.

To monitor the expansion progress, on the **Cluster > Overview** page, refer to the rebalance phase status and estimated time to completion. After the restriper completes the provisioning of additional usable capacity, the data protection status will show the same node fault tolerance level.

#### Increased Node Fault Tolerance with Slightly Lower Increase in Usable Capacity

{% include important.html content="We strongly recommend contacting [Qumulo Care](https://care.qumulo.com/hc/en-us/articles/115008409408) for guidance with the cluster expansion process." %}

Data protection reconfiguration automatically starts after the expansion succeeds. To monitor the reconfiguration progress, on the **Cluster** > **Overview** page, refer to the rebalance phase status and estimated time to completion. After the restriper completes the provisioning of additional usable capacity and data protection reconfiguration, the data protection status reflects the increased node fault tolerance level.
