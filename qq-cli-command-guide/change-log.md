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
{% include important.html content="To better improve standardization and consistency, this release introduces new aliases for existing `qq` CLI command names. All existing commands continue to function as before." %}

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
    <li>Added <code>total_capacity_and_unfilled_bytes</code> value to <code>qq fs_read_dir_aggregates --order-by</code> command</li>
    <li>
      Modified <code>qq object_portal_create_bridge</code> command:
      <ul>
        <li>
          Added flags to <code>qq object_portal_create_bridge</code> command:
          <ul>
            <li><code>--allow-archived-metadata-changes</code></li>
            <li><code>--disallow-archived-metadata-changes</code></li>
          </ul>
        </li>
        <li>Added <code>FROZEN</code> value to <code>qq object_portal_create_bridge --protocol-access</code> command</li>
        <li>
          Changed help text for the following flags of the <code>qq object_portal_create_bridge</code> command:
          <ul>
            <li><code>--bucket-uri</code></li>
            <li><code>--delimiter</code></li>
            <li><code>--key-prefix</code></li>
            <li><code>--key-vault-hostname</code></li>
            <li><code>--metadata-import</code></li>
            <li><code>--mount-path</code></li>
            <li><code>--notification-queue-url</code></li>
            <li><code>--protocol-access</code></li>
          </ul>
        </li>
      </ul>
    </li>
    <li>
      Modified <code>qq object_portal_delete_bridge</code> command:
      <ul>
        <li>Added <code>--force</code> flag to <code>qq object_portal_delete_bridge</code> command</li>
        <li>Changed help text for <code>qq object_portal_delete_bridge --filesystem-uuid</code> command</li>
      </ul>
    </li>
    <li>
      Changed help text for the following flags of the <code>qq object_portal_refresh</code> command:
      <ul>
        <li><code>--bucket-uri</code></li>
        <li><code>--key</code></li>
        <li><code>--mode</code></li>
      </ul>
    </li>
    <li>Changed help text for <code>qq portal_accept_hub --no-paths</code> command</li>
    <li>Changed help text for <code>qq portal_authorize_hub_root --no-paths</code> command</li>
    <li>
      Modified <code>qq portal_create</code> command:
      <ul>
        <li>Removed <code>--paused-spoke</code> flag from <code>qq portal_create</code> command</li>
        <li>Changed help text for <code>qq portal_create --no-paths</code> command</li>
      </ul>
    </li>
    <li>Changed help text for <code>qq portal_delete_hub --no-paths</code> command</li>
    <li>Changed help text for <code>qq portal_delete_spoke --no-paths</code> command</li>
    <li>Changed help text for <code>qq portal_delete_spoke_root --no-paths</code> command</li>
    <li>Changed help text for <code>qq portal_deny_hub_root --no-paths</code> command</li>
    <li>Changed help text for <code>qq portal_get_hub --no-paths</code> command</li>
    <li>Changed help text for <code>qq portal_get_spoke --no-paths</code> command</li>
    <li>Changed help text for <code>qq portal_modify_hub --no-paths</code> command</li>
    <li>Changed help text for <code>qq portal_modify_spoke --no-paths</code> command</li>
    <li>Changed help text for <code>qq portal_propose_spoke_root --no-paths</code> command</li>
    <li>Added <code>yearly</code> value to <code>qq snapshot_create_policy command</code> command</li>
    <li>Changed description of <code>qq snapshot_lock_snapshot</code> command</li>
    <li>Added <code>change_to_yearly</code> value to <code>qq snapshot_modify_policy command</code> command</li>
    <li>Changed help text for <code>qq upgrade_status --no-monitor</code> command</li>
  </ul>
</details>

### Qumulo Core 7.10.2
{{ nexusLink }}

