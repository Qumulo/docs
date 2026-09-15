---
category: /Files V1
methods:
  get:
    summary: 'Streams notifications for file system activity, monitoring only the
      files in the specified directory by using HTML server-sent events (SSE). The
      SSE data payload contains JSON-encoded event objects. For example: [{"type":
      <string>, "path": <string>, "stream_name": <optional string>}].'
    parameters:
    - name: ref
      description: The file ID or the absolute path to the file system object. File
        IDs can be found in the id field of responses of APIs that return file attributes.
        You must URL-encode the paths. The APIs & Tools page in the Qumulo Core Web
        UI URL-encodes the paths.
      required: true
    - name: filter
      description: A list that indicates the types of notification that you want to
        receive, in CSV format. If you don't provide the list, the system sends every
        type of notification. The following are available notification types:<ul><li><code>child_file_added</code></li><li><code>child_dir_added</code></li><li><code>child_file_removed</code></li><li><code>child_dir_removed</code></li><li><code>child_file_moved_from</code></li><li><code>child_file_moved_to</code></li><li><code>child_dir_moved_from</code></li><li><code>child_dir_moved_to</code></li><li><code>child_btime_changed</code></li><li><code>child_mtime_changed</code></li><li><code>child_atime_changed</code></li><li><code>child_size_changed</code></li><li><code>child_extra_attrs_changed</code></li><li><code>child_acl_changed</code></li><li><code>child_owner_changed</code></li><li><code>child_group_changed</code></li><li><code>child_data_written</code></li><li><code>child_stream_added</code></li><li><code>child_stream_removed</code></li><li><code>child_stream_moved_from</code></li><li><code>child_stream_moved_to</code></li><li><code>child_stream_size_changed</code></li><li><code>child_stream_data_written</code></li><li><code>self_removed</code></li></ul>
      required: false
    - name: recursive
      description: Specifies whether notifications are recursive. A recursive notification
        emits events for all files in the entire directory tree of the specified directory.
        A non-recursive notification emits events only for files that are immediately
        below (but not further down the directory tree) for the specified directory.
        To configure recursion for notifications, use the /v1/file-system/settings/notify
        REST API resource.
      required: false
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/files/{ref}/notify
api_version: v1
permalink: /rest-api-guide/files-v1/files_ref_notify.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/files/files_ref_notify.html
deprecated: false
---
