---
category: /auth
methods:
  get:
    parameters:
    - description: The POSIX UID to expand.
      name: id
      required: true
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_identity_v1\",\n    \"type\": \"object\",\n    \"properties\": {\n   \
        \   \"id_type\": {\n        \"type\": \"string\",\n        \"enum\": [\n \
        \         \"LOCAL_USER\",\n          \"LOCAL_GROUP\",\n          \"NFS_GID\"\
        ,\n          \"NFS_UID\",\n          \"SMB_SID\",\n          \"INTERNAL\"\
        ,\n          \"QUMULO_OPERATOR\"\n        ],\n        \"description\": \"\
        id_type:\\n * `INTERNAL` - INTERNAL,\\n * `LOCAL_GROUP` - LOCAL_GROUP,\\n\
        \ * `LOCAL_USER` - LOCAL_USER,\\n * `NFS_GID` - NFS_GID,\\n * `NFS_UID` -\
        \ NFS_UID,\\n * `QUMULO_OPERATOR` - QUMULO_OPERATOR,\\n * `SMB_SID` - SMB_SID\"\
        \n      },\n      \"id_value\": {\n        \"description\": \"id_value\",\n\
        \        \"type\": \"string\"\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Given a POSIX UID, return all related identities (equivalents in other
      domains, and containing groups). This API is deprecated in favor of /v1/identity/expand
rest_endpoint: /v1/auth/posix-uids/{id}/related-identities/
permalink: /rest-api-guide/auth/posix-uids_id_related-identities.html
sidebar: rest_api_guide_sidebar
---
