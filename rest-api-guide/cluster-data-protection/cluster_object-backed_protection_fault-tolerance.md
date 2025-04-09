---
category: /Cluster Data Protection
methods:
  get:
    summary: Gets the current fault tolerance of an object-backed cluster.
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_object_backed_fault_tolerance\",\n  \"\
        type\": \"object\",\n  \"properties\": {\n    \"disks\": {\n      \"description\"\
        : \"The maximum number of arbitrary disks that cluster currently supports\
        \ losing.\",\n      \"type\": \"number\"\n    },\n    \"nodes\": {\n     \
        \ \"description\": \"The maximum number of arbitrary nodes that cluster currently\
        \ supports losing.\",\n      \"type\": \"number\"\n    },\n    \"fault_domains\"\
        : {\n      \"description\": \"The maximum number of arbitrary fault_domains\
        \ that cluster currently supports losing.\",\n      \"type\": \"number\"\n\
        \    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/cluster/object-backed/protection/fault-tolerance
api_version: v1
permalink: /rest-api-guide/cluster-data-protection/cluster_object-backed_protection_fault-tolerance.html
sidebar: rest_api_guide_sidebar
---
