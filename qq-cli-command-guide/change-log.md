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
  <li>Removed `qq ad_poll` command</li>
  <li>Removed `qq add_nodes` command</li>
  <li>Removed `qq auth_add_group` command</li>
</ul>

  **Click to expand**
  <ul>
    <li>Removed `qq auth_add_user` command</li>
    <li>Removed `qq auth_list_group` command</li>
    <li>Removed `qq auth_list_user` command</li>
    <li>Removed `qq auth_mod_group` command</li>
    <li>Removed `qq auth_mod_user` command</li>
    <li>Removed `qq capacity_clamp_get` command</li>
    <li>Removed `qq capacity_clamp_set` command</li>
    <li>Removed `qq capacity_history_files_get` command</li>
    <li>Removed `qq capacity_history_get` command</li>
    <li>Removed `qq change_password` command</li>
    <li>Removed `qq cluster_conf` command</li>
    <li>Removed `qq cluster_slots` command</li>
    <li>Removed `qq create_object_backed_cluster` command</li>
    <li>Removed `qq current_activity_get` command</li>
    <li>Removed `qq data_core_cluster_create` command</li>
    <li>Removed `qq fs_security_add_key` command</li>
    <li>Removed `qq fs_security_delete_key` command</li>
    <li>Removed `qq fs_security_get_key` command</li>
    <li>Removed `qq fs_security_get_key_replace_challenge` command</li>
    <li>Removed `qq fs_security_get_key_usage` command</li>
    <li>Removed `qq fs_security_list_keys` command</li>
    <li>Removed `qq fs_security_modify_key` command</li>
    <li>Removed `qq fs_security_replace_key` command</li>
    <li>Removed `qq get_object_backed_nodes` command</li>
    <li>Removed `qq get_object_storage_uris` command</li>
    <li>Removed `qq get_vpn_keys` command</li>
    <li>Removed `qq install_vpn_keys` command</li>
    <li>Removed `qq ldap_update_settings` command</li>
    <li>Removed `qq monitoring_conf` command</li>
    <li>Removed `qq monitoring_status_get` command</li>
    <li>Removed `qq network_backend_interfaces` command</li>
    <li>Removed `qq network_frontend_interfaces` command</li>
    <li>Removed `qq network_put_config` command</li>
    <li>Removed `qq network_status` command</li>
    <li>Removed `qq nfs_add_export` command</li>
    <li>Removed `qq nfs_mod_export` command</li>
    <li>Removed `qq nfs_mod_export_host_access` command</li>
    <li>Removed `qq node_chassis_status_get` command</li>
    <li>Removed `qq nodes_list` command</li>
    <li>Removed `qq object_backed_fault_tolerance_get` command</li>
    <li>Removed `qq protection_status_get` command</li>
    <li>Removed `qq quota_update_quota` command</li>
    <li>Removed `qq replace_nodes` command</li>
    <li>Removed `qq replication_add_blackout_window` command</li>
    <li>Removed `qq restriper_status` command</li>
    <li>Removed `qq rotate_encryption_keys` command</li>
    <li>Removed `qq s3_add_bucket` command</li>
    <li>Removed `qq set_cluster_conf` command</li>
    <li>Removed `qq set_monitoring_conf` command</li>
    <li>Removed `qq set_node_identify_light` command</li>
    <li>Removed `qq smb_add_share` command</li>
    <li>Removed `qq smb_mod_share` command</li>
    <li>Removed `qq smb_mod_share_permissions` command</li>
    <li>Removed `qq static_ip_allocation` command</li>
    <li>Removed `qq stratus_cluster_create` command</li>
    <li>Removed `qq time_reset_configuration` command</li>
    <li>Removed `qq time_series_get` command</li>
    <li>Removed `qq time_status` command</li>
    <li>Removed `qq unconfigured_nodes_list` command</li>
    <li>Removed `qq unconfigured_upgrade_config` command</li>
    <li>Removed `qq unconfigured_upgrade_config_set` command</li>
    <li>Removed `qq unprotected_edge_cluster_create` command</li>
    <li>Removed `qq who_am_i` command</li>
    <li>Added `qq ad_status` command</li>
    <li>Added `qq analytics_get_capacity_history` command</li>
    <li>Added `qq analytics_get_capacity_history_files` command</li>
    <li>Added `qq analytics_get_current_activity` command</li>
    <li>Added `qq analytics_get_time_series` command</li>
    <li>Added `qq auth_change_password` command</li>
    <li>Added `qq auth_create_group` command</li>
    <li>Added `qq auth_create_user` command</li>
    <li>Added `qq auth_get_group` command</li>
    <li>Added `qq auth_get_user` command</li>
    <li>Added `qq auth_modify_group` command</li>
    <li>Added `qq auth_modify_user` command</li>
    <li>Added `qq auth_who_am_i` command</li>
    <li>Added `qq capacity_get_clamp` command</li>
    <li>Added `qq capacity_set_clamp` command</li>
    <li>Added `qq cluster_add_nodes` command</li>
    <li>Added `qq cluster_create_data_core` command</li>
    <li>Added `qq cluster_create_object_backed_cluster` command</li>
    <li>Added `qq cluster_create_stratus` command</li>
    <li>Added `qq cluster_create_unprotected_edge` command</li>
    <li>Added `qq cluster_get_config` command</li>
    <li>Added `qq cluster_get_node_chassis_status` command</li>
    <li>Added `qq cluster_get_object_backed_fault_tolerance` command</li>
    <li>Added `qq cluster_get_object_backed_nodes` command</li>
    <li>Added `qq cluster_get_object_storage_uris` command</li>
    <li>Added `qq cluster_get_protection_status` command</li>
    <li>Added `qq cluster_get_slot_status` command</li>
    <li>Added `qq cluster_list_nodes` command</li>
    <li>Added `qq cluster_list_unconfigured_nodes` command</li>
    <li>Added `qq cluster_replace_nodes` command</li>
    <li>Added `qq cluster_set_config` command</li>
    <li>Added `qq cluster_set_node_identify_light` command</li>
    <li>Added `qq encryption_add_key` command</li>
    <li>Added `qq encryption_delete_key` command</li>
    <li>Added `qq encryption_get_key` command</li>
    <li>Added `qq encryption_get_key_replace_challenge` command</li>
    <li>Added `qq encryption_get_key_usage` command</li>
    <li>Added `qq encryption_list_keys` command</li>
    <li>Added `qq encryption_modify_key` command</li>
    <li>Added `qq encryption_replace_key` command</li>
    <li>Added `qq encryption_rotate_keys` command</li>
    <li>Added `qq frozen_bridge_create` command</li>
    <li>Added `qq frozen_bridge_delete` command</li>
    <li>Added `qq frozen_bridge_get` command</li>
    <li>Added `qq frozen_bridge_list` command</li>
    <li>Added `qq frozen_delete` command</li>
    <li>Added `qq frozen_delete_cancel` command</li>
    <li>Added `qq frozen_delete_get` command</li>
    <li>Added `qq frozen_delete_list` command</li>
    <li>Added `qq frozen_delete_remove` command</li>
    <li>Added `qq frozen_freeze` command</li>
    <li>Added `qq frozen_job_cancel` command</li>
    <li>Added `qq frozen_job_delete` command</li>
    <li>Added `qq frozen_job_get` command</li>
    <li>Added `qq frozen_job_list` command</li>
    <li>Added `qq frozen_thaw` command</li>
    <li>Added `qq ldap_modify_settings` command</li>
    <li>Added `qq monitoring_get_config` command</li>
    <li>Added `qq monitoring_get_status` command</li>
    <li>Added `qq monitoring_set_config` command</li>
    <li>Added `qq network_get_static_ip_allocation` command</li>
    <li>Added `qq network_get_status` command</li>
    <li>Added `qq network_list_backend_interfaces` command</li>
    <li>Added `qq network_list_frontend_interfaces` command</li>
    <li>Added `qq network_modify_config` command</li>
    <li>Added `qq nfs_create_export` command</li>
    <li>Added `qq nfs_modify_export` command</li>
    <li>Added `qq nfs_modify_export_host_access` command</li>
    <li>Added `qq quota_modify_quota` command</li>
    <li>Added `qq replication_create_blackout_window` command</li>
    <li>Added `qq restriper_get_status` command</li>
    <li>Added `qq s3_create_bucket` command</li>
    <li>Added `qq smb_create_share` command</li>
    <li>Added `qq smb_modify_share` command</li>
    <li>Added `qq smb_modify_share_permissions` command</li>
    <li>Added `qq support_get_vpn_keys` command</li>
    <li>Added `qq support_install_vpn_keys` command</li>
    <li>Added `qq time_get_status` command</li>
    <li>Added `qq time_reset_config` command</li>
    <li>Added `qq unconfigured_upgrade_get_config` command</li>
    <li>Added `qq unconfigured_upgrade_set_config` command</li>
    <li>Added `total_capacity_and_unfilled_bytes` accepted value to `--order-by` flag in `qq fs_read_dir_aggregates` command</li>
    <li>
      Modified `qq object_portal_create_bridge`:
      <ul>
        <li>Added flags to `qq object_portal_create_bridge` command:
          <ul>
            <li>`--allow-archived-metadata-changes`</li>
            <li>`--disallow-archived-metadata-changes`</li>
          </ul></li>
        <li>Added `FROZEN` accepted value to `--protocol-access` flag in `qq object_portal_create_bridge` command</li>
        <li>Changed the help text for `qq object_portal_create_bridge` flags:
      <ul>
        <li>`--bucket-uri`</li>
        <li>`--delimiter`</li>
        <li>`--key-prefix`</li>
        <li>`--key-vault-hostname`</li>
        <li>`--metadata-import`</li>
        <li>`--mount-path`</li>
        <li>`--notification-queue-url`</li>
        <li>`--protocol-access`</li>
      </ul></li>
      </ul>
    </li>
    <li>
      Modified `qq object_portal_delete_bridge`:
      <ul>
        <li>Added `--force` flag to `qq object_portal_delete_bridge` command</li>
        <li>Changed the help text for `--filesystem-uuid` flag in `qq object_portal_delete_bridge` command</li>
      </ul>
    </li>
    <li>
      Changed the help text for `qq object_portal_refresh` flags:
      <ul>
        <li>`--bucket-uri`</li>
        <li>`--key`</li>
        <li>`--mode`</li>
      </ul>
    </li>
    <li>Changed the help text for `--no-paths` flag in `qq portal_accept_hub` command</li>
    <li>Changed the help text for `--no-paths` flag in `qq portal_authorize_hub_root` command</li>
    <li>
      Modified `qq portal_create`:
      <ul>
        <li>Removed `--paused-spoke` flag from `qq portal_create` command</li>
        <li>Changed the help text for `--no-paths` flag in `qq portal_create` command</li>
      </ul>
    </li>
    <li>Changed the help text for `--no-paths` flag in `qq portal_delete_hub` command</li>
    <li>Changed the help text for `--no-paths` flag in `qq portal_delete_spoke` command</li>
    <li>Changed the help text for `--no-paths` flag in `qq portal_delete_spoke_root` command</li>
    <li>Changed the help text for `--no-paths` flag in `qq portal_deny_hub_root` command</li>
    <li>Changed the help text for `--no-paths` flag in `qq portal_get_hub` command</li>
    <li>Changed the help text for `--no-paths` flag in `qq portal_get_spoke` command</li>
    <li>Changed the help text for `--no-paths` flag in `qq portal_modify_hub` command</li>
    <li>Changed the help text for `--no-paths` flag in `qq portal_modify_spoke` command</li>
    <li>Changed the help text for `--no-paths` flag in `qq portal_propose_spoke_root` command</li>
    <li>Added `yearly` accepted value to `command` flag in `qq snapshot_create_policy` command</li>
    <li>Changed the description of `qq snapshot_lock_snapshot`</li>
    <li>Added `change_to_yearly` accepted value to `command` flag in `qq snapshot_modify_policy` command</li>
    <li>Changed the help text for `--no-monitor` flag in `qq upgrade_status` command</li>
  </ul>

