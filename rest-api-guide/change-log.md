---
title: "Qumulo REST API Change Log"
summary: "This section lists the REST API changes for each release of Qumulo Core."
permalink: /rest-api-guide/change-log.html
sidebar: rest_api_guide_sidebar
layout: page
---

{% capture noAPIchanges %}This release contains no REST API changes.{% endcapture %}

<style>div#toc{height:200px;overflow:auto;}</style>


## 7.10 Releases

### Qumulo Core 7.10.2
{{ nexusLink }}
<ul>
  <li>Added <code>WELL_KNOWN</code> enum value to <code>type</code> field in <code>GET /v1/files/{ref}/user-metadata/</code> response</li>
  <li>Added <code>WELL_KNOWN</code> enum value to <code>type</code> field in <code>GET /v1/files/{ref}/user-metadata/{type}/</code> response</li>
</ul>

### Qumulo Core 7.10.1.1
{{ nexusLink }}
<ul>
  <li>Added <code>GET | POST /v1/object-portal/bridges/</code> endpoint</li>
  <li>Added <code>DELETE | GET /v1/object-portal/bridges/{filesystem_uuid}</code> endpoint</li>
  <li>Added <code>POST /v1/object-portal/notify</code> endpoint</li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>Added <code>POST /v1/object-portal/refresh</code> endpoint</li>
    <li>Added <code>record_ttl_seconds</code> parameter to <code>GET /v1/authoritative-dns/settings</code> response</li>
    <li>
      Modified <code>PATCH /v1/authoritative-dns/settings</code>:
      <ul>
        <li>Added <code>record_ttl_seconds</code> parameter to <code>PATCH /v1/authoritative-dns/settings</code> request body</li>
        <li>Added <code>record_ttl_seconds</code> parameter to <code>PATCH /v1/authoritative-dns/settings</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>GET /v1/files/{ref}/aggregates/</code>:
      <ul>
        <li>Added enum values to <code>order-by</code> parameter in <code>GET /v1/files/{ref}/aggregates/</code> parameters:
          <ul>
            <li><code>total_external_object_bytes</code></li>
            <li><code>total_external_objects</code></li>
          </ul></li>
        <li>Added parameters to <code>GET /v1/files/{ref}/aggregates/</code> response:
          <ul>
            <li><code>external_objects</code></li>
            <li><code>total_external_objects</code></li>
          </ul></li>
      </ul>
    </li>
    <li>
      Modified <code>GET /v1/files/{ref}/recursive-aggregates/</code>:
      <ul>
        <li>Added enum values to <code>order-by</code> parameter in <code>GET /v1/files/{ref}/recursive-aggregates/</code> parameters:
          <ul>
            <li><code>total_external_object_bytes</code></li>
            <li><code>total_external_objects</code></li>
          </ul></li>
        <li>Added parameters to <code>GET /v1/files/{ref}/recursive-aggregates/</code> response:
          <ul>
            <li><code>external_objects</code></li>
            <li><code>total_external_objects</code></li>
          </ul></li>
      </ul>
    </li>
    <li>Added <code>external_objects</code> parameter to <code>GET /v1/files/{ref}/sample/</code> response</li>
    <li>
      Modified <code>POST /v1/portal/ping</code>:
      <ul>
        <li>Added <code>sample_count</code> parameter to <code>POST /v1/portal/ping</code> request body</li>
        <li>Added parameters to <code>POST /v1/portal/ping</code> response:
          <ul>
            <li><code>ping_ms</code></li>
            <li><code>state</code></li>
          </ul></li>
      </ul>
    </li>
    <li>
      Modified <code>GET /v1/portal/quorum/events</code>:
      <ul>
        <li>Added <code>filesystem-uuid</code> parameter to <code>GET /v1/portal/quorum/events</code> parameters</li>
        <li>Removed <code>fs-id</code> parameter from <code>GET /v1/portal/quorum/events</code> parameters</li>
        <li>Added parameters to <code>GET /v1/portal/quorum/events</code> response:
          <ul>
            <li><code>end_reason_kind</code></li>
            <li><code>filesystem_uuid</code></li>
          </ul></li>
        <li>Removed <code>fs_id</code> parameter from <code>GET /v1/portal/quorum/events</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>GET /v2/portal/hubs/</code>:
      <ul>
        <li>Added <code>filesystem_uuid</code> parameter to <code>GET /v2/portal/hubs/</code> response</li>
        <li>Added enum values to <code>state</code> field in <code>GET /v2/portal/hubs/</code> response:
          <ul>
            <li><code>PAUSING</code></li>
            <li><code>QUIESCING</code></li>
          </ul></li>
        <li>Added <code>DISCONNECTED</code> enum value to <code>status</code> field in <code>GET /v2/portal/hubs/</code> response</li>
        <li>Added enum values to <code>type</code> field in <code>GET /v2/portal/hubs/</code> response:
          <ul>
            <li><code>PORTAL_PAUSED</code></li>
            <li><code>PORTAL_SUSPENDED</code></li>
          </ul></li>
      </ul>
    </li>
    <li>
      Modified <code>DELETE /v2/portal/hubs/{id}</code>:
      <ul>
        <li>Added <code>filesystem_uuid</code> parameter to <code>DELETE /v2/portal/hubs/{id}</code> <code>202</code> response</li>
        <li>Added enum values to <code>state</code> field in <code>DELETE /v2/portal/hubs/{id}</code> <code>202</code> response:
          <ul>
            <li><code>PAUSING</code></li>
            <li><code>QUIESCING</code></li>
          </ul></li>
        <li>Added <code>DISCONNECTED</code> enum value to <code>status</code> field in <code>DELETE /v2/portal/hubs/{id}</code> <code>202</code> response</li>
        <li>Added enum values to <code>type</code> field in <code>DELETE /v2/portal/hubs/{id}</code> <code>202</code> response:
          <ul>
            <li><code>PORTAL_PAUSED</code></li>
            <li><code>PORTAL_SUSPENDED</code></li>
          </ul></li>
      </ul>
    </li>
    <li>
      Modified <code>GET /v2/portal/hubs/{id}</code>:
      <ul>
        <li>Added <code>filesystem_uuid</code> parameter to <code>GET /v2/portal/hubs/{id}</code> response</li>
        <li>Added enum values to <code>state</code> field in <code>GET /v2/portal/hubs/{id}</code> response:
          <ul>
            <li><code>PAUSING</code></li>
            <li><code>QUIESCING</code></li>
          </ul></li>
        <li>Added <code>DISCONNECTED</code> enum value to <code>status</code> field in <code>GET /v2/portal/hubs/{id}</code> response</li>
        <li>Added enum values to <code>type</code> field in <code>GET /v2/portal/hubs/{id}</code> response:
          <ul>
            <li><code>PORTAL_PAUSED</code></li>
            <li><code>PORTAL_SUSPENDED</code></li>
          </ul></li>
      </ul>
    </li>
    <li>
      Modified <code>PATCH /v2/portal/hubs/{id}</code>:
      <ul>
        <li>Added <code>filesystem_uuid</code> parameter to <code>PATCH /v2/portal/hubs/{id}</code> request body</li>
        <li>Added enum values to <code>state</code> field in <code>PATCH /v2/portal/hubs/{id}</code> request body:
          <ul>
            <li><code>PAUSING</code></li>
            <li><code>QUIESCING</code></li>
          </ul></li>
        <li>Added <code>DISCONNECTED</code> enum value to <code>status</code> field in <code>PATCH /v2/portal/hubs/{id}</code> request body</li>
        <li>Added enum values to <code>type</code> field in <code>PATCH /v2/portal/hubs/{id}</code> request body:
          <ul>
            <li><code>PORTAL_PAUSED</code></li>
            <li><code>PORTAL_SUSPENDED</code></li>
          </ul></li>
        <li>Added <code>filesystem_uuid</code> parameter to <code>PATCH /v2/portal/hubs/{id}</code> response</li>
        <li>Added enum values to <code>state</code> field in <code>PATCH /v2/portal/hubs/{id}</code> response:
          <ul>
            <li><code>PAUSING</code></li>
            <li><code>QUIESCING</code></li>
          </ul></li>
        <li>Added <code>DISCONNECTED</code> enum value to <code>status</code> field in <code>PATCH /v2/portal/hubs/{id}</code> response</li>
        <li>Added enum values to <code>type</code> field in <code>PATCH /v2/portal/hubs/{id}</code> response:
          <ul>
            <li><code>PORTAL_PAUSED</code></li>
            <li><code>PORTAL_SUSPENDED</code></li>
          </ul></li>
      </ul>
    </li>
    <li>
      Modified <code>POST /v2/portal/hubs/{id}/accept</code>:
      <ul>
        <li>Added <code>filesystem_uuid</code> parameter to <code>POST /v2/portal/hubs/{id}/accept</code> response</li>
        <li>Added enum values to <code>state</code> field in <code>POST /v2/portal/hubs/{id}/accept</code> response:
          <ul>
            <li><code>PAUSING</code></li>
            <li><code>QUIESCING</code></li>
          </ul></li>
        <li>Added <code>DISCONNECTED</code> enum value to <code>status</code> field in <code>POST /v2/portal/hubs/{id}/accept</code> response</li>
        <li>Added enum values to <code>type</code> field in <code>POST /v2/portal/hubs/{id}/accept</code> response:
          <ul>
            <li><code>PORTAL_PAUSED</code></li>
            <li><code>PORTAL_SUSPENDED</code></li>
          </ul></li>
      </ul>
    </li>
    <li>
      Modified <code>DELETE /v2/portal/hubs/{id}/roots/{dir}</code>:
      <ul>
        <li>Added <code>filesystem_uuid</code> parameter to <code>DELETE /v2/portal/hubs/{id}/roots/{dir}</code> response</li>
        <li>Added enum values to <code>state</code> field in <code>DELETE /v2/portal/hubs/{id}/roots/{dir}</code> response:
          <ul>
            <li><code>PAUSING</code></li>
            <li><code>QUIESCING</code></li>
          </ul></li>
        <li>Added <code>DISCONNECTED</code> enum value to <code>status</code> field in <code>DELETE /v2/portal/hubs/{id}/roots/{dir}</code> response</li>
        <li>Added enum values to <code>type</code> field in <code>DELETE /v2/portal/hubs/{id}/roots/{dir}</code> response:
          <ul>
            <li><code>PORTAL_PAUSED</code></li>
            <li><code>PORTAL_SUSPENDED</code></li>
          </ul></li>
      </ul>
    </li>
    <li>
      Modified <code>POST /v2/portal/hubs/{id}/roots/{dir}</code>:
      <ul>
        <li>Added <code>filesystem_uuid</code> parameter to <code>POST /v2/portal/hubs/{id}/roots/{dir}</code> response</li>
        <li>Added enum values to <code>state</code> field in <code>POST /v2/portal/hubs/{id}/roots/{dir}</code> response:
          <ul>
            <li><code>PAUSING</code></li>
            <li><code>QUIESCING</code></li>
          </ul></li>
        <li>Added <code>DISCONNECTED</code> enum value to <code>status</code> field in <code>POST /v2/portal/hubs/{id}/roots/{dir}</code> response</li>
        <li>Added enum values to <code>type</code> field in <code>POST /v2/portal/hubs/{id}/roots/{dir}</code> response:
          <ul>
            <li><code>PORTAL_PAUSED</code></li>
            <li><code>PORTAL_SUSPENDED</code></li>
          </ul></li>
      </ul>
    </li>
    <li>
      Modified <code>GET /v2/portal/spokes/</code>:
      <ul>
        <li>Added parameters to <code>GET /v2/portal/spokes/</code> response:
          <ul>
            <li><code>filesystem_uuid</code></li>
            <li><code>hub_cluster_name</code></li>
          </ul></li>
        <li>Added enum values to <code>state</code> field in <code>GET /v2/portal/spokes/</code> response:
          <ul>
            <li><code>PAUSING</code></li>
            <li><code>QUIESCING</code></li>
          </ul></li>
        <li>Added <code>DISCONNECTED</code> enum value to <code>status</code> field in <code>GET /v2/portal/spokes/</code> response</li>
        <li>Added enum values to <code>type</code> field in <code>GET /v2/portal/spokes/</code> response:
          <ul>
            <li><code>PORTAL_PAUSED</code></li>
            <li><code>PORTAL_SUSPENDED</code></li>
          </ul></li>
      </ul>
    </li>
    <li>
      Modified <code>POST /v2/portal/spokes/</code>:
      <ul>
        <li>Added enum values to <code>type</code> field in <code>POST /v2/portal/spokes/</code> request body:
          <ul>
            <li><code>PORTAL_PAUSED</code></li>
            <li><code>PORTAL_SUSPENDED</code></li>
          </ul></li>
        <li>Added parameters to <code>POST /v2/portal/spokes/</code> response:
          <ul>
            <li><code>filesystem_uuid</code></li>
            <li><code>hub_cluster_name</code></li>
          </ul></li>
        <li>Added enum values to <code>state</code> field in <code>POST /v2/portal/spokes/</code> response:
          <ul>
            <li><code>PAUSING</code></li>
            <li><code>QUIESCING</code></li>
          </ul></li>
        <li>Added <code>DISCONNECTED</code> enum value to <code>status</code> field in <code>POST /v2/portal/spokes/</code> response</li>
        <li>Added enum values to <code>type</code> field in <code>POST /v2/portal/spokes/</code> response:
          <ul>
            <li><code>PORTAL_PAUSED</code></li>
            <li><code>PORTAL_SUSPENDED</code></li>
          </ul></li>
      </ul>
    </li>
    <li>
      Modified <code>DELETE /v2/portal/spokes/{id}</code>:
      <ul>
        <li>Added parameters to <code>DELETE /v2/portal/spokes/{id}</code> <code>202</code> response:
          <ul>
            <li><code>filesystem_uuid</code></li>
            <li><code>hub_cluster_name</code></li>
          </ul></li>
        <li>Added enum values to <code>state</code> field in <code>DELETE /v2/portal/spokes/{id}</code> <code>202</code> response:
          <ul>
            <li><code>PAUSING</code></li>
            <li><code>QUIESCING</code></li>
          </ul></li>
        <li>Added <code>DISCONNECTED</code> enum value to <code>status</code> field in <code>DELETE /v2/portal/spokes/{id}</code> <code>202</code> response</li>
        <li>Added enum values to <code>type</code> field in <code>DELETE /v2/portal/spokes/{id}</code> <code>202</code> response:
          <ul>
            <li><code>PORTAL_PAUSED</code></li>
            <li><code>PORTAL_SUSPENDED</code></li>
          </ul></li>
      </ul>
    </li>
    <li>
      Modified <code>GET /v2/portal/spokes/{id}</code>:
      <ul>
        <li>Added parameters to <code>GET /v2/portal/spokes/{id}</code> response:
          <ul>
            <li><code>filesystem_uuid</code></li>
            <li><code>hub_cluster_name</code></li>
          </ul></li>
        <li>Added enum values to <code>state</code> field in <code>GET /v2/portal/spokes/{id}</code> response:
          <ul>
            <li><code>PAUSING</code></li>
            <li><code>QUIESCING</code></li>
          </ul></li>
        <li>Added <code>DISCONNECTED</code> enum value to <code>status</code> field in <code>GET /v2/portal/spokes/{id}</code> response</li>
        <li>Added enum values to <code>type</code> field in <code>GET /v2/portal/spokes/{id}</code> response:
          <ul>
            <li><code>PORTAL_PAUSED</code></li>
            <li><code>PORTAL_SUSPENDED</code></li>
          </ul></li>
      </ul>
    </li>
    <li>
      Modified <code>PATCH /v2/portal/spokes/{id}</code>:
      <ul>
        <li>Added parameters to <code>PATCH /v2/portal/spokes/{id}</code> request body:
          <ul>
            <li><code>filesystem_uuid</code></li>
            <li><code>hub_cluster_name</code></li>
          </ul></li>
        <li>Added enum values to <code>state</code> field in <code>PATCH /v2/portal/spokes/{id}</code> request body:
          <ul>
            <li><code>PAUSING</code></li>
            <li><code>QUIESCING</code></li>
          </ul></li>
        <li>Added <code>DISCONNECTED</code> enum value to <code>status</code> field in <code>PATCH /v2/portal/spokes/{id}</code> request body</li>
        <li>Added enum values to <code>type</code> field in <code>PATCH /v2/portal/spokes/{id}</code> request body:
          <ul>
            <li><code>PORTAL_PAUSED</code></li>
            <li><code>PORTAL_SUSPENDED</code></li>
          </ul></li>
        <li>Added parameters to <code>PATCH /v2/portal/spokes/{id}</code> response:
          <ul>
            <li><code>filesystem_uuid</code></li>
            <li><code>hub_cluster_name</code></li>
          </ul></li>
        <li>Added enum values to <code>state</code> field in <code>PATCH /v2/portal/spokes/{id}</code> response:
          <ul>
            <li><code>PAUSING</code></li>
            <li><code>QUIESCING</code></li>
          </ul></li>
        <li>Added <code>DISCONNECTED</code> enum value to <code>status</code> field in <code>PATCH /v2/portal/spokes/{id}</code> response</li>
        <li>Added enum values to <code>type</code> field in <code>PATCH /v2/portal/spokes/{id}</code> response:
          <ul>
            <li><code>PORTAL_PAUSED</code></li>
            <li><code>PORTAL_SUSPENDED</code></li>
          </ul></li>
      </ul>
    </li>
    <li>
      Modified <code>POST /v2/portal/spokes/{id}/roots/</code>:
      <ul>
        <li>Added parameters to <code>POST /v2/portal/spokes/{id}/roots/</code> response:
          <ul>
            <li><code>filesystem_uuid</code></li>
            <li><code>hub_cluster_name</code></li>
          </ul></li>
        <li>Added enum values to <code>state</code> field in <code>POST /v2/portal/spokes/{id}/roots/</code> response:
          <ul>
            <li><code>PAUSING</code></li>
            <li><code>QUIESCING</code></li>
          </ul></li>
        <li>Added <code>DISCONNECTED</code> enum value to <code>status</code> field in <code>POST /v2/portal/spokes/{id}/roots/</code> response</li>
        <li>Added enum values to <code>type</code> field in <code>POST /v2/portal/spokes/{id}/roots/</code> response:
          <ul>
            <li><code>PORTAL_PAUSED</code></li>
            <li><code>PORTAL_SUSPENDED</code></li>
          </ul></li>
      </ul>
    </li>
    <li>
      Modified <code>DELETE /v2/portal/spokes/{id}/roots/{dir}</code>:
      <ul>
        <li>Added parameters to <code>DELETE /v2/portal/spokes/{id}/roots/{dir}</code> response:
          <ul>
            <li><code>filesystem_uuid</code></li>
            <li><code>hub_cluster_name</code></li>
          </ul></li>
        <li>Added enum values to <code>state</code> field in <code>DELETE /v2/portal/spokes/{id}/roots/{dir}</code> response:
          <ul>
            <li><code>PAUSING</code></li>
            <li><code>QUIESCING</code></li>
          </ul></li>
        <li>Added <code>DISCONNECTED</code> enum value to <code>status</code> field in <code>DELETE /v2/portal/spokes/{id}/roots/{dir}</code> response</li>
        <li>Added enum values to <code>type</code> field in <code>DELETE /v2/portal/spokes/{id}/roots/{dir}</code> response:
          <ul>
            <li><code>PORTAL_PAUSED</code></li>
            <li><code>PORTAL_SUSPENDED</code></li>
          </ul></li>
      </ul>
    </li>
    <li>
      Added parameters to <code>GET /v3/replication/object-relationships/status/</code> response:
          <ul>
            <li><code>access_key_id</code></li>
            <li><code>bucket</code></li>
            <li><code>bucket_style</code></li>
            <li><code>ca_certificate</code></li>
            <li><code>current_job</code></li>
            <li><code>direction</code></li>
            <li><code>id</code></li>
            <li><code>last_job</code></li>
            <li><code>local_directory_id</code></li>
            <li><code>local_directory_path</code></li>
            <li><code>object_folder</code></li>
            <li><code>object_store_address</code></li>
            <li><code>port</code></li>
            <li><code>region</code></li>
            <li><code>state</code></li>
          </ul>
    </li>
    <li>
      Added parameters to <code>GET /v3/replication/object-relationships/{id}/status</code> response:
          <ul>
            <li><code>access_key_id</code></li>
            <li><code>bucket</code></li>
            <li><code>bucket_style</code></li>
            <li><code>ca_certificate</code></li>
            <li><code>current_job</code></li>
            <li><code>direction</code></li>
            <li><code>id</code></li>
            <li><code>last_job</code></li>
            <li><code>local_directory_id</code></li>
            <li><code>local_directory_path</code></li>
            <li><code>object_folder</code></li>
            <li><code>object_store_address</code></li>
            <li><code>port</code></li>
            <li><code>region</code></li>
            <li><code>state</code></li>
          </ul>
    </li>
  </ul>
