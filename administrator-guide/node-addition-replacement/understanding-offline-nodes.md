---
title: "Understanding Offline Qumulo Core Nodes and Checking for Free Space"
summary: "This section explains what happens when a Qumulo Core node goes offline and how you can check the remaining free space."
permalink: /administrator-guide/node-addition-replacement/understanding-offline-nodes.html
redirect_from:
  - /administrator-guide/data-security/understanding-offline-nodes.html
  - /administrator-guide/protecting-data/understanding-offline-nodes.html
  - /administrator-guide/qumulo-core/understanding-offline-nodes.html
sidebar: administrator_guide_sidebar
---

## What Happens When a Qumulo Core Node Goes Offline
Qumulo Core uses _erasure coding_ to let multiple drives or nodes to go offline but continue to serve data. For more information, see [Qumulo Drive Failure Protection](https://care.qumulo.com/hc/en-us/articles/115014383267) on Qumulo Care.

Qumulo Core attempts to maintain cluster functionality for as long as possible. When a hybrid node (that has both HDDs and SSDs) goes offline, the cluster evicts existing data promoted to SSDs on the remaining nodes and makes all writes to the free space on the SSDs. When the node comes online, Qumulo Core begins to push writes to the HDDs that back the SSDs.

{% include important.html content="Writes, deletes, and changes count towards SSD space. For more information, see [Checking Remaining Free Space on Your Cluster](#checking-remaining-free-space-on-your-cluster)." %}

A cluster can operate with an offline node until its SSD space fills up. When a cluster has no more free space, the cluster goes into read-only (`ENOSPC`) state until the node comes back online and all nodes rejoin the quorum.

{% include note.html content="The amount of time that users have before the cluster enters the `ENOSPC` state depends on the rate at which data is being added to, or modified within, the cluster." %}