### Qumulo Core 7.10.2
{{ nexusLink }}
<ul>
  <li>Removed `qq portal_modify_hub_host` command</li>
  <li>Removed `qq portal_modify_spoke_host` command</li>
  <li>
    Modified `qq fs_delete_user_metadata`:
      <ul>
        <li>Added `--well-known` flag to `qq fs_delete_user_metadata` command</li>
        <li>Changed the help text for `--s3` flag in `qq fs_delete_user_metadata` command</li>
      </ul>
  </li>
</ul>

  **Click to expand**
  <ul>
    <li>
      Modified `qq fs_get_user_metadata`:
      <ul>
        <li>Added `--well-known` flag to `qq fs_get_user_metadata` command</li>
        <li>Changed the help text for `--s3` flag in `qq fs_get_user_metadata` command</li>
      </ul>
    </li>
    <li>
      Modified `qq fs_list_user_metadata`:
      <ul>
        <li>Added `--well-known` flag to `qq fs_list_user_metadata` command</li>
        <li>Changed the help text for `--s3` flag in `qq fs_list_user_metadata` command</li>
      </ul>
    </li>
    <li>
      Modified `qq fs_set_user_metadata`:
      <ul>
        <li>Added `--well-known` flag to `qq fs_set_user_metadata` command</li>
        <li>Changed the help text for `--s3` flag in `qq fs_set_user_metadata` command</li>
      </ul>
    </li>
    <li>Added `--all` flag to `qq logout` command</li>
    <li>
      Modified `qq portal_modify_hub`:
      <ul>
        <li>Added `paused` accepted value to `--type` flag in `qq portal_modify_hub` command</li>
        <li>Changed the help text for `--type` flag in `qq portal_modify_hub` command</li>
      </ul>
    </li>
  </ul>

