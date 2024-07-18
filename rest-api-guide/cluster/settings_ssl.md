---
category: /cluster
methods:
  put:
    parameters: []
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_cluster_ssl_settings\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"certificate\": {\n      \"description\"\
        : \"Public certificate for the cluster in PEM format\",\n      \"type\": \"\
        string\"\n    },\n    \"private_key\": {\n      \"description\": \"Private\
        \ key for the cluster in PEM format\",\n      \"type\": \"string\"\n    }\n\
        \  }\n}"
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Set the SSL certificates used by the cluster. Mostly used for HTTP traffic.
rest_endpoint: /v1/cluster/settings/ssl
permalink: /rest-api-guide/cluster/settings_ssl.html
sidebar: rest_api_guide_sidebar
---