<ul>
  <li>Removed <code>qq portal_modify_hub_host</code> command</li>
  <li>Removed <code>qq portal_modify_spoke_host</code> command</li>
  <li>
    Modified <code>qq fs_delete_user_metadata</code> command:
    <ul>
      <li>Added <code>--well-known</code> flag to <code>qq fs_delete_user_metadata</code> command</li>
      <li>Changed help text for <code>qq fs_delete_user_metadata --s3</code> command</li>
    </ul>
  </li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>
      Modified <code>qq fs_get_user_metadata</code> command:
      <ul>
        <li>Added <code>--well-known</code> flag to <code>qq fs_get_user_metadata</code> command</li>
        <li>Changed help text for <code>qq fs_get_user_metadata --s3</code> command</li>
      </ul>
    </li>
    <li>
      Modified <code>qq fs_list_user_metadata</code> command:
      <ul>
        <li>Added <code>--well-known</code> flag to <code>qq fs_list_user_metadata</code> command</li>
        <li>Changed help text for <code>qq fs_list_user_metadata --s3</code> command</li>
      </ul>
    </li>
    <li>
      Modified <code>qq fs_set_user_metadata</code> command:
      <ul>
        <li>Added <code>--well-known</code> flag to <code>qq fs_set_user_metadata</code> command</li>
        <li>Changed help text for <code>qq fs_set_user_metadata --s3</code> command</li>
      </ul>
    </li>
    <li>Added <code>--all</code> flag to <code>qq logout</code> command</li>
    <li>
      Modified <code>qq portal_modify_hub</code> command:
      <ul>
        <li>Added <code>paused</code> value to <code>qq portal_modify_hub --type</code> command</li>
        <li>Changed help text for <code>qq portal_modify_hub --type</code> command</li>
      </ul>
    </li>
  </ul>
</details>

### Qumulo Core 7.10.1.2
{{ nexusLink }}