### Qumulo Core 7.10.1.2
{{ nexusLink }}
<ul>
  <li>Removed `qq object_bridge_create` command</li>
  <li>Removed `qq object_bridge_delete` command</li>
  <li>Removed `qq object_bridge_export_job_run` command</li>
</ul>

  **Click to expand**
  <ul>
    <li>Removed `qq object_bridge_export_rule_create` command</li>
    <li>Removed `qq object_bridge_export_rule_delete` command</li>
    <li>Removed `qq object_bridge_export_rule_get` command</li>
    <li>Removed `qq object_bridge_export_rule_list` command</li>
    <li>Removed `qq portal_get_file_system` command</li>
    <li>Removed `qq portal_list_file_systems` command</li>
    <li>Added `qq object_portal_create_bridge` command</li>
    <li>Added `qq object_portal_delete_bridge` command</li>
    <li>Added `qq object_portal_get_bridge` command</li>
    <li>Added `qq object_portal_list_bridges` command</li>
    <li>Added `qq object_portal_refresh` command</li>
    <li>Added `qq portal_get_filesystem` command</li>
    <li>Added `qq portal_list_filesystems` command</li>
    <li>Added `--record-ttl-seconds` flag to `qq authoritative_dns_modify_settings` command</li>
    <li>Changed the description of `qq fs_create_symlink`</li>
    <li>
      Changed the help text for `qq fs_delete` flags:
      <ul>
        <li>`--id`</li>
        <li>`--path`</li>
      </ul>
    </li>
    <li>
      Added accepted values to `--order-by` flag in `qq fs_read_dir_aggregates` command:
          <ul>
            <li>`total_external_object_bytes`</li>
            <li>`total_external_objects`</li>
          </ul>
    </li>
    <li>Changed the description of `qq fs_security_add_key`</li>
    <li>Changed the description of `qq fs_set_notify_settings`</li>
    <li>Changed the description of `qq fs_unlink`</li>
    <li>Changed the description of `qq multitenancy_create_tenant`</li>
    <li>
      Changed the help text for `qq nfs_add_export` flags:
      <ul>
        <li>`--create-fs-path`</li>
        <li>`--fs-path`</li>
      </ul>
    </li>
    <li>
      Changed the help text for `qq nfs_mod_export` flags:
      <ul>
        <li>`--create-fs-path`</li>
        <li>`--fs-path`</li>
      </ul>
    </li>
    <li>
      Modified `qq portal_create`:
      <ul>
        <li>Added flags to `qq portal_create` command:
          <ul>
            <li>`--paused-spoke`</li>
            <li>`--suspended-spoke`</li>
          </ul></li>
        <li>Changed the help text for `--read-only-spoke` flag in `qq portal_create` command</li>
      </ul>
    </li>
    <li>Removed `--dns-lookup` flag from `qq portal_list` command</li>
    <li>Removed `--dns-lookup` flag from `qq portal_list_hubs` command</li>
    <li>
      Modified `qq portal_list_quorum_events`:
      <ul>
        <li>Added `--filesystem-uuid` flag to `qq portal_list_quorum_events` command</li>
        <li>Removed `--fs-id` flag from `qq portal_list_quorum_events` command</li>
      </ul>
    </li>
    <li>Removed `--dns-lookup` flag from `qq portal_list_spokes` command</li>
    <li>
      Modified `qq portal_modify_hub`:
      <ul>
        <li>Added `--type` flag to `qq portal_modify_hub` command</li>
        <li>Removed `--make-read-write` flag from `qq portal_modify_hub` command</li>
      </ul>
    </li>
    <li>
      Modified `qq portal_modify_hub_host`:
      <ul>
        <li>Added `--type` flag to `qq portal_modify_hub_host` command</li>
        <li>Removed `--make-read-write` flag from `qq portal_modify_hub_host` command</li>
      </ul>
    </li>
    <li>
      Changed the help text for `qq smb_add_share` flags:
      <ul>
        <li>`--create-fs-path`</li>
        <li>`--expand-fs-path-variables`</li>
        <li>`--fs-path`</li>
      </ul>
    </li>
    <li>
      Changed the help text for `qq smb_mod_share` flags:
      <ul>
        <li>`--create-fs-path`</li>
        <li>`--expand-fs-path-variables`</li>
        <li>`--fs-path`</li>
      </ul>
    </li>
    <li>
      Modified `qq snapshot_lock_snapshot`:
      <ul>
        <li>Changed the description of `qq snapshot_lock_snapshot`</li>
        <li>Changed the help text for `--lock-key` flag in `qq snapshot_lock_snapshot` command</li>
      </ul>
    </li>
    <li>
      Changed the help text for `qq stratus_cluster_create` flags:
      <ul>
        <li>`--node-uuids-and-fault-domains`</li>
        <li>`--object-store-credentials`</li>
      </ul>
    </li>
  </ul>

