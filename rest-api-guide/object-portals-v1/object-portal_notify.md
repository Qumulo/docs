---
category: /Object Portals V1
methods:
  post:
    summary: '[preview] Inject a bridge notification for the given bucket and key
      into the notification routing pipeline. A bucket no bridge serves is counted
      undeliverable and answers HTTP 200.'
    parameters: []
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: true
    request_body:
      schema: "{\n  \"description\": \"api_bridge_notify_request\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"bucket_uri\": {\n      \"description\"\
        : \"Bucket URI as it appears in the bridge's configuration\",\n      \"type\"\
        : \"string\"\n    },\n    \"key\": {\n      \"description\": \"Object key\
        \ within the bucket\",\n      \"type\": \"string\"\n    },\n    \"etag\":\
        \ {\n      \"description\": \"Etag of the object as reported by the cloud\
        \ event payload, when present\",\n      \"type\": \"string\"\n    },\n   \
        \ \"version_id\": {\n      \"description\": \"Version id of the object as\
        \ reported by the cloud event payload, when present\",\n      \"type\": \"\
        string\"\n    },\n    \"sequencer\": {\n      \"description\": \"Provider\
        \ ordering token for events on this key. An event whose sequencer orders at\
        \ or below the one stored on the file drops as stale.\",\n      \"type\":\
        \ \"string\"\n    },\n    \"event_type\": {\n      \"type\": \"string\",\n\
        \      \"enum\": [\n        \"CREATED\",\n        \"DELETED\",\n        \"\
        STORAGE_CLASS_CHANGED\",\n        \"ACCESS_TIER_CHANGED\",\n        \"RESTORE_INITIATED\"\
        ,\n        \"RESTORE_COMPLETED\",\n        \"RESTORE_EXPIRED\",\n        \"\
        TAGS_CHANGED\"\n      ],\n      \"description\": \"Kind of change the cloud\
        \ event reports. Treated as CREATED when omitted.:\\n * `ACCESS_TIER_CHANGED`\
        \ - BRIDGE_EVENT_KIND_ACCESS_TIER_CHANGED,\\n * `CREATED` - BRIDGE_EVENT_KIND_CREATED,\\\
        n * `DELETED` - BRIDGE_EVENT_KIND_DELETED,\\n * `RESTORE_COMPLETED` - BRIDGE_EVENT_KIND_RESTORE_COMPLETED,\\\
        n * `RESTORE_EXPIRED` - BRIDGE_EVENT_KIND_RESTORE_EXPIRED,\\n * `RESTORE_INITIATED`\
        \ - BRIDGE_EVENT_KIND_RESTORE_INITIATED,\\n * `STORAGE_CLASS_CHANGED` - BRIDGE_EVENT_KIND_STORAGE_CLASS_CHANGED,\\\
        n * `TAGS_CHANGED` - BRIDGE_EVENT_KIND_TAGS_CHANGED\"\n    },\n    \"destination_storage_class\"\
        : {\n      \"description\": \"Destination storage class of a STORAGE_CLASS_CHANGED\
        \ event, in AWS's vocabulary (e.g. GLACIER). Absent or unrecognized means\
        \ unknown.\",\n      \"type\": \"string\"\n    },\n    \"destination_access_tier\"\
        : {\n      \"description\": \"Destination access tier of an ACCESS_TIER_CHANGED\
        \ event (ARCHIVE_ACCESS or DEEP_ARCHIVE_ACCESS). Absent or unrecognized means\
        \ not archived.\",\n      \"type\": \"string\"\n    },\n    \"restore_expiry_time\"\
        : {\n      \"description\": \"RFC 3339 expiry of the restored copy reported\
        \ by a RESTORE_COMPLETED event. Absent or undecodable leaves the restore without\
        \ an expiry.\",\n      \"type\": \"string\"\n    }\n  }\n}"
rest_endpoint: /v1/object-portal/notify
api_version: v1
deprecated: false
permalink: /rest-api-guide/object-portals-v1/object-portal_notify.html
sidebar: rest_api_guide_sidebar
---