<ul>
  <li>Removed <code>qq object_bridge_create</code> command</li>
  <li>Removed <code>qq object_bridge_delete</code> command</li>
  <li>Removed <code>qq object_bridge_export_job_run</code> command</li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>Removed <code>qq object_bridge_export_rule_create</code> command</li>
    <li>Removed <code>qq object_bridge_export_rule_delete</code> command</li>
    <li>Removed <code>qq object_bridge_export_rule_get</code> command</li>
    <li>Removed <code>qq object_bridge_export_rule_list</code> command</li>
    <li>Removed <code>qq portal_get_file_system</code> command</li>
    <li>Removed <code>qq portal_list_file_systems</code> command</li>
    <li>Added <code>qq object_portal_create_bridge</code> command</li>
    <li>Added <code>qq object_portal_delete_bridge</code> command</li>
    <li>Added <code>qq object_portal_get_bridge</code> command</li>
    <li>Added <code>qq object_portal_list_bridges</code> command</li>
    <li>Added <code>qq object_portal_refresh</code> command</li>
    <li>Added <code>qq portal_get_filesystem</code> command</li>
    <li>Added <code>qq portal_list_filesystems</code> command</li>
    <li>Added <code>--record-ttl-seconds</code> flag to <code>qq authoritative_dns_modify_settings</code> command</li>
    <li>Changed description of <code>qq fs_create_symlink</code> command</li>
    <li>
      Changed help text for the following flags of the <code>qq fs_delete</code> command:
      <ul>
        <li><code>--id</code></li>
        <li><code>--path</code></li>
      </ul>
    </li>
    <li>
      Added values to <code>qq fs_read_dir_aggregates --order-by</code> command:
      <ul>
        <li><code>total_external_object_bytes</code></li>
        <li><code>total_external_objects</code></li>
      </ul>
    </li>
    <li>Changed description of <code>qq fs_security_add_key</code> command</li>
    <li>Changed description of <code>qq fs_set_notify_settings</code> command</li>
    <li>Changed description of <code>qq fs_unlink</code> command</li>
    <li>Changed description of <code>qq multitenancy_create_tenant</code> command</li>
    <li>
      Changed help text for the following flags of the <code>qq nfs_add_export</code> command:
      <ul>
        <li><code>--create-fs-path</code></li>
        <li><code>--fs-path</code></li>
      </ul>
    </li>
    <li>
      Changed help text for the following flags of the <code>qq nfs_mod_export</code> command:
      <ul>
        <li><code>--create-fs-path</code></li>
        <li><code>--fs-path</code></li>
      </ul>
    </li>
    <li>
      Modified <code>qq portal_create</code> command:
      <ul>
        <li>
          Added flags to <code>qq portal_create</code> command:
          <ul>
            <li><code>--paused-spoke</code></li>
            <li><code>--suspended-spoke</code></li>
          </ul>
        </li>
        <li>Changed help text for <code>qq portal_create --read-only-spoke</code> command</li>
      </ul>
    </li>
    <li>Removed <code>--dns-lookup</code> flag from <code>qq portal_list</code> command</li>
    <li>Removed <code>--dns-lookup</code> flag from <code>qq portal_list_hubs</code> command</li>
    <li>
      Modified <code>qq portal_list_quorum_events</code> command:
      <ul>
        <li>Added <code>--filesystem-uuid</code> flag to <code>qq portal_list_quorum_events</code> command</li>
        <li>Removed <code>--fs-id</code> flag from <code>qq portal_list_quorum_events</code> command</li>
      </ul>
    </li>
    <li>Removed <code>--dns-lookup</code> flag from <code>qq portal_list_spokes</code> command</li>
    <li>
      Modified <code>qq portal_modify_hub</code> command:
      <ul>
        <li>Added <code>--type</code> flag to <code>qq portal_modify_hub</code> command</li>
        <li>Removed <code>--make-read-write</code> flag from <code>qq portal_modify_hub</code> command</li>
      </ul>
    </li>
    <li>
      Modified <code>qq portal_modify_hub_host</code> command:
      <ul>
        <li>Added <code>--type</code> flag to <code>qq portal_modify_hub_host</code> command</li>
        <li>Removed <code>--make-read-write</code> flag from <code>qq portal_modify_hub_host</code> command</li>
      </ul>
    </li>
    <li>
      Changed help text for the following flags of the <code>qq smb_add_share</code> command:
      <ul>
        <li><code>--create-fs-path</code></li>
        <li><code>--expand-fs-path-variables</code></li>
        <li><code>--fs-path</code></li>
      </ul>
    </li>
    <li>
      Changed help text for the following flags of the <code>qq smb_mod_share</code> command:
      <ul>
        <li><code>--create-fs-path</code></li>
        <li><code>--expand-fs-path-variables</code></li>
        <li><code>--fs-path</code></li>
      </ul>
    </li>
    <li>
      Modified <code>qq snapshot_lock_snapshot</code> command:
      <ul>
        <li>Changed description of <code>qq snapshot_lock_snapshot</code> command</li>
        <li>Changed help text for <code>qq snapshot_lock_snapshot --lock-key</code> command</li>
      </ul>
    </li>
    <li>
      Changed help text for the following flags of the <code>qq stratus_cluster_create</code> command:
      <ul>
        <li><code>--node-uuids-and-fault-domains</code></li>
        <li><code>--object-store-credentials</code></li>
      </ul>
    </li>
  </ul>
</details>

### Qumulo Core 7.10.0.2 (Quarterly)
{{ nexusLink }}

<ul>
  <li>Added <code>qq fs_try_resolve_paths</code> command</li>
  <li>
    Modified <code>qq object_bridge_create</code> command:
    <ul>
      <li>Added <code>--metadata-import</code> flag to <code>qq object_bridge_create</code> command</li>
      <li>
        Changed help text for the following flags of the <code>qq object_bridge_create</code> command:
        <ul>
          <li><code>--key-prefix</code></li>
          <li><code>--read-only</code></li>
        </ul>
      </li>
    </ul>
  </li>
  <li>Changed help text for <code>qq portal_accept_hub --spoke-hosts</code> command</li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>
      Changed help text for the following flags of the <code>qq portal_create</code> command:
      <ul>
        <li><code>--hub-hosts</code></li>
        <li><code>--read-only-spoke</code></li>
      </ul>
    </li>
    <li>Changed help text for <code>qq portal_get_hub --dns-lookup</code> command</li>
    <li>Changed help text for <code>qq portal_get_spoke --dns-lookup</code> command</li>
    <li>Changed help text for <code>qq portal_list --dns-lookup</code> command</li>
    <li>Changed help text for <code>qq portal_list_hubs --dns-lookup</code> command</li>
    <li>Changed help text for <code>qq portal_list_spokes --dns-lookup</code> command</li>
    <li>
      Modified <code>qq portal_modify_hub</code> command:
      <ul>
        <li>Added <code>--make-read-write</code> flag to <code>qq portal_modify_hub</code> command</li>
        <li>Changed help text for <code>qq portal_modify_hub --spoke-hosts</code> command</li>
      </ul>
    </li>
    <li>
      Modified <code>qq portal_modify_hub_host</code> command:
      <ul>
        <li>Added <code>--make-read-write</code> flag to <code>qq portal_modify_hub_host</code> command</li>
        <li>Changed help text for <code>qq portal_modify_hub_host --spoke-hosts</code> command</li>
      </ul>
    </li>
    <li>Changed help text for <code>qq portal_modify_spoke --hub-hosts</code> command</li>
    <li>Changed help text for <code>qq portal_modify_spoke_host --hub-hosts</code> command</li>
    <li>Changed help text for <code>qq portal_ping --hosts</code> command</li>
  </ul>
