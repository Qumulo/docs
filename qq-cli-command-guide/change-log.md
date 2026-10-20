---
title: "Qumulo qq CLI Change Log"
summary: "This section lists the qq CLI changes for each release of Qumulo Core."
permalink: /qq-cli-command-guide/change-log.html
sidebar: qq_cli_command_reference_sidebar
layout: page
---

{% capture noCLIchanges %}This release contains no `qq` CLI changes.{% endcapture %}

<style>div#toc{height:200px;overflow:auto;}</style>


## 7.10 Releases

### Qumulo Core 7.10.3
{{ nexusLink }}
<ul>
  <li>Removed <code>qq ad_poll</code> command</li>
  <li>Removed <code>qq add_nodes</code> command</li>
  <li>Removed <code>qq auth_add_group</code> command</li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>Removed <code>qq auth_add_user</code> command</li>
    <li>Removed <code>qq auth_list_group</code> command</li>
    <li>Removed <code>qq auth_list_user</code> command</li>
    <li>Removed <code>qq auth_mod_group</code> command</li>
    <li>Removed <code>qq auth_mod_user</code> command</li>
    <li>Removed <code>qq capacity_clamp_get</code> command</li>
    <li>Removed <code>qq capacity_clamp_set</code> command</li>
    <li>Removed <code>qq capacity_history_files_get</code> command</li>
    <li>Removed <code>qq capacity_history_get</code> command</li>
    <li>Removed <code>qq change_password</code> command</li>
    <li>Removed <code>qq cluster_conf</code> command</li>
    <li>Removed <code>qq cluster_slots</code> command</li>
    <li>Removed <code>qq create_object_backed_cluster</code> command</li>
    <li>Removed <code>qq current_activity_get</code> command</li>
    <li>Removed <code>qq data_core_cluster_create</code> command</li>
    <li>Removed <code>qq fs_security_add_key</code> command</li>
    <li>Removed <code>qq fs_security_delete_key</code> command</li>
    <li>Removed <code>qq fs_security_get_key</code> command</li>
    <li>Removed <code>qq fs_security_get_key_replace_challenge</code> command</li>
    <li>Removed <code>qq fs_security_get_key_usage</code> command</li>
    <li>Removed <code>qq fs_security_list_keys</code> command</li>
    <li>Removed <code>qq fs_security_modify_key</code> command</li>
    <li>Removed <code>qq fs_security_replace_key</code> command</li>
    <li>Removed <code>qq get_object_backed_nodes</code> command</li>
    <li>Removed <code>qq get_object_storage_uris</code> command</li>
    <li>Removed <code>qq get_vpn_keys</code> command</li>
    <li>Removed <code>qq install_vpn_keys</code> command</li>
    <li>Removed <code>qq ldap_update_settings</code> command</li>
    <li>Removed <code>qq monitoring_conf</code> command</li>
    <li>Removed <code>qq monitoring_status_get</code> command</li>
    <li>Removed <code>qq network_backend_interfaces</code> command</li>
    <li>Removed <code>qq network_frontend_interfaces</code> command</li>
    <li>Removed <code>qq network_put_config</code> command</li>
    <li>Removed <code>qq network_status</code> command</li>
    <li>Removed <code>qq nfs_add_export</code> command</li>
    <li>Removed <code>qq nfs_mod_export</code> command</li>
    <li>Removed <code>qq nfs_mod_export_host_access</code> command</li>
    <li>Removed <code>qq node_chassis_status_get</code> command</li>
    <li>Removed <code>qq nodes_list</code> command</li>
    <li>Removed <code>qq object_backed_fault_tolerance_get</code> command</li>
    <li>Removed <code>qq protection_status_get</code> command</li>
    <li>Removed <code>qq quota_update_quota</code> command</li>
    <li>Removed <code>qq replace_nodes</code> command</li>
    <li>Removed <code>qq replication_add_blackout_window</code> command</li>
    <li>Removed <code>qq restriper_status</code> command</li>
    <li>Removed <code>qq rotate_encryption_keys</code> command</li>
    <li>Removed <code>qq s3_add_bucket</code> command</li>
    <li>Removed <code>qq set_cluster_conf</code> command</li>
    <li>Removed <code>qq set_monitoring_conf</code> command</li>
    <li>Removed <code>qq set_node_identify_light</code> command</li>
    <li>Removed <code>qq smb_add_share</code> command</li>
    <li>Removed <code>qq smb_mod_share</code> command</li>
    <li>Removed <code>qq smb_mod_share_permissions</code> command</li>
    <li>Removed <code>qq static_ip_allocation</code> command</li>
    <li>Removed <code>qq stratus_cluster_create</code> command</li>
    <li>Removed <code>qq time_reset_configuration</code> command</li>
    <li>Removed <code>qq time_series_get</code> command</li>
    <li>Removed <code>qq time_status</code> command</li>
    <li>Removed <code>qq unconfigured_nodes_list</code> command</li>
    <li>Removed <code>qq unconfigured_upgrade_config</code> command</li>
    <li>Removed <code>qq unconfigured_upgrade_config_set</code> command</li>
    <li>Removed <code>qq unprotected_edge_cluster_create</code> command</li>
    <li>Removed <code>qq who_am_i</code> command</li>
    <li>Added <code>qq ad_status</code> command</li>
    <li>Added <code>qq analytics_get_capacity_history</code> command</li>
    <li>Added <code>qq analytics_get_capacity_history_files</code> command</li>
    <li>Added <code>qq analytics_get_current_activity</code> command</li>
    <li>Added <code>qq analytics_get_time_series</code> command</li>
    <li>Added <code>qq auth_change_password</code> command</li>
    <li>Added <code>qq auth_create_group</code> command</li>
    <li>Added <code>qq auth_create_user</code> command</li>
    <li>Added <code>qq auth_get_group</code> command</li>
    <li>Added <code>qq auth_get_user</code> command</li>
    <li>Added <code>qq auth_modify_group</code> command</li>
    <li>Added <code>qq auth_modify_user</code> command</li>
    <li>Added <code>qq auth_who_am_i</code> command</li>
    <li>Added <code>qq capacity_get_clamp</code> command</li>
    <li>Added <code>qq capacity_set_clamp</code> command</li>
    <li>Added <code>qq cluster_add_nodes</code> command</li>
    <li>Added <code>qq cluster_create_data_core</code> command</li>
    <li>Added <code>qq cluster_create_object_backed_cluster</code> command</li>
    <li>Added <code>qq cluster_create_stratus</code> command</li>
    <li>Added <code>qq cluster_create_unprotected_edge</code> command</li>
    <li>Added <code>qq cluster_get_config</code> command</li>
    <li>Added <code>qq cluster_get_node_chassis_status</code> command</li>
    <li>Added <code>qq cluster_get_object_backed_fault_tolerance</code> command</li>
    <li>Added <code>qq cluster_get_object_backed_nodes</code> command</li>
    <li>Added <code>qq cluster_get_object_storage_uris</code> command</li>
    <li>Added <code>qq cluster_get_protection_status</code> command</li>
    <li>Added <code>qq cluster_get_slot_status</code> command</li>
    <li>Added <code>qq cluster_list_nodes</code> command</li>
    <li>Added <code>qq cluster_list_unconfigured_nodes</code> command</li>
    <li>Added <code>qq cluster_replace_nodes</code> command</li>
    <li>Added <code>qq cluster_set_config</code> command</li>
    <li>Added <code>qq cluster_set_node_identify_light</code> command</li>
    <li>Added <code>qq encryption_add_key</code> command</li>
    <li>Added <code>qq encryption_delete_key</code> command</li>
    <li>Added <code>qq encryption_get_key</code> command</li>
    <li>Added <code>qq encryption_get_key_replace_challenge</code> command</li>
    <li>Added <code>qq encryption_get_key_usage</code> command</li>
    <li>Added <code>qq encryption_list_keys</code> command</li>
    <li>Added <code>qq encryption_modify_key</code> command</li>
    <li>Added <code>qq encryption_replace_key</code> command</li>
    <li>Added <code>qq encryption_rotate_keys</code> command</li>
    <li>Added <code>qq frozen_bridge_create</code> command</li>
    <li>Added <code>qq frozen_bridge_delete</code> command</li>
    <li>Added <code>qq frozen_bridge_get</code> command</li>
    <li>Added <code>qq frozen_bridge_list</code> command</li>
    <li>Added <code>qq frozen_delete</code> command</li>
    <li>Added <code>qq frozen_delete_cancel</code> command</li>
    <li>Added <code>qq frozen_delete_get</code> command</li>
    <li>Added <code>qq frozen_delete_list</code> command</li>
    <li>Added <code>qq frozen_delete_remove</code> command</li>
    <li>Added <code>qq frozen_freeze</code> command</li>
    <li>Added <code>qq frozen_job_cancel</code> command</li>
    <li>Added <code>qq frozen_job_delete</code> command</li>
    <li>Added <code>qq frozen_job_get</code> command</li>
    <li>Added <code>qq frozen_job_list</code> command</li>
    <li>Added <code>qq frozen_thaw</code> command</li>
    <li>Added <code>qq ldap_modify_settings</code> command</li>
    <li>Added <code>qq monitoring_get_config</code> command</li>
    <li>Added <code>qq monitoring_get_status</code> command</li>
    <li>Added <code>qq monitoring_set_config</code> command</li>
    <li>Added <code>qq network_get_static_ip_allocation</code> command</li>
    <li>Added <code>qq network_get_status</code> command</li>
    <li>Added <code>qq network_list_backend_interfaces</code> command</li>
    <li>Added <code>qq network_list_frontend_interfaces</code> command</li>
    <li>Added <code>qq network_modify_config</code> command</li>
    <li>Added <code>qq nfs_create_export</code> command</li>
    <li>Added <code>qq nfs_modify_export</code> command</li>
    <li>Added <code>qq nfs_modify_export_host_access</code> command</li>
    <li>Added <code>qq quota_modify_quota</code> command</li>
    <li>Added <code>qq replication_create_blackout_window</code> command</li>
    <li>Added <code>qq restriper_get_status</code> command</li>
    <li>Added <code>qq s3_create_bucket</code> command</li>
    <li>Added <code>qq smb_create_share</code> command</li>
    <li>Added <code>qq smb_modify_share</code> command</li>
    <li>Added <code>qq smb_modify_share_permissions</code> command</li>
    <li>Added <code>qq support_get_vpn_keys</code> command</li>
    <li>Added <code>qq support_install_vpn_keys</code> command</li>
    <li>Added <code>qq time_get_status</code> command</li>
    <li>Added <code>qq time_reset_config</code> command</li>
    <li>Added <code>qq unconfigured_upgrade_get_config</code> command</li>
    <li>Added <code>qq unconfigured_upgrade_set_config</code> command</li>
    <li>Added <code>total_capacity_and_unfilled_bytes</code> accepted value to <code>--order-by</code> option in <code>qq fs_read_dir_aggregates</code> options</li>
    <li>
      Modified <code>qq object_portal_create_bridge</code>:
      <ul>
        <li>Added options to <code>qq object_portal_create_bridge</code> options:
          <ul>
            <li><code>--allow-archived-metadata-changes</code></li>
            <li><code>--disallow-archived-metadata-changes</code></li>
          </ul></li>
        <li>Added <code>FROZEN</code> accepted value to <code>--protocol-access</code> option in <code>qq object_portal_create_bridge</code> options</li>
        <li>Changed the synopsis of <code>qq object_portal_create_bridge</code></li>
        <li>Changed the help text for <code>qq object_portal_create_bridge</code> options:
          <ul>
            <li><code>--bucket-uri</code></li>
            <li><code>--delimiter</code></li>
            <li><code>--key-prefix</code></li>
            <li><code>--key-vault-hostname</code></li>
            <li><code>--metadata-import</code></li>
            <li><code>--mount-path</code></li>
            <li><code>--notification-queue-url</code></li>
            <li><code>--protocol-access</code></li>
          </ul></li>
      </ul>
    </li>
    <li>
      Modified <code>qq object_portal_delete_bridge</code>:
      <ul>
        <li>Added <code>--force</code> option to <code>qq object_portal_delete_bridge</code> options</li>
        <li>Changed the synopsis of <code>qq object_portal_delete_bridge</code></li>
        <li>Changed the help text for <code>--filesystem-uuid</code> option in <code>qq object_portal_delete_bridge</code></li>
      </ul>
    </li>
    <li>Changed the synopsis of <code>qq object_portal_get_bridge</code></li>
    <li>Changed the synopsis of <code>qq object_portal_list_bridges</code></li>
    <li>
      Modified <code>qq object_portal_refresh</code>:
      <ul>
        <li>Changed the synopsis of <code>qq object_portal_refresh</code></li>
        <li>Changed the help text for <code>qq object_portal_refresh</code> options:
          <ul>
            <li><code>--bucket-uri</code></li>
            <li><code>--key</code></li>
            <li><code>--mode</code></li>
          </ul></li>
      </ul>
    </li>
    <li>Changed the help text for <code>--no-paths</code> option in <code>qq portal_accept_hub</code></li>
    <li>Changed the help text for <code>--no-paths</code> option in <code>qq portal_authorize_hub_root</code></li>
    <li>
      Modified <code>qq portal_create</code>:
      <ul>
        <li>Removed <code>--paused-spoke</code> option from <code>qq portal_create</code> options</li>
        <li>Changed the help text for <code>--no-paths</code> option in <code>qq portal_create</code></li>
      </ul>
    </li>
    <li>Changed the help text for <code>--no-paths</code> option in <code>qq portal_delete_hub</code></li>
    <li>Changed the help text for <code>--no-paths</code> option in <code>qq portal_delete_spoke</code></li>
    <li>Changed the help text for <code>--no-paths</code> option in <code>qq portal_delete_spoke_root</code></li>
    <li>Changed the help text for <code>--no-paths</code> option in <code>qq portal_deny_hub_root</code></li>
    <li>Changed the help text for <code>--no-paths</code> option in <code>qq portal_get_hub</code></li>
    <li>Changed the help text for <code>--no-paths</code> option in <code>qq portal_get_spoke</code></li>
    <li>Changed the help text for <code>--no-paths</code> option in <code>qq portal_modify_hub</code></li>
    <li>Changed the help text for <code>--no-paths</code> option in <code>qq portal_modify_spoke</code></li>
    <li>Changed the help text for <code>--no-paths</code> option in <code>qq portal_propose_spoke_root</code></li>
    <li>Added <code>yearly</code> accepted value to <code>command</code> option in <code>qq snapshot_create_policy</code> options</li>
    <li>Changed the help text for <code>qq snapshot_lock_snapshot</code></li>
    <li>Added <code>change_to_yearly</code> accepted value to <code>command</code> option in <code>qq snapshot_modify_policy</code> options</li>
    <li>Changed the help text for <code>--no-monitor</code> option in <code>qq upgrade_status</code></li>
  </ul>
