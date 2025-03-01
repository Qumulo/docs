{% capture nameChange %}{{site.gns.nameChange}}{% endcapture %}
{% include tip.html content=nameChange %}

Before you can configure spoke portal cache management, your Qumulo cluster must have [an active portal relationship](configuring-portal-relationship.html).

## How Cache Management Works in Qumulo Core
By default, Qumulo Core automatically recaches data on spoke portals upon access and maintains a minimum of 5% free capacity on clusters whose spoke portals contain cached data. Qumulo Core removes cached data in the background until it meets its configured _free threshold_ or until it removes all cached data from the spoke portals.

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

* To view the current cluster capacity used by a spoke portal's cache, run the {% include qq.html command="portal_list_file_systems" %} command.
