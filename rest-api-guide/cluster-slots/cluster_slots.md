---
category: /Cluster Slots
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_disk_slot\",\n    \"type\": \"object\",\n    \"properties\": {\n     \
        \ \"id\": {\n        \"description\": \"Node:Slot representation identifying\
        \ the slot\",\n        \"type\": \"string\"\n      },\n      \"node_id\":\
        \ {\n        \"description\": \"Integer ID of the node containing the slot.\"\
        ,\n        \"type\": \"number\"\n      },\n      \"slot\": {\n        \"description\"\
        : \"Integer ID of slot on the given node\",\n        \"type\": \"number\"\n\
        \      },\n      \"state\": {\n        \"type\": \"string\",\n        \"enum\"\
        : [\n          \"empty\",\n          \"healthy\",\n          \"missing\",\n\
        \          \"dead\",\n          \"wrong_node\",\n          \"wrong_cluster\"\
        ,\n          \"wrong_version\"\n        ],\n        \"description\": \"Disk\
        \ slot state (healthy, dead, empty):\\n * `dead` - API_DEVICE_UI_STATE_DEAD,\\\
        n * `empty` - API_DEVICE_UI_STATE_EMPTY,\\n * `healthy` - API_DEVICE_UI_STATE_HEALTHY,\\\
        n * `missing` - API_DEVICE_UI_STATE_MISSING,\\n * `wrong_cluster` - API_DEVICE_UI_STATE_WRONG_CLUSTER,\\\
        n * `wrong_node` - API_DEVICE_UI_STATE_WRONG_NODE,\\n * `wrong_version` -\
        \ API_DEVICE_UI_STATE_WRONG_VERSION\"\n      },\n      \"slot_type\": {\n\
        \        \"type\": \"string\",\n        \"enum\": [\n          \"SSD\",\n\
        \          \"HDD\",\n          \"Premium Page Blob\",\n          \"Standard\
        \ Page Blob\",\n          \"Ephemeral SSD\",\n          \"Write Tier SSD\"\
        \n        ],\n        \"description\": \"Device type for slot (SSD, HDD):\\\
        n * `Ephemeral SSD` - API_DEVICE_SLOT_TYPE_EPHEMERAL_SSD,\\n * `HDD` - API_DEVICE_SLOT_TYPE_SPINNING_DISK,\\\
        n * `Premium Page Blob` - API_DEVICE_SLOT_TYPE_PREMIUM_PAGE_BLOB,\\n * `SSD`\
        \ - API_DEVICE_SLOT_TYPE_SSD,\\n * `Standard Page Blob` - API_DEVICE_SLOT_TYPE_STANDARD_PAGE_BLOB,\\\
        n * `Write Tier SSD` - API_DEVICE_SLOT_TYPE_WRITE_TIER_SSD\"\n      },\n \
        \     \"disk_type\": {\n        \"type\": \"string\",\n        \"enum\": [\n\
        \          \"\",\n          \"DEVICE_MEDIA_TYPE_UNKNOWN\",\n          \"SSD\"\
        ,\n          \"HDD\",\n          \"Premium Page Blob\",\n          \"Standard\
        \ Page Blob\",\n          \"Ephemeral SSD\",\n          \"Write Tier SSD\"\
        \n        ],\n        \"description\": \"Type of disk, if present (SSD, HDD):\\\
        n * `` - API_DEVICE_MEDIA_TYPE_MISSING,\\n * `DEVICE_MEDIA_TYPE_UNKNOWN` -\
        \ API_DEVICE_MEDIA_TYPE_UNKNOWN,\\n * `Ephemeral SSD` - API_DEVICE_MEDIA_TYPE_EPHEMERAL_SSD,\\\
        n * `HDD` - API_DEVICE_MEDIA_TYPE_SPINNING_DISK,\\n * `Premium Page Blob`\
        \ - API_DEVICE_MEDIA_TYPE_PREMIUM_PAGE_BLOB,\\n * `SSD` - API_DEVICE_MEDIA_TYPE_SSD,\\\
        n * `Standard Page Blob` - API_DEVICE_MEDIA_TYPE_STANDARD_PAGE_BLOB,\\n *\
        \ `Write Tier SSD` - API_DEVICE_MEDIA_TYPE_WRITE_TIER_SSD\"\n      },\n  \
        \    \"disk_model\": {\n        \"description\": \"Disk model (empty if no\
        \ disk)\",\n        \"type\": \"string\"\n      },\n      \"disk_serial_number\"\
        : {\n        \"description\": \"Serial number of this disk (empty if no disk)\"\
        ,\n        \"type\": \"string\"\n      },\n      \"capacity\": {\n       \
        \ \"description\": \"Capacity in bytes (0 if slot is empty)\",\n        \"\
        type\": \"string\"\n      },\n      \"raw_capacity\": {\n        \"description\"\
        : \"Raw capacity in bytes (0 if slot is empty)\",\n        \"type\": \"string\"\
        \n      },\n      \"minimum_raw_capacity\": {\n        \"description\": \"\
        Minimum raw capacity in bytes for slot\",\n        \"type\": \"string\"\n\
        \      },\n      \"high_endurance\": {\n        \"description\": \"Is this\
        \ device a high endurance model\",\n        \"type\": \"boolean\"\n      },\n\
        \      \"drive_bay\": {\n        \"description\": \"Drive bay label\",\n \
        \       \"type\": \"string\"\n      },\n      \"led_pattern\": {\n       \
        \ \"type\": \"string\",\n        \"enum\": [\n          \"LED_PATTERN_NORMAL\"\
        ,\n          \"LED_PATTERN_LOCATE\",\n          \"LED_PATTERN_FAILURE\"\n\
        \        ],\n        \"description\": \"Current state of the slot's LED:\\\
        n * `LED_PATTERN_FAILURE` - failure,\\n * `LED_PATTERN_LOCATE` - locate,\\\
        n * `LED_PATTERN_NORMAL` - normal\"\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: List slots.
rest_endpoint: /v1/cluster/slots/
api_version: v1
permalink: /rest-api-guide/cluster-slots/cluster_slots.html
sidebar: rest_api_guide_sidebar
---
