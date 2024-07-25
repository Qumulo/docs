---
category: /Files
methods:
  get:
    parameters:
    - description: The file ID or the absolute path to the file system object. File
        IDs can be found in the id field of responses of APIs that return file attributes.
        You must URL-encode the paths. The APIs & Tools page in the Qumulo Core Web
        UI URL-encodes the paths.
      name: ref
      required: true
    - description: 'A list that indicates the types of notification that you want
        to receive, in CSV format. If you don''t provide the list, the system sends
        every type of notification. The following are available notification types:*
        child_file_added

        * child_dir_added

        * child_file_removed

        * child_dir_removed

        * child_file_moved_from

        * child_file_moved_to

        * child_dir_moved_from

        * child_dir_moved_to

        * child_btime_changed

        * child_mtime_changed

        * child_atime_changed

        * child_size_changed

        * child_extra_attrs_changed

        * child_acl_changed

        * child_owner_changed

        * child_group_changed

        * child_data_written

        * child_stream_added

        * child_stream_removed

        * child_stream_moved_from

        * child_stream_moved_to

        * child_stream_size_changed

        * child_stream_data_written

        * self_removed

        '
      name: filter
      required: false
    - description: Specifies whether notifications are recursive. A recursive notification
        emits events for all files in the entire directory tree of the specified directory.
        A non-recursive notification emits events only for files that are immediately
        below (but not further down the directory tree) for the specified directory.
        To configure recursion for notifications, use the /v1/file-system/settings/notify
        REST API resource.
      name: recursive
      required: false
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: 'Streams notifications for file system activity, monitoring only the
      files in the specified directory by using HTML server-sent events (SSE). The
      SSE data payload contains JSON-encoded event objects. For example: [{"type":
      <string>, "path": <string>, "stream_name": <optional string>}].'
rest_endpoint: /v1/files/{ref}/notify
api_version: v1
permalink: /rest-api-guide/files/files_ref_notify.html
sidebar: rest_api_guide_sidebar
---
