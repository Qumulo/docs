---
category: /Time Configuration Methods V2
methods:
  get:
    summary: Retrieve this cluster's time-management configuration. Refer to the 'Set
      Time Configuration' method for a description of the returned fields.
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_time_config_v2\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"source\": {\n      \"type\": \"string\",\n \
        \     \"enum\": [\n        \"API_TIME_SOURCE_NTP\",\n        \"API_TIME_SOURCE_HYPERVISOR\"\
        \n      ],\n      \"description\": \"The time source type: For ANQ, must be\
        \ the hypervisor-provided time source. For all platforms other than CNQ on\
        \ Azure, must be an NTP server. For CNQ on Azure, can be either an NTP server\
        \ or the hypervisor-provided time source.:\\n * `API_TIME_SOURCE_HYPERVISOR`\
        \ - API_TIME_SOURCE_HYPERVISOR,\\n * `API_TIME_SOURCE_NTP` - API_TIME_SOURCE_NTP\"\
        \n    },\n    \"use_ad_for_primary\": {\n      \"description\": \"Use AD as\
        \ the primary time source\",\n      \"type\": \"boolean\"\n    },\n    \"\
        ntp_servers\": {\n      \"type\": \"array\",\n      \"items\": {\n       \
        \ \"description\": \"List of NTP servers\",\n        \"type\": \"string\"\n\
        \      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
  put:
    summary: Set this cluster's time-management configuration.
    parameters:
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body:
      schema: "{\n  \"description\": \"api_time_config_v2\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"source\": {\n      \"type\": \"string\",\n \
        \     \"enum\": [\n        \"API_TIME_SOURCE_NTP\",\n        \"API_TIME_SOURCE_HYPERVISOR\"\
        \n      ],\n      \"description\": \"The time source type: For ANQ, must be\
        \ the hypervisor-provided time source. For all platforms other than CNQ on\
        \ Azure, must be an NTP server. For CNQ on Azure, can be either an NTP server\
        \ or the hypervisor-provided time source.:\\n * `API_TIME_SOURCE_HYPERVISOR`\
        \ - API_TIME_SOURCE_HYPERVISOR,\\n * `API_TIME_SOURCE_NTP` - API_TIME_SOURCE_NTP\"\
        \n    },\n    \"use_ad_for_primary\": {\n      \"description\": \"Use AD as\
        \ the primary time source\",\n      \"type\": \"boolean\"\n    },\n    \"\
        ntp_servers\": {\n      \"type\": \"array\",\n      \"items\": {\n       \
        \ \"description\": \"List of NTP servers\",\n        \"type\": \"string\"\n\
        \      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"api_time_config_v2\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"source\": {\n      \"type\": \"string\",\n \
        \     \"enum\": [\n        \"API_TIME_SOURCE_NTP\",\n        \"API_TIME_SOURCE_HYPERVISOR\"\
        \n      ],\n      \"description\": \"The time source type: For ANQ, must be\
        \ the hypervisor-provided time source. For all platforms other than CNQ on\
        \ Azure, must be an NTP server. For CNQ on Azure, can be either an NTP server\
        \ or the hypervisor-provided time source.:\\n * `API_TIME_SOURCE_HYPERVISOR`\
        \ - API_TIME_SOURCE_HYPERVISOR,\\n * `API_TIME_SOURCE_NTP` - API_TIME_SOURCE_NTP\"\
        \n    },\n    \"use_ad_for_primary\": {\n      \"description\": \"Use AD as\
        \ the primary time source\",\n      \"type\": \"boolean\"\n    },\n    \"\
        ntp_servers\": {\n      \"type\": \"array\",\n      \"items\": {\n       \
        \ \"description\": \"List of NTP servers\",\n        \"type\": \"string\"\n\
        \      }\n    }\n  }\n}"
  patch:
    summary: Set just the provided components of this cluster's time-management configuration.
    parameters:
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body:
      schema: "{\n  \"description\": \"api_time_config_v2\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"source\": {\n      \"type\": \"string\",\n \
        \     \"enum\": [\n        \"API_TIME_SOURCE_NTP\",\n        \"API_TIME_SOURCE_HYPERVISOR\"\
        \n      ],\n      \"description\": \"The time source type: For ANQ, must be\
        \ the hypervisor-provided time source. For all platforms other than CNQ on\
        \ Azure, must be an NTP server. For CNQ on Azure, can be either an NTP server\
        \ or the hypervisor-provided time source.:\\n * `API_TIME_SOURCE_HYPERVISOR`\
        \ - API_TIME_SOURCE_HYPERVISOR,\\n * `API_TIME_SOURCE_NTP` - API_TIME_SOURCE_NTP\"\
        \n    },\n    \"use_ad_for_primary\": {\n      \"description\": \"Use AD as\
        \ the primary time source\",\n      \"type\": \"boolean\"\n    },\n    \"\
        ntp_servers\": {\n      \"type\": \"array\",\n      \"items\": {\n       \
        \ \"description\": \"List of NTP servers\",\n        \"type\": \"string\"\n\
        \      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"api_time_config_v2_patch\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"source\": {\n      \"type\": \"string\"\
        ,\n      \"enum\": [\n        \"API_TIME_SOURCE_NTP\",\n        \"API_TIME_SOURCE_HYPERVISOR\"\
        \n      ],\n      \"description\": \"The time source type: For ANQ, must be\
        \ the hypervisor-provided time source. For all platforms other than CNQ on\
        \ Azure, must be an NTP server. For CNQ on Azure, can be either an NTP server\
        \ or the hypervisor-provided time source.:\\n * `API_TIME_SOURCE_HYPERVISOR`\
        \ - API_TIME_SOURCE_HYPERVISOR,\\n * `API_TIME_SOURCE_NTP` - API_TIME_SOURCE_NTP\"\
        \n    },\n    \"use_ad_for_primary\": {\n      \"description\": \"Use AD as\
        \ the primary time source\",\n      \"type\": \"boolean\"\n    },\n    \"\
        ntp_servers\": {\n      \"type\": \"array\",\n      \"items\": {\n       \
        \ \"description\": \"List of NTP servers\",\n        \"type\": \"string\"\n\
        \      }\n    }\n  }\n}"
rest_endpoint: /v2/time/settings
api_version: v2
deprecated: false
permalink: /rest-api-guide/time-configuration-methods-v2/v2_time_settings.html
sidebar: rest_api_guide_sidebar
---
