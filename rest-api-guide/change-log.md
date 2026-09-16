---
title: "Qumulo REST API Change Log"
summary: "This section lists the REST API changes for each release of Qumulo Core."
permalink: /rest-api-guide/change-log.html
sidebar: rest_api_guide_sidebar
layout: page
---

{% capture noAPIchanges %}This release contains no REST API changes.{% endcapture %}

<style>div#toc{height:200px;overflow:auto;}</style>


## Qumulo Core 7.10.0
{{ nexusLink }}
<ul>
  <li>Added <code>POST /v1/files/try-resolve</code></li>
  <li>Added <code>portal_cache_size_bytes</code> parameter to <code>GET /v1/file-system</code> response</li>
</ul>


## Qumulo Core 7.9.3.1
{{ nexusLink }}
{{ noAPIchanges }}


## Qumulo Core 7.9.2.3
{{ nexusLink }}
<ul>
  <li>Removed <code>/v1/portal/hubs/</code></li>
  <li>Removed <code>/v1/portal/hubs/{id}</code></li>
  <li>Removed <code>/v1/portal/hubs/{id}/authorize</code></li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>Removed <code>/v1/portal/spokes/</code></li>
    <li>Removed <code>/v1/portal/spokes/{id}</code></li>
    <li>Removed <code>/v1/portal/spokes/{id}/propose</code></li>
    <li>Added <code>GET /v1/portal/quorum/events</code></li>
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


## Qumulo Core 7.9.1.2
{{ nexusLink }}
<ul>
  <li>Removed <code>/v1/portal/quorum/events</code></li>
  <li>Added <code>lock</code> parameter to <code>PATCH /v1/files/{ref}/info/attributes</code> response</li>
</ul>


## Qumulo Core 7.9.0.3
{{ nexusLink }}
<ul>
  <li>Removed <code>/v1/snapshots/calculate-used-capacity</code></li>
  <li>Removed <code>/v1/snapshots/capacity-used-per-snapshot/</code></li>
  <li>Removed <code>/v1/snapshots/capacity-used-per-snapshot/{id}</code></li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>Added <code>GET /v1/portal/quorum/events</code></li>
    <li>Added <code>GET | POST /v2/audit/destinations/</code></li>
    <li>Added <code>DELETE | GET | PATCH | PUT /v2/audit/destinations/{id}</code></li>
    <li>Added <code>GET /v2/audit/destinations/{id}/status</code></li>
    <li>Added <code>GET /v3/snapshots/{newer_id}/changes-since/{older_id}/files/{ref}</code></li>
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
        <li>Added <code>file_acls</code> parameter to <code>GET /v1/files/{ref}/entries/</code> response</li>
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


## Qumulo Core 7.8.4.3
{{ nexusLink }}
<ul>
  <li>Added <code>GET /v2/time/default-settings</code></li>
  <li>Added <code>GET | PATCH | PUT /v2/time/settings</code></li>
  <li>Added <code>GET /v2/time/status</code></li>
  <li>Added <code>GET /v2/time/timezones</code></li>
</ul>


## Qumulo Core 7.8.3.1
{{ nexusLink }}
<ul>
  <li>Added <code>POST /v1/files/{ref}/fetch-data</code></li>
  <li>Added <code>POST /v1/shutdown/container-restart</code></li>
</ul>


## Qumulo Core 7.8.2.1
{{ nexusLink }}
{{ noAPIchanges }}


## Qumulo Core 7.8.1.1
{{ nexusLink }}
{{ noAPIchanges }}


## Qumulo Core 7.8.0.4 (Quarterly)
{{ nexusLink }}
<ul>
  <li>Added <code>GET | PATCH /v1/authoritative-dns/settings</code></li>
  <li>Added <code>POST /v2/object-storage/add-uris</code></li>
  <li>Added <code>POST /v5/cluster/object-backed/create-stratus</code></li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>Added <code>node_statuses</code> parameter to <code>GET /v1/audit/cloudwatch/status</code> response</li>
    <li>Added <code>members</code> parameter to <code>GET /v1/auth/roles/{role_name}/members</code> response</li>
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


