---
title: "Qumulo OpenMetrics API Specification"
summary: "This topic describes the specification of the types of metrics that the Qumulo API emits."
permalink: /administrator-guide/qumulo-core/openmetrics-api-specification.html
keywords: metrics, openmetrics, prometheus, api
sidebar: administrator_guide_sidebar
---

The Qumulo OpenMetrics API has a single endpoint that provides a complete view of point-in-time telemetry from the Qumulo File Data Platform. Monitoring and metrics systems, such as [Prometheus](https://github.com/prometheus/prometheus), can consume the OpenMetrics data format that the API emits, without custom code or an agent. For more information about which data formats your system can ingest natively, see your monitoring system documentation.

## Accessing Metrics

The metrics API is available at <code>https://&lt;hostname&gt;:8000/v2/metrics/endpoints/default/data</code>, where <code>hostname</code> is your cluster's hostname or IP address.
An external system that supports the [OpenMetrics specification](https://github.com/OpenObservability/OpenMetrics/blob/main/specification/OpenMetrics.md) can be set up to point to this URL and use bearer token authentication to access the endpoint.

## Metric Types
All metrics available in the API belong to one of the four types that the OpenMetrics standard defines. Each metric type has a specific set of functionality. The following are the four metric types:

* **Counter**: A monotonically increasing integer that increases from zero, stored in `<metric_name>_count`. A counter's value will never decrease during normal operation.

* **Gauge**: A value that represents a single integer (similar to a counter), stored in `<metric_name>`.. A gauge's value may increase and decrease during normal operation.

* **Histogram**: A histogram that represents a series of _buckets._ Each bucket keeps track of all values that occur within a specific range. A histogram also has a `count` field and a `sum` field, stored in `<metric_name>_count` (the total number of samples) and `<metric_name>_sum` (the sum of all the samples). The Qumulo Core OpenMetrics API emits only a single bucket containing all samples.

  {% include note.html content="Because Qumulo Core only emits a single bucket for histogram metrics, you can use histograms to keep track of averages by dividing the `sum` field by the `count` field." %}

* **Info**: A metric that exposes some informational text about the system, stored in `<metric_name>_info`. An info metric always has a value of <code>1</code> and has labels containing the relevant information.

For more information about these (and other) OpenMetrics types, see [Metric Types](https://github.com/OpenObservability/OpenMetrics/blob/main/specification/OpenMetrics.md#metric-types) in the OpenMetrics Specification.

## Metric Labels
The OpenMetrics format allows for metrics to be labeled to communicate additional information about each metric point. The Qumulo Core OpenMetrics API emits labels to give context to each metric, for example the name of a protocol operation or the URL of a remote server. These labels are metric-specific. For more information, see the full table of [Available Labels](#available-labels).

## Available Metrics
Below are two tables that list the metrics and metric labels available in the Qumulo Core OpenMetrics API.
The following table gives the name, type, labels, and descriptions.

{% include note.html content="For Qumulo as a Service users, all metrics with a <code>node_id</code> label are unavailable as they refer to specific hardware." %}

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
      <td>info</td>
      <td>
        <ul>
          <li><code>name</code></li>
          <li><code>uuid</code></li>
          <li><code>version</code></li>
        </ul>
      </td>
      <td>Information about the Qumulo Core software. This gives the cluster name, the cluster UUID, and the software version of Qumulo Core currently running.</td>
    </tr>
    <tr>
      <td><code>qumulo_ad_netlogon_request_errors</code></td>
      <td>counter</td>
      <td>
        <ul>
          <li><code>server_url</code></li>
        </ul>
      </td>
      <td>Total number of errored active directory netlogon requests</td>
    </tr>
    <tr>
      <td><code>qumulo_ad_netlogon_request_latency_seconds</code></td>
      <td>histogram</td>
      <td>
        <ul>
          <li><code>server_url</code></li>
        </ul>
      </td>
      <td>Total latency for Active Directory Netlogon requests</td>
    </tr>
    <tr>
      <td><code>qumulo_ad_netlogon_requests</code></td>
      <td>counter</td>
      <td>
        <ul>
          <li><code>server_url</code></li>
        </ul>
      </td>
      <td>Total number of completed Active Directory Netlogon operations</td>
    </tr>
    <tr>
      <td><code>qumulo_cpu_temperature_celsius</code></td>
      <td>gauge</td>
      <td>
        <ul>
          <li><code>cpu</code></li>
          <li><code>node_id</code></li>
        </ul>
      </td>
      <td>The temperature in Celsius for each physical CPU</td>
    </tr>
    <tr>
      <td><code>qumulo_disk_is_unhealthy</code></td>
      <td>gauge</td>
      <td>
        <ul>
          <li><code>disk_type</code></li>
          <li><code>drive_bay</code></li>
          <li><code>node_id</code></li>
        </ul>
      </td>
      <td>Disk health for each disk in the cluster<br>
      This value can be <code>0</code> (disk is healthy) or <code>1</code> (disk is unhealthy).</td>
    </tr>
    <tr>
      <td><code>qumulo_disk_operation_latency_seconds</code></td>
      <td>histogram</td>
      <td>
        <ul>
          <li><code>disk_type</code></li>
          <li><code>drive_bay</code></li>
          <li><code>io_type</code></li>
          <li><code>node_id</code></li>
        </ul>
      </td>
      <td>Total latency for disk IO operations</td>
    </tr>
    <tr>
      <td><code>qumulo_fan_speed_rpm</code></td>
      <td>gauge</td>
      <td>
        <ul>
          <li><code>fan</code></li>
          <li><code>node_id</code></li>
        </ul>
      </td>
      <td>The fan speed in RPM</td>
    </tr>
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
      <td><code>qumulo_fs_snapshots</code></td>
      <td>gauge</td>
      <td>&mdash;</td>
      <td>Number of snapshots in the cluster</td>
    </tr>
    <tr>
      <td><code>qumulo_ldap_lookup_request_errors</code></td>
      <td>counter</td>
      <td>
        <ul>
          <li><code>server_url</code></li>
        </ul>
      </td>
      <td>Total number of errored LDAP requests</td>
    </tr>
    <tr>
      <td><code>qumulo_ldap_lookup_request_latency_seconds</code></td>
      <td>histogram</td>
      <td>
        <ul>
          <li><code>server_url</code></li>
        </ul>
      </td>
      <td>Total latency for LDAP requests</td>
    </tr>
    <tr>
      <td><code>qumulo_ldap_lookup_requests</code></td>
      <td>counter</td>
      <td>
        <ul>
          <li><code>server_url</code></li>
        </ul>
      </td>
      <td>Total number of completed LDAP requests</td>
    </tr>
    <tr>
      <td><code>qumulo_ldap_operation_errors</code></td>
      <td>counter</td>
      <td>&mdash;</td>
      <td>Total number of errored LDAP operations</td>
    </tr>
    <tr>
      <td><code>qumulo_ldap_operation_latency_seconds</code></td>
      <td>histogram</td>
      <td>&mdash;</td>
      <td>Total latency for LDAP operations</td>
    </tr>
    <tr>
      <td><code>qumulo_ldap_operations</code></td>
      <td>counter</td>
      <td>&mdash;</td>
      <td>Total number of completed LDAP operations</td>
    </tr>
    <tr>
      <td><code>qumulo_memory_correctable_ecc_errors</code></td>
      <td>counter</td>
      <td>
        <ul>
          <li><code>node_id</code></li>
        </ul>
      </td>
      <td>Total number of memory errors that were automatically corrected</td>
    </tr>
    <tr>
      <td><code>qumulo_network_interface_is_down</code></td>
      <td>gauge</td>
      <td>
        <ul>
          <li><code>bond</code></li>
          <li><code>role</code></li>
          <li><code>interface</code></li>
          <li><code>node_id</code></li>
        </ul>
      </td>
      <td>Whether this interface is up or down. This value can be <code>0</code> (interface is up) or <code>1</code> (interface is down)</td>
    </tr>
    <tr>
      <td><code>qumulo_network_interface_link_speed_bits_per_second</code></td>
      <td>gauge</td>
      <td>
        <ul>
          <li><code>bond</code></li>
          <li><code>role</code></li>
          <li><code>interface</code></li>
          <li><code>node_id</code></li>
        </ul>
      </td>
      <td>The negotiated link speed for this interface</td>
    </tr>
    <tr>
      <td><code>qumulo_network_interface_receive_errors</code></td>
      <td>counter</td>
      <td>
        <ul>
          <li><code>bond</code></li>
          <li><code>role</code></li>
          <li><code>interface</code></li>
          <li><code>node_id</code></li>
        </ul>
      </td>
      <td>Total number of receive errors on this interface</td>
    </tr>
    <tr>
      <td><code>qumulo_network_interface_received_bytes</code></td>
      <td>counter</td>
      <td>
        <ul>
          <li><code>bond</code></li>
          <li><code>role</code></li>
          <li><code>interface</code></li>
          <li><code>node_id</code></li>
        </ul>
      </td>
      <td>Total bytes received on this interface</td>
    </tr>
    <tr>
      <td><code>qumulo_network_interface_received_packets</code></td>
      <td>counter</td>
      <td>
        <ul>
          <li><code>bond</code></li>
          <li><code>role</code></li>
          <li><code>interface</code></li>
          <li><code>node_id</code></li>
        </ul>
      </td>
      <td>Total number of packets received on this interface</td>
    </tr>
    <tr>
      <td><code>qumulo_network_interface_transmit_errors</code></td>
      <td>counter</td>
      <td>
        <ul>
          <li><code>bond</code></li>
          <li><code>role</code></li>
          <li><code>interface</code></li>
          <li><code>node_id</code></li>
        </ul>
      </td>
      <td>Total number of transmit errors on this interface</td>
    </tr>
    <tr>
      <td><code>qumulo_network_interface_transmitted_bytes</code></td>
      <td>counter</td>
      <td>
        <ul>
          <li><code>bond</code></li>
          <li><code>role</code></li>
          <li><code>interface</code></li>
          <li><code>node_id</code></li>
        </ul>
      </td>
      <td>Total bytes transmitted on this interface</td>
    </tr>
    <tr>
      <td><code>qumulo_network_interface_transmitted_packets</code></td>
      <td>counter</td>
      <td>
        <ul>
          <li><code>bond</code></li>
          <li><code>role</code></li>
          <li><code>interface</code></li>
          <li><code>node_id</code></li>
        </ul>
      </td>
      <td>Total number of packets transmitted on this interface</td>
    </tr>
    <tr>
      <td><code>qumulo_power_supply_is_unhealthy</code></td>
      <td>gauge</td>
      <td>
        <ul>
          <li><code>location</code></li>
          <li><code>node_id</code></li>
        </ul>
      </td>
      <td>Whether this power supply is healthy. This value can be <code>0</code> (healthy) or <code>1</code> (unplugged, removed, or unresponsive)</td>
    </tr>
    <tr>
      <td><code>qumulo_protocol_client_connections</code></td>
      <td>counter</td>
      <td>
        <ul>
          <li><code>protocol</code></li>
        </ul>
      </td>
      <td>Total number of clients that have connected to this protocol</td>
    </tr>
    <tr>
      <td><code>qumulo_protocol_client_disconnections</code></td>
      <td>counter</td>
      <td>
        <ul>
          <li><code>protocol</code></li>
        </ul>
      </td>
      <td>Total number of clients that have disconnected from this protocol</td>
    </tr>
    <tr>
      <td><code>qumulo_protocol_operation_bytes</code></td>
      <td>counter</td>
      <td>
        <ul>
          <li><code>data_type</code></li>
          <li><code>io_type</code></li>
          <li><code>op_name</code></li>
          <li><code>protocol</code></li>
        </ul>
      </td>
      <td>Total bytes transferred by protocol operations</td>
    </tr>
    <tr>
      <td><code>qumulo_protocol_operation_latency_seconds</code></td>
      <td>histogram</td>
      <td>
        <ul>
          <li><code>data_type</code></li>
          <li><code>io_type</code></li>
          <li><code>op_name</code></li>
          <li><code>protocol</code></li>
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
        </ul>
      </td>
      <td>Total number of completed protocol operations</td>
    </tr>
    <tr>
      <td><code>qumulo_quorum_node_is_offline</code></td>
      <td>gauge</td>
      <td>
        <ul>
          <li><code>node_id</code></li>
        </ul>
      </td>
      <td>Online status for each node in the cluster<br>
      This value can be <code>0</code> (node online) or <code>1</code> (node offline).</td>
    </tr>
    <tr>
      <td><code>qumulo_time_is_not_synchronizing</code></td>
      <td>gauge</td>
      <td>
        <ul>
          <li><code>node_id</code></li>
        </ul>
      </td>
      <td>Time synchronization status for each node in the cluster<br>
      This value can be <code>0</code> (time is synchronized) or <code>1</code> (time is not synchronizing).</td>
    </tr>
  </tbody>
</table>

## Available Labels
The following table gives the metric label name, its possible values, and descriptions.

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
      <td><code>bond</code></td>
      <td>
        <ul>
          <li><code>bond0</code></li>
          <li><code>bond1</code></li>
        </ul>
      </td>
      <td>The bond to which a network interface belongs</td>
    </tr>
    <tr>
      <td><code>cpu</code></td>
      <td>A non-negative integer</td>
      <td>The CPU's index in the node</td>
    </tr>
    <tr>
      <td><code>data_type</code></td>
      <td>
        <ul>
          <li><code>data</code>: Read or write operations on a file's data.</li>
          <li><code>metadata</code>: Operations (such as <code>lookup</code>, <code>stat</code>, or <code>getattr</code>) that are unrelated to a file's data.</li>
          <li><code>none</code>: Operations that operate on neither file data nor metadata. The protocol often requires these operations for session negotiation and authentication.</li>
        </ul>
      </td>
      <td>The data type that an operation transfers</td>
    </tr>
    <tr>
      <td><code>disk_type</code></td>
      <td>
        <ul>
          <li><code>hdd</code>: Hard disk drive</li>
          <li><code>ssd</code>: Solid-state drive</li>
        </ul>
      </td>
      <td>The type of underlying storage</td>
    </tr>
    <tr>
      <td><code>drive_bay</code></td>
      <td>A drive bay name, for example <code>b3</code> or <code>1.1</code></td>
      <td>The physical drive bay on the chassis.</td>
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
      <td>The file system object type</td>
    </tr>
    <tr>
      <td><code>fan</code></td>
      <td>A fan name, for example <code>system fan 1</code></td>
      <td>The fan name</td>
    </tr>
    <tr>
      <td><code>interface</code></td>
      <td>An interface name, for example <code>eth0</code></td>
      <td>The interface name.</td>
    </tr>
    <tr>
      <td><code>io_type</code></td>
      <td>
        <ul>
          <li><code>none</code></li>
          <li><code>read</code></li>
          <li><code>wait</code>: A blocking operation that takes an indeterminate amount of time.</li>
          <li><code>write</code></li>
        </ul>
      </td>
      <td>The I/O that the operation performs</td>
    </tr>
    <tr>
      <td><code>location</code></td>
      <td>A location, for example <code>left</code> or <code>right</code></td>
      <td>The location on the chassis.<br>
      For power supplies, this location is determined by looking at the back of the node.</td>
    </tr>
    <tr>
      <td><code>node_id</code></td>
      <td>A positive integer that represents a node ID in the cluster.</td>
      <td>This value differentiates between the different nodes in the cluster.</td>
    </tr>
    <tr>
      <td><code>op_name</code></td>
      <td>Any NFS (NFSv3 or NFSv4), SMB (SMBv2 or SMBv3), or FTP operation name.</td>
      <td>The recorded operation</td>
    </tr>
    <tr>
      <td><code>path</code></td>
      <td>Slash (<code>/</code>)</td>
      <td>The path to a directory in the file system</td>
    </tr>
    <tr>
      <td><code>protocol</code></td>
      <td>
        <ul>
          <li><code>nfs</code>: NFSv3 or NFSv4</li>
          <li><code>smb2</code>: SMBv2 or SMBv3</li>
          <li><code>ftp</code></li>
        </ul>
      </td>
      <td>The protocol of the recorded operation</td>
    </tr>
    <tr>
      <td><code>role</code></td>
      <td>
        <ul>
          <li><code>frontend</code></li>
          <li><code>backend</code></li>
        </ul>
      </td>
      <td>The interface's role.<br>
      Frontend includes protocol, management, and replication traffic, and backend includes all intra-node communication.</td>
    </tr>
    <tr>
      <td><code>server_url</code></td>
      <td>A hostname (<code>ad.my-domain.com</code>) or IP address</td>
      <td>The URL of a remote server.</td>
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
      <td>The data type that uses space</td>
    </tr>
  </tbody>
</table>
