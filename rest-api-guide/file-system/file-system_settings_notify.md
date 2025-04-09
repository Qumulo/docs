---
category: /File System
methods:
  get:
    summary: Get FS notify related settings.
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"fs_notify_config\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"recursive_mode\": {\n      \"type\": \"string\"\
        ,\n      \"enum\": [\n        \"DISABLED_ERROR\",\n        \"DISABLED_IGNORE\"\
        ,\n        \"ENABLED\"\n      ],\n      \"description\": \"recursive_mode:\\\
        n * `DISABLED_ERROR` - FS_NOTIFY_RECURSIVE_MODE_DISABLED_ERROR,\\n * `DISABLED_IGNORE`\
        \ - FS_NOTIFY_RECURSIVE_MODE_DISABLED_IGNORE,\\n * `ENABLED` - FS_NOTIFY_RECURSIVE_MODE_ENABLED\"\
        \n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
  put:
    summary: Set FS notify related settings.
    parameters:
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body:
      schema: "{\n  \"description\": \"fs_notify_config\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"recursive_mode\": {\n      \"type\": \"string\"\
        ,\n      \"enum\": [\n        \"DISABLED_ERROR\",\n        \"DISABLED_IGNORE\"\
        ,\n        \"ENABLED\"\n      ],\n      \"description\": \"recursive_mode:\\\
        n * `DISABLED_ERROR` - FS_NOTIFY_RECURSIVE_MODE_DISABLED_ERROR,\\n * `DISABLED_IGNORE`\
        \ - FS_NOTIFY_RECURSIVE_MODE_DISABLED_IGNORE,\\n * `ENABLED` - FS_NOTIFY_RECURSIVE_MODE_ENABLED\"\
        \n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"fs_notify_config\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"recursive_mode\": {\n      \"type\": \"string\"\
        ,\n      \"enum\": [\n        \"DISABLED_ERROR\",\n        \"DISABLED_IGNORE\"\
        ,\n        \"ENABLED\"\n      ],\n      \"description\": \"recursive_mode:\\\
        n * `DISABLED_ERROR` - FS_NOTIFY_RECURSIVE_MODE_DISABLED_ERROR,\\n * `DISABLED_IGNORE`\
        \ - FS_NOTIFY_RECURSIVE_MODE_DISABLED_IGNORE,\\n * `ENABLED` - FS_NOTIFY_RECURSIVE_MODE_ENABLED\"\
        \n    }\n  }\n}"
rest_endpoint: /v1/file-system/settings/notify
api_version: v1
permalink: /rest-api-guide/file-system/file-system_settings_notify.html
sidebar: rest_api_guide_sidebar
---