### Qumulo Core 7.10.0.2 (Quarterly)
{{ nexusLink }}
<ul>
  <li>Added `qq fs_try_resolve_paths` command</li>
  <li>
    Modified `qq object_bridge_create`:
      <ul>
        <li>Added `--metadata-import` flag to `qq object_bridge_create` command</li>
        <li>Changed the help text for `qq object_bridge_create` flags:
      <ul>
        <li>`--key-prefix`</li>
        <li>`--read-only`</li>
      </ul></li>
      </ul>
  </li>
  <li>Changed the help text for `--spoke-hosts` flag in `qq portal_accept_hub` command</li>
</ul>

  **Click to expand**
  <ul>
    <li>
      Changed the help text for `qq portal_create` flags:
      <ul>
        <li>`--hub-hosts`</li>
        <li>`--read-only-spoke`</li>
      </ul>
    </li>
    <li>Changed the help text for `--dns-lookup` flag in `qq portal_get_hub` command</li>
    <li>Changed the help text for `--dns-lookup` flag in `qq portal_get_spoke` command</li>
    <li>Changed the help text for `--dns-lookup` flag in `qq portal_list` command</li>
    <li>Changed the help text for `--dns-lookup` flag in `qq portal_list_hubs` command</li>
    <li>Changed the help text for `--dns-lookup` flag in `qq portal_list_spokes` command</li>
    <li>
      Modified `qq portal_modify_hub`:
      <ul>
        <li>Added `--make-read-write` flag to `qq portal_modify_hub` command</li>
        <li>Changed the help text for `--spoke-hosts` flag in `qq portal_modify_hub` command</li>
      </ul>
    </li>
    <li>
      Modified `qq portal_modify_hub_host`:
      <ul>
        <li>Added `--make-read-write` flag to `qq portal_modify_hub_host` command</li>
        <li>Changed the help text for `--spoke-hosts` flag in `qq portal_modify_hub_host` command</li>
      </ul>
    </li>
    <li>Changed the help text for `--hub-hosts` flag in `qq portal_modify_spoke` command</li>
    <li>Changed the help text for `--hub-hosts` flag in `qq portal_modify_spoke_host` command</li>
    <li>Changed the help text for `--hosts` flag in `qq portal_ping` command</li>
  </ul>


