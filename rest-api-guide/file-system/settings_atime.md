---
category: /file-system
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"atime_config\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"enabled\": {\n      \"description\": \"Whether\
        \ atime update is enabled\",\n      \"type\": \"boolean\"\n    },\n    \"\
        granularity\": {\n      \"type\": \"string\",\n      \"enum\": [\n       \
        \ \"HOUR\",\n        \"DAY\",\n        \"WEEK\"\n      ],\n      \"description\"\
        : \"Granularity for atime updates (HOUR/DAY/WEEEK):\\n * `DAY` - ATIME_GRANULARITY_DAY,\\\
        n * `HOUR` - ATIME_GRANULARITY_HOUR,\\n * `WEEK` - ATIME_GRANULARITY_WEEK\"\
        \n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Get atime-related settings.
  patch:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"atime_config_patch\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"enabled\": {\n      \"description\": \"Whether\
        \ atime update is enabled\",\n      \"type\": \"boolean\"\n    },\n    \"\
        granularity\": {\n      \"type\": \"string\",\n      \"enum\": [\n       \
        \ \"HOUR\",\n        \"DAY\",\n        \"WEEK\"\n      ],\n      \"description\"\
        : \"Granularity for atime updates (HOUR/DAY/WEEEK):\\n * `DAY` - ATIME_GRANULARITY_DAY,\\\
        n * `HOUR` - ATIME_GRANULARITY_HOUR,\\n * `WEEK` - ATIME_GRANULARITY_WEEK\"\
        \n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"atime_config\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"enabled\": {\n      \"description\": \"Whether\
        \ atime update is enabled\",\n      \"type\": \"boolean\"\n    },\n    \"\
        granularity\": {\n      \"type\": \"string\",\n      \"enum\": [\n       \
        \ \"HOUR\",\n        \"DAY\",\n        \"WEEK\"\n      ],\n      \"description\"\
        : \"Granularity for atime updates (HOUR/DAY/WEEEK):\\n * `DAY` - ATIME_GRANULARITY_DAY,\\\
        n * `HOUR` - ATIME_GRANULARITY_HOUR,\\n * `WEEK` - ATIME_GRANULARITY_WEEK\"\
        \n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Update atime-related settings.
  put:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"atime_config\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"enabled\": {\n      \"description\": \"Whether\
        \ atime update is enabled\",\n      \"type\": \"boolean\"\n    },\n    \"\
        granularity\": {\n      \"type\": \"string\",\n      \"enum\": [\n       \
        \ \"HOUR\",\n        \"DAY\",\n        \"WEEK\"\n      ],\n      \"description\"\
        : \"Granularity for atime updates (HOUR/DAY/WEEEK):\\n * `DAY` - ATIME_GRANULARITY_DAY,\\\
        n * `HOUR` - ATIME_GRANULARITY_HOUR,\\n * `WEEK` - ATIME_GRANULARITY_WEEK\"\
        \n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"atime_config\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"enabled\": {\n      \"description\": \"Whether\
        \ atime update is enabled\",\n      \"type\": \"boolean\"\n    },\n    \"\
        granularity\": {\n      \"type\": \"string\",\n      \"enum\": [\n       \
        \ \"HOUR\",\n        \"DAY\",\n        \"WEEK\"\n      ],\n      \"description\"\
        : \"Granularity for atime updates (HOUR/DAY/WEEEK):\\n * `DAY` - ATIME_GRANULARITY_DAY,\\\
        n * `HOUR` - ATIME_GRANULARITY_HOUR,\\n * `WEEK` - ATIME_GRANULARITY_WEEK\"\
        \n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Set atime-related settings.
rest_endpoint: /v1/file-system/settings/atime
api_version: v1
permalink: /rest-api-guide/file-system/settings_atime.html
sidebar: rest_api_guide_sidebar
---
