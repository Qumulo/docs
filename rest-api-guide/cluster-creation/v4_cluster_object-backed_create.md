---
category: /Cluster Creation
methods:
  post:
    parameters: []
    request_body:
      schema: "{\n  \"description\": \"api_cluster_creation_object_backed_request_v4\"\
        ,\n  \"type\": \"object\",\n  \"properties\": {\n    \"eula_accepted\": {\n\
        \      \"description\": \"User accepts the End User License Agreement\",\n\
        \      \"type\": \"boolean\"\n    },\n    \"cluster_name\": {\n      \"description\"\
        : \"Name of the cluster\",\n      \"type\": \"string\"\n    },\n    \"node_ips_and_fault_domains\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"description\"\
        : \"List of node IP and their respective fault domains to form a cluster with\"\
        ,\n        \"type\": \"object\",\n        \"properties\": {\n          \"\
        node_ip\": {\n            \"description\": \"node_ip\",\n            \"type\"\
        : \"string\"\n          },\n          \"fault_domain_id\": {\n           \
        \ \"description\": \"fault_domain_id\",\n            \"type\": \"number\"\n\
        \          }\n        }\n      }\n    },\n    \"admin_password\": {\n    \
        \  \"description\": \"The administrator password\",\n      \"type\": \"string\"\
        ,\n      \"format\": \"password\"\n    },\n    \"host_instance_id\": {\n \
        \     \"description\": \"EC2 instance ID for the node handling this request\"\
        ,\n      \"type\": \"string\"\n    },\n    \"azure_key_vault\": {\n      \"\
        description\": \"The key vault for accessing Azure blobs (only used on Azure\
        \ clusters).\",\n      \"type\": \"string\"\n    },\n    \"object_storage_uris\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"description\"\
        : \"The URI to the object storage that backs the Object Tier for the cluster\"\
        ,\n        \"type\": \"string\"\n      }\n    },\n    \"usable_capacity_clamp\"\
        : {\n      \"description\": \"Usable capacity, in bytes, to clamp the file\
        \ system to\",\n      \"type\": \"string\"\n    },\n    \"product_type\":\
        \ {\n      \"type\": \"string\",\n      \"enum\": [\n        \"ACTIVE_WITH_STANDARD_STORAGE\"\
        ,\n        \"ACTIVE_WITH_INTELLIGENT_STORAGE\",\n        \"ACTIVE_WITH_HOT_STORAGE\"\
        ,\n        \"ARCHIVE_WITH_IA_STORAGE\",\n        \"ARCHIVE_WITH_GIR_STORAGE\"\
        ,\n        \"ARCHIVE_WITH_COLD_STORAGE\"\n      ],\n      \"description\"\
        : \"The product type of cluster to create. Valid options for AWS clusters\
        \ are:ACTIVE_WITH_STANDARD_STORAGE, ACTIVE_WITH_INTELLIGENT_STORAGE, ARCHIVE_WITH_IA_STORAGE,\
        \ ARCHIVE_WITH_GIR_STORAGE. Valid options for Azureclusters are: ACTIVE_WITH_HOT_STORAGE,\
        \ ARCHIVE_WITH_COLD_STORAGE.:\\n * `ACTIVE_WITH_HOT_STORAGE` - ACTIVE_WITH_HOT_STORAGE,\\\
        n * `ACTIVE_WITH_INTELLIGENT_STORAGE` - ACTIVE_WITH_INTELLIGENT_STORAGE,\\\
        n * `ACTIVE_WITH_STANDARD_STORAGE` - ACTIVE_WITH_STANDARD_STORAGE,\\n * `ARCHIVE_WITH_COLD_STORAGE`\
        \ - ARCHIVE_WITH_COLD_STORAGE,\\n * `ARCHIVE_WITH_GIR_STORAGE` - ARCHIVE_WITH_GIR_STORAGE,\\\
        n * `ARCHIVE_WITH_IA_STORAGE` - ARCHIVE_WITH_IA_STORAGE\"\n    },\n    \"\
        pbkdf2_admin_hash\": {\n      \"description\": \"The PBKDF2 has parameters\
        \ for the administrative user: a hexadecimal hash, a hexadecimal salt, and\
        \ the number of iterations. It is possible to use these parameters for administrative\
        \ password or a different password.\",\n      \"type\": \"object\",\n    \
        \  \"properties\": {\n        \"hash\": {\n          \"type\": \"array\",\n\
        \          \"items\": {\n            \"description\": \"hash\",\n        \
        \    \"type\": \"number\"\n          }\n        },\n        \"salt\": {\n\
        \          \"type\": \"array\",\n          \"items\": {\n            \"description\"\
        : \"salt\",\n            \"type\": \"number\"\n          }\n        },\n \
        \       \"num_iterations\": {\n          \"description\": \"num_iterations\"\
        ,\n          \"type\": \"number\"\n        }\n      }\n    },\n    \"operator_public_keys\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"description\"\
        : \"The set of public keys allowed to sign operator bearer tokens\",\n   \
        \     \"type\": \"object\",\n        \"properties\": {\n          \"data\"\
        : {\n            \"type\": \"array\",\n            \"items\": {\n        \
        \      \"description\": \"data\",\n              \"type\": \"number\"\n  \
        \          }\n          }\n        }\n      }\n    }\n  }\n}"
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
    summary: Form an object backed cluster with the given set of node IPs, fault domain
      IDs, object storage URIs and admin password.
rest_endpoint: /v4/cluster/object-backed/create
api_version: v4
permalink: /rest-api-guide/cluster-creation/v4_cluster_object-backed_create.html
sidebar: rest_api_guide_sidebar
---
