---
title: "How Drive and Node Failure Protection Works in Qumulo Core"
summary: "This section provides an overview of how Qumulo clusters ensure continued operation in the event of a drive or node failure."
permalink: /administrator-guide/node-addition-replacement/how-drive-node-failure-protection-works.html
redirect_from:
  - permalink: /administrator-guide/getting-started/how-drive-node-failure-protection-works.html
sidebar: administrator_guide_sidebar
keywords: drive_failure, node_failure, failure, failure_protection, protection, data_protection
varLow: <span class="emoji">⬇️</span> Low
varMedium: <span class="emoji">⚠️</span> Medium
varHigh: <span class="emoji">🚩</span> High
varDataOK: The data is protected.
varRepDriveAny: You can replace a failed drive at any time.
varReadOnlyRisk: The cluster is at risk of going into read-only mode.
varDataUnavailOK: The data is unavailable but intact.
varMinConfig: This configuration requires a minimum of
varDrX: drive failure
varNoX: node failure
---

## How Qumulo Core Ensures Fault Tolerance
Qumulo Core protects your cluster with a `6,4` [erasure coding](https://qumulo.com/blog/how-to-implement-erasure-coding/) (2 concurrent drive failures or 1 node failure), at minimum. When a drive fails, Qumulo Core begins to rebuild the data that was previously stored on the failed drive.

{% include note.html content="When Qumulo Core finishes reprotecting the drive, it resets the fault tolerance for the cluster, regardless of whether you have replaced the failed drive." %}

As a cluster increases in size, Qumulo Core makes additional fault tolerance options available during the cluster creation process. After creating a cluster, you can use [Adaptive Data Protection](../node-addition-replacement/adding-nodes-adaptive-data-protection.html) to include the cluster's fault tolerance during node-add procedures.

{% include note.html content="Depending on a cluster's size constraints, certain configurations (such as 1 concurrent drive failure or 4 node failures) might not be possible." %}

To view the fault tolerance of your Qumulo cluster:

* **Web UI:** Navigate to the **Cluster Overview** page

* **`qq` CLI:** Use the `qq protection_status_get` command

* **REST API:** Call the `/v1/cluster/protection/status` endpoint

### Read-Only Mode Scenario for Hybrid Nodes
When a hybrid node goes offline for a substantial period of time, there is a risk of the node entering read-only mode because Qumulo Core writes all inbound operations only to the node's SSDs.

The length of time before this scenario takes place depends on the number of drives in a node and the rate of incoming writes, deletes, and changes. For more information, see [Understanding Offline Nodes and Checking for Free Space](../node-addition-replacement/understanding-offline-nodes.html). If you encounter this scenario, {{site.contactQumuloCare}}.

The following sections describe various drive and node failure protection configurations and how they correspond to failure scenarios and data protection states.

## 2-Drive, 1-Node Protection (2,1)
This is the default system configuration. {{page.varMinConfig}} 4 nodes.

<table>
  <thead>
    <tr>
      <th width="43.5%">Failure Scenario</th>
      <th width="13%">Severity</th>
      <th width="43.5%">Data Protection State</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1 drive failure</td>
      <td>{{page.varLow}}</td>
      <td>{{page.varDataOK}} {{page.varRepDriveAny}}</td>
    </tr>
    <tr>
      <td>2 drive failures</td>
      <td>{{page.varMedium}}</td>
      <td>{{page.varDataOK}} {{page.varRepDriveAny}}</td>
    </tr>
    <tr>
      <td>1 node failure</td>
      <td>{{page.varHigh}}</td>
      <td>{{page.varDataOK}} {{page.varReadOnlyRisk}}</td>
    </tr>
    <tr>
      <td>
        3 (or more) drive failures
        or multiple node failures
      </td>
      <td>{{page.varHigh}}</td>
      <td>{{page.varDataUnavailOK}}</td>
    </tr>
  </tbody>    
</table>

## 3-Drive, 1-Node Protection (3,1)
This configuration requires a minimum of 5 nodes.

<table>
  <thead>
    <tr>
      <th width="43.5%">Failure Scenario</th>
      <th width="13%">Severity</th>
      <th width="43.5%">Data Protection State</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1 drive failure</td>
      <td>{{page.varLow}}</td>
      <td>{{page.varDataOK}} {{page.varRepDriveAny}}</td>
    </tr>
    <tr>
      <td>2 drive failures</td>
      <td>{{page.varMedium}}</td>
      <td>{{page.varDataOK}} {{page.varRepDriveAny}}</td>
    </tr>
    <tr>
      <td>3 drive failures</td>
      <td>{{page.varMedium}}</td>
      <td>{{page.varDataOK}} {{page.varRepDriveAny}}</td>
    </tr>
    <tr>
      <td>1 node failure</td>
      <td>{{page.varHigh}}</td>
      <td>{{page.varDataOK}} {{page.varReadOnlyRisk}}</td>
    </tr>
    <tr>
      <td>
        4 (or more) drive failures<br>
        or multiple node failures
      </td>
      <td>{{page.varHigh}}</td>
      <td>{{page.varDataUnavailOK}}</td>
    </tr>
  </tbody>    
</table>

## 3-Drive, 2-Node Protection (3,2)
{{page.varMinConfig}} 11 nodes.

<table>
  <thead>
    <tr>
      <th width="43.5%">Failure Scenario</th>
      <th width="13%">Severity</th>
      <th width="43.5%">Data Protection State</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1 drive failure</td>
      <td>{{page.varLow}}</td>
      <td>{{page.varDataOK}} {{page.varRepDriveAny}}</td>
    </tr>
    <tr>
      <td>2 drive failure</td>
      <td>{{page.varLow}}</td>
      <td>{{page.varDataOK}} {{page.varRepDriveAny}}</td>
    </tr>
    <tr>
      <td>3 drive failures</td>
      <td>{{page.varMedium}}</td>
      <td>{{page.varDataOK}} {{page.varRepDriveAny}}</td>
    </tr>
    <tr>
      <td>1 node failure</td>
      <td>{{page.varHigh}}</td>
      <td>{{page.varDataOK}} {{page.varReadOnlyRisk}}</td>
    </tr>
    <tr>
      <td>2 node failures</td>
      <td>{{page.varHigh}}</td>
      <td>{{page.varDataOK}} {{page.varReadOnlyRisk}}</td>
    </tr>
    <tr>
      <td>
        4 (or more) drive failures<br>
        or more than 2 node failures
      </td>
      <td>{{page.varHigh}}</td>
      <td>{{page.varDataUnavailOK}}</td>
    </tr>
  </tbody>    
</table>

## 3-Drive, 3-Node Protection (3,3)
{{page.varMinConfig}} 11 nodes.

<table>
  <thead>
    <tr>
      <th width="43.5%">Failure Scenario</th>
      <th width="13%">Severity</th>
      <th width="43.5%">Data Protection State</th>
    </tr>
  </thead>
  <tbody>  
    <tr>
      <td>1 drive failure</td>
      <td>{{page.varLow}}</td>
      <td>{{page.varDataOK}} {{page.varRepDriveAny}}</td>
    </tr>
    <tr>
      <td>2 drive failures</td>
      <td>{{page.varLow}}</td>
      <td>{{page.varDataOK}} {{page.varRepDriveAny}}</td>
    </tr>
    <tr>
      <td>3 drive failures</td>
      <td>{{page.varMedium}}</td>
      <td>{{page.varDataOK}} {{page.varRepDriveAny}}</td>
    </tr>
    <tr>
      <td>1 node failure</td>
      <td>{{page.varHigh}}</td>
      <td>{{page.varDataOK}} {{page.varReadOnlyRisk}}</td>
    </tr>
    <tr>
      <td>2 node failures</td>
      <td>{{page.varHigh}}</td>
      <td>{{page.varDataOK}} {{page.varReadOnlyRisk}}</td>
    </tr>
    <tr>
      <td>3 node failures</td>
      <td>{{page.varHigh}}</td>
      <td>{{page.varDataOK}} {{page.varReadOnlyRisk}}</td>
    </tr>
    <tr>
      <td>
        4 (or more) drive failure<br>
        or more than 3 node failures
      </td>
      <td>{{page.varHigh}}</td>
      <td>{{page.varDataUnavailOK}}</td>
    </tr>
  </tbody>
</table>

## 4-Drive, 2-Node Protection (4,2)
{{page.varMinConfig}} 12 nodes.

<table>
  <thead>
    <tr>
      <th width="43.5%">Failure Scenario</th>
      <th width="13%">Severity</th>
      <th width="43.5%">Data Protection State</th>
    </tr>
  </thead>
  <tbody>  
    <tr>
      <td>1 drive failure</td>
      <td>{{page.varLow}}</td>
      <td>{{page.varDataOK}} {{page.varRepDriveAny}}</td>
    </tr>
    <tr>
      <td>2 drive failures</td>
      <td>{{page.varLow}}</td>
      <td>Data is protected. You may replace a failed drive at any time.</td>
    </tr>
    <tr>
      <td>3 drive failures</td>
      <td>{{page.varMedium}}</td>
      <td>Data is protected. You may replace a failed drive at any time.</td>
    </tr>
    <tr>
      <td>4 drive failures</td>
      <td>{{page.varMedium}}</td>
      <td>Data is protected. You may replace a failed drive at any time.</td>
    </tr>
    <tr>
      <td>1 node failure</td>
      <td>{{page.varHigh}}</td>
      <td>{{page.varDataOK}} {{page.varReadOnlyRisk}}</td>
    </tr>
    <tr>
      <td>2 node failures</td>
      <td>{{page.varHigh}}</td>
      <td>{{page.varDataOK}} {{page.varReadOnlyRisk}}</td>
    </tr>
    <tr>
      <td>
        5 (or more) drive failures<br>
        or more than 2 node failures
      </td>
      <td>{{page.varHigh}}</td>
      <td>{{page.varDataUnavailOK}}</td>
    </tr>
  </tbody>
</table>

## 4-Drive, 3-Node Protection (4,3)
{{page.varMinConfig}} 24 nodes.

<table>
  <thead>
    <tr>
      <th width="43.5%">Failure Scenario</th>
      <th width="13%">Severity</th>
      <th width="43.5%">Data Protection State</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1 drive failure</td>
      <td>{{page.varLow}}</td>
      <td>{{page.varDataOK}} {{page.varRepDriveAny}}</td>
    </tr>
    <tr>
      <td>2 drive failures</td>
      <td>{{page.varLow}}</td>
      <td>{{page.varDataOK}} {{page.varRepDriveAny}}</td>
    </tr>
    <tr>
      <td>3 drive failures</td>
      <td>{{page.varMedium}}</td>
      <td>{{page.varDataOK}} {{page.varRepDriveAny}}</td>
    </tr>
    <tr>
      <td>4 drive failures</td>
      <td>{{page.varMedium}}</td>
      <td>{{page.varDataOK}} {{page.varRepDriveAny}}</td>
    </tr>
    <tr>
      <td>1 node failure</td>
      <td>{{page.varHigh}}</td>
      <td>{{page.varDataOK}} {{page.varReadOnlyRisk}}</td>
    </tr>
    <tr>
      <td>2 node failures</td>
      <td>{{page.varHigh}}</td>
      <td>{{page.varDataOK}} {{page.varReadOnlyRisk}}</td>
    </tr>
    <tr>
      <td>3 node failures</td>
      <td>{{page.varHigh}}</td>
      <td>{{page.varDataOK}} {{page.varReadOnlyRisk}}</td>
    </tr>
    <tr>
      <td>
        5 (or more) drive failure<br>
        or more than 3 node failure
      </td>
      <td>{{page.varHigh}}</td>
      <td>{{page.varDataUnavailOK}}</td>
    </tr>
  </tbody>
</table>

## 4-Drive, 4-Node Protection (4,4)
{{page.varMinConfig}} 24 nodes.

<table>
  <thead>
    <tr>
      <th width="43.5%">Failure Scenario</th>
      <th width="13%">Severity</th>
      <th width="43.5%">Data Protection State</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1 drive failure</td>
      <td>{{page.varLow}}</td>
      <td>{{page.varDataOK}} {{page.varRepDriveAny}}</td>
    </tr>
    <tr>
      <td>2 drive failures</td>
      <td>{{page.varLow}}</td>
      <td>{{page.varDataOK}} {{page.varRepDriveAny}}</td>
    </tr>
    <tr>
      <td>3 drive failures</td>
      <td>{{page.varMedium}}</td>
      <td>{{page.varDataOK}} {{page.varRepDriveAny}}</td>
    </tr>
    <tr>
      <td>4 drive failures</td>
      <td>{{page.varMedium}}</td>
      <td>{{page.varDataOK}} {{page.varRepDriveAny}}</td>
    </tr>
    <tr>
      <td>1 node failure</td>
      <td>{{page.varHigh}}</td>
      <td>{{page.varDataOK}} {{page.varReadOnlyRisk}}</td>
    </tr>
    <tr>
      <td>2 node failures</td>
      <td>{{page.varHigh}}</td>
      <td>{{page.varDataOK}} {{page.varReadOnlyRisk}}</td>
    </tr>
    <tr>
      <td>3 node failures</td>
      <td>{{page.varHigh}}</td>
      <td>{{page.varDataOK}} {{page.varReadOnlyRisk}}</td>
    </tr>
    <tr>
      <td>4 node failures</td>
      <td>{{page.varHigh}}</td>
      <td>{{page.varDataOK}} {{page.varReadOnlyRisk}}</td>
    </tr>
    <tr>
      <td>
        5 (or more) drive failures<br>
        or more than 4 node failures
      </td>
      <td>{{page.varHigh}}</td>
      <td>{{page.varDataUnavailOK}}</td>
    </tr>
  </tbody>
</table>