</details>

### Qumulo Core 7.10.0.1 (Quarterly)
{{ nexusLink }}
<ul>
  <li>Added <code>POST /v1/files/try-resolve</code> endpoint</li>
  <li>Added <code>portal_cache_size_bytes</code> parameter to <code>GET /v1/file-system</code> response</li>
</ul>


## 7.9 Releases

### Qumulo Core 7.9.3.1
{{ nexusLink }}
{{ noAPIchanges }}

### Qumulo Core 7.9.2.3
{{ nexusLink }}
<ul>
  <li>Removed <code>/v1/portal/hubs/</code> endpoint</li>
  <li>Removed <code>/v1/portal/hubs/{id}</code> endpoint</li>
  <li>Removed <code>/v1/portal/hubs/{id}/authorize</code> endpoint</li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>Removed <code>/v1/portal/spokes/</code> endpoint</li>
    <li>Removed <code>/v1/portal/spokes/{id}</code> endpoint</li>
    <li>Removed <code>/v1/portal/spokes/{id}/propose</code> endpoint</li>
    <li>Added <code>GET /v1/portal/quorum/events</code> endpoint</li>
    <li>Added <code>offline_files_caching_mode</code> parameter to <code>GET /v3/smb/shares/</code> response</li>
    <li>
      Modified <code>POST /v3/smb/shares/</code>:
      <ul>
        <li>Added <code>offline_files_caching_mode</code> parameter to <code>POST /v3/smb/shares/</code> request body</li>
        <li>Added <code>offline_files_caching_mode</code> parameter to <code>POST /v3/smb/shares/</code> response</li>
      </ul>
    </li>
    <li>Added <code>offline_files_caching_mode</code> parameter to <code>GET /v3/smb/shares/{share_id}</code> response</li>
    <li>
      Modified <code>PATCH /v3/smb/shares/{share_id}</code>:
      <ul>
        <li>Added <code>offline_files_caching_mode</code> parameter to <code>PATCH /v3/smb/shares/{share_id}</code> request body</li>
        <li>Added <code>offline_files_caching_mode</code> parameter to <code>PATCH /v3/smb/shares/{share_id}</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>PUT /v3/smb/shares/{share_id}</code>:
      <ul>
        <li>Added <code>offline_files_caching_mode</code> parameter to <code>PUT /v3/smb/shares/{share_id}</code> request body</li>
        <li>Added <code>offline_files_caching_mode</code> parameter to <code>PUT /v3/smb/shares/{share_id}</code> response</li>
      </ul>
    </li>
  </ul>
