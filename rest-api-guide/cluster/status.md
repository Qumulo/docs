---
category: /cluster
methods:
  get:
    parameters: []
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Get current status of restriper, including data protection status and
      current restripe phase (if running). This API is deprecated in favor of /v1/cluster/protection/restriper/status
      after v5.3.4.
rest_endpoint: /v1/cluster/restriper/status
permalink: /rest-api-guide/cluster/status.html
sidebar: rest_api_guide_sidebar
---
