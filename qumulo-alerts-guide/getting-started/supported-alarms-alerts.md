---
title: "What Alarms and Alerts Qumulo Alerts Supports"
summary: "This section lists the alarms and alerts that Qumulo Alerts collects and processes."
permalink: /qumulo-alerts-guide/getting-started/supported-alarms-alerts.html
redirect_from:
  - /qumulo-alerts-guide/getting-started-qumulo-alerts/alarms-alerts-support.html
sidebar: qumulo_alerts_guide_sidebar
---

## Alarms
The following alarms report hardware changes in a Qumulo cluster.

| Plugin Name | Description              |
|-------------|--------------------------|
| CPU         | Temperature deviation    |
| Disks       | Failure, state change    |
| Fans        | Speed deviation, failure |
| Network     | Link failure             |
| Nodes       | Addition, failure        |

## Alerts
The following alerts report software changes and changes in environmental conditions for a Qumulo cluster.

| Plugin Name | Description                                                               |
|-------------|---------------------------------------------------------------------------|
| AD          | Joining or leaving an Active Directory domain                             |
| Audit       | Auditing enabled or disabled                                              |
| Capacity    | Change in cluster capacity (configured percentage of the entire cluster)  |
| Exports     | NFS exports created, modified, or deleted                                 |
| FTP         | FTP enabled or disabled                                                   |
| Groups      | Local groups added, modified, or deleted                                  |
| Monitoring  | Cloud-based monitoring enabled, disabled, or unreachable                  |
| Quotas      | Quota notification (configured percentage for specified directories)      |
| Restriper   | Restriper started, stopped, or percentage complete                        |
| Shares      | SMB shares added, modified, or deleted                                    |
| Softquotas  | Soft quota notification (configured percentage for specified directories) |
| Users       | Local users added, modified, or deleted                                   |

## Informational
The following informational notifications show performance and status information for a Qumulo cluster.

| Plugin Name | Description                                         |
|-------------|-----------------------------------------------------|
| Metrics     | Performance metrics (throughput, IOPS, and latency) |
| OSUpgrade   | Qumulo Core upgrade                                 |
