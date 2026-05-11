---
category: /Time Configuration Methods V2
methods:
  get:
    summary: Retrieve the time status of the underlying system
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_time_status_v2\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"config\": {\n      \"description\": \"config\"\
        ,\n      \"type\": \"object\",\n      \"properties\": {\n        \"source\"\
        : {\n          \"type\": \"string\",\n          \"enum\": [\n            \"\
        API_TIME_SOURCE_NTP\",\n            \"API_TIME_SOURCE_HYPERVISOR\"\n     \
        \     ],\n          \"description\": \"The time source type: For ANQ, must\
        \ be the hypervisor-provided time source. For all platforms other than CNQ\
        \ on Azure, must be an NTP server. For CNQ on Azure, can be either an NTP\
        \ server or the hypervisor-provided time source.:\\n * `API_TIME_SOURCE_HYPERVISOR`\
        \ - API_TIME_SOURCE_HYPERVISOR,\\n * `API_TIME_SOURCE_NTP` - API_TIME_SOURCE_NTP\"\
        \n        },\n        \"use_ad_for_primary\": {\n          \"description\"\
        : \"Use AD as the primary time source\",\n          \"type\": \"boolean\"\n\
        \        },\n        \"ntp_servers\": {\n          \"type\": \"array\",\n\
        \          \"items\": {\n            \"description\": \"List of NTP servers\"\
        ,\n            \"type\": \"string\"\n          }\n        }\n      }\n   \
        \ },\n    \"time\": {\n      \"description\": \"time\",\n      \"type\": \"\
        string\"\n    },\n    \"node_statuses\": {\n      \"type\": \"array\",\n \
        \     \"items\": {\n        \"description\": \"node_statuses\",\n        \"\
        type\": \"object\",\n        \"properties\": {\n          \"node_id\": {\n\
        \            \"description\": \"node_id\",\n            \"type\": \"number\"\
        \n          },\n          \"status\": {\n            \"type\": \"string\"\
        ,\n            \"enum\": [\n              \"TIME_NOT_SYNCHRONIZING\",\n  \
        \            \"TIME_SYNCHRONIZING\"\n            ],\n            \"description\"\
        : \"status:\\n * `TIME_NOT_SYNCHRONIZING` - TIME_NOT_SYNCHRONIZING,\\n * `TIME_SYNCHRONIZING`\
        \ - TIME_SYNCHRONIZING\"\n          }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v2/time/status
api_version: v2
deprecated: false
permalink: /rest-api-guide/time-configuration-methods-v2/v2_time_status.html
sidebar: rest_api_guide_sidebar
---
