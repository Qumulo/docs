---
category: /Cloud Data Fabric V2
methods:
  post:
    summary: '[preview] Create a spoke portal in the current cluster and propose a
      relationship between this spoke portal and a hub portal on another cluster.'
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"v2_portal_spoke\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Spoke portal\
        \ ID\",\n      \"type\": \"number\"\n    },\n    \"type\": {\n      \"type\"\
        : \"string\",\n      \"enum\": [\n        \"PORTAL_READ_ONLY\",\n        \"\
        PORTAL_READ_WRITE\"\n      ],\n      \"description\": \"Type of the spoke\
        \ portal (read-only or read-write):\\n * `PORTAL_READ_ONLY` - PORTAL_READ_ONLY,\\\
        n * `PORTAL_READ_WRITE` - PORTAL_READ_WRITE\"\n    },\n    \"state\": {\n\
        \      \"type\": \"string\",\n      \"enum\": [\n        \"PENDING\",\n  \
        \      \"ACCEPTED\",\n        \"DELETING\"\n      ],\n      \"description\"\
        : \"State of the spoke portal:\\n * `ACCEPTED` - A portal that is in an active\
        \ relationship.,\\n * `DELETING` - A portal in the process of synchronizing\
        \ outstanding changes before deletion.,\\n * `PENDING` - A portal not yet\
        \ in an active relationship.\"\n    },\n    \"status\": {\n      \"type\"\
        : \"string\",\n      \"enum\": [\n        \"INACTIVE\",\n        \"ACTIVE\"\
        ,\n        \"DEGRADED\"\n      ],\n      \"description\": \"Status of the\
        \ portal:\\n * `ACTIVE` - A fully connected portal ready for use.,\\n * `DEGRADED`\
        \ - A portal missing one or more connections with the other cluster in the\
        \ relationship.,\\n * `INACTIVE` - A portal that is not ready for use.\"\n\
        \    },\n    \"hub_hosts\": {\n      \"type\": \"array\",\n      \"items\"\
        : {\n        \"description\": \"IP addresses and TCP ports of nodes in the\
        \ remote cluster\",\n        \"type\": \"object\",\n        \"properties\"\
        : {\n          \"address\": {\n            \"description\": \"address\",\n\
        \            \"type\": \"string\"\n          },\n          \"port\": {\n \
        \           \"description\": \"port\",\n            \"type\": \"number\"\n\
        \          }\n        }\n      }\n    },\n    \"hub_id\": {\n      \"description\"\
        : \"Corresponding remote hub portal ID\",\n      \"type\": \"number\"\n  \
        \  },\n    \"hub_cluster_uuid\": {\n      \"description\": \"UUID of the cluster\
        \ with the hub portal\",\n      \"type\": \"string\"\n    },\n    \"roots\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"description\"\
        : \"Map of spoke root directories to hub root directories\",\n        \"type\"\
        : \"object\",\n        \"properties\": {\n          \"local_root\": {\n  \
        \          \"description\": \"Local spoke root directory file ID\",\n    \
        \        \"type\": \"string\"\n          },\n          \"remote_root\": {\n\
        \            \"description\": \"Remote hub root directory file ID\",\n   \
        \         \"type\": \"string\"\n          },\n          \"authorized\": {\n\
        \            \"description\": \"Whether the spoke portal is authorized to\
        \ access the remote root\",\n            \"type\": \"boolean\"\n         \
        \ }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: true
    request_body:
      schema: "{\n  \"description\": \"v2_portal_create_request\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"type\": {\n      \"type\": \"string\"\
        ,\n      \"enum\": [\n        \"PORTAL_READ_ONLY\",\n        \"PORTAL_READ_WRITE\"\
        \n      ],\n      \"description\": \"Whether to create a read-only or read-write\
        \ spoke portal:\\n * `PORTAL_READ_ONLY` - PORTAL_READ_ONLY,\\n * `PORTAL_READ_WRITE`\
        \ - PORTAL_READ_WRITE\"\n    },\n    \"hub_hosts\": {\n      \"type\": \"\
        array\",\n      \"items\": {\n        \"description\": \"IP addresses and\
        \ TCP ports of nodes in the remote cluster\",\n        \"type\": \"object\"\
        ,\n        \"properties\": {\n          \"address\": {\n            \"description\"\
        : \"address\",\n            \"type\": \"string\"\n          },\n         \
        \ \"port\": {\n            \"description\": \"port\",\n            \"type\"\
        : \"number\"\n          }\n        }\n      }\n    }\n  }\n}"
  get:
    summary: '[preview] List the relationship status and configuration for all spoke
      portals on the current cluster.'
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"v2_portal_spokes\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"entries\": {\n      \"type\": \"array\",\n \
        \     \"items\": {\n        \"description\": \"List of spoke portals\",\n\
        \        \"type\": \"object\",\n        \"properties\": {\n          \"id\"\
        : {\n            \"description\": \"Spoke portal ID\",\n            \"type\"\
        : \"number\"\n          },\n          \"type\": {\n            \"type\": \"\
        string\",\n            \"enum\": [\n              \"PORTAL_READ_ONLY\",\n\
        \              \"PORTAL_READ_WRITE\"\n            ],\n            \"description\"\
        : \"Type of the spoke portal (read-only or read-write):\\n * `PORTAL_READ_ONLY`\
        \ - PORTAL_READ_ONLY,\\n * `PORTAL_READ_WRITE` - PORTAL_READ_WRITE\"\n   \
        \       },\n          \"state\": {\n            \"type\": \"string\",\n  \
        \          \"enum\": [\n              \"PENDING\",\n              \"ACCEPTED\"\
        ,\n              \"DELETING\"\n            ],\n            \"description\"\
        : \"State of the spoke portal:\\n * `ACCEPTED` - A portal that is in an active\
        \ relationship.,\\n * `DELETING` - A portal in the process of synchronizing\
        \ outstanding changes before deletion.,\\n * `PENDING` - A portal not yet\
        \ in an active relationship.\"\n          },\n          \"status\": {\n  \
        \          \"type\": \"string\",\n            \"enum\": [\n              \"\
        INACTIVE\",\n              \"ACTIVE\",\n              \"DEGRADED\"\n     \
        \       ],\n            \"description\": \"Status of the portal:\\n * `ACTIVE`\
        \ - A fully connected portal ready for use.,\\n * `DEGRADED` - A portal missing\
        \ one or more connections with the other cluster in the relationship.,\\n\
        \ * `INACTIVE` - A portal that is not ready for use.\"\n          },\n   \
        \       \"hub_hosts\": {\n            \"type\": \"array\",\n            \"\
        items\": {\n              \"description\": \"IP addresses and TCP ports of\
        \ nodes in the remote cluster\",\n              \"type\": \"object\",\n  \
        \            \"properties\": {\n                \"address\": {\n         \
        \         \"description\": \"address\",\n                  \"type\": \"string\"\
        \n                },\n                \"port\": {\n                  \"description\"\
        : \"port\",\n                  \"type\": \"number\"\n                }\n \
        \             }\n            }\n          },\n          \"hub_id\": {\n  \
        \          \"description\": \"Corresponding remote hub portal ID\",\n    \
        \        \"type\": \"number\"\n          },\n          \"hub_cluster_uuid\"\
        : {\n            \"description\": \"UUID of the cluster with the hub portal\"\
        ,\n            \"type\": \"string\"\n          },\n          \"roots\": {\n\
        \            \"type\": \"array\",\n            \"items\": {\n            \
        \  \"description\": \"Map of spoke root directories to hub root directories\"\
        ,\n              \"type\": \"object\",\n              \"properties\": {\n\
        \                \"local_root\": {\n                  \"description\": \"\
        Local spoke root directory file ID\",\n                  \"type\": \"string\"\
        \n                },\n                \"remote_root\": {\n               \
        \   \"description\": \"Remote hub root directory file ID\",\n            \
        \      \"type\": \"string\"\n                },\n                \"authorized\"\
        : {\n                  \"description\": \"Whether the spoke portal is authorized\
        \ to access the remote root\",\n                  \"type\": \"boolean\"\n\
        \                }\n              }\n            }\n          }\n        }\n\
        \      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: true
rest_endpoint: /v2/portal/spokes/
api_version: v2
permalink: /rest-api-guide/cloud-data-fabric-v2/v2_portal_spokes.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/cloud-data-fabric/v2_portal_spokes.html
deprecated: false
---
