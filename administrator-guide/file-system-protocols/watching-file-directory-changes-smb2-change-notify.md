---
title: "Watching for File Attribute and Directory Changes by Using SMB2 CHANGE_NOTIFY"
summary: "This section lists the completion filters that an SMB client can request and the corresponding actions that Qumulo Core returns for a matched change."
permalink: /administrator-guide/file-system-protocols/watching-file-directory-changes-smb2-change-notify.html
sidebar: administrator_guide_sidebar
keywords: SMB, SMB2, CHANGE_NOTIFY, completion filter, action, matched change
varNoEA: Qumulo doesn't support mutating extended attributes (EA). If only the <code>FILE_NOTIFY_CHANGE_EA</code> filter is requested, no events propagate.
---

Qumulo Core can watch for changes in file attributes and directory entries with a combination of SMB2 <a href='https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-smb2/598f395a-e7a2-4cc8-afb3-ccb30dd2df7c'><code>CHANGE_NOTIFY</code></a> filters. Depending on the requested filter&mdash;and activity in the file system&mdash;an SMB client or an application remains current by receiving a variety of notifications.

Commonly, these requests help limit the amount of traffic required to keep a current cache of entries for an open directory. The requests also help operating system applications such as Windows Explorer and macOS Finder update automatically when changes take place. It is also possible to make requests programmatically. For more information about language bindings, see the Windows Protocol documentation, such as [ReadDirectoryChangesW function (winbase.h)](https://learn.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-readdirectorychangesw) for Win32 and [FileSystemWatcher Class](https://learn.microsoft.com/en-us/dotnet/api/system.io.filesystemwatcher?view=net-7.0) for .NET.

{{site.data.alerts.note}}
<ul>
  <li>Certain events, such as <code>rename</code> and <code>delete</code> trigger multiple <code>NOTIFY_CHANGE</code> events.</li>
  <li>For certain events, such as <code>setattr</code> and <code>write</code>, Qumulo Core aggregates changes into a single <code>MODIFIED</code> event.</li>
  <li>Currently, Qumulo Core doesn’t support watching <code>STREAM</code> attributes or the <code>WATCH_TREE</code> flag.</li>
</ul>
{{site.data.alerts.end}}

## Completion Filter Types
Each request uses a _completion filter_ to specify the events to watch for. When events occur, the system batches them into a `NOTIFY` response that contains a list of `FILE_ACTION` items, each tagged with the names of changed entries. As long as the handle for the watched directory remains open, events queue up on the server, so that no events are lost between <code>NOTIFY</code> requests.

* **Watching for Name Changes:** A name change can include four event types.
  * Renaming
  * Deleting
  * Moving into watched directory
  * Moving out of watched directory
  
  The returned action specifies to your application whether an entry has been added, renamed, or removed.

* **Watching for Metadata Changes:** A metadata change can include six supported attribute types.
  * File attributes
  * File size
  * Last-write time
  * Last-access time
  * Creation time
  * Security (the permissions or access control list for the file or directory)

  {% capture content_ea %}{{page.varNoEA}}{% endcapture %}
  {% include note.html content=content_ea %}


## Completion Filters and Corresponding Actions
The following table show the requested completion filters (grouped by the number of inode reads required to support them), the changes they watch for, and the actions corresponding to them.

<table>
<thead>
  <tr>
    <th>Completion Filters</th>
    <th>Actions</th>
    <th>Description</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>
      <p>The following filters watch for name changes (<code>readdir-without-attrs</code>).</p>      
      <p>&bull;&nbsp;<code>FILE_NOTIFY_CHANGE_DIR_NAME</code></p>        
      <p>&bull;&nbsp;<code>FILE_NOTIFY_CHANGE_FILE_NAME</code></p>  
    </td>
    <td>
      <p>&bull;&nbsp;<code>FILE_ACTION_ADDED</code></p>
      <p>&bull;&nbsp;<code>FILE_ACTION_MODIFIED</code></p>
      <p>&bull;&nbsp;<code>FILE_ACTION_REMOVED</code></p>        
      <p>&bull;&nbsp;<code>FILE_ACTION_RENAMED_NEW_NAME</code></p>
      <p>&bull;&nbsp;<code>FILE_ACTION_RENAMED_OLD_NAME</code></p>
    </td>
    <td>
      <p>When Qumulo Core watches names, it notifies the client when there is an added, removed, or renamed file or directory in the watched directory.</p>
      <ul>
        <li>A <code>delete</code> event sends both <code>REMOVED</code> and <code>MODIFIED</code> notifications.</li>
        <li>A <code>rename</code> event sends separate, consecutive events for <code>OLD</code> and <code>NEW</code> names, for example:
<pre>[REMOVED, file_old_name],
[ADDED, file_new_name]</pre></li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>
      <p>The following filters watch for metadata changes (<code>readdir-with-attrs</code>).</p>        
      <p>&bull;&nbsp;<code>FILE_NOTIFY_CHANGE_ATTRIBUTES</code></p>
      <p>&bull;&nbsp;<code>FILE_NOTIFY_CHANGE_CREATION</code></p>
      <p>&bull;&nbsp;<code>FILE_NOTIFY_CHANGE_SECURITY</code></p>        
      <p>&bull;&nbsp;<code>FILE_NOTIFY_CHANGE_SIZE</code></p>
      <p>&bull;&nbsp;<code>FILE_NOTIFY_CHANGE_LAST_ACCESS</code></p>
      <p>&bull;&nbsp;<code>FILE_NOTIFY_CHANGE_LAST_WRITE</code></p>
      {% capture content_attr %}{{page.varNoEA}}{% endcapture %}
      {% include note.html content=content_attr %}    
    </td>
    <td>
      <code>FILE_ACTION_MODIFIED</code>
    </td>
    <td>
      <p>When one of the watched attributes changes for an entry of the watched directory and the filter is requested, the client receives a <code>MODIFIED</code> event.</p>
      <p>{% include note.html content="In Microsoft terminology, attributes are <em>flags.</em> For more information, see <a href='https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-fscc/ca28ec38-f155-4768-81d6-4bfeb8586fc9'>File Attributes</a> in the Open Specification documentation." %}</p>
    </td>
  </tr>
  <tr>
    <td>
      <p>The following filters watch for alternative data stream (ADS) changes (<code>readdir-attrs-and-stream-names</code>).</p>      
      <p>&bull;&nbsp;<code>FILE_NOTIFY_CHANGE_STREAM_NAME</code></p>
      <p>&bull;&nbsp;<code>FILE_NOTIFY_CHANGE_STREAM_SIZE</code></p>
      <p>&bull;&nbsp;<code>FILE_NOTIFY_CHANGE_STREAM_WRITE</code></p>
      {{site.data.alerts.note}}
      <p>Qumulo Core doesn't support watching ADS changes. The following explanation is only informational.</p>
      <p>For more information, see <a href="#known-limitations">Known CHANGE_NOTIFY Limitations for Qumulo Core</a>.</p>
      {{site.data.alerts.end}}
    </td>
    <td>
      <p>&bull;&nbsp;<code>FILE_ACTION_ADDED_STREAM</code></p>
      <p>&bull;&nbsp;<code>FILE_ACTION_REMOVED_STREAM</code></p>
      <p>&bull;&nbsp;<code>FILE_ACTION_MODIFIED_STREAM</code></p>      
    </td>
    <td>
      <p>Consider the following example command.</p>
      <pre>echo "data" > watched_dir/file0:stream</pre>
      <p>This command generates the following event.</p>
      <pre>[ADDED_STREAM, file0:stream]</pre>
      <p>When a name change takes place, Qumulo Core returns the <code>STATUS_ENUM_DIR</code> message that indicates that the client should perform its own directory read.</p>
    </td>   
  </tr>  
</tbody>
</table>


<a id="known-limitations"></a>
## Known CHANGE_NOTIFY Limitations for Qumulo Core
Qumulo Core doesn't support the following workflows.

{% include important.html content="You must ensure that your application can handle the `STATUS_ENUM_DIR` response status that indicates to the SMB client that it needs to re-enumerate a directory manually. Depending on the library you use, this response might propagate as an error or an empty response." %}

* A `NOTIFY_CHANGE_STREAM` ADS completion filter is requested.

* The `SMB2_WATCH_TREE` flag is requested. Rather than watch a directory tree recursively, Qumulo Core handles the `SMB2_WATCH_TREE` flag the same way it handles the `CHANGE_STREAM` filters.
  
* The watched directory contains more than 5,000 entries.

* The response buffer size is exceeded. Most third-party libraries limit this size to 64 Kb. At the maximum SMB file name length of 255 UTF-16 characters, this limit corresponds to roughly 200 simultaneous file renames.

* The system reaches the heap usage quota for `CHANGE_NOTIFY`. In the worst scenario, this can correspond to more than 500 unique handles across all clients connected to a single Qumulo node.
