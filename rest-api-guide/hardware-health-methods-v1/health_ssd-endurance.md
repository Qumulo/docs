---
category: /Hardware Health Methods V1
methods:
  get:
    summary: List all SSD's endurance level
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_ssd_endurance_map\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {},\n  \"additionalProperties\": {\n    \"type\": \"\
        array\",\n    \"items\": {\n      \"description\": \"api_ssd_endurance_map\
        \ value\",\n      \"type\": \"object\",\n      \"properties\": {\n       \
        \ \"drive_bay\": {\n          \"description\": \"drive_bay\",\n          \"\
        type\": \"string\"\n        },\n        \"level\": {\n          \"description\"\
        : \"level\",\n          \"type\": \"string\"\n        }\n      }\n    }\n\
        \  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/health/ssd-endurance
api_version: v1
permalink: /rest-api-guide/hardware-health-methods-v1/health_ssd-endurance.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/hardware-health-methods/health_ssd-endurance.html
---