</details>

### Qumulo Core 7.10.2
{{ nexusLink }}
{{ noCLIchanges }}

### Qumulo Core 7.10.1.2
{{ nexusLink }}
{{ noCLIchanges }}

### Qumulo Core 7.10.0.2 (Quarterly)
{{ nexusLink }}
{{ noCLIchanges }}


## 7.9 Releases

### Qumulo Core 7.9.3.1
{{ nexusLink }}
{{ noCLIchanges }}

### Qumulo Core 7.9.2.3
{{ nexusLink }}
{{ noCLIchanges }}

### Qumulo Core 7.9.1.3
{{ nexusLink }}
{{ noCLIchanges }}

### Qumulo Core 7.9.0.4 (Quarterly)
{{ nexusLink }}
{{ noCLIchanges }}


## 7.8 Releases

### Qumulo Core 7.8.4.3
{{ nexusLink }}
{{ noCLIchanges }}

### Qumulo Core 7.8.3.1
{{ nexusLink }}
{{ noCLIchanges }}

### Qumulo Core 7.8.2.1
{{ nexusLink }}
{{ noCLIchanges }}

### Qumulo Core 7.8.1.1
{{ nexusLink }}
{{ noCLIchanges }}

### Qumulo Core 7.8.0.4 (Quarterly)
{{ nexusLink }}
{{ noCLIchanges }}


