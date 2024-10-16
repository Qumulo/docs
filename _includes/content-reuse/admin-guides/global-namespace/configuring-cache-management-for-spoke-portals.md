Before you can configure spoke portal cache management, your Qumulo cluster must have [an active portal relationship](configuring-portal-relationship.html).

## How Cache Management Works in Qumulo Core
By default, Qumulo Core automatically recaches data on spoke portals upon access and maintains a minimum of 5% free capacity on clusters whose spoke portals contain cached data. Qumulo Core removes cached data in the background until it meets its configured _free threshold_ or until it removes all cached data from the spoke portals.

You can [configure the automated removal of cached data](#configure-automated-removal) or [remove cached data from spoke portals by using the `qq` CLI](#remove-cached-data-qq-cli).

{% include note.html content="Although this process doesn't affect data on the hub portal, accessing the portions of spoke portals whose cached data has been removed can incur the same latency as during initial access." %}


<a id="configure-automated-removal"></a>
## Configuring Automated Removal of Cached Data from Spoke Portals
This section explains how to configure automatic cache management for active spoke portals. To control automatic cache management, you can configure a _free threshold._ For example, if you set the free threshold setting to `0.05`, Qumulo Core begins to remove cached data from spoke portals when the system is 95% full.

{{site.data.alerts.important}}
<ul>
  <li>Depending on the free threshold configuration, the maximum amount of cached data that Qumulo Core can remove is equal to the amount of data that spoke portals consume.</li>
  <li>Spoke portals function as long as Qumulo Core has sufficient capacity for servicing in-flight file system requests. However, having to continuously fetch data from the hub portal can decrease system performance.</li>
  <li>If file system objects unrelated to spoke portals consume all usable capacity on a cluster, clients can experience issues while attemping to access spoke portals.</li>
</ul>
{{site.data.alerts.end}}

* To view the current free threshold, run the {% include qq.html command="portal_get_eviction_settings" %} command.

* To configure the current free threshold, run the {% include qq.html command="portal_set_eviction_settings" %} command and specify the free threshold value as a decimal between `0.0` and `1.0`. In the following example, Qumulo Core begins to remove cached data from spoke portals when the system is 80% full.

   ```bash
   qq portal_set_eviction_settings \
     --free-threshold 0.2
   ```

<a id="remove-cached-data-qq-cli"></a>
## Removing Cached Data from Spoke Portals by Using the qq CLI
This section explains how to free capacity by removing a cached directory, file, or a child file or directory linked to a parent directory.


### To Remove a Cached Directory
1. Ensure that the `jq` tool is installed on your system.

1. To determine the spoke ID, run the {% include qq.html command="portal_list_spokes" %} command and compare the spoke portal root directory to the path of the cached directory to be removed.

1. To determine the ID of the directory to be removed, run the {% include qq.html command="fs_file_get_attr" %} command and pipe the output to the `jq` tool. For example:

   ```bash
   qq fs_file_get_attr \
     --path /portals/seattle/media/ | \
       jq .id
   ```

1. Run the {% include qq.html command="portal_evict_tree" %} command and specify the spoke ID and directory ID. For example:

   ```bash
   qq portal_evict_tree \
     --spoke-id 3 \
     --dir-id 29710
   ```

   Qumulo Core begins to remove the cached directory. {{site.exampleOutput}}

   ```json
   {
     "monitor_uri": "v1/tree-delete/jobs/29710"
   }
   ```

1. To view the status of the removal process, run the {% include qq.html command="tree_delete_get" %} command and specify the directory ID.

   {{site.exampleOutput}}

   ```
   id         initial_path            mode
   ===== ...  =============           ===============
   29710      /portals/seattle/media  PORTAL_EVICTION
   ```

### To Remove a Cached File
1. Ensure that the `jq` tool is installed on your system.

1. To determine the spoke ID, run the {% include qq.html command="portal_list_spokes" %} command and compare the spoke portal root directory to the path of the cached file to be removed.

1. To determine the ID of the file to be removed, run the {% include qq.html command="fs_file_get_attr" %} command and pipe the output to the `jq` tool. For example:

   ```bash
   qq fs_file_get_attr \
     --path /portals/seattle/project.xml | \
       jq .id
   ```

1. Run the {% include qq.html command="portal_evict_data" %} command and specify the spoke ID and file ID. For example:

   ```bash
   qq portal_evict_data \
     --spoke-id 3 \
     --file-id 14560
   ```

   The cached file is removed. {{site.exampleOutput}}

   ```json
   {
     "evicted_blocks": 5000
   }
   ```

### To Remove a Cached Link from a Directory to its Child File or Directory
{% include note.html content="If no links remain to a cached child file or directory, this operation also removes the cached child." %}

1. Ensure that the `jq` tool is installed on your system.

1. To determine the spoke ID, run the {% include qq.html command="portal_list_spokes" %} command and compare the spoke portal root directory to the path of the of the child file or directory to be removed.

1. To determine the ID of the directory whose cached link to a child file is to be removed, run the {% include qq.html command="fs_file_get_attr" %} command and pipe the output to the `jq` tool. For example:

   ```bash
   qq fs_file_get_attr \
     --path /portals/seattle/ | \
       jq .id
   ```

1. Run the {% include qq.html command="portal_evict_link" %} and specify the spoke ID, the directory ID, and the name of the cached child file or the path of the cached child directory to be removed. The following example specifies the file `project.xml`.

   ```bash
   qq portal_evict_link \
     --spoke-id 3 \
     --dir-id 54890 \
     --name project.xml
   ```

   {{site.exampleOutput}}

   ```json
   {
     "evicted_blocks": 2
   }
   ```