</details>

### Qumulo Core 7.9.1.3
{{ nexusLink }}
<ul>
  <li>Removed <code>/v1/portal/quorum/events</code> endpoint</li>
  <li>Added <code>lock</code> parameter to <code>PATCH /v1/files/{ref}/info/attributes</code> response</li>
</ul>

### Qumulo Core 7.9.0.4 (Quarterly)
{{ nexusLink }}
<ul>
  <li>Removed <code>/v1/snapshots/calculate-used-capacity</code> endpoint</li>
  <li>Removed <code>/v1/snapshots/capacity-used-per-snapshot/</code> endpoint</li>
  <li>Removed <code>/v1/snapshots/capacity-used-per-snapshot/{id}</code> endpoint</li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>Added <code>GET /v1/portal/quorum/events</code> endpoint</li>
    <li>Added <code>GET | POST /v2/audit/destinations/</code> endpoint</li>
    <li>Added <code>DELETE | GET | PATCH | PUT /v2/audit/destinations/{id}</code> endpoint</li>
    <li>Added <code>GET /v2/audit/destinations/{id}/status</code> endpoint</li>
    <li>Added <code>GET /v3/snapshots/{newer_id}/changes-since/{older_id}/files/{ref}</code> endpoint</li>
    <li>Added <code>skip-atime-update</code> parameter to <code>GET /v1/files/{ref}/data</code> parameters</li>
    <li>Added <code>logical_datablocks</code> parameter to <code>PATCH /v1/files/{ref}/data</code> response</li>
    <li>Added <code>logical_datablocks</code> parameter to <code>PUT /v1/files/{ref}/data</code> response</li>
    <li>
      Modified <code>GET /v1/files/{ref}/entries/</code>:
      <ul>
        <li>Added parameters to <code>GET /v1/files/{ref}/entries/</code> parameters:
          <ul>
            <li><code>include-acls</code></li>
            <li><code>skip-atime-update</code></li>
          </ul></li>
        <li>Added parameters to <code>GET /v1/files/{ref}/entries/</code> response:
          <ul>
            <li><code>file_acls</code></li>
            <li><code>logical_datablocks</code></li>
          </ul></li>
      </ul>
    </li>
    <li>Added <code>logical_datablocks</code> parameter to <code>POST /v1/files/{ref}/entries/</code> response</li>
    <li>Added <code>logical_datablocks</code> parameter to <code>PATCH /v1/files/{ref}/file-lock</code> response</li>
    <li>Added <code>logical_datablocks</code> parameter to <code>GET /v1/files/{ref}/info/attributes</code> response</li>
    <li>
      Modified <code>PATCH /v1/files/{ref}/info/attributes</code>:
      <ul>
        <li>Added <code>logical_datablocks</code> parameter to <code>PATCH /v1/files/{ref}/info/attributes</code> request body</li>
        <li>Added <code>logical_datablocks</code> parameter to <code>PATCH /v1/files/{ref}/info/attributes</code> response</li>
      </ul>
    </li>
    <li>Added <code>logical_datablocks</code> parameter to <code>POST /v1/files/{ref}/punch-hole</code> response</li>
    <li>Added <code>logical_datablocks</code> parameter to <code>GET /v1/files/{ref}/streams/</code> response</li>
    <li>Added <code>logical_datablocks</code> parameter to <code>POST /v1/files/{ref}/streams/</code> response</li>
    <li>Added <code>logical_datablocks</code> parameter to <code>GET /v1/files/{ref}/streams/{stream_id}/attributes</code> response</li>
    <li>
      Modified <code>PATCH /v1/files/{ref}/streams/{stream_id}/attributes</code>:
      <ul>
        <li>Added <code>logical_datablocks</code> parameter to <code>PATCH /v1/files/{ref}/streams/{stream_id}/attributes</code> request body</li>
        <li>Added <code>logical_datablocks</code> parameter to <code>PATCH /v1/files/{ref}/streams/{stream_id}/attributes</code> response</li>
      </ul>
    </li>
    <li>Added <code>skip-atime-update</code> parameter to <code>GET /v1/files/{ref}/streams/{stream_id}/data</code> parameters</li>
    <li>Added <code>logical_datablocks</code> parameter to <code>PATCH /v1/files/{ref}/streams/{stream_id}/data</code> response</li>
    <li>Added <code>logical_datablocks</code> parameter to <code>PUT /v1/files/{ref}/streams/{stream_id}/data</code> response</li>
    <li>Added <code>logical_datablocks</code> parameter to <code>POST /v1/files/{ref}/streams/{stream_id}/punch-hole</code> response</li>
    <li>Added <code>logical_datablocks</code> parameter to <code>POST /v1/files/{ref}/streams/{stream_id}/rename</code> response</li>
    <li>Added <code>error_class</code> parameter to <code>POST /v2/upgrade/verify-image</code> response</li>
  </ul>
