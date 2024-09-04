## How File Locks Works in Qumulo Core
A _file lock_ can prevent a regular file from being modified. There are two file lock types, both of which require the `FS_FILE_LOCK_WRITE` privilege.

* **Legal Hold:** A file lock that you can enable for an indefinite time period. This file lock type is best suited for temporary scenarios.

* **Retention Period:** A file lock that you can enable for a specific period of time by configuring a _retention period_ which can be extended but never shortened or removed. This file lock type is best suited to locking files for a known time period.

For more information and examples of configuring file locks, see the following resources in the {{site.guides.cli}}:

* {% include qq.html command="fs_file_modify_lock" %}

* {% include qq.html command="fs_file_get_attr" %}


## How You Can Use File Locks to Implement the Write Once Read Many (WORM) Model
To lock any newly created file once the client finishes writing to it, you can [watch for file attribute and directory changes by using REST](../watching-file-attribute-directory-changes/rest.html). For example, you can use the `child_data_written` or `child_size_change` events. For more information, see [SSE Payload Notification Types](../watching-file-attribute-directory-changes/rest.html#sse-payload-notification-types).

To implement the WORM model and maintain the file's _write-once_ integrity, use file locks to prevent any further modifications after the file becomes immutable following the initial write operation.
