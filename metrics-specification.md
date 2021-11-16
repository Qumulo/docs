---
title: Metrics API Specification
permalink: metrics-specifications.html
tags:
  - metrics
  - specifications
  - openmetrics
sidebar: administrator_guide_sidebar
---

# Available Metrics

| Metric Name | Metric Type | Additional Labels | Value Type | Description |
|---|---|---|---|---|
| `qumulo_quorum_node_is_offline` | Gauge | <ul><li>`node_id`</li></ul> | Either 0 or 1:<br><ul><li>0: node is online</li><li>1: node is offline</li></ul> | The online status of each node in the cluster. |
| `qumulo_fs_capacity_bytes` | Gauge | None | A positive integer | The total amount of space in the cluster. |
| `qumulo_fs_free_bytes` | Gauge | None | A positive integer | The amount of free space available in the cluster. |
| `qumulo_fs_directory_used_bytes` | Gauge | <ul><li>`path`</li><li>`usage_type`</li></ul> | A positive integer | The amount of space being used, broken up by the type of object using the data. |
| `qumulo_fs_directory_tree_entries` | Gauge | <ul><li>`path`</li><li>`entry_type`</li></ul> | A positive integer | The number of file system objects in the cluster, broken up by type of object. |
| `qumulo_protocol_operations` | Counter | <ul><li>`op_name`</li><li>`protocol`</li><li>`data_type`</li><li>`io_type`</li><li>`server_ip`</li></ul> | A positive integer | The number of protocol operations that have been completed. |
| `qumulo_protocol_bytes` | Counter | <ul><li>`op_name`</li><li>`protocol`</li><li>`data_type`</li><li>`io_type`</li><li>`server_ip`</li></ul> | A positive integer | Amount of bytes transferred by protocol. |
| `qumulo_protocol_latency_seconds` | Histogram | <ul><li>`op_name`</li><li>`protocol`</li><li>`data_type`</li><li>`io_type`</li><li>`server_ip`</li></ul> | Contains a total count of measurements and a single bucket:<br><ul><li>Count: A positive integer</li><li>Bucket: A positive float value</li></ul> | The total latency during protocol operations. |
