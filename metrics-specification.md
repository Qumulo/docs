---
title: Metrics API Specification
permalink: metrics-specification.html
tags:
  - metrics
  - specification
  - openmetrics
sidebar: administrator_guide_sidebar
---

# Metric Types

All the metrics available in the API will be one of three different types defined by the OpenMetrics standards, with each metric type possessing a specific set of functionality. The three different metric types are:

- **Counter**: A monotonically increasing integer value. It starts at zero and cannot be decremented.
- **Gauge**: Like a counter in that it represents a single integer value; however a gauge can be both increased and decreased.
- **Histogram**: A histogram represents a series of "buckets", with each bucket keeping track of all values that occur within a specific range, as well as a count of the total number of measurements made by the histogram. However, in this API histograms will have only one bucket, which will contain the sum of all the values measured by the histogram, as well as the count of those measurements. As a result, this allows a histogram to also keep track of the average value of the measurements, which can be calculated by dividing the sum by the count.

# Labels

The OpenMetrics format also provides a way to label metrics, enabling them to be broken up and categorized based on the different combinations of labels. All metrics will automatically be labeled with `job_name`, which is specified in the `prometheus.yml` configuration file, and `instance`, which will be the hostname and port of the cluster that the metrics are coming from and is also specified in `prometheus.yml`. Any additional labels will be metric-specific, and are listed in the "Additional Labels" column in the table below.

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
