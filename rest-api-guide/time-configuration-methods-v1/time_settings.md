---
category: /Time Configuration Methods V1
methods:
  get:
    summary: Retrieve the server's time-management configuration. Refer to the 'Set
      Time Configuration' method for a description of the returned fields.
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
    preview: false
  put:
    summary: Set the server's time-management configuration.
    parameters:
    - name: If-Match
      description: ETag for expected version
      required: false
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
    preview: false
    request_body:
      schema: "{\n  \"description\": \"conf_time_state\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"use_ad_for_primary\": {\n      \"description\"\
        : \"Whether to use the Active Directory controller as the primary NTP server\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"ntp_servers\": {\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"description\": \"List of NTP servers\"\
        ,\n        \"type\": \"string\"\n      }\n    }\n  }\n}"
  patch:
    summary: Set just the provided components of the server's time-management configuration.
    parameters:
    - name: If-Match
      description: ETag for expected version
      required: false
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
    preview: false
    request_body:
      schema: "{\n  \"description\": \"conf_time_state_patch\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"use_ad_for_primary\": {\n      \"description\"\
        : \"Whether to use the Active Directory controller as the primary NTP server\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"ntp_servers\": {\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"description\": \"List of NTP servers\"\
        ,\n        \"type\": \"string\"\n      }\n    }\n  }\n}"
rest_endpoint: /v1/time/settings
api_version: v1
permalink: /rest-api-guide/time-configuration-methods-v1/time_settings.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/time-configuration-methods/time_settings.html
deprecated: false
---
