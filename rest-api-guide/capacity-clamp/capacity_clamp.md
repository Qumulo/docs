---
category: /Capacity Clamp
methods:
  get:
    summary: Retrieve the capacity clamp value in bytes. You can set this value by
      using a PUT API call or as an argument to the cluster creation API. The cluster
      uses this value to determine the maximum capacity that it can provision, regardless
      of the maximum capacity of the underlying storage.
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_capacity_clamp\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"capacity_clamp\": {\n      \"description\":\
        \ \"The value, in bytes, to clamp usable capacity to\",\n      \"type\": \"\
        string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
  put:
    summary: Specify the capacity clamp value in bytes. This value limits maximum
      provisioned capacity. The actual provisioned space is limited to the maximum
      capacity of the underlying storage. In addition, the actual provisioned space
      is close to the requested value in bytes, without exceeding it. If the system
      applies this value successfully, it abandons quorum and allocates storage capacity
      in a new quorum.
    parameters: []
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"api_capacity_clamp\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"capacity_clamp\": {\n      \"description\":\
        \ \"The value, in bytes, to clamp usable capacity to\",\n      \"type\": \"\
        string\"\n    }\n  }\n}"
rest_endpoint: /v1/capacity/clamp
api_version: v1
permalink: /rest-api-guide/capacity-clamp/capacity_clamp.html
sidebar: rest_api_guide_sidebar
---
