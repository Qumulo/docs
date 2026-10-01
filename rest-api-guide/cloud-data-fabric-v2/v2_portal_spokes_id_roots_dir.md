---
category: /Cloud Data Fabric V2
methods:
  delete:
    summary: Delete the specified spoke root directory for the specified spoke portal.
      This action does not affect the data in the hub root directory. Requires connectivity
      with the hub portal host cluster.
    parameters:
    - name: id
      description: Portal ID
      required: true
    - name: dir
      description: Directory ID
      required: true
    response_body:
      schema: "{\n  \"description\": \"v2_portal_spoke\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Spoke portal\
        \ ID\",\n      \"type\": \"number\"\n    },\n    \"type\": {\n      \"type\"\
        : \"string\",\n      \"enum\": [\n        \"PORTAL_READ_ONLY\",\n        \"\
        PORTAL_READ_WRITE\",\n        \"PORTAL_PAUSED\",\n        \"PORTAL_SUSPENDED\"\
        \n      ],\n      \"description\": \"Type of the spoke portal (read-only or\
        \ read-write):\\n * `PORTAL_PAUSED` - PORTAL_PAUSED,\\n * `PORTAL_READ_ONLY`\
        \ - PORTAL_READ_ONLY,\\n * `PORTAL_READ_WRITE` - PORTAL_READ_WRITE,\\n * `PORTAL_SUSPENDED`\
        \ - PORTAL_SUSPENDED\"\n    },\n    \"state\": {\n      \"type\": \"string\"\
        ,\n      \"enum\": [\n        \"PENDING\",\n        \"ACCEPTED\",\n      \
        \  \"QUIESCING\",\n        \"PAUSING\",\n        \"DELETING\"\n      ],\n\
        \      \"description\": \"State of the spoke portal:\\n * `ACCEPTED` - A portal\
        \ that is in an active relationship.,\\n * `DELETING` - A portal in the process\
        \ of synchronizing outstanding changes before deletion.,\\n * `PAUSING` -\
        \ A portal closing spoke client state and synchronizing outstanding changes\
        \ before it becomes paused.,\\n * `PENDING` - A portal not yet in an active\
        \ relationship.,\\n * `QUIESCING` - A portal synchronizing outstanding changes\
        \ before it becomes read-only.\"\n    },\n    \"status\": {\n      \"type\"\
        : \"string\",\n      \"enum\": [\n        \"INACTIVE\",\n        \"ACTIVE\"\
        ,\n        \"DEGRADED\",\n        \"DISCONNECTED\"\n      ],\n      \"description\"\
        : \"Status of the portal:\\n * `ACTIVE` - A fully connected portal ready for\
        \ use.,\\n * `DEGRADED` - A portal whose quorum is missing a cluster other\
        \ than this relationship's peer.,\\n * `DISCONNECTED` - A portal whose quorum\
        \ is missing this relationship's own peer.,\\n * `INACTIVE` - A portal that\
        \ is not ready for use.\"\n    },\n    \"hub_hosts\": {\n      \"type\": \"\
        array\",\n      \"items\": {\n        \"description\": \"IP addresses and\
        \ TCP ports of nodes in the remote cluster\",\n        \"type\": \"object\"\
        ,\n        \"properties\": {\n          \"address\": {\n            \"description\"\
        : \"address\",\n            \"type\": \"string\"\n          },\n         \
        \ \"port\": {\n            \"description\": \"port\",\n            \"type\"\
        : \"number\"\n          }\n        }\n      }\n    },\n    \"hub_id\": {\n\
        \      \"description\": \"Corresponding remote hub portal ID\",\n      \"\
        type\": \"number\"\n    },\n    \"hub_cluster_uuid\": {\n      \"description\"\
        : \"UUID of the cluster with the hub portal\",\n      \"type\": \"string\"\
        \n    },\n    \"hub_cluster_name\": {\n      \"description\": \"Name of the\
        \ cluster with the hub portal\",\n      \"type\": \"string\"\n    },\n   \
        \ \"filesystem_uuid\": {\n      \"description\": \"UUID of the filesystem\
        \ caching data from the hub portal\",\n      \"type\": \"string\"\n    },\n\
        \    \"roots\": {\n      \"type\": \"array\",\n      \"items\": {\n      \
        \  \"description\": \"Map of spoke root directories to hub root directories\"\
        ,\n        \"type\": \"object\",\n        \"properties\": {\n          \"\
        local_root\": {\n            \"description\": \"Local spoke root directory\
        \ file ID\",\n            \"type\": \"string\"\n          },\n          \"\
        remote_root\": {\n            \"description\": \"Remote hub root directory\
        \ file ID\",\n            \"type\": \"string\"\n          },\n          \"\
        authorized\": {\n            \"description\": \"Whether the spoke portal is\
        \ authorized to access the remote root\",\n            \"type\": \"boolean\"\
        \n          }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v2/portal/spokes/{id}/roots/{dir}
api_version: v2
permalink: /rest-api-guide/cloud-data-fabric-v2/v2_portal_spokes_id_roots_dir.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/cloud-data-fabric/v2_portal_spokes_id_roots_dir.html
deprecated: false
---
