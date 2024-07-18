---
category: /support
methods:
  get:
    parameters: []
    response_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"monitoring_config\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"enabled\": {\n      \"description\": \"enabled\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"mq_host\": {\n      \"description\"\
        : \"mq_host\",\n      \"type\": \"string\"\n    },\n    \"mq_port\": {\n \
        \     \"description\": \"mq_port\",\n      \"type\": \"number\"\n    },\n\
        \    \"mq_proxy_host\": {\n      \"description\": \"mq_proxy_host\",\n   \
        \   \"type\": \"string\"\n    },\n    \"mq_proxy_port\": {\n      \"description\"\
        : \"mq_proxy_port\",\n      \"type\": \"number\"\n    },\n    \"s3_proxy_host\"\
        : {\n      \"description\": \"s3_proxy_host\",\n      \"type\": \"string\"\
        \n    },\n    \"s3_proxy_port\": {\n      \"description\": \"s3_proxy_port\"\
        ,\n      \"type\": \"number\"\n    },\n    \"s3_proxy_disable_https\": {\n\
        \      \"description\": \"s3_proxy_disable_https\",\n      \"type\": \"boolean\"\
        \n    },\n    \"vpn_enabled\": {\n      \"description\": \"vpn_enabled\",\n\
        \      \"type\": \"boolean\"\n    },\n    \"vpn_host\": {\n      \"description\"\
        : \"vpn_host\",\n      \"type\": \"string\"\n    },\n    \"period\": {\n \
        \     \"description\": \"period\",\n      \"type\": \"number\"\n    },\n \
        \   \"nexus_enabled\": {\n      \"description\": \"nexus_enabled\",\n    \
        \  \"type\": \"boolean\"\n    },\n    \"nexus_host\": {\n      \"description\"\
        : \"nexus_host\",\n      \"type\": \"string\"\n    },\n    \"nexus_port\"\
        : {\n      \"description\": \"nexus_port\",\n      \"type\": \"number\"\n\
        \    },\n    \"nexus_interval\": {\n      \"description\": \"nexus_interval\"\
        ,\n      \"type\": \"number\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Get monitoring configuration.
  patch:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"monitoring_config\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"enabled\": {\n      \"description\": \"enabled\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"mq_host\": {\n      \"description\"\
        : \"mq_host\",\n      \"type\": \"string\"\n    },\n    \"mq_port\": {\n \
        \     \"description\": \"mq_port\",\n      \"type\": \"number\"\n    },\n\
        \    \"mq_proxy_host\": {\n      \"description\": \"mq_proxy_host\",\n   \
        \   \"type\": \"string\"\n    },\n    \"mq_proxy_port\": {\n      \"description\"\
        : \"mq_proxy_port\",\n      \"type\": \"number\"\n    },\n    \"s3_proxy_host\"\
        : {\n      \"description\": \"s3_proxy_host\",\n      \"type\": \"string\"\
        \n    },\n    \"s3_proxy_port\": {\n      \"description\": \"s3_proxy_port\"\
        ,\n      \"type\": \"number\"\n    },\n    \"s3_proxy_disable_https\": {\n\
        \      \"description\": \"s3_proxy_disable_https\",\n      \"type\": \"boolean\"\
        \n    },\n    \"vpn_enabled\": {\n      \"description\": \"vpn_enabled\",\n\
        \      \"type\": \"boolean\"\n    },\n    \"vpn_host\": {\n      \"description\"\
        : \"vpn_host\",\n      \"type\": \"string\"\n    },\n    \"period\": {\n \
        \     \"description\": \"period\",\n      \"type\": \"number\"\n    },\n \
        \   \"nexus_enabled\": {\n      \"description\": \"nexus_enabled\",\n    \
        \  \"type\": \"boolean\"\n    },\n    \"nexus_host\": {\n      \"description\"\
        : \"nexus_host\",\n      \"type\": \"string\"\n    },\n    \"nexus_port\"\
        : {\n      \"description\": \"nexus_port\",\n      \"type\": \"number\"\n\
        \    },\n    \"nexus_interval\": {\n      \"description\": \"nexus_interval\"\
        ,\n      \"type\": \"number\"\n    }\n  }\n}"
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
    summary: Partial set of monitoring configuration.
  put:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"monitoring_config\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"enabled\": {\n      \"description\": \"enabled\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"mq_host\": {\n      \"description\"\
        : \"mq_host\",\n      \"type\": \"string\"\n    },\n    \"mq_port\": {\n \
        \     \"description\": \"mq_port\",\n      \"type\": \"number\"\n    },\n\
        \    \"mq_proxy_host\": {\n      \"description\": \"mq_proxy_host\",\n   \
        \   \"type\": \"string\"\n    },\n    \"mq_proxy_port\": {\n      \"description\"\
        : \"mq_proxy_port\",\n      \"type\": \"number\"\n    },\n    \"s3_proxy_host\"\
        : {\n      \"description\": \"s3_proxy_host\",\n      \"type\": \"string\"\
        \n    },\n    \"s3_proxy_port\": {\n      \"description\": \"s3_proxy_port\"\
        ,\n      \"type\": \"number\"\n    },\n    \"s3_proxy_disable_https\": {\n\
        \      \"description\": \"s3_proxy_disable_https\",\n      \"type\": \"boolean\"\
        \n    },\n    \"vpn_enabled\": {\n      \"description\": \"vpn_enabled\",\n\
        \      \"type\": \"boolean\"\n    },\n    \"vpn_host\": {\n      \"description\"\
        : \"vpn_host\",\n      \"type\": \"string\"\n    },\n    \"period\": {\n \
        \     \"description\": \"period\",\n      \"type\": \"number\"\n    },\n \
        \   \"nexus_enabled\": {\n      \"description\": \"nexus_enabled\",\n    \
        \  \"type\": \"boolean\"\n    },\n    \"nexus_host\": {\n      \"description\"\
        : \"nexus_host\",\n      \"type\": \"string\"\n    },\n    \"nexus_port\"\
        : {\n      \"description\": \"nexus_port\",\n      \"type\": \"number\"\n\
        \    },\n    \"nexus_interval\": {\n      \"description\": \"nexus_interval\"\
        ,\n      \"type\": \"number\"\n    }\n  }\n}"
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
    summary: Set monitoring configuration.
rest_endpoint: /v1/support/settings
permalink: /rest-api-guide/support/settings.html
sidebar: rest_api_guide_sidebar
---
