---
title: "Watching for File Attribute and Directory Changes by Using REST"
summary: "This section describes how to configure Qumulo Core and watch for file attribute and directory changes by using REST."
permalink: /administrator-guide/watching-file-attribute-directory-changes/rest.html
sidebar: administrator_guide_sidebar
keywords: change notify, change watch, notification, FS, REST
varConstitutesRename: The combination of the <code>*_moved_to</code> and <code>*_moved_from</code> notification type constitutes the renaming of the listed
---

{% capture useRESTnotSMB %}{{site.changeNotify.useRESTnotSMB}}{% endcapture %}
{% include note.html content=useRESTnotSMB %}

Qumulo Core streams notifications to the client by using HTML server-sent events (SSE). For more information about the SSE syntax, see [Server-sent events](https://html.spec.whatwg.org/multipage/server-sent-events.html#server-sent-events) in the HTML Living Standard documentation.

* The comment syntax&mdash;any line that begins with a colon (`:`)&mdash; shows that the call has registered successfully for notifications and periodic keep-alive connections.

* The data syntax (`data: payload`) shows the event content.

Qumulo Core continues to stream events until the client closes the connection.

{{site.data.alerts.important}}
<ul>
  <li>Standard file system permissions apply to API requests for non-recursive watching: The system compares the authenticated user that makes the API request with the defined access control list (ACL) permissions for the file and grants or denies access access. The authenticated user must have permission to read a directory in order to request notifications for its changes.</li>
  <li>Because of the complexity of representing and enforcing a permissions model for an arbitrary subtree of the file system, recursive notification requests require an authenticated API user to have the <code>DATA_ADMINISTRATOR</code> privilege. This requirement remains true even if you configure your Qumulo cluster to ignore the recursive notification mode.</li>
</ul>
{{site.data.alerts.end}}

<a id="sse-event-payload-structure"></a>
## How SSE Event Payloads are Structured for Recursive Notification Requests
An SSE event payload is a JSON-encoded list of notification objects. The following is a format example of the SSE event payload.

```json
[
  {
    "type": "<type>",
    "path": "<path>",
    "spine": ["<file_id_1>", "<file_id_2>", ...],
    "stream_name": "<optional_stream_name>"
  },
  {
  ...
  }
]
```

* `type`: One of the possible [notification types](#notification-types).

* `path`: The path to the file for which the notification occurred.

  This path is relative to the watched directory.

* `spine`: A representation of the file path that uses Qumulo file IDs (rather than path components).

   * The first file ID in the spine is the oldest ancestor in the path.
   
   * The last file ID in the spine is the file for which the system sends the notification.

* `stream_name`: The name of an alternate data stream (ADS) for the file.

  When this value is `null`, the notification is for the file's default stream. Otherwise, the notification is for the listed stream.

<a id="notification-types"></a>
### SSE Payload Notification Types
The following is a list of available notification types in [SSE event payloads](#sse-event-payload-structure).

* The `type` field shows a single notification type.

* The `filter` field shows multiple notification types in comma-separated format.

<table>
<thead>
  <tr>
    <th width="30%">Notification Type</th>
    <th>Description</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td><code>child_acl_changed</code></td>
    <td>The ACL for the listed or directory has been modified.</td>
  </tr>  
  <tr>
    <td><code>child_atime_changed</code></td>
    <td>
      <p>The <code>atime</code> (access time) of the listed file or directory has been modified.</p>
      {{site.data.alerts.note}}
      <ul>
        <li>When a client modifies the <code>atime</code> field for a file directly, Qumulo Cores sends <code>atime</code> notifications for the file.</li>
        <li>If you have enabled <code>atime</code> monitoring on your Qumulo Cluster, Qumulo Core sends <code>atime</code> notifications automatically. To configure <code>atime</code> monitoring, use the <code>/v1/file-system/settings/atime</code> REST API or the <code>qq fs_set_atime_settings</code> command.</li>
      </ul>
      {{site.data.alerts.end}}
    </td>
  </tr>   
  <tr>
    <td><code>child_btime_changed</code></td>
    <td>The <code>btime</code> (creation time) of the listed file or directory has been modified.</td>
  </tr>
  <tr>
    <td><code>child_mtime_changed</code></td>
    <td>The <code>mtime</code> (modification time) of the listed file or directory has been modified.</td>
  </tr>
  <tr>
    <td><code>child_data_written</code></td>
    <td>Data has been written to the listed file.</td>
  </tr>  
  <tr>
    <td><code>child_dir_added</code></td>
    <td>The listed directory has been created.</td>
  </tr>
  <tr>
    <td><code>child_dir_removed</code></td>
    <td>The listed directory has been removed.</td>
  </tr>
  <tr>
    <td><code>child_dir_moved_from</code></td>
    <td>
      <p>A directory has been moved from the listed location.</p>
      {% capture renameDir %}{{page.varConstitutesRename}} directory.{% endcapture %}
      {% include note.html content=renameDir %}
    </td>
  </tr>
  <tr>
    <td><code>child_dir_moved_to</code></td>
    <td>
      <p>A directory has been moved to the listed location.</p>
      {% include note.html content=renameDir %}
    </td>
  </tr>
  <tr>
    <td><code>child_extra_attrs_changed</code></td>
    <td>
      <p>The additional attributes for the listed file or directory have been modified.</p>
      {% include note.html content="The additional attributes are Windows-specific _extra file attributes_ which include <code>HIDDEN</code>, <code>READ_ONLY</code>, and so on. For more information, see [File Attributes](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-fscc/ca28ec38-f155-4768-81d6-4bfeb8586fc9) in the Microsoft Open Attributes documentation." %}
    </td>
  </tr>  
  <tr>
    <td><code>child_file_added</code></td>
    <td>The listed file has been created.</td>
  </tr>
  <tr>
    <td><code>child_file_removed</code></td>
    <td>The listed file has been removed.</td>
  </tr>
  <tr>
    <td><code>child_file_moved_from</code></td>
    <td>
      <p>A file has been moved from the listed location.</p>
      {% capture renameFile %}{{page.varConstitutesRename}} file.{% endcapture %}
      {% include note.html content=renameFile %}
    </td>
  </tr>
  <tr>
    <td><code>child_file_moved_to</code></td>
    <td>
      <p>A file has been moved from the listed location.</p>
      {% include note.html content=renameFile %}
    </td>
  </tr>
  <tr>
    <td><code>child_group_changed</code></td>
    <td>The group for the listed file or directory has been changed.</td>
  </tr>  
  <tr>
    <td><code>child_owner_changed</code></td>
    <td>The owner for the listed file or directory has been changed.</td>
  </tr>  
  <tr>
    <td><code>child_size_changed</code></td>
    <td>The size of the listed file has been changed.</td>
  </tr>
  <tr>
    <td><code>child_stream_added</code></td>
    <td>The listed alternate data stream (ADS) has been added to the listed file or directory.</td>
  </tr>
  <tr>
    <td><code>child_stream_data_written</code></td>
    <td>Data has been written to the listed ADS.</td>
  </tr>  
  <tr>
    <td><code>child_stream_moved_from</code></td>
    <td>The listed ADS has been moved to the listed file or directory.</td>
  </tr>
  <tr>
    <td><code>child_stream_moved_to</code></td>
    <td>The listed ADS has been moved from the listed file or directory.</td>
  </tr>  
  <tr>
    <td><code>child_stream_removed</code></td>
    <td>The listed ADS has been removed from the listed file or directory.</td>
  </tr>
  <tr>
    <td><code>child_stream_size_changed</code></td>
    <td>The size of the listed ADS for the listed file or directory has been changed.</td>
  </tr>
  <tr>
    <td><code>self_removed</code></td>
    <td>
      <p>The directory from which then system streams notifications has been removed from the file system.</p>
      {% include note.html content="No notifications follow a <code>self_removed</code> notification." %}
    </td>
  </tr>
</tbody>
</table>


## Streaming Change Notifications by Using the qq CLI
Use the `qq fs_notify` command and specify the path to a directory. For example:

```bash
qq fs_notify --path /my/directory
```

In this example, Qumulo Core streams all [notification types](#notification-types) for files immediately under the `/my/directory` directory.

To terminate the stream, send a `SIGQUIT` signal.


## Streaming Change Notifications by Using the REST API
Make a `GET` request to the REST endpoint in the following format:

```
/v1/files/<ref>/notify&filter=<filter>&recursive=<recursive>
```

In the following example:

* `ref`: An absolute path or a numeric file ID for the directory to watch.

* `filter`:  A comma-separated list of [notification types](#notification-types).

* `recursive`: When set to `true`, enables recursive change notifications.

```
/v1/files/my/directory/notify&filter=child_file_added,child_dir_removed&recursive=true
```