</details>


## 7.9 Releases

### Qumulo Core 7.9.3.1
{{ nexusLink }}

<ul>
  <li>Added <code>qq object_bridge_delete</code> command</li>
  <li>Added <code>qq object_bridge_export_job_run</code> command</li>
  <li>Added <code>qq object_bridge_export_rule_create</code> command</li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>Added <code>qq object_bridge_export_rule_delete</code> command</li>
    <li>Added <code>qq object_bridge_export_rule_get</code> command</li>
    <li>Added <code>qq object_bridge_export_rule_list</code> command</li>
    <li>Added <code>--read-only</code> flag to <code>qq object_bridge_create</code> command</li>
  </ul>
</details>

### Qumulo Core 7.9.2.3
{{ nexusLink }}

<ul>
  <li>Added <code>qq portal_list_quorum_events</code> command</li>
  <li>
    Changed help text for the following flags of the <code>qq multitenancy_nfs_modify_global_settings</code> command:
    <ul>
      <li><code>--disable-v4</code></li>
      <li><code>--enable-v4</code></li>
    </ul>
  </li>
  <li>
    Changed help text for the following flags of the <code>qq multitenancy_nfs_modify_settings</code> command:
    <ul>
      <li><code>--disable-v4</code></li>
      <li><code>--enable-v4</code></li>
    </ul>
  </li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>
      Changed help text for the following flags of the <code>qq nfs_modify_settings</code> command:
      <ul>
        <li><code>--disable-v4</code></li>
        <li><code>--enable-v4</code></li>
      </ul>
    </li>
    <li>Added <code>--notification-queue-url</code> flag to <code>qq object_bridge_create</code> command</li>
    <li>Added <code>--offline-files-caching-mode</code> flag to <code>qq smb_add_share</code> command</li>
    <li>Added <code>--offline-files-caching-mode</code> flag to <code>qq smb_mod_share</code> command</li>
  </ul>
</details>

### Qumulo Core 7.9.1.3
{{ nexusLink }}

<ul>
  <li>Removed <code>qq portal_list_quorum_events</code> command</li>
  <li>
    Modified <code>qq object_bridge_create</code> command:
    <ul>
      <li>
        Added flags to <code>qq object_bridge_create</code> command:
        <ul>
          <li><code>--delimiter</code></li>
          <li><code>--key-vault-hostname</code></li>
        </ul>
      </li>
      <li>Changed help text for <code>qq object_bridge_create --bucket-uri</code> command</li>
    </ul>
  </li>
</ul>

### Qumulo Core 7.9.0.4 (Quarterly)
{{ nexusLink }}