## 7.9 Releases

### Qumulo Core 7.9.3.1
{{ nexusLink }}
<ul>
  <li>Added `qq object_bridge_delete` command</li>
  <li>Added `qq object_bridge_export_job_run` command</li>
  <li>Added `qq object_bridge_export_rule_create` command</li>
</ul>

  **Click to expand**
  <ul>
    <li>Added `qq object_bridge_export_rule_delete` command</li>
    <li>Added `qq object_bridge_export_rule_get` command</li>
    <li>Added `qq object_bridge_export_rule_list` command</li>
    <li>Added `--read-only` flag to `qq object_bridge_create` command</li>
  </ul>

### Qumulo Core 7.9.2.3
{{ nexusLink }}
<ul>
  <li>Added `qq portal_list_quorum_events` command</li>
  <li>
    Changed the help text for `qq multitenancy_nfs_modify_global_settings` flags:
      <ul>
        <li>`--disable-v4`</li>
        <li>`--enable-v4`</li>
      </ul>
  </li>
  <li>
    Changed the help text for `qq multitenancy_nfs_modify_settings` flags:
      <ul>
        <li>`--disable-v4`</li>
        <li>`--enable-v4`</li>
      </ul>
  </li>
</ul>

  **Click to expand**
  <ul>
    <li>
      Changed the help text for `qq nfs_modify_settings` flags:
      <ul>
        <li>`--disable-v4`</li>
        <li>`--enable-v4`</li>
      </ul>
    </li>
    <li>Added `--notification-queue-url` flag to `qq object_bridge_create` command</li>
    <li>Added `--offline-files-caching-mode` flag to `qq smb_add_share` command</li>
    <li>Added `--offline-files-caching-mode` flag to `qq smb_mod_share` command</li>
  </ul>

### Qumulo Core 7.9.1.3
{{ nexusLink }}
<ul>
  <li>Removed `qq portal_list_quorum_events` command</li>
  <li>
    Modified `qq object_bridge_create`:
      <ul>
        <li>Added flags to `qq object_bridge_create` command:
          <ul>
            <li>`--delimiter`</li>
            <li>`--key-vault-hostname`</li>
          </ul></li>
        <li>Changed the help text for `--bucket-uri` flag in `qq object_bridge_create` command</li>
      </ul>
  </li>
</ul>

### Qumulo Core 7.9.0.4 (Quarterly)
{{ nexusLink }}
<ul>
  <li>Removed `qq snapshot_calculate_used_capacity` command</li>
  <li>Removed `qq snapshot_get_capacity_used_per_snapshot` command</li>
  <li>Added `qq audit_create_destination` command</li>
</ul>

  **Click to expand**
  <ul>
    <li>Added `qq audit_delete_destination` command</li>
    <li>Added `qq audit_get_destination` command</li>
    <li>Added `qq audit_get_destination_status` command</li>
    <li>Added `qq audit_list_destinations` command</li>
    <li>Added `qq audit_modify_destination` command</li>
    <li>Added `qq audit_set_destination` command</li>
    <li>Added `qq object_bridge_create` command</li>
    <li>Added `qq portal_list_quorum_events` command</li>
    <li>Added `--skip-atime-update` flag to `qq fs_read` command</li>
    <li>
      Added flags to `qq fs_read_dir` command:
          <ul>
            <li>`--include-acls`</li>
            <li>`--skip-atime-update`</li>
          </ul>
    </li>
  </ul>