</details>


## 7.8 Releases

### Qumulo Core 7.8.4.3
{{ nexusLink }}
<ul>
  <li>Added <code>GET /v2/time/default-settings</code> endpoint</li>
  <li>Added <code>GET | PATCH | PUT /v2/time/settings</code> endpoint</li>
  <li>Added <code>GET /v2/time/status</code> endpoint</li>
  <li>Added <code>GET /v2/time/timezones</code> endpoint</li>
</ul>

### Qumulo Core 7.8.3.1
{{ nexusLink }}
<ul>
  <li>Added <code>POST /v1/files/{ref}/fetch-data</code> endpoint</li>
  <li>Added <code>POST /v1/shutdown/container-restart</code> endpoint</li>
</ul>

### Qumulo Core 7.8.2.1
{{ nexusLink }}
{{ noAPIchanges }}

### Qumulo Core 7.8.1.1
{{ nexusLink }}
{{ noAPIchanges }}

### Qumulo Core 7.8.0.4 (Quarterly)
{{ nexusLink }}
<ul>
  <li>Added <code>GET | PATCH /v1/authoritative-dns/settings</code> endpoint</li>
  <li>Added <code>POST /v2/object-storage/add-uris</code> endpoint</li>
  <li>Added <code>POST /v5/cluster/object-backed/create-stratus</code> endpoint</li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>Added <code>node_statuses</code> parameter to <code>GET /v1/audit/cloudwatch/status</code> response</li>
    <li>Added <code>members</code> parameter to <code>GET /v1/auth/roles/{role_name}/members</code> response</li>
    <li>
      Added parameters to <code>GET /v3/network/status</code> response:
          <ul>
            <li><code>api_cloud_provider_status</code></li>
            <li><code>devices</code></li>
            <li><code>environment</code></li>
            <li><code>managed_interface_statuses</code></li>
            <li><code>network_statuses</code></li>
            <li><code>node_id</code></li>
            <li><code>node_name</code></li>
          </ul>
    </li>
    <li>
      Added parameters to <code>GET /v3/network/status/{node_id}</code> response:
          <ul>
            <li><code>api_cloud_provider_status</code></li>
            <li><code>devices</code></li>
            <li><code>environment</code></li>
            <li><code>managed_interface_statuses</code></li>
            <li><code>network_statuses</code></li>
            <li><code>node_id</code></li>
            <li><code>node_name</code></li>
          </ul>
    </li>
  </ul>
