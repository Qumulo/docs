---
category: /Nexus Configuration V1
methods:
  get:
    summary: Retrieve current Nexus connection configuration
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"nexus_connection_config\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"nexus_enabled\": {\n      \"description\"\
        : \"nexus_enabled\",\n      \"type\": \"boolean\"\n    },\n    \"nexus_host\"\
        : {\n      \"description\": \"nexus_host\",\n      \"type\": \"string\"\n\
        \    },\n    \"nexus_port\": {\n      \"description\": \"nexus_port\",\n \
        \     \"type\": \"number\"\n    },\n    \"nexus_interval\": {\n      \"description\"\
        : \"nexus_interval\",\n      \"type\": \"number\"\n    },\n    \"nexus_capability_remote_support\"\
        : {\n      \"description\": \"nexus_capability_remote_support\",\n      \"\
        type\": \"boolean\"\n    },\n    \"nexus_capability_sso\": {\n      \"description\"\
        : \"nexus_capability_sso\",\n      \"type\": \"boolean\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
  put:
    summary: Set the Nexus connection configuration
    parameters:
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body:
      schema: "{\n  \"description\": \"nexus_connection_config\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"nexus_enabled\": {\n      \"description\"\
        : \"nexus_enabled\",\n      \"type\": \"boolean\"\n    },\n    \"nexus_host\"\
        : {\n      \"description\": \"nexus_host\",\n      \"type\": \"string\"\n\
        \    },\n    \"nexus_port\": {\n      \"description\": \"nexus_port\",\n \
        \     \"type\": \"number\"\n    },\n    \"nexus_interval\": {\n      \"description\"\
        : \"nexus_interval\",\n      \"type\": \"number\"\n    },\n    \"nexus_capability_remote_support\"\
        : {\n      \"description\": \"nexus_capability_remote_support\",\n      \"\
        type\": \"boolean\"\n    },\n    \"nexus_capability_sso\": {\n      \"description\"\
        : \"nexus_capability_sso\",\n      \"type\": \"boolean\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"nexus_connection_config\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"nexus_enabled\": {\n      \"description\"\
        : \"nexus_enabled\",\n      \"type\": \"boolean\"\n    },\n    \"nexus_host\"\
        : {\n      \"description\": \"nexus_host\",\n      \"type\": \"string\"\n\
        \    },\n    \"nexus_port\": {\n      \"description\": \"nexus_port\",\n \
        \     \"type\": \"number\"\n    },\n    \"nexus_interval\": {\n      \"description\"\
        : \"nexus_interval\",\n      \"type\": \"number\"\n    },\n    \"nexus_capability_remote_support\"\
        : {\n      \"description\": \"nexus_capability_remote_support\",\n      \"\
        type\": \"boolean\"\n    },\n    \"nexus_capability_sso\": {\n      \"description\"\
        : \"nexus_capability_sso\",\n      \"type\": \"boolean\"\n    }\n  }\n}"
  patch:
    summary: Partial set of the Nexus connection configuration
    parameters:
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body:
      schema: "{\n  \"description\": \"nexus_connection_config\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"nexus_enabled\": {\n      \"description\"\
        : \"nexus_enabled\",\n      \"type\": \"boolean\"\n    },\n    \"nexus_host\"\
        : {\n      \"description\": \"nexus_host\",\n      \"type\": \"string\"\n\
        \    },\n    \"nexus_port\": {\n      \"description\": \"nexus_port\",\n \
        \     \"type\": \"number\"\n    },\n    \"nexus_interval\": {\n      \"description\"\
        : \"nexus_interval\",\n      \"type\": \"number\"\n    },\n    \"nexus_capability_remote_support\"\
        : {\n      \"description\": \"nexus_capability_remote_support\",\n      \"\
        type\": \"boolean\"\n    },\n    \"nexus_capability_sso\": {\n      \"description\"\
        : \"nexus_capability_sso\",\n      \"type\": \"boolean\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"nexus_connection_config_patch\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"nexus_enabled\": {\n      \"description\"\
        : \"nexus_enabled\",\n      \"type\": \"boolean\"\n    },\n    \"nexus_host\"\
        : {\n      \"description\": \"nexus_host\",\n      \"type\": \"string\"\n\
        \    },\n    \"nexus_port\": {\n      \"description\": \"nexus_port\",\n \
        \     \"type\": \"number\"\n    },\n    \"nexus_interval\": {\n      \"description\"\
        : \"nexus_interval\",\n      \"type\": \"number\"\n    },\n    \"nexus_capability_remote_support\"\
        : {\n      \"description\": \"nexus_capability_remote_support\",\n      \"\
        type\": \"boolean\"\n    },\n    \"nexus_capability_sso\": {\n      \"description\"\
        : \"nexus_capability_sso\",\n      \"type\": \"boolean\"\n    }\n  }\n}"
rest_endpoint: /v1/nexus/connection
api_version: v1
permalink: /rest-api-guide/nexus-configuration-v1/nexus_connection.html
sidebar: rest_api_guide_sidebar
---