## 7.8 Releases

### Qumulo Core 7.8.4.3
{{ nexusLink }}
<ul>
  <li>Added `qq time_reset_configuration` command</li>
  <li>Changed the help text for `--dns-servers` flag in `qq network_add_network` command</li>
  <li>Changed the help text for `--dns-servers` flag in `qq network_mod_network` command</li>
  <li>Added `--source` flag to `qq time_set` command</li>
</ul>

### Qumulo Core 7.8.3.1
{{ nexusLink }}
<ul>
  <li>Added `qq container_restart_cluster` command</li>
  <li>Added `qq fs_fetch_file` command</li>
  <li>Added `qq fs_fetch_tree` command</li>
</ul>

  **Click to expand**
  <ul>
    <li>Added `qq rdma_get_settings` command</li>
    <li>Added `qq rdma_get_status` command</li>
    <li>Added `qq rdma_set_settings` command</li>
    <li>
      Added flags to `qq fs_walk_tree` command:
          <ul>
            <li>`--fetch-data`</li>
            <li>`--max-bytes-per-file`</li>
          </ul>
    </li>
  </ul>

### Qumulo Core 7.8.2.1
{{ nexusLink }}
<ul>
  <li>Changed the help text for `--s3` flag in `qq fs_delete_user_metadata` command</li>
  <li>Changed the help text for `--s3` flag in `qq fs_get_user_metadata` command</li>
  <li>Changed the help text for `--s3` flag in `qq fs_list_user_metadata` command</li>
</ul>

  **Click to expand**
  <ul>
    <li>Changed the description of `qq fs_security_add_key`</li>
    <li>Changed the description of `qq fs_security_get_key_replace_challenge`</li>
    <li>Changed the description of `qq fs_security_replace_key`</li>
    <li>Changed the help text for `--s3` flag in `qq fs_set_user_metadata` command</li>
    <li>
      Added flags to `qq fs_walk_tree` command:
          <ul>
            <li>`--progress`</li>
            <li>`--summary`</li>
          </ul>
    </li>
  </ul>

### Qumulo Core 7.8.1.1
{{ nexusLink }}
<ul>
  <li>Added `--json` flag to `qq portal_get_file_system` command</li>
  <li>Added `--json` flag to `qq portal_list_file_systems` command</li>
</ul>

### Qumulo Core 7.8.0.4 (Quarterly)
{{ nexusLink }}
<ul>
  <li>Added `qq stratus_cluster_create` command</li>
  <li>
    Added flags to `qq add_object_storage_uris` command:
          <ul>
            <li>`--credentials`</li>
            <li>`--credentials-file`</li>
          </ul>
  </li>
  <li>Added `--brief` flag to `qq portal_ping` command</li>
</ul>


## 7.7 Releases

### Qumulo Core 7.7.5.1
{{ nexusLink }}
{{ noCLIchanges }}

### Qumulo Core 7.7.4.1
{{ nexusLink }}
<ul>
  <li>Added `qq portal_ping` command</li>
  <li>Added `--no-wait` flag to `qq ad_cancel` command</li>
  <li>Added `--no-wait` flag to `qq ad_join` command</li>
</ul>

  **Click to expand**
  <ul>
    <li>Added `--no-wait` flag to `qq ad_leave` command</li>
    <li>Added `--no-wait` flag to `qq ad_reconfigure` command</li>
    <li>
      Added flags to `qq multitenancy_nfs_modify_global_settings` command:
          <ul>
            <li>`--clear-idmap-domain`</li>
            <li>`--idmap-domain`</li>
          </ul>
    </li>
    <li>
      Added flags to `qq multitenancy_nfs_modify_settings` command:
          <ul>
            <li>`--clear-idmap-domain`</li>
            <li>`--idmap-domain`</li>
          </ul>
    </li>
    <li>
      Added flags to `qq nfs_modify_settings` command:
          <ul>
            <li>`--clear-idmap-domain`</li>
            <li>`--idmap-domain`</li>
          </ul>
    </li>
    <li>Changed the help text for `--spoke-hosts` flag in `qq portal_accept_hub` command</li>
    <li>Changed the help text for `--hub-hosts` flag in `qq portal_create` command</li>
    <li>Changed the help text for `--spoke-hosts` flag in `qq portal_modify_hub` command</li>
    <li>Changed the help text for `--spoke-hosts` flag in `qq portal_modify_hub_host` command</li>
    <li>Changed the help text for `--hub-hosts` flag in `qq portal_modify_spoke` command</li>
    <li>Changed the help text for `--hub-hosts` flag in `qq portal_modify_spoke_host` command</li>
  </ul>

### Qumulo Core 7.7.3
{{ nexusLink }}
<ul>
  <li>Added `--expand-fs-path-variables` flag to `qq smb_add_share` command</li>
  <li>Added `--expand-fs-path-variables` flag to `qq smb_mod_share` command</li>
