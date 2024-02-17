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

On hybrid Qumulo nodes (that have HDDs and SSDs), Qumulo Core attempts to maintain cluster functionality for as long as possible. When a node goes offline, the cluster evicts existing data promoted to SSDs on the remaining nodes and makes all writes to the free space on the SSDs. When the node comes online, Qumulo Core begins to push writes to the HDDs that back the SSDs.

{% include important.html content="Writes, deletes, and changes count towards SSD space. For more information, see [Checking Remaining Free Space on Your Cluster](#checking-remaining-free-space-on-your-cluster)." %}

A cluster can operate with an offline node until its SSD space fills up. When a cluster has no more free space, the cluster goes into read-only (`ENOSPC`) state until the node comes back online and all nodes rejoin the quorum.

{% include note.html content="The amount of time that users have before the cluster enters the `ENOSPC` state depends on the rate of change in new rates to the cluster." %}

## Checking Remaining Free Space on Your Cluster
You can estimate the amount of time before your cluster enters the `ENOSPC` state by running multiple iterations of the `debug_metrics_get` command (`metrics_get` in Qumulo Core 4.2.0 and lower) on every node in your cluster.

The output of the command shows the number of valid tokens remaining for writes to the cluster. At 50,000 (or fewer) tokens, an `ENOSPC` event is imminent.

{% include note.html content="Because SSD space on the cluster is limited, new writes, deletes, and changes consume any reclaimable tokens." %}

<table>
<thead>
  <tr>
    <th>Qumulo Core Version</th>
    <th>Command</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>4.2.1 (and higher)</td>
    <td><pre>sudo qsh -c /opt/qumulo/qq debug_metrics_get \
  --measurement space_agent | grep reclaimable; sleep 60; \
  sudo qsh -c /opt/qumulo/qq debug_metrics_get \
  --measurement space_agent | grep reclaimable</pre></td>
  </tr>
  <tr>
    <td>3.3.2 - 4.2.0</td>
    <td><pre>sudo qsh -c /opt/qumulo/qq metrics_get \
  --measurement space_agent | grep reclaimable; sleep 60; \
  sudo qsh -c /opt/qumulo/qq metrics_get \
  --measurement space_agent | grep reclaimable</pre></td>
  </tr>   
  <tr>
    <td>3.1 - 3.3.1</td>
    <td><pre>sudo /opt/qumulo/qq metrics_get \
  --measurement space_agent | grep reclaimable; sleep 60; \
  sudo /opt/qumulo/qq metrics_get \
  --measurement space_agent | grep reclaimable</pre></td>
  </tr>     
</tbody>
</table>

You can also {{site.contactQumuloCare}} for a time estimate.
