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
- **Histogram**: A histogram represents a series of "buckets", with each bucket keeping track of all values that occur within its own specific range. They also have a "count" field and a "sum" field, stored in `<metric_name>_count` and `<metric_name>_sum`. These fields contain the total number of samples and the total sum of all the samples, respectively. The main use of histograms in this API is to provide a convenient way to keep track of averages, which can be calculated by dividing the "sum" field by the "count" field.

For more details on these and other OpenMetrics types, see the [OpenMetrics specification](https://github.com/OpenObservability/OpenMetrics/blob/main/specification/OpenMetrics.md#metric-types).

# Labels

The OpenMetrics format also provides a way to label metrics, enabling them to be broken up and categorized based on the different combinations of labels. If using Prometheus, all metrics will automatically be labeled with `job_name`, which is specified in the `prometheus.yml` configuration file, and `instance`, which will be the hostname and port of the cluster that the metrics are coming from and is also specified in `prometheus.yml`. Any additional labels will be metric-specific, and are listed in the "Labels" column in the table below.

# Available Metrics

<table>
  <thead>
    <tr>
      <th>Metric Name</th>
      <th>Metric Type</th>
      <th>Labels</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>qumulo_quorum_node_is_offline</code></td>
      <td>Gauge</td>
      <td>
        <ul>
          <li><code>node_id</code></li>
        </ul>
      </td>
      <td>The online status of each node in the cluster. The value will be either a 0 or a 1, with 0 representing a node being online, and 1 representing an offline node.</td>
    </tr>
    <tr>
      <td><code>qumulo_fs_capacity_bytes</code></td>
      <td>Gauge</td>
      <td>None</td>
      <td>The total amount of space in the cluster, in bytes.</td>
    </tr>
    <tr>
      <td><code>qumulo_fs_free_bytes</code></td>
      <td>Gauge</td>
      <td>None</td>
      <td>The amount of free space available in the cluster, in bytes.</td>
    </tr>
    <tr>
      <td><code>qumulo_fs_directory_used_bytes</code></td>
      <td>Gauge</td>
      <td>
        <ul>
          <li><code>path</code></li>
          <li><code>usage_type</code></li>
        </ul>
      </td>
      <td>The amount of space being used, broken up by the type of object using the data, in bytes.</td>
    </tr>
    <tr>
      <td><code>qumulo_fs_directory_tree_entries</code></td>
      <td>Gauge</td>
      <td>
        <ul>
          <li><code>path</code></li>
          <li><code>entry_type</code></li>
        </ul>
      </td>
      <td>The number of file system objects in the cluster, broken up by type of object.</td>
    </tr>
    <tr>
      <td><code>qumulo_protocol_operations</code></td>
      <td>Counter</td>
      <td>
        <ul>
          <li><code>op_name</code></li>
          <li><code>protocol</code></li>
          <li><code>data_type</code></li>
          <li><code>io_type</code></li>
          <li><code>server_ip</code></li>
        </ul>
      </td>
      <td>The number of protocol operations that have been completed.</td>
    </tr>
        <tr>
      <td><code>qumulo_protocol_bytes</code></td>
      <td>Counter</td>
      <td>
        <ul>
          <li><code>op_name</code></li>
          <li><code>protocol</code></li>
          <li><code>data_type</code></li>
          <li><code>io_type</code></li>
          <li><code>server_ip</code></li>
        </ul>
      </td>
      <td>Amount of bytes transferred by different protocol operations.</td>
    </tr>
        <tr>
      <td><code>qumulo_protocol_latency_seconds</code></td>
      <td>Histogram</td>
      <td>
        <ul>
          <li><code>op_name</code></li>
          <li><code>protocol</code></li>
          <li><code>data_type</code></li>
          <li><code>io_type</code></li>
          <li><code>server_ip</code></li>
        </ul>
      </td>
      <td>The total latency during protocol operations. The "count" field will contain the total number of each operation, and the single bucket will contain the total latency for that operation.</td>
    </tr>
  </tbody>
</table>