## Qumulo Core 7.7.5.1
{{ nexusLink }}
Added <code>GET /v1/object-storage/external-credentials-source</code>


## Qumulo Core 7.7.4.1
{{ nexusLink }}
<ul>
  <li>Added <code>POST /v1/portal/ping</code></li>
  <li>Added <code>idmap_domain</code> parameter to <code>GET /v1/multitenancy/nfs/global-settings</code> response</li>
  <li>
    Modified <code>PATCH /v1/multitenancy/nfs/global-settings</code>:
      <ul>
        <li>Added <code>idmap_domain</code> parameter to <code>PATCH /v1/multitenancy/nfs/global-settings</code> request body</li>
        <li>Added <code>idmap_domain</code> parameter to <code>PATCH /v1/multitenancy/nfs/global-settings</code> response</li>
      </ul>
  </li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
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


## Qumulo Core 7.7.3
{{ nexusLink }}
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


## Qumulo Core 7.7.2
{{ nexusLink }}
Added <code>POST /v2/cluster/data-core/create</code>


## Qumulo Core 7.7.1.1
{{ nexusLink }}
<ul>
  <li>Added <code>GET | PATCH | PUT /v1/nexus/connection</code></li>
  <li>Added <code>DELETE | GET | PUT /v1/nexus/registration</code></li>
  <li>Added <code>POST /v1/nexus/registration/rotate</code></li>
</ul>


## Qumulo Core 7.7.0.3 (Quarterly)
{{ nexusLink }}
<ul>
  <li>
    Added parameters to <code>GET /v1/support/settings</code> response:
          <ul>
            <li><code>nexus_registration_key</code></li>
            <li><code>nexus_secret_created_at</code></li>
          </ul>
  </li>
  <li>Added <code>nexus_registration_key</code> parameter to <code>PATCH /v1/support/settings</code> request body</li>
  <li>Added <code>nexus_registration_key</code> parameter to <code>PUT /v1/support/settings</code> request body</li>
</ul>


## Qumulo Core 7.6.4.1 
{{ nexusLink }}
{{ noAPIchanges }}


## Qumulo Core 7.6.3.1
{{ nexusLink }}
<ul>
  <li>Added <code>POST /v2/cluster/unprotected-edge/create</code></li>
  <li>Added <code>domain_controllers</code> parameter to <code>POST /v1/ad/join</code> request body</li>
  <li>Added <code>domain_controllers</code> parameter to <code>POST /v1/ad/reconfigure</code> request body</li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
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


## Qumulo Core 7.6.2
{{ nexusLink }}
<ul>
  <li>Added <code>GET /v2/portal/hubs/</code></li>
  <li>Added <code>DELETE | GET | PATCH /v2/portal/hubs/{id}</code></li>
  <li>Added <code>POST /v2/portal/hubs/{id}/accept</code></li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>Added <code>DELETE | POST /v2/portal/hubs/{id}/roots/{dir}</code></li>
    <li>Added <code>GET | POST /v2/portal/spokes/</code></li>
    <li>Added <code>DELETE | GET | PATCH /v2/portal/spokes/{id}</code></li>
    <li>Added <code>POST /v2/portal/spokes/{id}/roots/</code></li>
    <li>Added <code>DELETE /v2/portal/spokes/{id}/roots/{dir}</code></li>
    <li>Added <code>include-incompatibles</code> parameter to <code>GET /v1/unconfigured/nodes/</code> parameters</li>
  </ul>
</details>


## Qumulo Core 7.6.1.1
{{ nexusLink }}
Added <code>private</code> parameter to <code>POST /v1/s3/buckets/</code> request body


