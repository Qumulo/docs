---
title: "Increasing Node Fault Tolerance During Node-Add Operations"
summary: "This topic explains how you can increase node fault tolerance during node-add operations."
permalink: node-fault-tolerance.html
sidebar: administrator_guide_sidebar
keywords: node fault tolerance, node failure, fault tolerance, node add, node-add, cluster expansion, expand, reconfiguration
---
Prior to Qumulo Core 5.1.3, a cluster's node fault tolerance level is configured at cluster creation
time and cannot be modified. The software now enables reconfiguring data protection to increase an
existing cluster's node fault tolerance level as part of cluster expansion.

**Note**: There may be a usable capacity trade-off if the cluster after node-add is heterogeneous and
feasible for higher node fault tolerance. In this case, the software defaults to maximize usable
capacity and offers an option to trade-off usable capacity for higher node fault tolerance level at
the time of node-add.

If node purchase happened before this feature was available and you would like to learn more before
adding the new nodes, you can reach out to CS to understand if your purchased nodes are feasible for
this feature.

The following sections explain how to add new nodes to an existing cluster and ensure increased node
fault tolerance once node purchase and delivery are complete. Find the section that describes your
cluster after expansion.

## Does not support higher node fault tolerance
Follow the instructions to [add nodes to an existing cluster](https://care.qumulo.com/hc/en-us/articles/360001070307-Add-a-New-Node-to-an-Existing-Qumulo-Cluster). Before clicking the **Yes** button in the web UI confirmation dialog, verify that the projected capacity matches the expected capacity.

## Supports higher node fault tolerance without usable capacity trade-off
Follow the instructions to [add nodes to an existing cluster](https://care.qumulo.com/hc/en-us/articles/360001070307-Add-a-New-Node-to-an-Existing-Qumulo-Cluster). Before clicking the **Yes** button in the web UI confirmation dialog, verify that the projected capacity matches the expected capacity.

Data protection reconfiguration automatically starts after the expansion succeeds. To monitor the reconfiguration progress, on the **Cluster** > **Overview** page, refer to the rebalance phase status and estimated time to completion. After the restriper completes the provisioning of additional usable capacity and data protection reconfiguration, the data protection status reflects the increased node fault tolerance level.


## Supports higher node fault tolerance with capacity trade-off and you choose to optimize for higher usable capacity
Follow the instructions to [add nodes to an existing cluster](https://care.qumulo.com/hc/en-us/articles/360001070307-Add-a-New-Node-to-an-Existing-Qumulo-Cluster). Before clicking the **Yes** button in the web UI confirmation dialog, verify that the projected capacity matches the expected capacity.

To monitor the expansion progress, on the **Cluster** > **Overview** page, refer to the rebalance phase status and estimated time to completion. After the restriper completes the provisioning of additional usable capacity, the data protection status will show the same node fault tolerance level.

## Supports higher node fault tolerance with capacity trade-off and you choose to optimize for higher node fault tolerance

**Important**: Contact Customer Success to guide you through the expansion process.

Data protection reconfiguration automatically starts after the expansion succeeds. To monitor the reconfiguration progress, on the **Cluster** > **Overview** page, refer to the rebalance phase status and estimated time to completion. After the restriper completes the provisioning of additional usable capacity and data protection reconfiguration, the data protection status reflects the increased node fault tolerance level.