</details>


## 7.7 Releases

### Qumulo Core 7.7.5.1
{{ nexusLink }}
Added <code>GET /v1/object-storage/external-credentials-source</code> endpoint

### Qumulo Core 7.7.4.1
{{ nexusLink }}
<ul>
  <li>Added <code>POST /v1/portal/ping</code> endpoint</li>
  <li>
    Modified <code>GET /v1/file-system/settings/permissions</code>:
      <ul>
        <li>Added <code>CROSS_PROTOCOL_POSIX_PRIORITY</code> enum value to <code>mode</code> field in <code>GET /v1/file-system/settings/permissions</code> response</li>
        <li>Removed <code>CROSS_PROTOCOL_IGNORE_UNRELATED_ACES</code> enum value from <code>mode</code> field in <code>GET /v1/file-system/settings/permissions</code> response</li>
      </ul>
  </li>
  <li>
    Modified <code>PUT /v1/file-system/settings/permissions</code>:
      <ul>
        <li>Added <code>CROSS_PROTOCOL_POSIX_PRIORITY</code> enum value to <code>mode</code> field in <code>PUT /v1/file-system/settings/permissions</code> request body</li>
        <li>Removed <code>CROSS_PROTOCOL_IGNORE_UNRELATED_ACES</code> enum value from <code>mode</code> field in <code>PUT /v1/file-system/settings/permissions</code> request body</li>
        <li>Added <code>CROSS_PROTOCOL_POSIX_PRIORITY</code> enum value to <code>mode</code> field in <code>PUT /v1/file-system/settings/permissions</code> response</li>
        <li>Removed <code>CROSS_PROTOCOL_IGNORE_UNRELATED_ACES</code> enum value from <code>mode</code> field in <code>PUT /v1/file-system/settings/permissions</code> response</li>
      </ul>
  </li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>Added <code>idmap_domain</code> parameter to <code>GET /v1/multitenancy/nfs/global-settings</code> response</li>
    <li>
      Modified <code>PATCH /v1/multitenancy/nfs/global-settings</code>:
      <ul>
        <li>Added <code>idmap_domain</code> parameter to <code>PATCH /v1/multitenancy/nfs/global-settings</code> request body</li>
        <li>Added <code>idmap_domain</code> parameter to <code>PATCH /v1/multitenancy/nfs/global-settings</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>PUT /v1/multitenancy/nfs/global-settings</code>:
      <ul>
        <li>Added <code>idmap_domain</code> parameter to <code>PUT /v1/multitenancy/nfs/global-settings</code> request body</li>
        <li>Added <code>idmap_domain</code> parameter to <code>PUT /v1/multitenancy/nfs/global-settings</code> response</li>
      </ul>
    </li>
    <li>Added <code>idmap_domain</code> parameter to <code>GET /v1/multitenancy/nfs/settings/{id}</code> response</li>
    <li>
      Modified <code>PATCH /v1/multitenancy/nfs/settings/{id}</code>:
      <ul>
        <li>Added <code>idmap_domain</code> parameter to <code>PATCH /v1/multitenancy/nfs/settings/{id}</code> request body</li>
        <li>Added <code>idmap_domain</code> parameter to <code>PATCH /v1/multitenancy/nfs/settings/{id}</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>PUT /v1/multitenancy/nfs/settings/{id}</code>:
      <ul>
        <li>Added <code>idmap_domain</code> parameter to <code>PUT /v1/multitenancy/nfs/settings/{id}</code> request body</li>
        <li>Added <code>idmap_domain</code> parameter to <code>PUT /v1/multitenancy/nfs/settings/{id}</code> response</li>
      </ul>
    </li>
    <li>Added <code>idmap_domain</code> parameter to <code>GET /v2/nfs/settings</code> response</li>
    <li>
      Modified <code>PATCH /v2/nfs/settings</code>:
      <ul>
        <li>Added <code>idmap_domain</code> parameter to <code>PATCH /v2/nfs/settings</code> request body</li>
        <li>Added <code>idmap_domain</code> parameter to <code>PATCH /v2/nfs/settings</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>PUT /v2/nfs/settings</code>:
      <ul>
        <li>Added <code>idmap_domain</code> parameter to <code>PUT /v2/nfs/settings</code> request body</li>
        <li>Added <code>idmap_domain</code> parameter to <code>PUT /v2/nfs/settings</code> response</li>
      </ul>
    </li>
  </ul>
</details>

### Qumulo Core 7.7.3
{{ nexusLink }}
<ul>
  <li>Added <code>CROSS_PROTOCOL_IGNORE_UNRELATED_ACES</code> enum value to <code>mode</code> field in <code>GET /v1/file-system/settings/permissions</code> response</li>
  <li>
    Modified <code>PUT /v1/file-system/settings/permissions</code>:
      <ul>
        <li>Added <code>CROSS_PROTOCOL_IGNORE_UNRELATED_ACES</code> enum value to <code>mode</code> field in <code>PUT /v1/file-system/settings/permissions</code> request body</li>
        <li>Added <code>CROSS_PROTOCOL_IGNORE_UNRELATED_ACES</code> enum value to <code>mode</code> field in <code>PUT /v1/file-system/settings/permissions</code> response</li>
      </ul>
  </li>
  <li>
    Added parameters to <code>GET /v3/smb/shares/</code> response:
          <ul>
            <li><code>allow_fs_path_create</code></li>
            <li><code>expand_fs_path_variables</code></li>
          </ul>
  </li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>
      Modified <code>POST /v3/smb/shares/</code>:
      <ul>
        <li>Removed <code>allow-fs-path-create</code> parameter from <code>POST /v3/smb/shares/</code> parameters</li>
        <li>Added parameters to <code>POST /v3/smb/shares/</code> request body:
          <ul>
            <li><code>allow_fs_path_create</code></li>
            <li><code>expand_fs_path_variables</code></li>
          </ul></li>
        <li>Added parameters to <code>POST /v3/smb/shares/</code> response:
          <ul>
            <li><code>allow_fs_path_create</code></li>
            <li><code>expand_fs_path_variables</code></li>
          </ul></li>
      </ul>
    </li>
    <li>
      Added parameters to <code>GET /v3/smb/shares/{share_id}</code> response:
          <ul>
            <li><code>allow_fs_path_create</code></li>
            <li><code>expand_fs_path_variables</code></li>
          </ul>
    </li>
    <li>
      Modified <code>PATCH /v3/smb/shares/{share_id}</code>:
      <ul>
        <li>Removed <code>allow-fs-path-create</code> parameter from <code>PATCH /v3/smb/shares/{share_id}</code> parameters</li>
        <li>Added parameters to <code>PATCH /v3/smb/shares/{share_id}</code> request body:
          <ul>
            <li><code>allow_fs_path_create</code></li>
            <li><code>expand_fs_path_variables</code></li>
          </ul></li>
        <li>Added parameters to <code>PATCH /v3/smb/shares/{share_id}</code> response:
          <ul>
            <li><code>allow_fs_path_create</code></li>
            <li><code>expand_fs_path_variables</code></li>
          </ul></li>
      </ul>
    </li>
    <li>
      Modified <code>PUT /v3/smb/shares/{share_id}</code>:
      <ul>
        <li>Removed <code>allow-fs-path-create</code> parameter from <code>PUT /v3/smb/shares/{share_id}</code> parameters</li>
        <li>Added parameters to <code>PUT /v3/smb/shares/{share_id}</code> request body:
          <ul>
            <li><code>allow_fs_path_create</code></li>
            <li><code>expand_fs_path_variables</code></li>
          </ul></li>
        <li>Added parameters to <code>PUT /v3/smb/shares/{share_id}</code> response:
          <ul>
            <li><code>allow_fs_path_create</code></li>
            <li><code>expand_fs_path_variables</code></li>
          </ul></li>
      </ul>
    </li>
  </ul>