<ul>
  <li>Removed <code>qq snapshot_calculate_used_capacity</code> command</li>
  <li>Removed <code>qq snapshot_get_capacity_used_per_snapshot</code> command</li>
  <li>Added <code>qq audit_create_destination</code> command</li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>Added <code>qq audit_delete_destination</code> command</li>
    <li>Added <code>qq audit_get_destination</code> command</li>
    <li>Added <code>qq audit_get_destination_status</code> command</li>
    <li>Added <code>qq audit_list_destinations</code> command</li>
    <li>Added <code>qq audit_modify_destination</code> command</li>
    <li>Added <code>qq audit_set_destination</code> command</li>
    <li>Added <code>qq object_bridge_create</code> command</li>
    <li>Added <code>qq portal_list_quorum_events</code> command</li>
    <li>Added <code>--skip-atime-update</code> flag to <code>qq fs_read</code> command</li>
    <li>
      Added flags to <code>qq fs_read_dir</code> command:
      <ul>
        <li><code>--include-acls</code></li>
        <li><code>--skip-atime-update</code></li>
      </ul>
    </li>
  </ul>
</details>


## 7.8 Releases

### Qumulo Core 7.8.4.3
{{ nexusLink }}

<ul>
  <li>Added <code>qq time_reset_configuration</code> command</li>
  <li>Changed help text for <code>qq network_add_network --dns-servers</code> command</li>
  <li>Changed help text for <code>qq network_mod_network --dns-servers</code> command</li>
  <li>Added <code>--source</code> flag to <code>qq time_set</code> command</li>
</ul>

### Qumulo Core 7.8.3.1
{{ nexusLink }}

<ul>
  <li>Added <code>qq container_restart_cluster</code> command</li>
  <li>Added <code>qq fs_fetch_file</code> command</li>
  <li>Added <code>qq fs_fetch_tree</code> command</li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>Added <code>qq rdma_get_settings</code> command</li>
    <li>Added <code>qq rdma_get_status</code> command</li>
    <li>Added <code>qq rdma_set_settings</code> command</li>
    <li>
      Added flags to <code>qq fs_walk_tree</code> command:
      <ul>
        <li><code>--fetch-data</code></li>
        <li><code>--max-bytes-per-file</code></li>
      </ul>
    </li>
  </ul>
</details>

### Qumulo Core 7.8.2.1
{{ nexusLink }}

<ul>
  <li>Changed help text for <code>qq fs_delete_user_metadata --s3</code> command</li>
  <li>Changed help text for <code>qq fs_get_user_metadata --s3</code> command</li>
  <li>Changed help text for <code>qq fs_list_user_metadata --s3</code> command</li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>Changed description of <code>qq fs_security_add_key</code> command</li>
    <li>Changed description of <code>qq fs_security_get_key_replace_challenge</code> command</li>
    <li>Changed description of <code>qq fs_security_replace_key</code> command</li>
    <li>Changed help text for <code>qq fs_set_user_metadata --s3</code> command</li>
    <li>
      Added flags to <code>qq fs_walk_tree</code> command:
      <ul>
        <li><code>--progress</code></li>
        <li><code>--summary</code></li>
      </ul>
    </li>
  </ul>
</details>

### Qumulo Core 7.8.1.1
{{ nexusLink }}

<ul>
  <li>Added <code>--json</code> flag to <code>qq portal_get_file_system</code> command</li>
  <li>Added <code>--json</code> flag to <code>qq portal_list_file_systems</code> command</li>
</ul>

### Qumulo Core 7.8.0.4 (Quarterly)
{{ nexusLink }}

<ul>
  <li>Added <code>qq stratus_cluster_create</code> command</li>
  <li>
    Added flags to <code>qq add_object_storage_uris</code> command:
    <ul>
      <li><code>--credentials</code></li>
      <li><code>--credentials-file</code></li>
    </ul>
  </li>
  <li>Added <code>--brief</code> flag to <code>qq portal_ping</code> command</li>
</ul>


## 7.7 Releases

### Qumulo Core 7.7.5.1
{{ nexusLink }}

{{ noCLIchanges }}

### Qumulo Core 7.7.4.1
{{ nexusLink }}

