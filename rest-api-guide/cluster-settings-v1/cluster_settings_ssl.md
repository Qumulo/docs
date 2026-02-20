---
category: /Cluster Settings V1
methods:
  put:
    summary: Set the SSL certificates used by the cluster. Mostly used for HTTP traffic.
    parameters: []
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"api_cluster_ssl_settings\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"certificate\": {\n      \"description\"\
        : \"Public certificate for the cluster in PEM format\",\n      \"type\": \"\
        string\"\n    },\n    \"private_key\": {\n      \"description\": \"Private\
        \ key for the cluster in PEM format\",\n      \"type\": \"string\"\n    }\n\
        \  }\n}"
rest_endpoint: /v1/cluster/settings/ssl
api_version: v1
permalink: /rest-api-guide/cluster-settings-v1/cluster_settings_ssl.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/cluster-settings/cluster_settings_ssl.html
deprecated: false
---
