---
title: "Qumulo OpenMetrics API Specification"
summary: "This section lists the names, types, labels, and descriptions for the metrics that the Qumulo REST API emits."
permalink: /administrator-guide/metrics/openmetrics-api-specification.html
keywords: metrics, OpenMetrics, API metrics, prometheus
sidebar: administrator_guide_sidebar
---

This section lists the names, types, labels, and descriptions for the metrics that the Qumulo REST API emits.

The Qumulo OpenMetrics API has a single endpoint that provides a complete view of point-in-time telemetry from Qumulo Core to monitoring systems. These systems, such as [Prometheus](https://github.com/prometheus/prometheus), can consume the OpenMetrics data format that the Qumulo REST API emits without custom code or a monitoring agent. For more information about data formats, see your monitoring system's documentation.


## Accessing Qumulo Metrics
Qumulo metrics are available at the following endpoint.

```
https://<my-cluster-hostname>:8000/v2/metrics/endpoints/default/data
```

You can configure a monitoring system that supports the [OpenMetrics Specification](https://github.com/OpenObservability/OpenMetrics/blob/main/specification/OpenMetrics.md) to use [bearer token authentication](using-access-tokens.md) to access this endpoint.

## Metric Types
All Qumulo metrics belong to one of the following OpenMetrics types.

<table>
  <thead>
    <tr>
      <th>Metric Type</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a name="metric-type-counter"></a><code>counter</code></td>
      <td>An integer that increases monotonically from zero, stored in <code>&lt;metric_name&gt;_count</code>. {% include note.html content="During normal operation, the value of <code>counter</code> never decreases." %}</td>
    </tr>
    <tr>
      <td><a name="metric-type-gauge"></a><code>gauge</code></td>
      <td>A value that represents a single integer (similar to <code>counter</code>), stored in <code>&lt;metric_name&gt;</code>. {% include note.html content="During normal operation, the value of a <code>gauge</code> metric might increase or decrease." %}</td>
    </tr>
    <tr>
      <td><a name="metric-type-histogram"></a><code>histogram</code></td>
      <td><p>A representation of a series of <em>buckets</em>, where each bucket tracks values within a specific range.</p><p>A histogram has a <code>count</code> field and a <code>sum</code> field, stored in <code>&lt;metric_name&gt;_count</code> (the total number of samples) and <code>&lt;metric_name&gt;_sum</code> (the sum of all samples). Qumulo Core emits a single bucket that contains all samples.</p> {% include tip.html content="You can use <code>histogram</code> metrics to keep track of averages by dividing the <code>sum</code> field by the <code>count</code> field." %}</td>
    </tr>
    <tr>
      <td><a name="metric-type-info"></a><code>info</code></td>
      <td>Informational text about the system, stored in <code>&lt;metric_name&gt;_info</code>. An <code>info</code> metric always has a value of <code>1</code> and labels that contain detailed information.</td>
    </tr>
  </tbody>
</table>

For more information, see [Metric Types](https://github.com/OpenObservability/OpenMetrics/blob/main/specification/OpenMetrics.md#metric-types) in the OpenMetrics Specification.


## Metric Labels
The OpenMetrics format allows for metric labeling for communicating additional information. To provide context for metrics, Qumulo Core emits metric-specific labels. For example, the `name` of a protocol operation or the `url` of a remote server. For more information, see [Available Labels](#available-labels).


## Available Metrics
The following table lists metric names, types, labels, and descriptions.

{% include note.html content="For Qumulo as a Service, all metrics with a `node_id` label are unavailable because they refer to specific hardware." %}

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
      <td><code>qumulo</code></td>
      <td><a href="#metric-type-info"><code>info</code></a></td>
      <td>
        <ul>
          <li><code>name</code></li>
          <li><code>uuid</code></li>
          <li><code>version</code></li>
        </ul>
      </td>
      <td>Qumulo Core information, including the cluster name, cluster UUID, and the current Qumulo Core version</td>
    </tr>
    <tr>
      <td><code>qumulo_ad_netlogon_request_errors</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-server_url"><code>server_url</code></a></li>
        </ul>
      </td>
      <td>The total number Active Directory (AD) <code>NETLOGON</code> requests that resulted in an error</td>
    </tr>
    <tr>
      <td><code>qumulo_ad_netlogon_request_latency_seconds</code></td>
      <td><a href="#metric-type-histogram"><code>histogram</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-server_url"><code>server_url</code></a></li>
        </ul>
      </td>
      <td>The total latency for AD <code>NETLOGON</code> requests</td>
    </tr>
    <tr>
      <td><code>qumulo_ad_netlogon_requests</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-server_url"><code>server_url</code></a></li>
        </ul>
      </td>
      <td>The total number of completed AD <code>NETLOGON</code> operations</td>
    </tr>
    <tr>
      <td><code>qumulo_cpu_temperature_celsius</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-cpu"><code>cpu</code></a></li>
          <li><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>The temperature for each physical CPU, in degrees Celsius</td>
    </tr>
    <tr>
      <td><code>qumulo_disk_is_unhealthy</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-disk_type"><code>disk_type</code></a></li>
          <li><a href="#metric-label-drive_bay"><code>drive_bay</code></a></li>
          <li><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>The health of each disk in the cluster, ranging from <code>0</code> (the disk is healthy) to <code>1</code> (the disk is unhealthy)</td>
    </tr>
    <tr>
      <td><code>qumulo_disk_operation_latency_seconds</code></td>
      <td><a href="#metric-type-histogram"><code>histogram</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-disk_type"><code>disk_type</code></a></li>
          <li><a href="#metric-label-drive_bay"><code>drive_bay</code></a></li>
          <li><a href="#metric-label-io_type"><code>io_type</code></a></li>
          <li><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>The total latency for disk I/O operations</td>
    </tr>
    <tr>
      <td><code>qumulo_fan_speed_rpm</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-fan"><code>fan</code></a></li>
          <li><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>The fan speed, in RPM</td>
    </tr>
    <tr>
      <td><code>qumulo_fs_capacity_bytes</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td>&mdash;</td>
      <td>The total cluster space, in bytes</td>
    </tr>
    <tr>
      <td><code>qumulo_fs_directory_tree_entries</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-entry_type"><code>entry_type</code></a></li>
          <li><a href="#metric-label-path"><code>path</code></a></li>
        </ul>
      </td>
      <td>The number of file system objects on the cluster, sorted by object type</td>
    </tr>
    <tr>
      <td><code>qumulo_fs_directory_used_bytes</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-path"><code>path</code></a></li>
          <li><a href="#metric-label-usage_type"><code>usage_type</code></a></li>
        </ul>
      </td>
      <td>The amount of space that object types use, in bytes</td>
    </tr>
    <tr>
      <td><code>qumulo_fs_free_bytes</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td>&mdash;</td>
      <td>The free space on the cluster, in bytes</td>
    </tr>
    <tr>
      <td><code>qumulo_fs_snapshots</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td>&mdash;</td>
      <td>The number of snapshots on the cluster</td>
    </tr>
    <tr>
      <td><code>qumulo_ldap_lookup_request_errors</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-server_url"><code>server_url</code></a></li>
        </ul>
      </td>
      <td>The total number of LDAP requests that resulted in an error</td>
    </tr>
    <tr>
      <td><code>qumulo_ldap_lookup_request_latency_seconds</code></td>
      <td><a href="#metric-type-histogram"><code>histogram</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-server_url"><code>server_url</code></a></li>
        </ul>
      </td>
      <td>The total latency of LDAP requests</td>
    </tr>
    <tr>
      <td><code>qumulo_ldap_lookup_requests</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-server_url"><code>server_url</code></a></li>
        </ul>
      </td>
      <td>The total number of completed LDAP requests</td>
    </tr>
    <tr>
      <td><code>qumulo_ldap_operation_errors</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>&mdash;</td>
      <td>The total number of LDAP operations that resulted in an error</td>
    </tr>
    <tr>
      <td><code>qumulo_ldap_operation_latency_seconds</code></td>
      <td><a href="#metric-type-histogram"><code>histogram</code></a></td>
      <td>&mdash;</td>
      <td>The total latency for LDAP operations</td>
    </tr>
    <tr>
      <td><code>qumulo_ldap_operations</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>&mdash;</td>
      <td>The total number of completed LDAP operations</td>
    </tr>
    <tr>
      <td><code>qumulo_memory_correctable_ecc_errors</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>The total number of memory errors that Qumulo Core corrected automatically</td>
    </tr>
    <tr>
      <td><code>qumulo_network_interface_is_down</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-bond"><code>name</code></a></li>
          <li><a href="#metric-label-role"><code>role</code></a></li>
          <li><a href="#metric-label-interface"><code>interface</code></a></li>
          <li><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>The interface status, <code>0</code> (interface is up) or <code>1</code> (interface is down)</td>
    </tr>
    <tr>
      <td><code>qumulo_network_interface_link_speed_bits_per_second</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-bond"><code>name</code></a></li>
          <li><a href="#metric-label-role"><code>role</code></a></li>
          <li><a href="#metric-label-interface"><code>interface</code></a></li>
          <li><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>The negotiated link speed for the specified interface</td>
    </tr>
    <tr>
      <td><code>qumulo_network_interface_receive_errors</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-bond"><code>name</code></a></li>
          <li><a href="#metric-label-role"><code>role</code></a></li>
          <li><a href="#metric-label-interface"><code>interface</code></a></li>
          <li><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>The total number of receive errors on the specified interface</td>
    </tr>
    <tr>
      <td><code>qumulo_network_interface_received_bytes</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-bond"><code>name</code></a></li>
          <li><a href="#metric-label-role"><code>role</code></a></li>
          <li><a href="#metric-label-interface"><code>interface</code></a></li>
          <li><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>The total bytes received on the specified interface</td>
    </tr>
    <tr>
      <td><code>qumulo_network_interface_received_packets</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-bond"><code>name</code></a></li>
          <li><a href="#metric-label-role"><code>role</code></a></li>
          <li><a href="#metric-label-interface"><code>interface</code></a></li>
          <li><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>The total number of packets received on the specified interface</td>
    </tr>
    <tr>
      <td><code>qumulo_network_interface_transmit_errors</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-bond"><code>name</code></a></li>
          <li><a href="#metric-label-role"><code>role</code></a></li>
          <li><a href="#metric-label-interface"><code>interface</code></a></li>
          <li><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>The total number of transmission errors on the specified interface</td>
    </tr>
    <tr>
      <td><code>qumulo_network_interface_transmitted_bytes</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-bond"><code>name</code></a></li>
          <li><a href="#metric-label-role"><code>role</code></a></li>
          <li><a href="#metric-label-interface"><code>interface</code></a></li>
          <li><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>The total number of bytes transmitted on the specified interface</td>
    </tr>
    <tr>
      <td><code>qumulo_network_interface_transmitted_packets</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-bond"><code>name</code></a></li>
          <li><a href="#metric-label-role"><code>role</code></a></li>
          <li><a href="#metric-label-interface"><code>interface</code></a></li>
          <li><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>The total number of packets transmitted on the specified interface</td>
    </tr>
    <tr>
      <td><code>qumulo_power_supply_is_unhealthy</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-location"><code>location</code></a></li>
          <li><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>PSU health, <code>0</code> (healthy) or <code>1</code> (unplugged, removed, or unresponsive)</td>
    </tr>
    <tr>
      <td><code>qumulo_protocol_client_connections</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-protocol"><code>protocol</code></a></li>
        </ul>
      </td>
      <td>The total number of clients that have connected to the specified protocol</td>
    </tr>
    <tr>
      <td><code>qumulo_protocol_client_disconnections</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-protocol"><code>protocol</code></a></li>
        </ul>
      </td>
      <td>The total number of clients that have disconnected from the specified protocol</td>
    </tr>
    <tr>
      <td><code>qumulo_protocol_operation_bytes</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-data_type"><code>data_type</code></a></li>
          <li><a href="#metric-label-io_type"><code>io_type</code></a></li>
          <li><a href="#metric-label-op_name"><code>op_name</code></a></li>
          <li><a href="#metric-label-protocol"><code>protocol</code></a></li>
        </ul>
      </td>
      <td>The total bytes that protocol operations have transferred</td>
    </tr>
    <tr>
      <td><code>qumulo_protocol_operation_latency_seconds</code></td>
      <td><a href="#metric-type-histogram"><code>histogram</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-data_type"><code>data_type</code></a></li>
          <li><a href="#metric-label-io_type"><code>io_type</code></a></li>
          <li><a href="#metric-label-op_name"><code>op_name</code></a></li>
          <li><a href="#metric-label-protocol"><code>protocol</code></a></li>
        </ul>
      </td>
      <td>The total latency for protocol operations</td>
    </tr>
    <tr>
      <td><code>qumulo_protocol_operations</code></td>
      <td><a href="#metric-type-counter"><code>counter</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-data_type"><code>data_type</code></a></li>
          <li><a href="#metric-label-io_type"><code>io_type</code></a></li>
          <li><a href="#metric-label-op_name"><code>op_name</code></a></li>
          <li><a href="#metric-label-protocol"><code>protocol</code></a></li>
        </ul>
      </td>
      <td>The total number of completed protocol operations</td>
    </tr>
    <tr>
      <td><code>qumulo_quorum_node_is_offline</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>The online status for each node in the cluster, <code>0</code> (node online) or <code>1</code> (node offline)</td>
    </tr>
    <tr>
      <td><code>qumulo_time_is_not_synchronizing</code></td>
      <td><a href="#metric-type-gauge"><code>gauge</code></a></td>
      <td>
        <ul>
          <li><a href="#metric-label-node_id"><code>node_id</code></a></li>
        </ul>
      </td>
      <td>The time synchronization status for each node in the cluster, <code>0</code> (time is synchronized) or <code>1</code> (time isn't synchronized)</td>
    </tr>
  </tbody>
</table>


## Available Labels
The following table lists metric label names, possible values, and descriptions.

<table>
  <thead>
    <tr>
      <th>Label Name</th>
      <th>Possible Values</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a name="metric-label-bond"></a><code>bond</code></td>
      <td>
        <ul>
          <li><code>bond0</code></li>
          <li><code>bond1</code></li>
        </ul>
      </td>
      <td>The bond to which a network interface belongs</td>
    </tr>
    <tr>
      <td><a name="metric-label-cpu"></a><code>cpu</code></td>
      <td>A non-negative integer</td>
      <td>The CPU index in the node</td>
    </tr>
    <tr>
      <td><a name="metric-label-data_type"></a><code>data_type</code></td>
      <td>
        <ul>
          <li><code>data</code>: Read or write operations on the data of a file.</li>
          <li><code>metadata</code>: Operations (such as <code>lookup</code>, <code>stat</code>, or <code>getattr</code>) unrelated to a file's data</li>
          <li><code>none</code>: Operations that operate on neither the file data nor the metadata. {% include note.html content="The protocol often requires these operations for session negotiation and authentication." %}</li>
        </ul>
      </td>
      <td>The data type that an operation transfers</td>
    </tr>
    <tr>
      <td><a name="metric-label-disk_type"></a><code>disk_type</code></td>
      <td>
        <ul>
          <li><code>hdd</code>: Hard Disk Drive</li>
          <li><code>ssd</code>: Solid-State Drive</li>
        </ul>
      </td>
      <td>The underlying storage type</td>
    </tr>
    <tr>
      <td><a name="metric-label-drive_bay"></a><code>drive_bay</code></td>
      <td>A drive bay name. For example: <code>b3</code>, <code>1.1</code></td>
      <td>The physical drive bay in the chassis.</td>
    </tr>
    <tr>
      <td><a name="metric-label-entry_type"></a><code>entry_type</code></td>
      <td>
        <ul>
          <li><code>alternate_data_stream</code></li>
          <li><code>directory</code></li>
          <li><code>file</code></li>
          <li><code>other</code></li>
          <li><code>symlink</code></li>
        </ul>
      </td>
      <td>The file system object type</td>
    </tr>
    <tr>
      <td><a name="metric-label-fan"></a><code>fan</code></td>
      <td>A fan name, for example <code>system fan 1</code></td>
      <td>The fan name</td>
    </tr>
    <tr>
      <td><a name="metric-label-interface"></a><code>interface</code></td>
      <td>An interface name, for example <code>eth0</code></td>
      <td>The interface name</td>
    </tr>
    <tr>
      <td><a name="metric-label-io_type"></a><code>io_type</code></td>
      <td>
        <ul>
          <li><code>none</code></li>
          <li><code>read</code></li>
          <li><code>wait</code>: A blocking operation that takes an indeterminate amount of time</li>
          <li><code>write</code></li>
        </ul>
      </td>
      <td>The I/O that an operation performs</td>
    </tr>
    <tr>
      <td><a name="metric-label-location"></a><code>location</code></td>
      <td>A location on the chassis, for example <code>left</code> or <code>right</code></td>
      <td>The location on the chassis. {% include note.html content="For PSU, this location is relative to the back of the node." %}</td>
    </tr>
    <tr>
      <td><a name="metric-label-node_id"></a><code>node_id</code></td>
      <td>A positive integer that represents a node ID in the cluster.</td>
      <td>A value that differentiates between the different nodes in a cluster</td>
    </tr>
    <tr>
      <td><a name="metric-label-op_name"></a><code>op_name</code></td>
      <td>Any operation name, including NFSv3, NFSv4.1, SMBv2, SMBv3 or FTP</td>
      <td>The recorded operation</td>
    </tr>
    <tr>
      <td><a name="metric-label-path"></a><code>path</code></td>
      <td>Slash (<code>/</code>)</td>
      <td>The path to a directory in the file system</td>
    </tr>
    <tr>
      <td><a name="metric-label-protocol"></a><code>protocol</code></td>
      <td>
        <ul>
          <li><code>nfs</code>: NFSv3 or NFSv4.1</li>
          <li><code>smb2</code>: SMBv2 or SMBv3</li>
          <li><code>ftp</code></li>
        </ul>
      </td>
      <td>The protocol of the recorded operation</td>
    </tr>
    <tr>
      <td><a name="metric-label-role"></a><code>role</code></td>
      <td>
        <ul>
          <li><code>frontend</code></li>
          <li><code>backend</code></li>
        </ul>
      </td>
      <td>The role of the interface {% include note.html content="<code>frontend</code> includes protocol, management, and replication traffic. <code>backend</code> includes all intra-node communications." %}</td>
    </tr>
    <tr>
      <td><a name="metric-label-server_url"></a><code>server_url</code></td>
      <td>A hostname (for example, <code>ad.my-domain.com</code>) or an IP address</td>
      <td>The URL of a remote server</td>
    </tr>
    <tr>
      <td><a name="metric-label-usage_type"></a><code>usage_type</code></td>
      <td>
        <ul>
          <li><code>data</code></li>
          <li><code>metadata</code></li>
          <li><code>snapshot</code></li>
        </ul>
      </td>
      <td>The data type that uses space</td>
    </tr>
  </tbody>
</table>
