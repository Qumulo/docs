---
category: /time
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"type\": \"string\"\
        \n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Get a list of all timezones supported by Qumulo Core
rest_endpoint: /v1/time/timezones
api_version: v1
permalink: /rest-api-guide/time/timezones.html
sidebar: rest_api_guide_sidebar
---
