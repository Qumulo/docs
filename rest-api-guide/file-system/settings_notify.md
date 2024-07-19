---
category: /file-system
methods:
  get:
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
    summary: Get FS notify related settings.
  put:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"fs_notify_config\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"recursive_mode\": {\n      \"type\": \"string\"\
        ,\n      \"enum\": [\n        \"DISABLED_ERROR\",\n        \"DISABLED_IGNORE\"\
        ,\n        \"ENABLED\"\n      ],\n      \"description\": \"recursive_mode:\\\
        n * `DISABLED_ERROR` - FS_NOTIFY_RECURSIVE_MODE_DISABLED_ERROR,\\n * `DISABLED_IGNORE`\
        \ - FS_NOTIFY_RECURSIVE_MODE_DISABLED_IGNORE,\\n * `ENABLED` - FS_NOTIFY_RECURSIVE_MODE_ENABLED\"\
        \n    }\n  }\n}"
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
    summary: Set FS notify related settings.
rest_endpoint: /v1/file-system/settings/notify
permalink: /rest-api-guide/file-system/settings_notify.html
sidebar: rest_api_guide_sidebar
---
