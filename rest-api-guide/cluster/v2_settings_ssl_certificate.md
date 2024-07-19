---
category: /cluster
methods:
  put:
    parameters: []
    request_body:
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
    summary: Set the SSL certificates used by the cluster to authenticate its own
      identity.
rest_endpoint: /v2/cluster/settings/ssl/certificate
permalink: /rest-api-guide/cluster/v2_settings_ssl_certificate.html
sidebar: rest_api_guide_sidebar
---
