---
category: /upgrade
methods:
  post:
    parameters: []
    request_body:
      schema: "{\n  \"description\": \"api_upgrade_prepare_request\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"image_path\": {\n      \"description\"\
        : \"Path to image to install\",\n      \"type\": \"string\"\n    },\n    \"\
        auto_commit\": {\n      \"description\": \"If true, the system will automatically\
        \ commit when prepare is complete\",\n      \"type\": \"boolean\"\n    },\n\
        \    \"do_rolling_reboot\": {\n      \"description\": \"If true, do a rolling\
        \ reboot after the upgrade is committed if doing a full platform upgrade\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"num_nodes_to_reboot\": {\n \
        \     \"description\": \"If the number of nodes to reboot is configured and\
        \ rolling reboot is enabled, your cluster reboots the specified number of\
        \ nodes at a time. The number of nodes must be greater than 0 and less than\
        \ or equal to the number of node failures that your cluster permits. By default,\
        \ the value is the number of permitted node failures minus 1 (1 node minimum).\"\
        ,\n      \"type\": \"number\"\n    }\n  }\n}"
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
    summary: Prepare for upgrade.
rest_endpoint: /v2/upgrade/prepare
api_version: v2
permalink: /rest-api-guide/upgrade/v2_prepare.html
sidebar: rest_api_guide_sidebar
---
