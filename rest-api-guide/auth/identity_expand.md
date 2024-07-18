---
category: /auth
methods:
  post:
    parameters: []
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_id_to_expand\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"The identity\
        \ to expand.\",\n      \"type\": \"object\",\n      \"properties\": {\n  \
        \      \"domain\": {\n          \"type\": \"string\",\n          \"enum\"\
        : [\n            \"LOCAL\",\n            \"API_NULL_DOMAIN\",\n          \
        \  \"WORLD\",\n            \"POSIX_USER\",\n            \"POSIX_GROUP\",\n\
        \            \"ACTIVE_DIRECTORY\",\n            \"API_INVALID_DOMAIN\",\n\
        \            \"API_RESERVED_DOMAIN\",\n            \"API_INTERNAL_DOMAIN\"\
        ,\n            \"API_OPERATOR_DOMAIN\",\n            \"API_CREATOR_DOMAIN\"\
        \n          ],\n          \"description\": \"domain:\\n * `ACTIVE_DIRECTORY`\
        \ - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n *\
        \ `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` -\
        \ API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN`\
        \ - API_OPERATOR_DOMAIN,\\n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\\
        n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` -\
        \ POSIX_USER,\\n * `WORLD` - WORLD\"\n        },\n        \"auth_id\": {\n\
        \          \"description\": \"auth_id\",\n          \"type\": \"string\"\n\
        \        },\n        \"uid\": {\n          \"description\": \"uid\",\n   \
        \       \"type\": \"number\"\n        },\n        \"gid\": {\n          \"\
        description\": \"gid\",\n          \"type\": \"number\"\n        },\n    \
        \    \"sid\": {\n          \"description\": \"sid\",\n          \"type\":\
        \ \"string\"\n        },\n        \"name\": {\n          \"description\":\
        \ \"name\",\n          \"type\": \"string\"\n        }\n      }\n    },\n\
        \    \"equivalent_ids\": {\n      \"type\": \"array\",\n      \"items\": {\n\
        \        \"description\": \"Additional identities that should be considered\
        \ equivalent, and also expanded.\",\n        \"type\": \"object\",\n     \
        \   \"properties\": {\n          \"domain\": {\n            \"type\": \"string\"\
        ,\n            \"enum\": [\n              \"LOCAL\",\n              \"API_NULL_DOMAIN\"\
        ,\n              \"WORLD\",\n              \"POSIX_USER\",\n             \
        \ \"POSIX_GROUP\",\n              \"ACTIVE_DIRECTORY\",\n              \"\
        API_INVALID_DOMAIN\",\n              \"API_RESERVED_DOMAIN\",\n          \
        \    \"API_INTERNAL_DOMAIN\",\n              \"API_OPERATOR_DOMAIN\",\n  \
        \            \"API_CREATOR_DOMAIN\"\n            ],\n            \"description\"\
        : \"domain:\\n * `ACTIVE_DIRECTORY` - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN`\
        \ - API_CREATOR_DOMAIN,\\n * `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\\
        n * `API_INVALID_DOMAIN` - API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\\
        n * `API_OPERATOR_DOMAIN` - API_OPERATOR_DOMAIN,\\n * `API_RESERVED_DOMAIN`\
        \ - API_RESERVED_DOMAIN,\\n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\\
        n * `POSIX_USER` - POSIX_USER,\\n * `WORLD` - WORLD\"\n          },\n    \
        \      \"auth_id\": {\n            \"description\": \"auth_id\",\n       \
        \     \"type\": \"string\"\n          },\n          \"uid\": {\n         \
        \   \"description\": \"uid\",\n            \"type\": \"number\"\n        \
        \  },\n          \"gid\": {\n            \"description\": \"gid\",\n     \
        \       \"type\": \"number\"\n          },\n          \"sid\": {\n       \
        \     \"description\": \"sid\",\n            \"type\": \"string\"\n      \
        \    },\n          \"name\": {\n            \"description\": \"name\",\n \
        \           \"type\": \"string\"\n          }\n        }\n      }\n    },\n\
        \    \"group_ids\": {\n      \"type\": \"array\",\n      \"items\": {\n  \
        \      \"description\": \"Additional groups that the id should be considered\
        \ a member of, and also expanded.\",\n        \"type\": \"object\",\n    \
        \    \"properties\": {\n          \"domain\": {\n            \"type\": \"\
        string\",\n            \"enum\": [\n              \"LOCAL\",\n           \
        \   \"API_NULL_DOMAIN\",\n              \"WORLD\",\n              \"POSIX_USER\"\
        ,\n              \"POSIX_GROUP\",\n              \"ACTIVE_DIRECTORY\",\n \
        \             \"API_INVALID_DOMAIN\",\n              \"API_RESERVED_DOMAIN\"\
        ,\n              \"API_INTERNAL_DOMAIN\",\n              \"API_OPERATOR_DOMAIN\"\
        ,\n              \"API_CREATOR_DOMAIN\"\n            ],\n            \"description\"\
        : \"domain:\\n * `ACTIVE_DIRECTORY` - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN`\
        \ - API_CREATOR_DOMAIN,\\n * `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\\
        n * `API_INVALID_DOMAIN` - API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\\
        n * `API_OPERATOR_DOMAIN` - API_OPERATOR_DOMAIN,\\n * `API_RESERVED_DOMAIN`\
        \ - API_RESERVED_DOMAIN,\\n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\\
        n * `POSIX_USER` - POSIX_USER,\\n * `WORLD` - WORLD\"\n          },\n    \
        \      \"auth_id\": {\n            \"description\": \"auth_id\",\n       \
        \     \"type\": \"string\"\n          },\n          \"uid\": {\n         \
        \   \"description\": \"uid\",\n            \"type\": \"number\"\n        \
        \  },\n          \"gid\": {\n            \"description\": \"gid\",\n     \
        \       \"type\": \"number\"\n          },\n          \"sid\": {\n       \
        \     \"description\": \"sid\",\n            \"type\": \"string\"\n      \
        \    },\n          \"name\": {\n            \"description\": \"name\",\n \
        \           \"type\": \"string\"\n          }\n        }\n      }\n    }\n\
        \  }\n}"
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_expanded_id\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"id\": {\n      \"description\": \"The identity\
        \ that was expanded.\",\n      \"type\": \"object\",\n      \"properties\"\
        : {\n        \"domain\": {\n          \"type\": \"string\",\n          \"\
        enum\": [\n            \"LOCAL\",\n            \"API_NULL_DOMAIN\",\n    \
        \        \"WORLD\",\n            \"POSIX_USER\",\n            \"POSIX_GROUP\"\
        ,\n            \"ACTIVE_DIRECTORY\",\n            \"API_INVALID_DOMAIN\",\n\
        \            \"API_RESERVED_DOMAIN\",\n            \"API_INTERNAL_DOMAIN\"\
        ,\n            \"API_OPERATOR_DOMAIN\",\n            \"API_CREATOR_DOMAIN\"\
        \n          ],\n          \"description\": \"domain:\\n * `ACTIVE_DIRECTORY`\
        \ - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n *\
        \ `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` -\
        \ API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN`\
        \ - API_OPERATOR_DOMAIN,\\n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\\
        n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` -\
        \ POSIX_USER,\\n * `WORLD` - WORLD\"\n        },\n        \"auth_id\": {\n\
        \          \"description\": \"auth_id\",\n          \"type\": \"string\"\n\
        \        },\n        \"uid\": {\n          \"description\": \"uid\",\n   \
        \       \"type\": \"number\"\n        },\n        \"gid\": {\n          \"\
        description\": \"gid\",\n          \"type\": \"number\"\n        },\n    \
        \    \"sid\": {\n          \"description\": \"sid\",\n          \"type\":\
        \ \"string\"\n        },\n        \"name\": {\n          \"description\":\
        \ \"name\",\n          \"type\": \"string\"\n        }\n      }\n    },\n\
        \    \"type\": {\n      \"type\": \"string\",\n      \"enum\": [\n       \
        \ \"UNKNOWN\",\n        \"USER\",\n        \"GROUP\"\n      ],\n      \"description\"\
        : \"Whether the expanded identity is a user, group, or indeterminate.:\\n\
        \ * `GROUP` - RESOLVED_ID_IS_GROUP,\\n * `UNKNOWN` - RESOLVED_ID_IS_UNKNOWN,\\\
        n * `USER` - RESOLVED_ID_IS_USER\"\n    },\n    \"smb_id\": {\n      \"description\"\
        : \"The equivalent identity that would be shown to SMB clients.\",\n     \
        \ \"type\": \"object\",\n      \"properties\": {\n        \"domain\": {\n\
        \          \"type\": \"string\",\n          \"enum\": [\n            \"LOCAL\"\
        ,\n            \"API_NULL_DOMAIN\",\n            \"WORLD\",\n            \"\
        POSIX_USER\",\n            \"POSIX_GROUP\",\n            \"ACTIVE_DIRECTORY\"\
        ,\n            \"API_INVALID_DOMAIN\",\n            \"API_RESERVED_DOMAIN\"\
        ,\n            \"API_INTERNAL_DOMAIN\",\n            \"API_OPERATOR_DOMAIN\"\
        ,\n            \"API_CREATOR_DOMAIN\"\n          ],\n          \"description\"\
        : \"domain:\\n * `ACTIVE_DIRECTORY` - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN`\
        \ - API_CREATOR_DOMAIN,\\n * `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\\
        n * `API_INVALID_DOMAIN` - API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\\
        n * `API_OPERATOR_DOMAIN` - API_OPERATOR_DOMAIN,\\n * `API_RESERVED_DOMAIN`\
        \ - API_RESERVED_DOMAIN,\\n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\\
        n * `POSIX_USER` - POSIX_USER,\\n * `WORLD` - WORLD\"\n        },\n      \
        \  \"auth_id\": {\n          \"description\": \"auth_id\",\n          \"type\"\
        : \"string\"\n        },\n        \"uid\": {\n          \"description\": \"\
        uid\",\n          \"type\": \"number\"\n        },\n        \"gid\": {\n \
        \         \"description\": \"gid\",\n          \"type\": \"number\"\n    \
        \    },\n        \"sid\": {\n          \"description\": \"sid\",\n       \
        \   \"type\": \"string\"\n        },\n        \"name\": {\n          \"description\"\
        : \"name\",\n          \"type\": \"string\"\n        }\n      }\n    },\n\
        \    \"nfs_id\": {\n      \"description\": \"The equivalent identity that\
        \ would be shown to NFS clients.\",\n      \"type\": \"object\",\n      \"\
        properties\": {\n        \"domain\": {\n          \"type\": \"string\",\n\
        \          \"enum\": [\n            \"LOCAL\",\n            \"API_NULL_DOMAIN\"\
        ,\n            \"WORLD\",\n            \"POSIX_USER\",\n            \"POSIX_GROUP\"\
        ,\n            \"ACTIVE_DIRECTORY\",\n            \"API_INVALID_DOMAIN\",\n\
        \            \"API_RESERVED_DOMAIN\",\n            \"API_INTERNAL_DOMAIN\"\
        ,\n            \"API_OPERATOR_DOMAIN\",\n            \"API_CREATOR_DOMAIN\"\
        \n          ],\n          \"description\": \"domain:\\n * `ACTIVE_DIRECTORY`\
        \ - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n *\
        \ `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` -\
        \ API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN`\
        \ - API_OPERATOR_DOMAIN,\\n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\\
        n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` -\
        \ POSIX_USER,\\n * `WORLD` - WORLD\"\n        },\n        \"auth_id\": {\n\
        \          \"description\": \"auth_id\",\n          \"type\": \"string\"\n\
        \        },\n        \"uid\": {\n          \"description\": \"uid\",\n   \
        \       \"type\": \"number\"\n        },\n        \"gid\": {\n          \"\
        description\": \"gid\",\n          \"type\": \"number\"\n        },\n    \
        \    \"sid\": {\n          \"description\": \"sid\",\n          \"type\":\
        \ \"string\"\n        },\n        \"name\": {\n          \"description\":\
        \ \"name\",\n          \"type\": \"string\"\n        }\n      }\n    },\n\
        \    \"equivalent_ids\": {\n      \"type\": \"array\",\n      \"items\": {\n\
        \        \"description\": \"Identities that are the same as the expanded ID,\
        \ and which have the same rights.\",\n        \"type\": \"object\",\n    \
        \    \"properties\": {\n          \"domain\": {\n            \"type\": \"\
        string\",\n            \"enum\": [\n              \"LOCAL\",\n           \
        \   \"API_NULL_DOMAIN\",\n              \"WORLD\",\n              \"POSIX_USER\"\
        ,\n              \"POSIX_GROUP\",\n              \"ACTIVE_DIRECTORY\",\n \
        \             \"API_INVALID_DOMAIN\",\n              \"API_RESERVED_DOMAIN\"\
        ,\n              \"API_INTERNAL_DOMAIN\",\n              \"API_OPERATOR_DOMAIN\"\
        ,\n              \"API_CREATOR_DOMAIN\"\n            ],\n            \"description\"\
        : \"domain:\\n * `ACTIVE_DIRECTORY` - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN`\
        \ - API_CREATOR_DOMAIN,\\n * `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\\
        n * `API_INVALID_DOMAIN` - API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\\
        n * `API_OPERATOR_DOMAIN` - API_OPERATOR_DOMAIN,\\n * `API_RESERVED_DOMAIN`\
        \ - API_RESERVED_DOMAIN,\\n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\\
        n * `POSIX_USER` - POSIX_USER,\\n * `WORLD` - WORLD\"\n          },\n    \
        \      \"auth_id\": {\n            \"description\": \"auth_id\",\n       \
        \     \"type\": \"string\"\n          },\n          \"uid\": {\n         \
        \   \"description\": \"uid\",\n            \"type\": \"number\"\n        \
        \  },\n          \"gid\": {\n            \"description\": \"gid\",\n     \
        \       \"type\": \"number\"\n          },\n          \"sid\": {\n       \
        \     \"description\": \"sid\",\n            \"type\": \"string\"\n      \
        \    },\n          \"name\": {\n            \"description\": \"name\",\n \
        \           \"type\": \"string\"\n          }\n        }\n      }\n    },\n\
        \    \"group_ids\": {\n      \"type\": \"array\",\n      \"items\": {\n  \
        \      \"description\": \"Groups that the expanded ID is a member of.\",\n\
        \        \"type\": \"object\",\n        \"properties\": {\n          \"domain\"\
        : {\n            \"type\": \"string\",\n            \"enum\": [\n        \
        \      \"LOCAL\",\n              \"API_NULL_DOMAIN\",\n              \"WORLD\"\
        ,\n              \"POSIX_USER\",\n              \"POSIX_GROUP\",\n       \
        \       \"ACTIVE_DIRECTORY\",\n              \"API_INVALID_DOMAIN\",\n   \
        \           \"API_RESERVED_DOMAIN\",\n              \"API_INTERNAL_DOMAIN\"\
        ,\n              \"API_OPERATOR_DOMAIN\",\n              \"API_CREATOR_DOMAIN\"\
        \n            ],\n            \"description\": \"domain:\\n * `ACTIVE_DIRECTORY`\
        \ - ACTIVE_DIRECTORY,\\n * `API_CREATOR_DOMAIN` - API_CREATOR_DOMAIN,\\n *\
        \ `API_INTERNAL_DOMAIN` - API_INTERNAL_DOMAIN,\\n * `API_INVALID_DOMAIN` -\
        \ API_INVALID_DOMAIN,\\n * `API_NULL_DOMAIN` - API_NULL_DOMAIN,\\n * `API_OPERATOR_DOMAIN`\
        \ - API_OPERATOR_DOMAIN,\\n * `API_RESERVED_DOMAIN` - API_RESERVED_DOMAIN,\\\
        n * `LOCAL` - LOCAL,\\n * `POSIX_GROUP` - POSIX_GROUP,\\n * `POSIX_USER` -\
        \ POSIX_USER,\\n * `WORLD` - WORLD\"\n          },\n          \"auth_id\"\
        : {\n            \"description\": \"auth_id\",\n            \"type\": \"string\"\
        \n          },\n          \"uid\": {\n            \"description\": \"uid\"\
        ,\n            \"type\": \"number\"\n          },\n          \"gid\": {\n\
        \            \"description\": \"gid\",\n            \"type\": \"number\"\n\
        \          },\n          \"sid\": {\n            \"description\": \"sid\"\
        ,\n            \"type\": \"string\"\n          },\n          \"name\": {\n\
        \            \"description\": \"name\",\n            \"type\": \"string\"\n\
        \          }\n        }\n      }\n    }\n  }\n}"
      status_code: '200'
    summary: Find all equivalents and the group membership of the given identity.
      This API is deprecated in favor of /v1/identity/expand
rest_endpoint: /v1/auth/identity/expand
permalink: /rest-api-guide/auth/identity_expand.html
sidebar: rest_api_guide_sidebar
---