## 7.7 Releases

### Qumulo Core 7.7.5.1
{{ nexusLink }}
{{ noCLIchanges }}

### Qumulo Core 7.7.4.1
{{ nexusLink }}
{{ noCLIchanges }}

### Qumulo Core 7.7.3
{{ nexusLink }}
<ul>
  <li>Added <code>--expand-fs-path-variables</code> option to <code>qq smb_add_share</code> options</li>
  <li>Added <code>--expand-fs-path-variables</code> option to <code>qq smb_mod_share</code> options</li>
</ul>

### Qumulo Core 7.7.2
{{ nexusLink }}
{{ noCLIchanges }}

### Qumulo Core 7.7.1.1
{{ nexusLink }}
{{ noCLIchanges }}

### Qumulo Core 7.7.0.3 (Quarterly)
{{ nexusLink }}
{{ noCLIchanges }}


## 7.6 Releases

### Qumulo Core 7.6.4.1 
{{ nexusLink }}
{{ noCLIchanges }}

### Qumulo Core 7.6.3.1
{{ nexusLink }}
{{ noCLIchanges }}

### Qumulo Core 7.6.2
{{ nexusLink }}
{{ noCLIchanges }}

### Qumulo Core 7.6.1.1
{{ nexusLink }}
{{ noCLIchanges }}

### Qumulo Core 7.6.0.2 (Quarterly)
{{ nexusLink }}
{{ noCLIchanges }}


## 7.5 Releases

### Qumulo Core 7.5.5.2
{{ nexusLink }}
{{ noCLIchanges }}

### Qumulo Core 7.5.4.2
{{ nexusLink }}
{{ noCLIchanges }}

### Qumulo Core 7.5.3
{{ nexusLink }}
{{ noCLIchanges }}

### Qumulo Core 7.5.2
{{ nexusLink }}
{{ noCLIchanges }}

### Qumulo Core 7.5.1.2
{{ nexusLink }}
{{ noCLIchanges }}

### Qumulo Core 7.5.0.3 (Quarterly)
{{ nexusLink }}
{{ noCLIchanges }}