<ul>
  <li>Added <code>qq portal_ping</code> command</li>
  <li>Added <code>--no-wait</code> flag to <code>qq ad_cancel</code> command</li>
  <li>Added <code>--no-wait</code> flag to <code>qq ad_join</code> command</li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>Added <code>--no-wait</code> flag to <code>qq ad_leave</code> command</li>
    <li>Added <code>--no-wait</code> flag to <code>qq ad_reconfigure</code> command</li>
    <li>
      Added flags to <code>qq multitenancy_nfs_modify_global_settings</code> command:
      <ul>
        <li><code>--clear-idmap-domain</code></li>
        <li><code>--idmap-domain</code></li>
      </ul>
    </li>
    <li>
      Added flags to <code>qq multitenancy_nfs_modify_settings</code> command:
      <ul>
        <li><code>--clear-idmap-domain</code></li>
        <li><code>--idmap-domain</code></li>
      </ul>
    </li>
    <li>
      Added flags to <code>qq nfs_modify_settings</code> command:
      <ul>
        <li><code>--clear-idmap-domain</code></li>
        <li><code>--idmap-domain</code></li>
      </ul>
    </li>
    <li>Changed help text for <code>qq portal_accept_hub --spoke-hosts</code> command</li>
    <li>Changed help text for <code>qq portal_create --hub-hosts</code> command</li>
    <li>Changed help text for <code>qq portal_modify_hub --spoke-hosts</code> command</li>
    <li>Changed help text for <code>qq portal_modify_hub_host --spoke-hosts</code> command</li>
    <li>Changed help text for <code>qq portal_modify_spoke --hub-hosts</code> command</li>
    <li>Changed help text for <code>qq portal_modify_spoke_host --hub-hosts</code> command</li>
  </ul>
</details>

### Qumulo Core 7.7.3
{{ nexusLink }}

<ul>
  <li>Added <code>--expand-fs-path-variables</code> flag to <code>qq smb_add_share</code> command</li>
  <li>Added <code>--expand-fs-path-variables</code> flag to <code>qq smb_mod_share</code> command</li>
</ul>

### Qumulo Core 7.7.2
{{ nexusLink }}

<ul>
  <li>Added <code>qq data_core_cluster_create</code> command</li>
  <li>Added <code>qq portal_modify_hub</code> command</li>
  <li>Added <code>qq portal_modify_spoke</code> command</li>
</ul>

### Qumulo Core 7.7.1.1
{{ nexusLink }}

<ul>
  <li>Added <code>qq nexus_get_config</code> command</li>
  <li>Added <code>qq nexus_get_registration</code> command</li>
  <li>Added <code>qq nexus_set_config</code> command</li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>Added <code>qq nexus_set_registration</code> command</li>
    <li>Changed help text for <code>qq nfs_add_export --restrictions</code> command</li>
    <li>Changed help text for <code>qq nfs_mod_export --restrictions</code> command</li>
    <li>Added <code>--dns-lookup</code> flag to <code>qq portal_get_hub</code> command</li>
    <li>Added <code>--dns-lookup</code> flag to <code>qq portal_get_spoke</code> command</li>
    <li>Added <code>--dns-lookup</code> flag to <code>qq portal_list</code> command</li>
    <li>Added <code>--dns-lookup</code> flag to <code>qq portal_list_hubs</code> command</li>
    <li>Added <code>--dns-lookup</code> flag to <code>qq portal_list_spokes</code> command</li>
    <li>Changed help text for <code>qq s3_modify_settings --insecure</code> command</li>
  </ul>
</details>

### Qumulo Core 7.7.0.3 (Quarterly)
{{ nexusLink }}

<ul>
  <li>Removed <code>qq snapshot_get_snapshot</code> command</li>
  <li>Removed <code>qq snapshot_list_snapshots</code> command</li>
  <li>Added <code>--nexus-registration-key</code> flag to <code>qq set_monitoring_conf</code> command</li>
</ul>


## 7.6 Releases

### Qumulo Core 7.6.4.1 
{{ nexusLink }}

