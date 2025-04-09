---
category: /Time Configuration Methods
methods:
  get:
    summary: Get a list of all time zones supported by Qumulo Core
    parameters: []
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"type\": \"string\"\
        \n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/time/timezones
api_version: v1
permalink: /rest-api-guide/time-configuration-methods/time_timezones.html
sidebar: rest_api_guide_sidebar
---
