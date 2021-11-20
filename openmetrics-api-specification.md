---
title: Qumulo OpenMetrics API Specification
permalink: openmetrics-api-specification.html
tags:
  - metrics
  - openmetrics
  - prometheus
  - api
sidebar: administrator_guide_sidebar
---

# Qumulo OpenMetrics API Specification
The Qumulo OpenMetrics API has a single endpoint that provides complete collections of point-in-time telemetry from the Qumulo File Data Platform. Monitoring and metrics systems can consume the OpenMetrics data format that the API emits, without custom code or an agent. For more information about whether you can ingest OpenMetrics or Prometheus data formats natively, see your monitoring system documentation.

This section describes the specification of the types of metrics that the API emits.

## Metric Types
All metrics available in the API belong to one of the three types that the OpenMetrics standard defines. Each metric type has a specific set of functionality. The following are the three metric types:

* **Counter**: A monotonically increasing integer that increases from zero. It isn't possible to decrement this value.

* **Gauge**: A value that represents a single integer (similar to a counter). It is posible to increase or decrease a gauge.

* **Histogram**: A histogram that represents a series of _buckets._ Each bucket keeps track of all values that occur within a specific range. A histogram also has a `count` field and a `sum` field, stored in `<metric_name>_count` (the total number of samples) and `<metric_name>_sum` (the sum of all the samples).
  
  **Note:** Because Qumulo Core doesn't emit any buckets for histogram metrics, you can use histograms to keep track of averages, by dividing the `sum` field by the `count` field.

