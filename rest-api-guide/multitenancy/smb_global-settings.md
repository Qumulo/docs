---
category: /multitenancy
methods:
  get:
    parameters: []
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_smb_settings\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"session_encryption\": {\n      \"type\": \"\
        string\",\n      \"enum\": [\n        \"NONE\",\n        \"PREFERRED\",\n\
        \        \"REQUIRED\"\n      ],\n      \"description\": \"Session-level encryption\
        \ setting.:\\n * `NONE` - SMB_SESSION_ENCRYPTION_SETTING_NONE,\\n * `PREFERRED`\
        \ - SMB_SESSION_ENCRYPTION_SETTING_PREFERRED,\\n * `REQUIRED` - SMB_SESSION_ENCRYPTION_SETTING_REQUIRED\"\
        \n    },\n    \"supported_dialects\": {\n      \"type\": \"array\",\n    \
        \  \"items\": {\n        \"type\": \"string\",\n        \"enum\": [\n    \
        \      \"SMB2_DIALECT_2_002\",\n          \"SMB2_DIALECT_2_1\",\n        \
        \  \"SMB2_DIALECT_3_0\",\n          \"SMB2_DIALECT_3_11\"\n        ],\n  \
        \      \"description\": \"supported_dialects:\\n * `SMB2_DIALECT_2_002` -\
        \ API_SMB2_DIALECT_2_002,\\n * `SMB2_DIALECT_2_1` - API_SMB2_DIALECT_2_1,\\\
        n * `SMB2_DIALECT_3_0` - API_SMB2_DIALECT_3_0,\\n * `SMB2_DIALECT_3_11` -\
        \ API_SMB2_DIALECT_3_11\"\n      }\n    },\n    \"hide_shares_from_unauthorized_users\"\
        : {\n      \"description\": \"If share permissions deny a logged in user access\
        \ to a share, that share will not be visible in the share listing.\",\n  \
        \    \"type\": \"boolean\"\n    },\n    \"hide_shares_from_unauthorized_hosts\"\
        : {\n      \"description\": \"If share permissions deny a connected host access\
        \ to a share, that share will not be visible in the share listing.\",\n  \
        \    \"type\": \"boolean\"\n    },\n    \"snapshot_directory_mode\": {\n \
        \     \"type\": \"string\",\n      \"enum\": [\n        \"VISIBLE\",\n   \
        \     \"HIDDEN\",\n        \"DISABLED\"\n      ],\n      \"description\":\
        \ \"Whether the special .snapshot directory should be visible or accessible.:\\\
        n * `DISABLED` - SNAPSHOT_METADIR_DISABLED,\\n * `HIDDEN` - SNAPSHOT_METADIR_HIDDEN,\\\
        n * `VISIBLE` - SNAPSHOT_METADIR_VISIBLE\"\n    },\n    \"bypass_traverse_checking\"\
        : {\n      \"description\": \"Skip directory traversal checking for all users.\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"signing_required\": {\n    \
        \  \"description\": \"Requires messages from non-guest users to be signed.\"\
        ,\n      \"type\": \"boolean\"\n    }\n  }\n}"
      status_code: '200'
    summary: Retrieve global SMB configuration.
  patch:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_smb_settings_patch\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"session_encryption\": {\n      \"type\": \"\
        string\",\n      \"enum\": [\n        \"NONE\",\n        \"PREFERRED\",\n\
        \        \"REQUIRED\"\n      ],\n      \"description\": \"Session-level encryption\
        \ setting.:\\n * `NONE` - SMB_SESSION_ENCRYPTION_SETTING_NONE,\\n * `PREFERRED`\
        \ - SMB_SESSION_ENCRYPTION_SETTING_PREFERRED,\\n * `REQUIRED` - SMB_SESSION_ENCRYPTION_SETTING_REQUIRED\"\
        \n    },\n    \"supported_dialects\": {\n      \"type\": \"array\",\n    \
        \  \"items\": {\n        \"type\": \"string\",\n        \"enum\": [\n    \
        \      \"SMB2_DIALECT_2_002\",\n          \"SMB2_DIALECT_2_1\",\n        \
        \  \"SMB2_DIALECT_3_0\",\n          \"SMB2_DIALECT_3_11\"\n        ],\n  \
        \      \"description\": \"supported_dialects:\\n * `SMB2_DIALECT_2_002` -\
        \ API_SMB2_DIALECT_2_002,\\n * `SMB2_DIALECT_2_1` - API_SMB2_DIALECT_2_1,\\\
        n * `SMB2_DIALECT_3_0` - API_SMB2_DIALECT_3_0,\\n * `SMB2_DIALECT_3_11` -\
        \ API_SMB2_DIALECT_3_11\"\n      }\n    },\n    \"hide_shares_from_unauthorized_users\"\
        : {\n      \"description\": \"If share permissions deny a logged in user access\
        \ to a share, that share will not be visible in the share listing.\",\n  \
        \    \"type\": \"boolean\"\n    },\n    \"hide_shares_from_unauthorized_hosts\"\
        : {\n      \"description\": \"If share permissions deny a connected host access\
        \ to a share, that share will not be visible in the share listing.\",\n  \
        \    \"type\": \"boolean\"\n    },\n    \"snapshot_directory_mode\": {\n \
        \     \"type\": \"string\",\n      \"enum\": [\n        \"VISIBLE\",\n   \
        \     \"HIDDEN\",\n        \"DISABLED\"\n      ],\n      \"description\":\
        \ \"Whether the special .snapshot directory should be visible or accessible.:\\\
        n * `DISABLED` - SNAPSHOT_METADIR_DISABLED,\\n * `HIDDEN` - SNAPSHOT_METADIR_HIDDEN,\\\
        n * `VISIBLE` - SNAPSHOT_METADIR_VISIBLE\"\n    },\n    \"bypass_traverse_checking\"\
        : {\n      \"description\": \"Skip directory traversal checking for all users.\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"signing_required\": {\n    \
        \  \"description\": \"Requires messages from non-guest users to be signed.\"\
        ,\n      \"type\": \"boolean\"\n    }\n  }\n}"
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_smb_settings\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"session_encryption\": {\n      \"type\": \"\
        string\",\n      \"enum\": [\n        \"NONE\",\n        \"PREFERRED\",\n\
        \        \"REQUIRED\"\n      ],\n      \"description\": \"Session-level encryption\
        \ setting.:\\n * `NONE` - SMB_SESSION_ENCRYPTION_SETTING_NONE,\\n * `PREFERRED`\
        \ - SMB_SESSION_ENCRYPTION_SETTING_PREFERRED,\\n * `REQUIRED` - SMB_SESSION_ENCRYPTION_SETTING_REQUIRED\"\
        \n    },\n    \"supported_dialects\": {\n      \"type\": \"array\",\n    \
        \  \"items\": {\n        \"type\": \"string\",\n        \"enum\": [\n    \
        \      \"SMB2_DIALECT_2_002\",\n          \"SMB2_DIALECT_2_1\",\n        \
        \  \"SMB2_DIALECT_3_0\",\n          \"SMB2_DIALECT_3_11\"\n        ],\n  \
        \      \"description\": \"supported_dialects:\\n * `SMB2_DIALECT_2_002` -\
        \ API_SMB2_DIALECT_2_002,\\n * `SMB2_DIALECT_2_1` - API_SMB2_DIALECT_2_1,\\\
        n * `SMB2_DIALECT_3_0` - API_SMB2_DIALECT_3_0,\\n * `SMB2_DIALECT_3_11` -\
        \ API_SMB2_DIALECT_3_11\"\n      }\n    },\n    \"hide_shares_from_unauthorized_users\"\
        : {\n      \"description\": \"If share permissions deny a logged in user access\
        \ to a share, that share will not be visible in the share listing.\",\n  \
        \    \"type\": \"boolean\"\n    },\n    \"hide_shares_from_unauthorized_hosts\"\
        : {\n      \"description\": \"If share permissions deny a connected host access\
        \ to a share, that share will not be visible in the share listing.\",\n  \
        \    \"type\": \"boolean\"\n    },\n    \"snapshot_directory_mode\": {\n \
        \     \"type\": \"string\",\n      \"enum\": [\n        \"VISIBLE\",\n   \
        \     \"HIDDEN\",\n        \"DISABLED\"\n      ],\n      \"description\":\
        \ \"Whether the special .snapshot directory should be visible or accessible.:\\\
        n * `DISABLED` - SNAPSHOT_METADIR_DISABLED,\\n * `HIDDEN` - SNAPSHOT_METADIR_HIDDEN,\\\
        n * `VISIBLE` - SNAPSHOT_METADIR_VISIBLE\"\n    },\n    \"bypass_traverse_checking\"\
        : {\n      \"description\": \"Skip directory traversal checking for all users.\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"signing_required\": {\n    \
        \  \"description\": \"Requires messages from non-guest users to be signed.\"\
        ,\n      \"type\": \"boolean\"\n    }\n  }\n}"
      status_code: '200'
    summary: Modify global SMB configuration.
  put:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_smb_settings\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"session_encryption\": {\n      \"type\": \"\
        string\",\n      \"enum\": [\n        \"NONE\",\n        \"PREFERRED\",\n\
        \        \"REQUIRED\"\n      ],\n      \"description\": \"Session-level encryption\
        \ setting.:\\n * `NONE` - SMB_SESSION_ENCRYPTION_SETTING_NONE,\\n * `PREFERRED`\
        \ - SMB_SESSION_ENCRYPTION_SETTING_PREFERRED,\\n * `REQUIRED` - SMB_SESSION_ENCRYPTION_SETTING_REQUIRED\"\
        \n    },\n    \"supported_dialects\": {\n      \"type\": \"array\",\n    \
        \  \"items\": {\n        \"type\": \"string\",\n        \"enum\": [\n    \
        \      \"SMB2_DIALECT_2_002\",\n          \"SMB2_DIALECT_2_1\",\n        \
        \  \"SMB2_DIALECT_3_0\",\n          \"SMB2_DIALECT_3_11\"\n        ],\n  \
        \      \"description\": \"supported_dialects:\\n * `SMB2_DIALECT_2_002` -\
        \ API_SMB2_DIALECT_2_002,\\n * `SMB2_DIALECT_2_1` - API_SMB2_DIALECT_2_1,\\\
        n * `SMB2_DIALECT_3_0` - API_SMB2_DIALECT_3_0,\\n * `SMB2_DIALECT_3_11` -\
        \ API_SMB2_DIALECT_3_11\"\n      }\n    },\n    \"hide_shares_from_unauthorized_users\"\
        : {\n      \"description\": \"If share permissions deny a logged in user access\
        \ to a share, that share will not be visible in the share listing.\",\n  \
        \    \"type\": \"boolean\"\n    },\n    \"hide_shares_from_unauthorized_hosts\"\
        : {\n      \"description\": \"If share permissions deny a connected host access\
        \ to a share, that share will not be visible in the share listing.\",\n  \
        \    \"type\": \"boolean\"\n    },\n    \"snapshot_directory_mode\": {\n \
        \     \"type\": \"string\",\n      \"enum\": [\n        \"VISIBLE\",\n   \
        \     \"HIDDEN\",\n        \"DISABLED\"\n      ],\n      \"description\":\
        \ \"Whether the special .snapshot directory should be visible or accessible.:\\\
        n * `DISABLED` - SNAPSHOT_METADIR_DISABLED,\\n * `HIDDEN` - SNAPSHOT_METADIR_HIDDEN,\\\
        n * `VISIBLE` - SNAPSHOT_METADIR_VISIBLE\"\n    },\n    \"bypass_traverse_checking\"\
        : {\n      \"description\": \"Skip directory traversal checking for all users.\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"signing_required\": {\n    \
        \  \"description\": \"Requires messages from non-guest users to be signed.\"\
        ,\n      \"type\": \"boolean\"\n    }\n  }\n}"
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_smb_settings\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"session_encryption\": {\n      \"type\": \"\
        string\",\n      \"enum\": [\n        \"NONE\",\n        \"PREFERRED\",\n\
        \        \"REQUIRED\"\n      ],\n      \"description\": \"Session-level encryption\
        \ setting.:\\n * `NONE` - SMB_SESSION_ENCRYPTION_SETTING_NONE,\\n * `PREFERRED`\
        \ - SMB_SESSION_ENCRYPTION_SETTING_PREFERRED,\\n * `REQUIRED` - SMB_SESSION_ENCRYPTION_SETTING_REQUIRED\"\
        \n    },\n    \"supported_dialects\": {\n      \"type\": \"array\",\n    \
        \  \"items\": {\n        \"type\": \"string\",\n        \"enum\": [\n    \
        \      \"SMB2_DIALECT_2_002\",\n          \"SMB2_DIALECT_2_1\",\n        \
        \  \"SMB2_DIALECT_3_0\",\n          \"SMB2_DIALECT_3_11\"\n        ],\n  \
        \      \"description\": \"supported_dialects:\\n * `SMB2_DIALECT_2_002` -\
        \ API_SMB2_DIALECT_2_002,\\n * `SMB2_DIALECT_2_1` - API_SMB2_DIALECT_2_1,\\\
        n * `SMB2_DIALECT_3_0` - API_SMB2_DIALECT_3_0,\\n * `SMB2_DIALECT_3_11` -\
        \ API_SMB2_DIALECT_3_11\"\n      }\n    },\n    \"hide_shares_from_unauthorized_users\"\
        : {\n      \"description\": \"If share permissions deny a logged in user access\
        \ to a share, that share will not be visible in the share listing.\",\n  \
        \    \"type\": \"boolean\"\n    },\n    \"hide_shares_from_unauthorized_hosts\"\
        : {\n      \"description\": \"If share permissions deny a connected host access\
        \ to a share, that share will not be visible in the share listing.\",\n  \
        \    \"type\": \"boolean\"\n    },\n    \"snapshot_directory_mode\": {\n \
        \     \"type\": \"string\",\n      \"enum\": [\n        \"VISIBLE\",\n   \
        \     \"HIDDEN\",\n        \"DISABLED\"\n      ],\n      \"description\":\
        \ \"Whether the special .snapshot directory should be visible or accessible.:\\\
        n * `DISABLED` - SNAPSHOT_METADIR_DISABLED,\\n * `HIDDEN` - SNAPSHOT_METADIR_HIDDEN,\\\
        n * `VISIBLE` - SNAPSHOT_METADIR_VISIBLE\"\n    },\n    \"bypass_traverse_checking\"\
        : {\n      \"description\": \"Skip directory traversal checking for all users.\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"signing_required\": {\n    \
        \  \"description\": \"Requires messages from non-guest users to be signed.\"\
        ,\n      \"type\": \"boolean\"\n    }\n  }\n}"
      status_code: '200'
    summary: Set global SMB configuration.
rest_endpoint: /v1/multitenancy/smb/global-settings
permalink: /rest-api-guide/multitenancy/smb_global-settings.html
sidebar: rest_api_guide_sidebar
---