<ul>
  <li>Removed <code>qq network_preview_add_network</code> command</li>
  <li>Removed <code>qq network_preview_backend_interfaces</code> command</li>
  <li>Removed <code>qq network_preview_delete_network</code> command</li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>Removed <code>qq network_preview_frontend_interfaces</code> command</li>
    <li>Removed <code>qq network_preview_get_config</code> command</li>
    <li>Removed <code>qq network_preview_modify_interface</code> command</li>
    <li>Removed <code>qq network_preview_modify_network</code> command</li>
    <li>Removed <code>qq network_preview_put_config</code> command</li>
    <li>Removed <code>qq network_preview_status</code> command</li>
    <li>Added <code>qq network_backend_interfaces</code> command</li>
    <li>Added <code>qq network_create_network</code> command</li>
    <li>Added <code>qq network_frontend_interfaces</code> command</li>
    <li>Added <code>qq network_get_config</code> command</li>
    <li>Added <code>qq network_modify_interface</code> command</li>
    <li>Added <code>qq network_modify_network</code> command</li>
    <li>Added <code>qq network_put_config</code> command</li>
    <li>Added <code>qq network_remove_network</code> command</li>
    <li>Added <code>qq network_status</code> command</li>
    <li>
      Changed help text for the following flags of the <code>qq modify_object_backed_cluster_membership</code> command:
      <ul>
        <li><code>--node-ips-and-fault-domains</code></li>
        <li><code>--node-uuids-and-fault-domains</code></li>
      </ul>
    </li>
    <li>Changed help text for <code>qq s3_add_bucket --private</code> command</li>
  </ul>
</details>

### Qumulo Core 7.6.3.1
{{ nexusLink }}

<ul>
  <li>Added <code>qq network_preview_modify_interface</code> command</li>
  <li>Added <code>qq network_preview_modify_network</code> command</li>
  <li>Added <code>qq unprotected_edge_cluster_create</code> command</li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>Added <code>--domain-controllers</code> flag to <code>qq ad_join</code> command</li>
    <li>Added <code>--domain-controllers</code> flag to <code>qq ad_reconfigure</code> command</li>
    <li>
      Added values to <code>qq network_preview_add_network assigned_by</code> command:
      <ul>
        <li><code>dhcp</code></li>
        <li><code>static</code></li>
      </ul>
    </li>
    <li>
      Modified <code>qq portal_accept_hub</code> command:
      <ul>
        <li>
          Added flags to <code>qq portal_accept_hub</code> command:
          <ul>
            <li><code>--authorize-hub-roots</code></li>
            <li><code>--spoke-hosts</code></li>
          </ul>
        </li>
        <li>Changed help text for <code>qq portal_accept_hub --spoke-port</code> command</li>
      </ul>
    </li>
    <li>
      Changed help text for the following flags of the <code>qq portal_authorize_hub</code> command:
      <ul>
        <li><code>--id</code></li>
        <li><code>--json</code></li>
        <li><code>--spoke-address</code></li>
        <li><code>--spoke-port</code></li>
      </ul>
    </li>
    <li>
      Modified <code>qq portal_create</code> command:
      <ul>
        <li>Added <code>--hub-hosts</code> flag to <code>qq portal_create</code> command</li>
        <li>Changed help text for <code>qq portal_create --hub-port</code> command</li>
      </ul>
    </li>
    <li>Added <code>--spoke-root-path</code> flag to <code>qq portal_delete_spoke_root</code> command</li>
    <li>
      Modified <code>qq portal_modify_hub_host</code> command:
      <ul>
        <li>Added <code>--spoke-hosts</code> flag to <code>qq portal_modify_hub_host</code> command</li>
        <li>Changed help text for <code>qq portal_modify_hub_host --spoke-port</code> command</li>
      </ul>
    </li>
    <li>
      Modified <code>qq portal_modify_spoke_host</code> command:
      <ul>
        <li>Added <code>--hub-hosts</code> flag to <code>qq portal_modify_spoke_host</code> command</li>
        <li>Changed help text for <code>qq portal_modify_spoke_host --hub-port</code> command</li>
      </ul>
    </li>
  </ul>
</details>

### Qumulo Core 7.6.2
{{ nexusLink }}