</details>

### Qumulo Core 7.7.2
{{ nexusLink }}
Added <code>POST /v2/cluster/data-core/create</code> endpoint

### Qumulo Core 7.7.1.1
{{ nexusLink }}
<ul>
  <li>Added <code>GET | PATCH | PUT /v1/nexus/connection</code> endpoint</li>
  <li>Added <code>DELETE | GET | PUT /v1/nexus/registration</code> endpoint</li>
  <li>Added <code>POST /v1/nexus/registration/rotate</code> endpoint</li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>Added <code>required_authentication_mode</code> parameter to <code>GET /v2/nfs/exports/</code> response</li>
    <li>
      Modified <code>POST /v2/nfs/exports/</code>:
      <ul>
        <li>Added <code>required_authentication_mode</code> parameter to <code>POST /v2/nfs/exports/</code> request body</li>
        <li>Added <code>required_authentication_mode</code> parameter to <code>POST /v2/nfs/exports/</code> response</li>
      </ul>
    </li>
    <li>Added <code>required_authentication_mode</code> parameter to <code>GET /v2/nfs/exports/{ref}</code> response</li>
    <li>
      Modified <code>PATCH /v2/nfs/exports/{ref}</code>:
      <ul>
        <li>Added <code>required_authentication_mode</code> parameter to <code>PATCH /v2/nfs/exports/{ref}</code> request body</li>
        <li>Added <code>required_authentication_mode</code> parameter to <code>PATCH /v2/nfs/exports/{ref}</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>PUT /v2/nfs/exports/{ref}</code>:
      <ul>
        <li>Added <code>required_authentication_mode</code> parameter to <code>PUT /v2/nfs/exports/{ref}</code> request body</li>
        <li>Added <code>required_authentication_mode</code> parameter to <code>PUT /v2/nfs/exports/{ref}</code> response</li>
      </ul>
    </li>
    <li>Added <code>required_authentication_mode</code> parameter to <code>GET /v3/nfs/exports/</code> response</li>
    <li>
      Modified <code>POST /v3/nfs/exports/</code>:
      <ul>
        <li>Added <code>required_authentication_mode</code> parameter to <code>POST /v3/nfs/exports/</code> request body</li>
        <li>Added <code>required_authentication_mode</code> parameter to <code>POST /v3/nfs/exports/</code> response</li>
      </ul>
    </li>
    <li>Added <code>required_authentication_mode</code> parameter to <code>GET /v3/nfs/exports/{export_id}</code> response</li>
    <li>
      Modified <code>PATCH /v3/nfs/exports/{export_id}</code>:
      <ul>
        <li>Added <code>required_authentication_mode</code> parameter to <code>PATCH /v3/nfs/exports/{export_id}</code> request body</li>
        <li>Added <code>required_authentication_mode</code> parameter to <code>PATCH /v3/nfs/exports/{export_id}</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>PUT /v3/nfs/exports/{export_id}</code>:
      <ul>
        <li>Added <code>required_authentication_mode</code> parameter to <code>PUT /v3/nfs/exports/{export_id}</code> request body</li>
        <li>Added <code>required_authentication_mode</code> parameter to <code>PUT /v3/nfs/exports/{export_id}</code> response</li>
      </ul>
    </li>
  </ul>
</details>