</ul>

### Qumulo Core 7.7.2
{{ nexusLink }}
<ul>
  <li>Added `qq data_core_cluster_create` command</li>
  <li>Added `qq portal_modify_hub` command</li>
  <li>Added `qq portal_modify_spoke` command</li>
</ul>

### Qumulo Core 7.7.1.1
{{ nexusLink }}
<ul>
  <li>Added `qq nexus_get_config` command</li>
  <li>Added `qq nexus_get_registration` command</li>
  <li>Added `qq nexus_set_config` command</li>
</ul>

  **Click to expand**
  <ul>
    <li>Added `qq nexus_set_registration` command</li>
    <li>Changed the help text for `--restrictions` flag in `qq nfs_add_export` command</li>
    <li>Changed the help text for `--restrictions` flag in `qq nfs_mod_export` command</li>
    <li>Added `--dns-lookup` flag to `qq portal_get_hub` command</li>
    <li>Added `--dns-lookup` flag to `qq portal_get_spoke` command</li>
    <li>Added `--dns-lookup` flag to `qq portal_list` command</li>
    <li>Added `--dns-lookup` flag to `qq portal_list_hubs` command</li>
    <li>Added `--dns-lookup` flag to `qq portal_list_spokes` command</li>
    <li>Changed the help text for `--insecure` flag in `qq s3_modify_settings` command</li>
  </ul>

### Qumulo Core 7.7.0.3 (Quarterly)
{{ nexusLink }}
<ul>
  <li>Removed `qq snapshot_get_snapshot` command</li>
  <li>Removed `qq snapshot_list_snapshots` command</li>
  <li>Added `--nexus-registration-key` flag to `qq set_monitoring_conf` command</li>
</ul>


## 7.6 Releases

### Qumulo Core 7.6.4.1 
{{ nexusLink }}
<ul>
  <li>Removed `qq network_preview_add_network` command</li>
  <li>Removed `qq network_preview_backend_interfaces` command</li>
  <li>Removed `qq network_preview_delete_network` command</li>
</ul>

  **Click to expand**
  <ul>
    <li>Removed `qq network_preview_frontend_interfaces` command</li>
    <li>Removed `qq network_preview_get_config` command</li>
    <li>Removed `qq network_preview_modify_interface` command</li>
    <li>Removed `qq network_preview_modify_network` command</li>
    <li>Removed `qq network_preview_put_config` command</li>
    <li>Removed `qq network_preview_status` command</li>
    <li>Added `qq network_backend_interfaces` command</li>
    <li>Added `qq network_create_network` command</li>
    <li>Added `qq network_frontend_interfaces` command</li>
    <li>Added `qq network_get_config` command</li>
    <li>Added `qq network_modify_interface` command</li>
    <li>Added `qq network_modify_network` command</li>
    <li>Added `qq network_put_config` command</li>
    <li>Added `qq network_remove_network` command</li>
    <li>Added `qq network_status` command</li>
    <li>
      Changed the help text for `qq modify_object_backed_cluster_membership` flags:
      <ul>
        <li>`--node-ips-and-fault-domains`</li>
        <li>`--node-uuids-and-fault-domains`</li>
      </ul>
    </li>
    <li>Changed the help text for `--private` flag in `qq s3_add_bucket` command</li>
  </ul>

### Qumulo Core 7.6.3.1
{{ nexusLink }}
<ul>
  <li>Added `qq network_preview_modify_interface` command</li>
  <li>Added `qq network_preview_modify_network` command</li>
  <li>Added `qq unprotected_edge_cluster_create` command</li>
</ul>

  **Click to expand**
  <ul>
    <li>Added `--domain-controllers` flag to `qq ad_join` command</li>
    <li>Added `--domain-controllers` flag to `qq ad_reconfigure` command</li>
    <li>
      Added accepted values to `assigned_by` flag in `qq network_preview_add_network` command:
          <ul>
            <li>`dhcp`</li>
            <li>`static`</li>
          </ul>
    </li>
    <li>
      Modified `qq portal_accept_hub`:
      <ul>
        <li>Added flags to `qq portal_accept_hub` command:
          <ul>
            <li>`--authorize-hub-roots`</li>
            <li>`--spoke-hosts`</li>
          </ul></li>
        <li>Changed the help text for `--spoke-port` flag in `qq portal_accept_hub` command</li>
      </ul>
    </li>
    <li>
      Changed the help text for `qq portal_authorize_hub` flags:
      <ul>
        <li>`--id`</li>
        <li>`--json`</li>
        <li>`--spoke-address`</li>
        <li>`--spoke-port`</li>
      </ul>
    </li>
    <li>
      Modified `qq portal_create`:
      <ul>
        <li>Added `--hub-hosts` flag to `qq portal_create` command</li>
        <li>Changed the help text for `--hub-port` flag in `qq portal_create` command</li>
      </ul>
    </li>
    <li>Added `--spoke-root-path` flag to `qq portal_delete_spoke_root` command</li>
    <li>
      Modified `qq portal_modify_hub_host`:
      <ul>
        <li>Added `--spoke-hosts` flag to `qq portal_modify_hub_host` command</li>
        <li>Changed the help text for `--spoke-port` flag in `qq portal_modify_hub_host` command</li>
      </ul>
    </li>
    <li>
      Modified `qq portal_modify_spoke_host`:
      <ul>
        <li>Added `--hub-hosts` flag to `qq portal_modify_spoke_host` command</li>
        <li>Changed the help text for `--hub-port` flag in `qq portal_modify_spoke_host` command</li>
      </ul>
    </li>
  </ul>

