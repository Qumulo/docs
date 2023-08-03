---
title: "Watching for File Attribute and Directory Changes by Using SMB2 CHANGE_NOTIFY"
summary: "This section lists the completion filters that an SMB client can request and the corresponding actions that Qumulo Core returns for a matched change."
permalink: /administrator-guide/watching-file-attribute-directory-changes/smb2-change-notify.html
redirect_from:
  - /administrator-guide/file-system-protocols/watching-file-directory-changes-smb2-change-notify.html
sidebar: administrator_guide_sidebar
keywords: SMB2, CHANGE_NOTIFY, completion_filter, action, matched_change
varNoEA: Qumulo doesn't support mutating extended attributes (EA). If the system requests only the <code>FILE_NOTIFY_CHANGE_EA</code> filter, no events propagate.
---

{% capture useRESTnotSMB %}{{site.changeNotify.useRESTnotSMB}}{% endcapture %}
{% include note.html content=useRESTnotSMB %}

Qumulo Core can watch for changes in file attributes and directory entries with a combination of SMB2 <a href='https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-smb2/598f395a-e7a2-4cc8-afb3-ccb30dd2df7c'><code>CHANGE_NOTIFY</code></a> filters. Depending on the requested filter&mdash;and activity in the file system&mdash;an SMB client or an application remains current by receiving a variety of notifications.

Commonly, these requests help limit the amount of traffic required to keep a current cache of entries for an open directory. The requests also help operating system applications such as Windows Explorer and macOS Finder update automatically when changes take place. It is also possible to make requests programmatically. For more information about language bindings, see the Windows Protocol documentation, such as [ReadDirectoryChangesW function (winbase.h)](https://learn.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-readdirectorychangesw) for Win32 and [FileSystemWatcher Class](https://learn.microsoft.com/en-us/dotnet/api/system.io.filesystemwatcher?view=net-7.0) for .NET.

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
The following table shows the requested completion filters (grouped by the number of inode reads required to support them), the changes they watch for, and the actions that correspond to them.

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
      <p>A <code>rename</code> event sends separate, consecutive events for <code>OLD</code> and <code>NEW</code> names, for example:
<pre>[REMOVED, file_old_name],
[ADDED, file_new_name]</pre>
      </p>
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
    </td>   
  </tr>  
</tbody>
</table>

{% include note.html content="If you don't supply a filter, the SMB server accepts the request but doesn't send any notifications." %}

## Re-Enumerating Changes after the STATUS_ENUM_DIR Error
If the SMB client can't keep up with the notification stream from the server, the server returns the `STATUS_ENUM_DIR` error code to the client and stops sending notifications.

In this scenario, the client must re-enumerate any changes that concern it directly, by opening and inspecting files, rather than relying on notifications. This scenario can happen because the request is too broad, for example, a recursive watch on the filesystem root.

## Configuring Full Recursion for the WATCH_TREE Flag
By default, when a client supplies the `WATCH_TREE` flag, the server sends an error to the client immediately. In this scenario, you can [configure your Qumulo cluster to support full recursion](how-file-system-change-notifications-work.html).
