---
category: /LDAP Server
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_lone_ldap_config_v2\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"use_ldap\": {\n      \"description\"\
        : \"Top-level LDAP enablement switch, indicating whether Qumulo Core should\
        \ use LDAP or not.\",\n      \"type\": \"boolean\"\n    },\n    \"bind_uri\"\
        : {\n      \"description\": \"LDAP URI used to bind. Example: ldap://ldap-server.example.com\"\
        ,\n      \"type\": \"string\"\n    },\n    \"user\": {\n      \"description\"\
        : \"Binding user's distinguished name. Default is empty, for anonymous authentication.\"\
        ,\n      \"type\": \"string\"\n    },\n    \"password\": {\n      \"description\"\
        : \"Binding password for simple auth. Default is the password that is currently\
        \ configured.\",\n      \"type\": \"string\",\n      \"format\": \"password\"\
        \n    },\n    \"base_distinguished_names\": {\n      \"description\": \"Distinguished\
        \ name(s) which will be used as the search base for queries. Multiple DNs\
        \ may be specified, separated by semi-colons. Example: dc=users,dc=example,dc=com;\
        \ dc=robots,dc=example,dc=com\",\n      \"type\": \"string\"\n    },\n   \
        \ \"ldap_schema\": {\n      \"type\": \"string\",\n      \"enum\": [\n   \
        \     \"RFC2307\",\n        \"CUSTOM\"\n      ],\n      \"description\": \"\
        LDAP server schema to use. Default is RFC2307:\\n * `CUSTOM` - CUSTOM,\\n\
        \ * `RFC2307` - RFC2307\"\n    },\n    \"ldap_schema_description\": {\n  \
        \    \"description\": \"An expanded description of the LDAP server schema.\
        \ Only set this field if setting ldap_schema to CUSTOM.\",\n      \"type\"\
        : \"object\",\n      \"properties\": {\n        \"group_member_attribute\"\
        : {\n          \"description\": \"group_member_attribute\",\n          \"\
        type\": \"string\"\n        },\n        \"user_group_identifier_attribute\"\
        : {\n          \"description\": \"user_group_identifier_attribute\",\n   \
        \       \"type\": \"string\"\n        },\n        \"login_name_attribute\"\
        : {\n          \"description\": \"login_name_attribute\",\n          \"type\"\
        : \"string\"\n        },\n        \"group_name_attribute\": {\n          \"\
        description\": \"group_name_attribute\",\n          \"type\": \"string\"\n\
        \        },\n        \"user_object_class\": {\n          \"description\":\
        \ \"user_object_class\",\n          \"type\": \"string\"\n        },\n   \
        \     \"group_object_class\": {\n          \"description\": \"group_object_class\"\
        ,\n          \"type\": \"string\"\n        },\n        \"uid_number_attribute\"\
        : {\n          \"description\": \"uid_number_attribute\",\n          \"type\"\
        : \"string\"\n        },\n        \"gid_number_attribute\": {\n          \"\
        description\": \"gid_number_attribute\",\n          \"type\": \"string\"\n\
        \        }\n      }\n    },\n    \"encrypt_connection\": {\n      \"description\"\
        : \"If true, require to have encrypted connection with LDAP. Default is True.\"\
        ,\n      \"type\": \"boolean\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Get settings for LDAP interaction
  patch:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"api_lone_ldap_config_v2\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"use_ldap\": {\n      \"description\"\
        : \"Top-level LDAP enablement switch, indicating whether Qumulo Core should\
        \ use LDAP or not.\",\n      \"type\": \"boolean\"\n    },\n    \"bind_uri\"\
        : {\n      \"description\": \"LDAP URI used to bind. Example: ldap://ldap-server.example.com\"\
        ,\n      \"type\": \"string\"\n    },\n    \"user\": {\n      \"description\"\
        : \"Binding user's distinguished name. Default is empty, for anonymous authentication.\"\
        ,\n      \"type\": \"string\"\n    },\n    \"password\": {\n      \"description\"\
        : \"Binding password for simple auth. Default is the password that is currently\
        \ configured.\",\n      \"type\": \"string\",\n      \"format\": \"password\"\
        \n    },\n    \"base_distinguished_names\": {\n      \"description\": \"Distinguished\
        \ name(s) which will be used as the search base for queries. Multiple DNs\
        \ may be specified, separated by semi-colons. Example: dc=users,dc=example,dc=com;\
        \ dc=robots,dc=example,dc=com\",\n      \"type\": \"string\"\n    },\n   \
        \ \"ldap_schema\": {\n      \"type\": \"string\",\n      \"enum\": [\n   \
        \     \"RFC2307\",\n        \"CUSTOM\"\n      ],\n      \"description\": \"\
        LDAP server schema to use. Default is RFC2307:\\n * `CUSTOM` - CUSTOM,\\n\
        \ * `RFC2307` - RFC2307\"\n    },\n    \"ldap_schema_description\": {\n  \
        \    \"description\": \"An expanded description of the LDAP server schema.\
        \ Only set this field if setting ldap_schema to CUSTOM.\",\n      \"type\"\
        : \"object\",\n      \"properties\": {\n        \"group_member_attribute\"\
        : {\n          \"description\": \"group_member_attribute\",\n          \"\
        type\": \"string\"\n        },\n        \"user_group_identifier_attribute\"\
        : {\n          \"description\": \"user_group_identifier_attribute\",\n   \
        \       \"type\": \"string\"\n        },\n        \"login_name_attribute\"\
        : {\n          \"description\": \"login_name_attribute\",\n          \"type\"\
        : \"string\"\n        },\n        \"group_name_attribute\": {\n          \"\
        description\": \"group_name_attribute\",\n          \"type\": \"string\"\n\
        \        },\n        \"user_object_class\": {\n          \"description\":\
        \ \"user_object_class\",\n          \"type\": \"string\"\n        },\n   \
        \     \"group_object_class\": {\n          \"description\": \"group_object_class\"\
        ,\n          \"type\": \"string\"\n        },\n        \"uid_number_attribute\"\
        : {\n          \"description\": \"uid_number_attribute\",\n          \"type\"\
        : \"string\"\n        },\n        \"gid_number_attribute\": {\n          \"\
        description\": \"gid_number_attribute\",\n          \"type\": \"string\"\n\
        \        }\n      }\n    },\n    \"encrypt_connection\": {\n      \"description\"\
        : \"If true, require to have encrypted connection with LDAP. Default is True.\"\
        ,\n      \"type\": \"boolean\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_lone_ldap_config_v2\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"use_ldap\": {\n      \"description\"\
        : \"Top-level LDAP enablement switch, indicating whether Qumulo Core should\
        \ use LDAP or not.\",\n      \"type\": \"boolean\"\n    },\n    \"bind_uri\"\
        : {\n      \"description\": \"LDAP URI used to bind. Example: ldap://ldap-server.example.com\"\
        ,\n      \"type\": \"string\"\n    },\n    \"user\": {\n      \"description\"\
        : \"Binding user's distinguished name. Default is empty, for anonymous authentication.\"\
        ,\n      \"type\": \"string\"\n    },\n    \"password\": {\n      \"description\"\
        : \"Binding password for simple auth. Default is the password that is currently\
        \ configured.\",\n      \"type\": \"string\",\n      \"format\": \"password\"\
        \n    },\n    \"base_distinguished_names\": {\n      \"description\": \"Distinguished\
        \ name(s) which will be used as the search base for queries. Multiple DNs\
        \ may be specified, separated by semi-colons. Example: dc=users,dc=example,dc=com;\
        \ dc=robots,dc=example,dc=com\",\n      \"type\": \"string\"\n    },\n   \
        \ \"ldap_schema\": {\n      \"type\": \"string\",\n      \"enum\": [\n   \
        \     \"RFC2307\",\n        \"CUSTOM\"\n      ],\n      \"description\": \"\
        LDAP server schema to use. Default is RFC2307:\\n * `CUSTOM` - CUSTOM,\\n\
        \ * `RFC2307` - RFC2307\"\n    },\n    \"ldap_schema_description\": {\n  \
        \    \"description\": \"An expanded description of the LDAP server schema.\
        \ Only set this field if setting ldap_schema to CUSTOM.\",\n      \"type\"\
        : \"object\",\n      \"properties\": {\n        \"group_member_attribute\"\
        : {\n          \"description\": \"group_member_attribute\",\n          \"\
        type\": \"string\"\n        },\n        \"user_group_identifier_attribute\"\
        : {\n          \"description\": \"user_group_identifier_attribute\",\n   \
        \       \"type\": \"string\"\n        },\n        \"login_name_attribute\"\
        : {\n          \"description\": \"login_name_attribute\",\n          \"type\"\
        : \"string\"\n        },\n        \"group_name_attribute\": {\n          \"\
        description\": \"group_name_attribute\",\n          \"type\": \"string\"\n\
        \        },\n        \"user_object_class\": {\n          \"description\":\
        \ \"user_object_class\",\n          \"type\": \"string\"\n        },\n   \
        \     \"group_object_class\": {\n          \"description\": \"group_object_class\"\
        ,\n          \"type\": \"string\"\n        },\n        \"uid_number_attribute\"\
        : {\n          \"description\": \"uid_number_attribute\",\n          \"type\"\
        : \"string\"\n        },\n        \"gid_number_attribute\": {\n          \"\
        description\": \"gid_number_attribute\",\n          \"type\": \"string\"\n\
        \        }\n      }\n    },\n    \"encrypt_connection\": {\n      \"description\"\
        : \"If true, require to have encrypted connection with LDAP. Default is True.\"\
        ,\n      \"type\": \"boolean\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Partially Set LDAP interaction settings
  put:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"api_lone_ldap_config_v2\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"use_ldap\": {\n      \"description\"\
        : \"Top-level LDAP enablement switch, indicating whether Qumulo Core should\
        \ use LDAP or not.\",\n      \"type\": \"boolean\"\n    },\n    \"bind_uri\"\
        : {\n      \"description\": \"LDAP URI used to bind. Example: ldap://ldap-server.example.com\"\
        ,\n      \"type\": \"string\"\n    },\n    \"user\": {\n      \"description\"\
        : \"Binding user's distinguished name. Default is empty, for anonymous authentication.\"\
        ,\n      \"type\": \"string\"\n    },\n    \"password\": {\n      \"description\"\
        : \"Binding password for simple auth. Default is the password that is currently\
        \ configured.\",\n      \"type\": \"string\",\n      \"format\": \"password\"\
        \n    },\n    \"base_distinguished_names\": {\n      \"description\": \"Distinguished\
        \ name(s) which will be used as the search base for queries. Multiple DNs\
        \ may be specified, separated by semi-colons. Example: dc=users,dc=example,dc=com;\
        \ dc=robots,dc=example,dc=com\",\n      \"type\": \"string\"\n    },\n   \
        \ \"ldap_schema\": {\n      \"type\": \"string\",\n      \"enum\": [\n   \
        \     \"RFC2307\",\n        \"CUSTOM\"\n      ],\n      \"description\": \"\
        LDAP server schema to use. Default is RFC2307:\\n * `CUSTOM` - CUSTOM,\\n\
        \ * `RFC2307` - RFC2307\"\n    },\n    \"ldap_schema_description\": {\n  \
        \    \"description\": \"An expanded description of the LDAP server schema.\
        \ Only set this field if setting ldap_schema to CUSTOM.\",\n      \"type\"\
        : \"object\",\n      \"properties\": {\n        \"group_member_attribute\"\
        : {\n          \"description\": \"group_member_attribute\",\n          \"\
        type\": \"string\"\n        },\n        \"user_group_identifier_attribute\"\
        : {\n          \"description\": \"user_group_identifier_attribute\",\n   \
        \       \"type\": \"string\"\n        },\n        \"login_name_attribute\"\
        : {\n          \"description\": \"login_name_attribute\",\n          \"type\"\
        : \"string\"\n        },\n        \"group_name_attribute\": {\n          \"\
        description\": \"group_name_attribute\",\n          \"type\": \"string\"\n\
        \        },\n        \"user_object_class\": {\n          \"description\":\
        \ \"user_object_class\",\n          \"type\": \"string\"\n        },\n   \
        \     \"group_object_class\": {\n          \"description\": \"group_object_class\"\
        ,\n          \"type\": \"string\"\n        },\n        \"uid_number_attribute\"\
        : {\n          \"description\": \"uid_number_attribute\",\n          \"type\"\
        : \"string\"\n        },\n        \"gid_number_attribute\": {\n          \"\
        description\": \"gid_number_attribute\",\n          \"type\": \"string\"\n\
        \        }\n      }\n    },\n    \"encrypt_connection\": {\n      \"description\"\
        : \"If true, require to have encrypted connection with LDAP. Default is True.\"\
        ,\n      \"type\": \"boolean\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_lone_ldap_config_v2\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"use_ldap\": {\n      \"description\"\
        : \"Top-level LDAP enablement switch, indicating whether Qumulo Core should\
        \ use LDAP or not.\",\n      \"type\": \"boolean\"\n    },\n    \"bind_uri\"\
        : {\n      \"description\": \"LDAP URI used to bind. Example: ldap://ldap-server.example.com\"\
        ,\n      \"type\": \"string\"\n    },\n    \"user\": {\n      \"description\"\
        : \"Binding user's distinguished name. Default is empty, for anonymous authentication.\"\
        ,\n      \"type\": \"string\"\n    },\n    \"password\": {\n      \"description\"\
        : \"Binding password for simple auth. Default is the password that is currently\
        \ configured.\",\n      \"type\": \"string\",\n      \"format\": \"password\"\
        \n    },\n    \"base_distinguished_names\": {\n      \"description\": \"Distinguished\
        \ name(s) which will be used as the search base for queries. Multiple DNs\
        \ may be specified, separated by semi-colons. Example: dc=users,dc=example,dc=com;\
        \ dc=robots,dc=example,dc=com\",\n      \"type\": \"string\"\n    },\n   \
        \ \"ldap_schema\": {\n      \"type\": \"string\",\n      \"enum\": [\n   \
        \     \"RFC2307\",\n        \"CUSTOM\"\n      ],\n      \"description\": \"\
        LDAP server schema to use. Default is RFC2307:\\n * `CUSTOM` - CUSTOM,\\n\
        \ * `RFC2307` - RFC2307\"\n    },\n    \"ldap_schema_description\": {\n  \
        \    \"description\": \"An expanded description of the LDAP server schema.\
        \ Only set this field if setting ldap_schema to CUSTOM.\",\n      \"type\"\
        : \"object\",\n      \"properties\": {\n        \"group_member_attribute\"\
        : {\n          \"description\": \"group_member_attribute\",\n          \"\
        type\": \"string\"\n        },\n        \"user_group_identifier_attribute\"\
        : {\n          \"description\": \"user_group_identifier_attribute\",\n   \
        \       \"type\": \"string\"\n        },\n        \"login_name_attribute\"\
        : {\n          \"description\": \"login_name_attribute\",\n          \"type\"\
        : \"string\"\n        },\n        \"group_name_attribute\": {\n          \"\
        description\": \"group_name_attribute\",\n          \"type\": \"string\"\n\
        \        },\n        \"user_object_class\": {\n          \"description\":\
        \ \"user_object_class\",\n          \"type\": \"string\"\n        },\n   \
        \     \"group_object_class\": {\n          \"description\": \"group_object_class\"\
        ,\n          \"type\": \"string\"\n        },\n        \"uid_number_attribute\"\
        : {\n          \"description\": \"uid_number_attribute\",\n          \"type\"\
        : \"string\"\n        },\n        \"gid_number_attribute\": {\n          \"\
        description\": \"gid_number_attribute\",\n          \"type\": \"string\"\n\
        \        }\n      }\n    },\n    \"encrypt_connection\": {\n      \"description\"\
        : \"If true, require to have encrypted connection with LDAP. Default is True.\"\
        ,\n      \"type\": \"boolean\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Set settings for LDAP interaction
rest_endpoint: /v2/ldap/settings
api_version: v2
permalink: /rest-api-guide/ldap-server/v2_ldap_settings.html
sidebar: rest_api_guide_sidebar
---
