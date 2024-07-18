---
category: /multitenancy
methods:
  get:
    parameters: []
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_tenant_configs\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"entries\": {\n      \"type\": \"array\",\n \
        \     \"items\": {\n        \"description\": \"List of tenant configs\",\n\
        \        \"type\": \"object\",\n        \"properties\": {\n          \"id\"\
        : {\n            \"description\": \"Unique identifier for this tenant configuration.\"\
        ,\n            \"type\": \"number\"\n          },\n          \"name\": {\n\
        \            \"description\": \"Unique name of the tenant chosen by the user.\"\
        ,\n            \"type\": \"string\"\n          },\n          \"web_ui_enabled\"\
        : {\n            \"description\": \"Web UI is accessible from this tenant.\"\
        ,\n            \"type\": \"boolean\"\n          },\n          \"rest_api_enabled\"\
        : {\n            \"description\": \"Rest API is accessible from this tenant.\"\
        ,\n            \"type\": \"boolean\"\n          },\n          \"ssh_enabled\"\
        : {\n            \"description\": \"SSH is accessible from this tenant.\"\
        ,\n            \"type\": \"boolean\"\n          },\n          \"replication_enabled\"\
        : {\n            \"description\": \"Replication is accessible from this tenant.\"\
        ,\n            \"type\": \"boolean\"\n          },\n          \"nfs_enabled\"\
        : {\n            \"description\": \"NFS is accessible from this tenant.\"\
        ,\n            \"type\": \"boolean\"\n          },\n          \"smb_enabled\"\
        : {\n            \"description\": \"SMB is accessible from this tenant.\"\
        ,\n            \"type\": \"boolean\"\n          },\n          \"networks\"\
        : {\n            \"type\": \"array\",\n            \"items\": {\n        \
        \      \"description\": \"List of network IDs associated with this tenant.\"\
        ,\n              \"type\": \"number\"\n            }\n          },\n     \
        \     \"identity_config_id\": {\n            \"description\": \"Unique identifier\
        \ for the identity configuration to use for this tenant.\",\n            \"\
        type\": \"number\"\n          }\n        }\n      }\n    }\n  }\n}"
      status_code: '200'
    summary: Get configurations of all tenants.
  post:
    parameters: []
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_tenant_config_post\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"name\": {\n      \"description\": \"Unique name\
        \ of the tenant chosen by the user.\",\n      \"type\": \"string\"\n    },\n\
        \    \"web_ui_enabled\": {\n      \"description\": \"Web UI is accessible\
        \ from this tenant. Defaults to false.\",\n      \"type\": \"boolean\"\n \
        \   },\n    \"rest_api_enabled\": {\n      \"description\": \"Rest API is\
        \ accessible from this tenant. Defaults to false.\",\n      \"type\": \"boolean\"\
        \n    },\n    \"ssh_enabled\": {\n      \"description\": \"SSH is accessible\
        \ from this tenant. Defaults to false.\",\n      \"type\": \"boolean\"\n \
        \   },\n    \"replication_enabled\": {\n      \"description\": \"Replication\
        \ is accessible from this tenant. Defaults to false.\",\n      \"type\": \"\
        boolean\"\n    },\n    \"nfs_enabled\": {\n      \"description\": \"NFS is\
        \ accessible from this tenant. Defaults to false.\",\n      \"type\": \"boolean\"\
        \n    },\n    \"smb_enabled\": {\n      \"description\": \"SMB is accessible\
        \ from this tenant. Defaults to false.\",\n      \"type\": \"boolean\"\n \
        \   },\n    \"networks\": {\n      \"type\": \"array\",\n      \"items\":\
        \ {\n        \"description\": \"List of network IDs associated with this tenant.\
        \ Defaults to empty.\",\n        \"type\": \"number\"\n      }\n    },\n \
        \   \"identity_config_id\": {\n      \"description\": \"Unique identifier\
        \ for the identity configuration to use for this tenant.\",\n      \"type\"\
        : \"number\"\n    }\n  }\n}"
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_tenant_config\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Unique identifier\
        \ for this tenant configuration.\",\n      \"type\": \"number\"\n    },\n\
        \    \"name\": {\n      \"description\": \"Unique name of the tenant chosen\
        \ by the user.\",\n      \"type\": \"string\"\n    },\n    \"web_ui_enabled\"\
        : {\n      \"description\": \"Web UI is accessible from this tenant.\",\n\
        \      \"type\": \"boolean\"\n    },\n    \"rest_api_enabled\": {\n      \"\
        description\": \"Rest API is accessible from this tenant.\",\n      \"type\"\
        : \"boolean\"\n    },\n    \"ssh_enabled\": {\n      \"description\": \"SSH\
        \ is accessible from this tenant.\",\n      \"type\": \"boolean\"\n    },\n\
        \    \"replication_enabled\": {\n      \"description\": \"Replication is accessible\
        \ from this tenant.\",\n      \"type\": \"boolean\"\n    },\n    \"nfs_enabled\"\
        : {\n      \"description\": \"NFS is accessible from this tenant.\",\n   \
        \   \"type\": \"boolean\"\n    },\n    \"smb_enabled\": {\n      \"description\"\
        : \"SMB is accessible from this tenant.\",\n      \"type\": \"boolean\"\n\
        \    },\n    \"networks\": {\n      \"type\": \"array\",\n      \"items\"\
        : {\n        \"description\": \"List of network IDs associated with this tenant.\"\
        ,\n        \"type\": \"number\"\n      }\n    },\n    \"identity_config_id\"\
        : {\n      \"description\": \"Unique identifier for the identity configuration\
        \ to use for this tenant.\",\n      \"type\": \"number\"\n    }\n  }\n}"
      status_code: '200'
    summary: Create a tenant.
rest_endpoint: /v1/multitenancy/tenants/
permalink: /rest-api-guide/multitenancy/tenants.html
sidebar: rest_api_guide_sidebar
---
