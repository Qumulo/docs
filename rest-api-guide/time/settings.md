---
category: /time
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"conf_time_state\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"use_ad_for_primary\": {\n      \"description\"\
        : \"Whether to use the Active Directory controller as the primary NTP server\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"ntp_servers\": {\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"description\": \"List of NTP servers\"\
        ,\n        \"type\": \"string\"\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Retrieve the server's time-management configuration. Refer to the 'Set
      Time Configuration' method for a description of the returned fields.
  patch:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"conf_time_state_patch\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"use_ad_for_primary\": {\n      \"description\"\
        : \"Whether to use the Active Directory controller as the primary NTP server\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"ntp_servers\": {\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"description\": \"List of NTP servers\"\
        ,\n        \"type\": \"string\"\n      }\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"conf_time_state\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"use_ad_for_primary\": {\n      \"description\"\
        : \"Whether to use the Active Directory controller as the primary NTP server\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"ntp_servers\": {\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"description\": \"List of NTP servers\"\
        ,\n        \"type\": \"string\"\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Set just the provided components of the server's time-management configuration.
  put:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"conf_time_state\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"use_ad_for_primary\": {\n      \"description\"\
        : \"Whether to use the Active Directory controller as the primary NTP server\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"ntp_servers\": {\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"description\": \"List of NTP servers\"\
        ,\n        \"type\": \"string\"\n      }\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"conf_time_state\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"use_ad_for_primary\": {\n      \"description\"\
        : \"Whether to use the Active Directory controller as the primary NTP server\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"ntp_servers\": {\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"description\": \"List of NTP servers\"\
        ,\n        \"type\": \"string\"\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Set the server's time-management configuration.
rest_endpoint: /v1/time/settings
permalink: /rest-api-guide/time/settings.html
sidebar: rest_api_guide_sidebar
---