For more information about these (and other) OpenMetrics types, see [Metric Types](https://github.com/OpenObservability/OpenMetrics/blob/main/specification/OpenMetrics.md#metric-types) in the OpenMetrics Specification.

## Metric Labels
The OpenMetrics format provides a way to label metrics. You can use metric labels to categorize metrics based on different label combinations. If you use Prometheus, all metrics are labeled with the `job_name` and `instance` labels automatically. The `instance` label specifies the host name and port for the cluster that emits the metrics. The two labels are defined in `prometheus.yml`.

Any other labels are metric-specific. For more information, see the **Label** column in [Available Metrics](#available-metrics)

## Available Metrics
The following table gives the name, type, labels, and descriptions for metrics available for Qumulo Core. The table lists specific sets of possible values for labels.

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
      <td><code>qumulo_fs_capacity_bytes</code></td>
      <td>gauge</td>
      <td>&mdash;</td>
      <td>Total space in the cluster, in bytes</td>
    </tr>
    <tr>
      <td><code>qumulo_fs_directory_tree_entries</code></td>
      <td>gauge</td>
      <td>
        <ul>
          <li><code>entry_type</code></li>
          <li><code>path</code></li>
        </ul>
      </td>
      <td>Number of file system objects in the cluster, by object type</td>
    </tr>
    <tr>
      <td><code>qumulo_fs_directory_used_bytes</code></td>
      <td>gauge</td>
      <td>
        <ul>
          <li><code>path</code></li>
          <li><code>usage_type</code></li>
        </ul>
      </td>
      <td>Space that object types use, in bytes</td>
    </tr>
    <tr>
      <td><code>qumulo_fs_free_bytes</code></td>
      <td>gauge</td>
      <td>&mdash;</td>
      <td>Free space in the cluster, in bytes</td>
    </tr>
    <tr>
      <td><code>qumulo_protocol_bytes</code></td>
      <td>counter</td>
      <td>
        <ul>
          <li><code>data_type</code></li>
          <li><code>io_type</code></li>
          <li><code>op_name</code></li>
          <li><code>protocol</code></li>
          <li><code>server_ip</code></li>
        </ul>
      </td>
      <td>Bytes transferred by protocol operations</td>
    </tr>
    <tr>
      <td><code>qumulo_protocol_latency_seconds</code></td>
      <td>histogram</td>
      <td>
        <ul>
          <li><code>data_type</code></li>
          <li><code>io_type</code></li>
          <li><code>op_name</code></li>
          <li><code>protocol</code></li>
          <li><code>server_ip</code></li>
        </ul>
      </td>
      <td>Total latency for protocol operations</td>
    </tr>
    <tr>
      <td><code>qumulo_protocol_operations</code></td>
      <td>counter</td>
      <td>
        <ul>
          <li><code>data_type</code></li>
          <li><code>io_type</code></li>          
          <li><code>op_name</code></li>
          <li><code>protocol</code></li>
          <li><code>server_ip</code></li>
        </ul>
      </td>
      <td>Number of completed protocol operations</td>
    </tr>
    <tr>
      <td><code>qumulo_quorum_node_is_offline</code></td>
      <td>gauge</td>
      <td>
        <ul>
          <li><code>node_id</code></li>
        </ul>
      </td>
      <td>Online status for each node in the cluster<br>This value can be <code>0</code> (node online) or <code>1</code> (node offline).</td>
    </tr>
  </tbody>
</table>

## Metric Labels
The following table gives the metric label name, its possible values, and descriptions.

<table>
  <thead>
    <tr>
      <th>Label Name</th>
      <th>Possible Values</th>
      <th>Description</th>
    </th>
  </thead>
  <tbody>
    <tr>
      <td><code>data_type</code></td>
      <td>
        <ul>
          <li><code>data</code></li>
          <li><code>metadata</code></li>
          <li><code>none</code></li>
        </ul>
      </td>
      <td>The type of data being transferred by the operation. Note that <code>data</code> refers to reading or writing operations that operate on a file's data. <code>metadata</code> operations refer to things like lookups, stats/getattrs, and other file operations which are not related to a file's data. Finally, <code>none</code> are operations which are neither operating on file data or metadata, and are often required by the protocol for session negotiation or authentication.</td>
    </tr>
    <tr>
      <td><code>entry_type</code></td>
      <td>
        <ul>
          <li><code>alternate_data_stream</code></li>
          <li><code>directory</code></li>
          <li><code>file</code></li>
          <li><code>other</code></li>
          <li><code>symlink</code></li>
        </ul>
      </td>
      <td>The type of file system object.</code></td>
    </tr>
    <tr>
      <td><code>io_type</code></td>
      <td>
        <ul>
          <li><code>none</code></li>
          <li><code>read</code></li>
          <li><code>wait</code></li>          
          <li><code>write</code></li>
        </ul>
      </td>
      <td>The type of I/O being performed by the operation. In this context, <code>wait</code> refers to a blocking operation that will take an indeterminant amount of time.</td>
    </tr>
    <tr>
      <td><code>node_id</code></td>
      <td>A positive integer representing a node ID within the cluster.</td>
      <td>Differentiates between the different nodes in the cluster for <code>qumulo_quorum_node_is_offline</code>.</td>
    </tr>
    <tr>
      <td><code>op_name</code></td>
      <td>Any one of the operations from NFSv3, NFSv4, or SMB.</td>
      <td>The operation being recorded. Note that operations with <code>smb2</code> refer to both SMB2 and SMB3 operations, as both protocols are closely related.</td>
    </tr>
    <tr>
      <td><code>path</code></td>
      <td>Currently only uses <code>/</code></td>
      <td>Represents a path to a directory in the file system.</td>
    </tr>
    <tr>
      <td><code>protocol</code></td>
      <td>
        <ul>
          <li><code>nfs3</code></li>
          <li><code>nfs4</code></li>
          <li><code>smb2</code></li>
        </ul>
      </td>
      <td>The protocol of the operation being recorded. Note that <code>smb2</code> refers to both SMB2 and SMB3, as both protocols are closely related.</td>
    </tr>
    <tr>
      <td><code>server_ip</code></td>
      <td>An IPv4 or IPv6 address.</td>
      <td>This is the IP address on your Qumulo cluster that received and serviced the protocol operation request from the client machine. This label can be used to understand how client connections are distributed across the IP address space of your cluster.</td>
    </tr>
    <tr>
      <td><code>usage_type</code></td>
      <td>
        <ul>
          <li><code>data</code></li>
          <li><code>metadata</code></li>
          <li><code>snapshot</code></li>
        </ul>
      </td>
      <td>The type of data taking up space.</td>
    </tr>
  </tbody>
</table>