<ul>
  <li>Removed <code>qq portal_modify_hub</code> command</li>
  <li>Removed <code>qq portal_modify_spoke</code> command</li>
  <li>Added <code>qq portal_accept_hub</code> command</li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>Added <code>qq portal_authorize_hub_root</code> command</li>
    <li>Added <code>qq portal_delete_spoke_root</code> command</li>
    <li>Added <code>qq portal_deny_hub_root</code> command</li>
    <li>Added <code>qq portal_modify_hub_host</code> command</li>
    <li>Added <code>qq portal_modify_spoke_host</code> command</li>
    <li>Added <code>qq portal_propose_spoke_root</code> command</li>
    <li>Added <code>--no-paths</code> flag to <code>qq portal_create</code> command</li>
    <li>
      Added flags to <code>qq portal_delete_hub</code> command:
      <ul>
        <li><code>--json</code></li>
        <li><code>--no-paths</code></li>
      </ul>
    </li>
    <li>
      Added flags to <code>qq portal_delete_spoke</code> command:
      <ul>
        <li><code>--json</code></li>
        <li><code>--no-paths</code></li>
      </ul>
    </li>
    <li>Added <code>--no-paths</code> flag to <code>qq portal_get_hub</code> command</li>
    <li>Added <code>--no-paths</code> flag to <code>qq portal_get_spoke</code> command</li>
    <li>Added <code>--include-incompatibles</code> flag to <code>qq unconfigured_nodes_list</code> command</li>
  </ul>
</details>

### Qumulo Core 7.6.1.1
{{ nexusLink }}

<ul>
  <li>Added <code>--private</code> flag to <code>qq s3_add_bucket</code> command</li>
</ul>

### Qumulo Core 7.6.0.2 (Quarterly)
{{ nexusLink }}

<ul>
  <li>Changed help text for <code>qq ldap_set_settings --bind-uri</code> command</li>
  <li>Changed help text for <code>qq ldap_update_settings --bind-uri</code> command</li>
</ul>


## 7.5 Releases

### Qumulo Core 7.5.5.2
{{ nexusLink }}

<ul>
  <li>Changed help text for <code>qq ldap_set_settings --bind-uri</code> command</li>
  <li>Changed help text for <code>qq ldap_update_settings --bind-uri</code> command</li>
</ul>

### Qumulo Core 7.5.4.2
{{ nexusLink }}

<ul>
  <li>Changed help text for <code>qq fs_read_dir_aggregates --recursive</code> command</li>
</ul>

### Qumulo Core 7.5.3
{{ nexusLink }}

{{ noCLIchanges }}

### Qumulo Core 7.5.2
{{ nexusLink }}

<ul>
  <li>Removed <code>qq network_v3_add_network</code> command</li>
  <li>Removed <code>qq network_v3_backend_interfaces</code> command</li>
  <li>Removed <code>qq network_v3_delete_network</code> command</li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>Removed <code>qq network_v3_frontend_interfaces</code> command</li>
    <li>Removed <code>qq network_v3_get_config</code> command</li>
    <li>Removed <code>qq network_v3_put_config</code> command</li>
    <li>Removed <code>qq network_v3_status</code> command</li>
    <li>Added <code>qq network_preview_add_network</code> command</li>
    <li>Added <code>qq network_preview_backend_interfaces</code> command</li>
    <li>Added <code>qq network_preview_delete_network</code> command</li>
    <li>Added <code>qq network_preview_frontend_interfaces</code> command</li>
    <li>Added <code>qq network_preview_get_config</code> command</li>
    <li>Added <code>qq network_preview_put_config</code> command</li>
    <li>Added <code>qq network_preview_status</code> command</li>
  </ul>
</details>

### Qumulo Core 7.5.1.2
{{ nexusLink }}

<ul>
  <li>Added <code>qq network_v3_add_network</code> command</li>
  <li>Added <code>qq network_v3_backend_interfaces</code> command</li>
  <li>Added <code>qq network_v3_delete_network</code> command</li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>Added <code>qq network_v3_frontend_interfaces</code> command</li>
    <li>Added <code>qq network_v3_get_config</code> command</li>
    <li>Added <code>qq network_v3_put_config</code> command</li>
    <li>Added <code>qq network_v3_status</code> command</li>
  </ul>
</details>

### Qumulo Core 7.5.0.3 (Quarterly)
{{ nexusLink }}

{{ noCLIchanges }}
