---
title: "How File System Change Notifications Work in Qumulo Core"
summary: "This section describes how file system change notifications work in Qumulo Core and explains request filtering, recursion, and the three configuration modes for notification requests."
permalink: /administrator-guide/watching-file-attribute-directory-changes/how-file-system-change-notifications-work.html
sidebar: administrator_guide_sidebar
keywords: CHANGE_NOTIFY, watch, change, file_change, directory_change, file_system, filtering, recursion, configuration_type, DISABLED_ERROR, DISABLED_IGNORE, ENABLED
varClientOverwhelmed: In case a client can't keep up with the amount of events that the system emits, the cluster stops queuing events and produces an error the next time the client attempts to contact the cluster.
varMeasurablePerformanceImpact: For example, thousands of recursive watches at the file system root can have a measurable performance impact on a write-heavy IOPS workload.
---

Qumulo Core can stream file system change notifications to a client whenever someone modifies a file or directory. The client can specify for which directories in the file system to receive notifications and what notification types Qumulo Core sends for these directories.

Qumulo Core supports two protocols for streaming file system change notifications. Both protocols provide roughly the same functionality.

* **SMB:** For more information, see [Watching for File Attribute and Directory Changes by Using SMB2 CHANGE_NOTIFY](smb2-change-notify.html)

* **REST:** For more information, see [Watching for File Attribute and Directory Changes by Using REST](rest.html). 

The Qumulo Core notification system guarantees that:

* The system never misses a notification.

* The system sends notifications in real time.

* A client connected to any node in a cluster receives a notification which might originate from any node in the cluster.

* The system sends notifications in accurate chronological order. (For example, the system doesn't send a `child_file_added` event after a `child_file_removed` event.)

* {{page.varClientOverwhelmed}}


## How Request Filtering Works
A client can request Qumulo Core to filter notifications. Although available filters differ between protocols, they work in a similar way.

{% include tip.html content="We recommend using a filter whenever you have an idea of the kind of events for which you want to receive notifications. Filtering notifications reduces back-end and front-end load and helps your client keep up with the data the cluster streams to it." %}

For example, you want to configure a client to receive notifications only about files being created but not deleted. In this scenario, you can make a notification request with the `child_file_added` filter for your protocol.


## How Recursion Works
{{site.data.alerts.important}}
<ul>
  <li>Because recursive notification lets you monitor large regions of the file system tree without having to "walk" through these regions to look for changes, recursive notification is a powerful feature. Use this feature carefully: Watching too large a file tree can lead to the system sending too many notifications.</li>
  <li>{{page.varClientOverwhelmed}}</li>
  <li>When Qumulo Core sends too many messages, there can also be a slight performance impact for your cluster. {{page.varMeasurablePerformanceImpact}}</li>
  <li>In the Windows implementation, recursive notifications over SMB require permissions only for the directory that the system watches. The system doesn't check permissions anywhere below the directory. Before you enable recursive notification, consider whether this policy is appropriate for your organization.</li>
</ul>
{{site.data.alerts.end}}

When you don't use recursion, the system sends notifications for changes that occur immediately within a target directory (changes to files that are children of the watched directory).

Consider the following example with recursion disabled:

1. You watch the `/a/b` directory.

1. You create the `/a/b/f` file.

1. You receive a notification that a user created the `/a/b/f` file.

1. You create the `/a/b/c/f` file.

In this example, you receive no additional notifications.

When you use recursion, the system sends notifications for changes that occur in the sub-tree _below_ the target directory. Both protocols let you use recursion.

If you repeat the previous example scenario with recursion enabled, you receive two notifications:

* You receive a notification that a user created the `/a/b/f` file.

* You receive a notification that a user created the `/a/b/c/f` file.


## Configuration Modes for Notification Requests
Qumulo Core has three global configuration modes that affect all recursive notification requests for both protocols.

* `DISABLED_ERROR`: Recursive change notification requests return errors immediately.

* `DISABLED_IGNORE`: The system accepts recursive change notification requests but sends notifications only for the top directory that it watches. (The system behaves as if the user doesn't specify the recursive flag.)

  Use this mode to improve compatibility with applications that request recursive behavior but don't depend on it.
  
  {% include important.html content="For scenarios that require recursive behavior, this mode can cause an application to become unresponsive or exhibit other unexpected behavior." %}

* `ENABLED`: This is the default mode. This mode provides full support for recursive change notification requests. The system pushes notifications for all descendants of the watched directory to the watcher.

  {% capture mpi %}This mode can affect system performance. {{page.varMeasurablePerformanceImpact}}{% endcapture %}
  {% include important.html content=mpi %}

To select the configuration mode, use the `/v1/file-system/settings/notify` REST API or the `qq fs_set_notify_settings` command. 

## Supported Functionality
<table>
  <thead>
    <tr>
        <th>Functionality</th>
        <th>Supported from Qumulo Core Version</th>        
    </tr>
  </thead>
  <tbody>
    <tr>
        <td>Fully featured REST API for streaming file system notifications</td>
        <td>6.0.2</td>        
    </tr>
    <tr>
        <td>
          <ul>
            <li>Full support for SMB <code>CHANGE_NOTIFY</code></li>
            <li>Parity with Windows Server</li>
            <li>Full support for recursion</li>
            <li>No limit on maximum directory size</li>
            <li>Configuration options for controlling recursive behavior</li>
          </ul>
        </td>
        <td>6.0.1</td>
    </tr>
    <tr>
        <td>
          <ul>
            <li>Improved compatibility with Windows applications</li>
            <li>Configuration options for controlling behavior of unsupported features</li>
          </ul>
        </td>
        <td>5.3.3</td>        
    </tr>
    <tr>
        <td>
          <ul>
            <li>Support for all possible SMB <code>CHANGE_NOTIFY</code> types except for Alternate Data Streams (ADS)</li>
          </ul>
        </td>
        <td>5.3.1</td>        
    </tr>
    <tr>
        <td>SMB2 <code>CHANGE_NOTIFY</code> support for adding and removing files and directories</td>
        <td>5.3.0</td>        
    </tr>
  </tbody>
</table>