### Qumulo Core 7.7.0.3 (Quarterly)
{{ nexusLink }}
<ul>
  <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>GET /v0/ftp/settings</code> response</li>
  <li>
    Modified <code>PATCH /v0/ftp/settings</code>:
      <ul>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PATCH /v0/ftp/settings</code> request body</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PATCH /v0/ftp/settings</code> response</li>
      </ul>
  </li>
  <li>
    Modified <code>PUT /v0/ftp/settings</code>:
      <ul>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PUT /v0/ftp/settings</code> request body</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PUT /v0/ftp/settings</code> response</li>
      </ul>
  </li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>GET /v0/ftp/status</code> response</li>
    <li>
      Modified <code>GET /v1/auth/access-tokens/</code>:
      <ul>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>GET /v1/auth/access-tokens/</code> response</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>GET /v1/auth/access-tokens/</code> response</li>
      </ul>
    </li>
    <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/auth/access-tokens/</code> request body</li>
    <li>
      Modified <code>GET /v1/auth/access-tokens/{id}</code>:
      <ul>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>GET /v1/auth/access-tokens/{id}</code> response</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>GET /v1/auth/access-tokens/{id}</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>PATCH /v1/auth/access-tokens/{id}</code>:
      <ul>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>PATCH /v1/auth/access-tokens/{id}</code> response</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>PATCH /v1/auth/access-tokens/{id}</code> response</li>
      </ul>
    </li>
    <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>GET /v1/auth/auth-ids/{id}/related-identities/</code> response</li>
    <li>
      Modified <code>POST /v1/auth/identity/expand</code>:
      <ul>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/auth/identity/expand</code> request body</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/auth/identity/expand</code> request body</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/auth/identity/expand</code> request body</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/auth/identity/expand</code> response</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/auth/identity/expand</code> response</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/auth/identity/expand</code> response</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/auth/identity/expand</code> response</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/auth/identity/expand</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>POST /v1/auth/identity/find</code>:
      <ul>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/auth/identity/find</code> request body</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/auth/identity/find</code> response</li>
      </ul>
    </li>
    <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>GET /v1/auth/local-username/{username}/related-identities/</code> response</li>
    <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>GET /v1/auth/posix-gids/{id}/related-identities/</code> response</li>
    <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>GET /v1/auth/posix-uids/{id}/related-identities/</code> response</li>
    <li>
      Modified <code>POST /v1/auth/roles/{role_name}/members</code>:
      <ul>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/auth/roles/{role_name}/members</code> request body</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/auth/roles/{role_name}/members</code> response</li>
      </ul>
    </li>
    <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>GET /v1/auth/roles/{role_name}/members/{member_id}</code> response</li>
    <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>GET /v1/auth/sids/{id}/related-identities/</code> response</li>
    <li>
      Modified <code>PATCH /v1/files/{ref}/data</code>:
      <ul>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PATCH /v1/files/{ref}/data</code> response</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PATCH /v1/files/{ref}/data</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>PUT /v1/files/{ref}/data</code>:
      <ul>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PUT /v1/files/{ref}/data</code> response</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PUT /v1/files/{ref}/data</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>GET /v1/files/{ref}/entries/</code>:
      <ul>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>GET /v1/files/{ref}/entries/</code> response</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>GET /v1/files/{ref}/entries/</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>POST /v1/files/{ref}/entries/</code>:
      <ul>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>POST /v1/files/{ref}/entries/</code> response</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>POST /v1/files/{ref}/entries/</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>PATCH /v1/files/{ref}/file-lock</code>:
      <ul>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PATCH /v1/files/{ref}/file-lock</code> response</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PATCH /v1/files/{ref}/file-lock</code> response</li>
      </ul>
    </li>
    <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>GET /v1/files/{ref}/info/acl</code> response</li>
    <li>
      Modified <code>PUT /v1/files/{ref}/info/acl</code>:
      <ul>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PUT /v1/files/{ref}/info/acl</code> request body</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PUT /v1/files/{ref}/info/acl</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>POST /v1/files/{ref}/info/acl/explain-posix-mode</code>:
      <ul>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/files/{ref}/info/acl/explain-posix-mode</code> response</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/files/{ref}/info/acl/explain-posix-mode</code> response</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/files/{ref}/info/acl/explain-posix-mode</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>POST /v1/files/{ref}/info/acl/explain-rights</code>:
      <ul>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/files/{ref}/info/acl/explain-rights</code> request body</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/files/{ref}/info/acl/explain-rights</code> request body</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/files/{ref}/info/acl/explain-rights</code> request body</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/files/{ref}/info/acl/explain-rights</code> response</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/files/{ref}/info/acl/explain-rights</code> response</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/files/{ref}/info/acl/explain-rights</code> response</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/files/{ref}/info/acl/explain-rights</code> response</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/files/{ref}/info/acl/explain-rights</code> response</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/files/{ref}/info/acl/explain-rights</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>POST /v1/files/{ref}/info/acl/explain-set-mode</code>:
      <ul>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/files/{ref}/info/acl/explain-set-mode</code> response</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/files/{ref}/info/acl/explain-set-mode</code> response</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/files/{ref}/info/acl/explain-set-mode</code> response</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/files/{ref}/info/acl/explain-set-mode</code> response</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/files/{ref}/info/acl/explain-set-mode</code> response</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/files/{ref}/info/acl/explain-set-mode</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>GET /v1/files/{ref}/info/attributes</code>:
      <ul>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>GET /v1/files/{ref}/info/attributes</code> response</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>GET /v1/files/{ref}/info/attributes</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>PATCH /v1/files/{ref}/info/attributes</code>:
      <ul>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PATCH /v1/files/{ref}/info/attributes</code> request body</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PATCH /v1/files/{ref}/info/attributes</code> request body</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PATCH /v1/files/{ref}/info/attributes</code> response</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PATCH /v1/files/{ref}/info/attributes</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>POST /v1/files/{ref}/punch-hole</code>:
      <ul>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>POST /v1/files/{ref}/punch-hole</code> response</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>POST /v1/files/{ref}/punch-hole</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>PATCH /v1/files/{ref}/streams/{stream_id}/attributes</code>:
      <ul>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PATCH /v1/files/{ref}/streams/{stream_id}/attributes</code> request body</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PATCH /v1/files/{ref}/streams/{stream_id}/attributes</code> request body</li>
      </ul>
    </li>
    <li>
      Modified <code>POST /v1/identity/expand</code>:
      <ul>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/identity/expand</code> request body</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/identity/expand</code> request body</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/identity/expand</code> request body</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/identity/expand</code> response</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/identity/expand</code> response</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/identity/expand</code> response</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/identity/expand</code> response</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/identity/expand</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>POST /v1/identity/find</code>:
      <ul>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/identity/find</code> request body</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/identity/find</code> response</li>
      </ul>
    </li>
    <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>GET /v1/s3/access-keys/</code> response</li>
    <li>
      Modified <code>POST /v1/s3/access-keys/</code>:
      <ul>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/s3/access-keys/</code> request body</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/s3/access-keys/</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>POST /v1/s3/buckets/{name}/policy/explain-access</code>:
      <ul>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/s3/buckets/{name}/policy/explain-access</code> request body</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/s3/buckets/{name}/policy/explain-access</code> response</li>
      </ul>
    </li>
    <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>GET /v1/s3/buckets/{name}/uploads/</code> response</li>
    <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>GET /v1/smb/sessions/</code> response</li>
    <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v1/smb/sessions/close</code> request body</li>
    <li>
      Added parameters to <code>GET /v1/support/settings</code> response:
          <ul>
            <li><code>nexus_registration_key</code></li>
            <li><code>nexus_secret_created_at</code></li>
          </ul>
    </li>
    <li>Added <code>nexus_registration_key</code> parameter to <code>PATCH /v1/support/settings</code> request body</li>
    <li>Added <code>nexus_registration_key</code> parameter to <code>PUT /v1/support/settings</code> request body</li>
    <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>GET /v2/files/{ref}/info/acl</code> response</li>
    <li>
      Modified <code>PUT /v2/files/{ref}/info/acl</code>:
      <ul>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>PUT /v2/files/{ref}/info/acl</code> request body</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>PUT /v2/files/{ref}/info/acl</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>GET /v2/nfs/exports/</code>:
      <ul>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>GET /v2/nfs/exports/</code> response</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>GET /v2/nfs/exports/</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>POST /v2/nfs/exports/</code>:
      <ul>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>POST /v2/nfs/exports/</code> request body</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>POST /v2/nfs/exports/</code> request body</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>POST /v2/nfs/exports/</code> response</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>POST /v2/nfs/exports/</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>GET /v2/nfs/exports/{ref}</code>:
      <ul>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>GET /v2/nfs/exports/{ref}</code> response</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>GET /v2/nfs/exports/{ref}</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>PATCH /v2/nfs/exports/{ref}</code>:
      <ul>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PATCH /v2/nfs/exports/{ref}</code> request body</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PATCH /v2/nfs/exports/{ref}</code> request body</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PATCH /v2/nfs/exports/{ref}</code> response</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PATCH /v2/nfs/exports/{ref}</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>PUT /v2/nfs/exports/{ref}</code>:
      <ul>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PUT /v2/nfs/exports/{ref}</code> request body</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PUT /v2/nfs/exports/{ref}</code> request body</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PUT /v2/nfs/exports/{ref}</code> response</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PUT /v2/nfs/exports/{ref}</code> response</li>
      </ul>
    </li>
    <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>GET /v2/smb/shares/</code> response</li>
    <li>
      Modified <code>POST /v2/smb/shares/</code>:
      <ul>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v2/smb/shares/</code> request body</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v2/smb/shares/</code> response</li>
      </ul>
    </li>
    <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>GET /v2/smb/shares/{ref}</code> response</li>
    <li>
      Modified <code>PATCH /v2/smb/shares/{ref}</code>:
      <ul>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>PATCH /v2/smb/shares/{ref}</code> request body</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>PATCH /v2/smb/shares/{ref}</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>PUT /v2/smb/shares/{ref}</code>:
      <ul>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>PUT /v2/smb/shares/{ref}</code> request body</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>PUT /v2/smb/shares/{ref}</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>GET /v3/nfs/exports/</code>:
      <ul>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>GET /v3/nfs/exports/</code> response</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>GET /v3/nfs/exports/</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>POST /v3/nfs/exports/</code>:
      <ul>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>POST /v3/nfs/exports/</code> request body</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>POST /v3/nfs/exports/</code> request body</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>POST /v3/nfs/exports/</code> response</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>POST /v3/nfs/exports/</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>GET /v3/nfs/exports/{export_id}</code>:
      <ul>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>GET /v3/nfs/exports/{export_id}</code> response</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>GET /v3/nfs/exports/{export_id}</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>PATCH /v3/nfs/exports/{export_id}</code>:
      <ul>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PATCH /v3/nfs/exports/{export_id}</code> request body</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PATCH /v3/nfs/exports/{export_id}</code> request body</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PATCH /v3/nfs/exports/{export_id}</code> response</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PATCH /v3/nfs/exports/{export_id}</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>PUT /v3/nfs/exports/{export_id}</code>:
      <ul>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PUT /v3/nfs/exports/{export_id}</code> request body</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PUT /v3/nfs/exports/{export_id}</code> request body</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PUT /v3/nfs/exports/{export_id}</code> response</li>
        <li>Added <code>QUMULO_SUPPORT</code> enum value to <code>id_type</code> field in <code>PUT /v3/nfs/exports/{export_id}</code> response</li>
      </ul>
    </li>
    <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>GET /v3/smb/shares/</code> response</li>
    <li>
      Modified <code>POST /v3/smb/shares/</code>:
      <ul>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v3/smb/shares/</code> request body</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>POST /v3/smb/shares/</code> response</li>
      </ul>
    </li>
    <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>GET /v3/smb/shares/{share_id}</code> response</li>
    <li>
      Modified <code>PATCH /v3/smb/shares/{share_id}</code>:
      <ul>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>PATCH /v3/smb/shares/{share_id}</code> request body</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>PATCH /v3/smb/shares/{share_id}</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>PUT /v3/smb/shares/{share_id}</code>:
      <ul>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>PUT /v3/smb/shares/{share_id}</code> request body</li>
        <li>Added <code>API_QUMULO_SUPPORT_DOMAIN</code> enum value to <code>domain</code> field in <code>PUT /v3/smb/shares/{share_id}</code> response</li>
      </ul>
    </li>
  </ul>
