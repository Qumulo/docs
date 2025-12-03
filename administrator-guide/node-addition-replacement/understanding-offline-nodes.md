---
title: "Understanding Offline Qumulo Core Nodes"
summary: "This section explains what happens when a Qumulo Core node goes offline."
permalink: /administrator-guide/node-addition-replacement/understanding-offline-nodes.html
redirect_from:
  - /administrator-guide/data-security/understanding-offline-nodes.html
  - /administrator-guide/protecting-data/understanding-offline-nodes.html
  - /administrator-guide/qumulo-core/understanding-offline-nodes.html
sidebar: administrator_guide_sidebar
---

## What Happens When a Qumulo Core Node Goes Offline
Qumulo Core uses _erasure coding_ to let multiple drives or nodes to go offline but continue to serve data. For more information, see [Qumulo Drive Failure Protection](https://care.qumulo.com/hc/en-us/articles/115014383267) on Qumulo Care.

Qumulo Core attempts to maintain cluster functionality for as long as possible:

* **Hybrid Nodes:** When a hybrid node (with both SSDs and HDDs) goes offline, the cluster continues to use SSD space for new data on the remaining nodes. Because it is possible to evict only a portion of this SSD-resident data to HDDs at a later time (the exact proportion depends on the cluster size, configuration, and type of writes), the system can temporarily fill SSDs with data which can't be evicted, potentially causing out-of-space errors until the node comes online and the cluster recovers.

* **All-Flash Nodes:** When an all-flash node goes offline, the cluster writes new data to the SSD free space on the remaining nodes. When the node comes back online and rejoins the cluster, Qumulo Core redistributes data to rebalance capacity and restore protection.

A cluster can operate with an offline node until its SSD space fills up. When a cluster has no more free space, the cluster goes into read-only (`ENOSPC`) state until the node comes back online and all nodes rejoin the quorum.

{% include note.html content="The amount of time that users have before the cluster enters the `ENOSPC` state depends on the rate at which data is being added to or modified within the cluster." %}


## Known Limits for SSD Usage
The following known limits apply to both hybrid and all-flash nodes. However, certain functionality is specific to certain node types.

* **File System Changes:** Writes, deletes, and changes count towards SSD space. However, depending on cluster size and configuration, not all new writes can consume non-reserved SSD space. Qumulo Core might write some data to SSD space reserved for handling degraded file system conditions.

* **Usage During Node Recovery:** Deleting existing data might not cause SSD space usage to decrease immediately because the Qumulo cluster must retain certain data in order to bring the node online safely.

* **Write Priority:** While a hybrid node is offline, the cluster writes data only to SSD space on the remaining nodes.

  {% include note.html content="This is standard functionality for all-flash nodes." %}

* **Temporarily Reduced Capacity:** When a Qumulo cluster uses only SSD space during a node's downtime, it is possible for the cluster to reach its SSD space limits before reaching the full theoretical capacity.

  {% include note.html content="This effect is more apparent on hybrid nodes." %}
