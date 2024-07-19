---
category: /multitenancy
methods:
  delete:
    parameters:
    - description: The unique ID of the tenant
      name: tenant_id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Delete configuration of a tenant.
  get:
    parameters:
    - description: The unique ID of the tenant
      name: tenant_id
      required: true
    response_body:
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
    responses:
    - code: '200'
      description: Return value on success
    summary: Get configuration of a tenant.
  patch:
    parameters:
    - description: The unique ID of the tenant
      name: tenant_id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"api_tenant_config_patch\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"id\": {\n      \"description\": \"Unique\
        \ identifier for this tenant configuration.\",\n      \"type\": \"number\"\
        \n    },\n    \"name\": {\n      \"description\": \"Unique name of the tenant\
        \ chosen by the user.\",\n      \"type\": \"string\"\n    },\n    \"web_ui_enabled\"\
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
    response_body:
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
    responses:
    - code: '200'
      description: Return value on success
    summary: Update the configuration of a tenant.
  put:
    parameters:
    - description: The unique ID of the tenant
      name: tenant_id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
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
    response_body:
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
    responses:
    - code: '200'
      description: Return value on success
    summary: Set configuration of a tenant.
rest_endpoint: /v1/multitenancy/tenants/{tenant_id}
api_version: v1
permalink: /rest-api-guide/multitenancy/tenants_tenant_id.html
sidebar: rest_api_guide_sidebar
---