</details>


## 7.6 Releases

### Qumulo Core 7.6.4.1 
{{ nexusLink }}
{{ noAPIchanges }}

### Qumulo Core 7.6.3.1
{{ nexusLink }}
<ul>
  <li>Added <code>POST /v2/cluster/unprotected-edge/create</code> endpoint</li>
  <li>Added <code>domain_controllers</code> parameter to <code>POST /v1/ad/join</code> request body</li>
  <li>Added <code>domain_controllers</code> parameter to <code>POST /v1/ad/reconfigure</code> request body</li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>
      Modified <code>GET /v2/portal/hubs/</code>:
      <ul>
        <li>Added <code>spoke_hosts</code> parameter to <code>GET /v2/portal/hubs/</code> response</li>
        <li>Removed <code>spoke_host</code> parameter from <code>GET /v2/portal/hubs/</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>DELETE /v2/portal/hubs/{id}</code>:
      <ul>
        <li>Added <code>spoke_hosts</code> parameter to <code>DELETE /v2/portal/hubs/{id}</code> <code>202</code> response</li>
        <li>Removed <code>spoke_host</code> parameter from <code>DELETE /v2/portal/hubs/{id}</code> <code>202</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>GET /v2/portal/hubs/{id}</code>:
      <ul>
        <li>Added <code>spoke_hosts</code> parameter to <code>GET /v2/portal/hubs/{id}</code> response</li>
        <li>Removed <code>spoke_host</code> parameter from <code>GET /v2/portal/hubs/{id}</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>PATCH /v2/portal/hubs/{id}</code>:
      <ul>
        <li>Added <code>spoke_hosts</code> parameter to <code>PATCH /v2/portal/hubs/{id}</code> request body</li>
        <li>Removed <code>spoke_host</code> parameter from <code>PATCH /v2/portal/hubs/{id}</code> request body</li>
        <li>Added <code>spoke_hosts</code> parameter to <code>PATCH /v2/portal/hubs/{id}</code> response</li>
        <li>Removed <code>spoke_host</code> parameter from <code>PATCH /v2/portal/hubs/{id}</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>POST /v2/portal/hubs/{id}/accept</code>:
      <ul>
        <li>Added parameters to <code>POST /v2/portal/hubs/{id}/accept</code> request body:
          <ul>
            <li><code>authorized_roots</code></li>
            <li><code>spoke_hosts</code></li>
          </ul></li>
        <li>Removed parameters from <code>POST /v2/portal/hubs/{id}/accept</code> request body:
          <ul>
            <li><code>spoke_address</code></li>
            <li><code>spoke_port</code></li>
          </ul></li>
        <li>Added <code>spoke_hosts</code> parameter to <code>POST /v2/portal/hubs/{id}/accept</code> response</li>
        <li>Removed <code>spoke_host</code> parameter from <code>POST /v2/portal/hubs/{id}/accept</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>DELETE /v2/portal/hubs/{id}/roots/{dir}</code>:
      <ul>
        <li>Added <code>spoke_hosts</code> parameter to <code>DELETE /v2/portal/hubs/{id}/roots/{dir}</code> response</li>
        <li>Removed <code>spoke_host</code> parameter from <code>DELETE /v2/portal/hubs/{id}/roots/{dir}</code> response</li>
      </ul>
    </li>
    <li>
      Modified <code>POST /v2/portal/hubs/{id}/roots/{dir}</code>:
      <ul>
        <li>Added <code>spoke_hosts</code> parameter to <code>POST /v2/portal/hubs/{id}/roots/{dir}</code> response</li>
        <li>Removed <code>spoke_host</code> parameter from <code>POST /v2/portal/hubs/{id}/roots/{dir}</code> response</li>
      </ul>
    </li>
  </ul>
</details>

### Qumulo Core 7.6.2
{{ nexusLink }}
<ul>
  <li>Added <code>GET /v2/portal/hubs/</code> endpoint</li>
  <li>Added <code>DELETE | GET | PATCH /v2/portal/hubs/{id}</code> endpoint</li>
  <li>Added <code>POST /v2/portal/hubs/{id}/accept</code> endpoint</li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>Added <code>DELETE | POST /v2/portal/hubs/{id}/roots/{dir}</code> endpoint</li>
    <li>Added <code>GET | POST /v2/portal/spokes/</code> endpoint</li>
    <li>Added <code>DELETE | GET | PATCH /v2/portal/spokes/{id}</code> endpoint</li>
    <li>Added <code>POST /v2/portal/spokes/{id}/roots/</code> endpoint</li>
    <li>Added <code>DELETE /v2/portal/spokes/{id}/roots/{dir}</code> endpoint</li>
    <li>Added <code>include-incompatibles</code> parameter to <code>GET /v1/unconfigured/nodes/</code> parameters</li>
  </ul>
</details>

### Qumulo Core 7.6.1.1
{{ nexusLink }}
<ul>
  <li>Added <code>private</code> parameter to <code>POST /v1/s3/buckets/</code> request body</li>
  <li>Added <code>disk_info</code> parameter to <code>GET /v1/unconfigured/nodes/</code> response</li>
</ul>

### Qumulo Core 7.6.0.2 (Quarterly)
{{ nexusLink }}
Removed parameters from <code>POST /v1/smb/files/close</code> request body:
          <ul>
            <li><code>access_mask</code></li>
            <li><code>file_number</code></li>
            <li><code>num_byte_range_locks</code></li>
            <li><code>num_notify_watches</code></li>
            <li><code>owner</code></li>
            <li><code>path</code></li>
            <li><code>version</code></li>
          </ul>


## 7.5 Releases

### Qumulo Core 7.5.5.2
{{ nexusLink }}
<ul>
  <li>Added <code>configured_dcs</code> parameter to <code>POST /v1/ad/dismiss-error</code> response</li>
  <li>Added <code>configured_dcs</code> parameter to <code>GET /v1/ad/monitor</code> response</li>
</ul>

### Qumulo Core 7.5.4.2
{{ nexusLink }}
{{ noAPIchanges }}

### Qumulo Core 7.5.3
{{ nexusLink }}
{{ noAPIchanges }}

### Qumulo Core 7.5.2
{{ nexusLink }}
{{ noAPIchanges }}

### Qumulo Core 7.5.1.2
{{ nexusLink }}
<ul>
  <li>Added <code>GET | PUT /v3/network</code> endpoint</li>
  <li>Added <code>GET /v3/network/backend-interfaces</code> endpoint</li>
  <li>Added <code>GET /v3/network/frontend-interfaces</code> endpoint</li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>Added <code>GET /v3/network/status</code> endpoint</li>
    <li>Added <code>GET /v3/network/status/{node_id}</code> endpoint</li>
    <li>Added <code>PUT /v3/network/validate</code> endpoint</li>
  </ul>
</details>

### Qumulo Core 7.5.0.3 (Quarterly)
{{ nexusLink }}
{{ noAPIchanges }}
