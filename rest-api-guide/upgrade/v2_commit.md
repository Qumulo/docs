---
category: /upgrade
methods:
  post:
    parameters: []
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_monitor_uri\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"monitor_uri\": {\n      \"description\": \"\
        monitor_uri\",\n      \"type\": \"string\"\n    }\n  }\n}"
      status_code: '202'
    summary: Commit a prepared upgrade.
rest_endpoint: /v2/upgrade/commit
permalink: /rest-api-guide/upgrade/v2_commit.html
sidebar: rest_api_guide_sidebar
---