### Qumulo Core 7.6.2
{{ nexusLink }}
<ul>
  <li>Removed `qq portal_modify_hub` command</li>
  <li>Removed `qq portal_modify_spoke` command</li>
  <li>Added `qq portal_accept_hub` command</li>
</ul>

  **Click to expand**
  <ul>
    <li>Added `qq portal_authorize_hub_root` command</li>
    <li>Added `qq portal_delete_spoke_root` command</li>
    <li>Added `qq portal_deny_hub_root` command</li>
    <li>Added `qq portal_modify_hub_host` command</li>
    <li>Added `qq portal_modify_spoke_host` command</li>
    <li>Added `qq portal_propose_spoke_root` command</li>
    <li>Added `--no-paths` flag to `qq portal_create` command</li>
    <li>
      Added flags to `qq portal_delete_hub` command:
          <ul>
            <li>`--json`</li>
            <li>`--no-paths`</li>
          </ul>
    </li>
    <li>
      Added flags to `qq portal_delete_spoke` command:
          <ul>
            <li>`--json`</li>
            <li>`--no-paths`</li>
          </ul>
    </li>
    <li>Added `--no-paths` flag to `qq portal_get_hub` command</li>
    <li>Added `--no-paths` flag to `qq portal_get_spoke` command</li>
    <li>Added `--include-incompatibles` flag to `qq unconfigured_nodes_list` command</li>
  </ul>

### Qumulo Core 7.6.1.1
{{ nexusLink }}
Added `--private` flag to `qq s3_add_bucket` command

### Qumulo Core 7.6.0.2 (Quarterly)
{{ nexusLink }}
<ul>
  <li>Changed the help text for `--bind-uri` flag in `qq ldap_set_settings` command</li>
  <li>Changed the help text for `--bind-uri` flag in `qq ldap_update_settings` command</li>
</ul>


## 7.5 Releases

### Qumulo Core 7.5.5.2
{{ nexusLink }}
<ul>
  <li>Changed the help text for `--bind-uri` flag in `qq ldap_set_settings` command</li>
  <li>Changed the help text for `--bind-uri` flag in `qq ldap_update_settings` command</li>
</ul>

### Qumulo Core 7.5.4.2
{{ nexusLink }}
Changed the help text for `--recursive` flag in `qq fs_read_dir_aggregates` command

### Qumulo Core 7.5.3
{{ nexusLink }}
{{ noCLIchanges }}

### Qumulo Core 7.5.2
{{ nexusLink }}
<ul>
  <li>Removed `qq network_v3_add_network` command</li>
  <li>Removed `qq network_v3_backend_interfaces` command</li>
  <li>Removed `qq network_v3_delete_network` command</li>
</ul>

  **Click to expand**
  <ul>
    <li>Removed `qq network_v3_frontend_interfaces` command</li>
    <li>Removed `qq network_v3_get_config` command</li>
    <li>Removed `qq network_v3_put_config` command</li>
    <li>Removed `qq network_v3_status` command</li>
    <li>Added `qq network_preview_add_network` command</li>
    <li>Added `qq network_preview_backend_interfaces` command</li>
    <li>Added `qq network_preview_delete_network` command</li>
    <li>Added `qq network_preview_frontend_interfaces` command</li>
    <li>Added `qq network_preview_get_config` command</li>
    <li>Added `qq network_preview_put_config` command</li>
    <li>Added `qq network_preview_status` command</li>
  </ul>

### Qumulo Core 7.5.1.2
{{ nexusLink }}
<ul>
  <li>Added `qq network_v3_add_network` command</li>
  <li>Added `qq network_v3_backend_interfaces` command</li>
  <li>Added `qq network_v3_delete_network` command</li>
</ul>

  **Click to expand**
  <ul>
    <li>Added `qq network_v3_frontend_interfaces` command</li>
    <li>Added `qq network_v3_get_config` command</li>
    <li>Added `qq network_v3_put_config` command</li>
    <li>Added `qq network_v3_status` command</li>
  </ul>

### Qumulo Core 7.5.0.3 (Quarterly)
{{ nexusLink }}
{{ noCLIchanges }}