## Qumulo Core 7.6.0.2 (Quarterly)
{{ nexusLink }}
{{ noAPIchanges }}


## Qumulo Core 7.5.5.2
{{ nexusLink }}
<ul>
  <li>Added <code>configured_dcs</code> parameter to <code>POST /v1/ad/dismiss-error</code> response</li>
  <li>Added <code>configured_dcs</code> parameter to <code>GET /v1/ad/monitor</code> response</li>
</ul>


## Qumulo Core 7.5.4.2
{{ nexusLink }}
{{ noAPIchanges }}


## Qumulo Core 7.5.3
{{ nexusLink }}
{{ noAPIchanges }}


## Qumulo Core 7.5.2
{{ nexusLink }}
{{ noAPIchanges }}


## Qumulo Core 7.5.1.2
{{ nexusLink }}
<ul>
  <li>Added <code>GET | PUT /v3/network</code></li>
  <li>Added <code>GET /v3/network/backend-interfaces</code></li>
  <li>Added <code>GET /v3/network/frontend-interfaces</code></li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>Added <code>GET /v3/network/status</code></li>
    <li>Added <code>GET /v3/network/status/{node_id}</code></li>
    <li>Added <code>PUT /v3/network/validate</code></li>
  </ul>
</details>


## Qumulo Core 7.5.0.3 (Quarterly)
{{ nexusLink }}
{{ noAPIchanges }}


## Qumulo Core 7.4.4
{{ nexusLink }}
Added <code>GET /v1/health/ssd-endurance</code>


## Qumulo Core 7.4.3.1
{{ nexusLink }}
Added <code>POST /v5/cluster/object-backed/create</code>


## Qumulo Core 7.4.2.1
{{ nexusLink }}
<ul>
  <li>Added <code>DELETE /v1/files/{ref}/entries/{name}</code></li>
  <li>Added <code>force</code> parameter to <code>DELETE /v1/portal/hubs/{id}</code> parameters</li>
  <li>Added <code>status</code> parameter to <code>GET /v1/portal/hubs/{id}</code> response</li>
</ul>
<details>
  <summary>Click to expand</summary>
  <ul>
    <li>
      Modified <code>PATCH /v1/portal/hubs/{id}</code>:
      <ul>
        <li>Added <code>status</code> parameter to <code>PATCH /v1/portal/hubs/{id}</code> request body</li>
        <li>Added <code>status</code> parameter to <code>PATCH /v1/portal/hubs/{id}</code> response</li>
      </ul>
    </li>
    <li>Added <code>status</code> parameter to <code>POST /v1/portal/hubs/{id}/authorize</code> response</li>
    <li>Added <code>force</code> parameter to <code>DELETE /v1/portal/spokes/{id}</code> parameters</li>
    <li>Added <code>status</code> parameter to <code>GET /v1/portal/spokes/{id}</code> response</li>
    <li>
      Modified <code>PATCH /v1/portal/spokes/{id}</code>:
      <ul>
        <li>Added <code>status</code> parameter to <code>PATCH /v1/portal/spokes/{id}</code> request body</li>
        <li>Added <code>status</code> parameter to <code>PATCH /v1/portal/spokes/{id}</code> response</li>
      </ul>
    </li>
    <li>Added <code>status</code> parameter to <code>POST /v1/portal/spokes/{id}/propose</code> response</li>
  </ul>
</details>


## Qumulo Core 7.4.1.1
{{ nexusLink }}
<ul>
  <li>Removed <code>/v1/portal/spokes/{id}/evict-data</code></li>
  <li>Removed <code>/v1/portal/spokes/{id}/evict-link</code></li>
  <li>Removed <code>/v1/portal/spokes/{id}/evict-tree</code></li>
  <li>Added <code>GET /v1/cluster/slots/node/{node_id}</code></li>
</ul>


## Qumulo Core 7.4.0.4 (Quarterly)
{{ nexusLink }}
{{ noAPIchanges }}
