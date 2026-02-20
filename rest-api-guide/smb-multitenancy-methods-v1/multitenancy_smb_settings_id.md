---
category: /SMB Multitenancy Methods V1
methods:
  get:
    summary: '[preview] Retrieve current tenant-specific SMB configuration.'
    parameters:
    - name: id
      description: The tenant ID of the SMB settings.
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_smb_settings\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"session_encryption\": {\n      \"type\": \"\
        string\",\n      \"enum\": [\n        \"NONE\",\n        \"PREFERRED\",\n\
        \        \"REQUIRED\"\n      ],\n      \"description\": \"Session-level encryption\
        \ setting.:\\n * `NONE` - Do not instruct clients to encrypt SMB traffic.,\\\
        n * `PREFERRED` - Instruct clients to encrypt SMB traffic if they support\
        \ encryption.,\\n * `REQUIRED` - Always instruct clients to encrypt SMB traffic.\
        \ Reject clients who do not support encryption.\"\n    },\n    \"supported_dialects\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"type\": \"\
        string\",\n        \"enum\": [\n          \"SMB2_DIALECT_2_002\",\n      \
        \    \"SMB2_DIALECT_2_1\",\n          \"SMB2_DIALECT_3_0\",\n          \"\
        SMB2_DIALECT_3_11\"\n        ],\n        \"description\": \"supported_dialects:\\\
        n * `SMB2_DIALECT_2_002` - API_SMB2_DIALECT_2_002,\\n * `SMB2_DIALECT_2_1`\
        \ - API_SMB2_DIALECT_2_1,\\n * `SMB2_DIALECT_3_0` - API_SMB2_DIALECT_3_0,\\\
        n * `SMB2_DIALECT_3_11` - API_SMB2_DIALECT_3_11\"\n      }\n    },\n    \"\
        hide_shares_from_unauthorized_users\": {\n      \"description\": \"If share\
        \ permissions deny a logged in user access to a share, that share will not\
        \ be visible in the share listing.\",\n      \"type\": \"boolean\"\n    },\n\
        \    \"hide_shares_from_unauthorized_hosts\": {\n      \"description\": \"\
        If share permissions deny a connected host access to a share, that share will\
        \ not be visible in the share listing.\",\n      \"type\": \"boolean\"\n \
        \   },\n    \"snapshot_directory_mode\": {\n      \"type\": \"string\",\n\
        \      \"enum\": [\n        \"VISIBLE\",\n        \"HIDDEN\",\n        \"\
        DISABLED\"\n      ],\n      \"description\": \"Whether the special .snapshot\
        \ directory should be visible or accessible.:\\n * `DISABLED` - .snapshot\
        \ directories will not be accessible via SMB.,\\n * `HIDDEN` - .snapshot directories\
        \ will not be visible in directory listings, but may be opened by name.,\\\
        n * `VISIBLE` - A .snapshot directory will be visible when listing the root\
        \ directory of a SMB share.\"\n    },\n    \"bypass_traverse_checking\": {\n\
        \      \"description\": \"Skip directory traversal checking for all users.\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"signing_required\": {\n    \
        \  \"description\": \"Requires messages from non-guest users to be signed.\"\
        ,\n      \"type\": \"boolean\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: true
  put:
    summary: '[preview] Set current tenant-specific SMB configuration.'
    parameters:
    - name: id
      description: The tenant ID of the SMB settings.
      required: true
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body:
      schema: "{\n  \"description\": \"api_smb_settings\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"session_encryption\": {\n      \"type\": \"\
        string\",\n      \"enum\": [\n        \"NONE\",\n        \"PREFERRED\",\n\
        \        \"REQUIRED\"\n      ],\n      \"description\": \"Session-level encryption\
        \ setting.:\\n * `NONE` - Do not instruct clients to encrypt SMB traffic.,\\\
        n * `PREFERRED` - Instruct clients to encrypt SMB traffic if they support\
        \ encryption.,\\n * `REQUIRED` - Always instruct clients to encrypt SMB traffic.\
        \ Reject clients who do not support encryption.\"\n    },\n    \"supported_dialects\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"type\": \"\
        string\",\n        \"enum\": [\n          \"SMB2_DIALECT_2_002\",\n      \
        \    \"SMB2_DIALECT_2_1\",\n          \"SMB2_DIALECT_3_0\",\n          \"\
        SMB2_DIALECT_3_11\"\n        ],\n        \"description\": \"supported_dialects:\\\
        n * `SMB2_DIALECT_2_002` - API_SMB2_DIALECT_2_002,\\n * `SMB2_DIALECT_2_1`\
        \ - API_SMB2_DIALECT_2_1,\\n * `SMB2_DIALECT_3_0` - API_SMB2_DIALECT_3_0,\\\
        n * `SMB2_DIALECT_3_11` - API_SMB2_DIALECT_3_11\"\n      }\n    },\n    \"\
        hide_shares_from_unauthorized_users\": {\n      \"description\": \"If share\
        \ permissions deny a logged in user access to a share, that share will not\
        \ be visible in the share listing.\",\n      \"type\": \"boolean\"\n    },\n\
        \    \"hide_shares_from_unauthorized_hosts\": {\n      \"description\": \"\
        If share permissions deny a connected host access to a share, that share will\
        \ not be visible in the share listing.\",\n      \"type\": \"boolean\"\n \
        \   },\n    \"snapshot_directory_mode\": {\n      \"type\": \"string\",\n\
        \      \"enum\": [\n        \"VISIBLE\",\n        \"HIDDEN\",\n        \"\
        DISABLED\"\n      ],\n      \"description\": \"Whether the special .snapshot\
        \ directory should be visible or accessible.:\\n * `DISABLED` - .snapshot\
        \ directories will not be accessible via SMB.,\\n * `HIDDEN` - .snapshot directories\
        \ will not be visible in directory listings, but may be opened by name.,\\\
        n * `VISIBLE` - A .snapshot directory will be visible when listing the root\
        \ directory of a SMB share.\"\n    },\n    \"bypass_traverse_checking\": {\n\
        \      \"description\": \"Skip directory traversal checking for all users.\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"signing_required\": {\n    \
        \  \"description\": \"Requires messages from non-guest users to be signed.\"\
        ,\n      \"type\": \"boolean\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: true
    request_body:
      schema: "{\n  \"description\": \"api_smb_settings\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"session_encryption\": {\n      \"type\": \"\
        string\",\n      \"enum\": [\n        \"NONE\",\n        \"PREFERRED\",\n\
        \        \"REQUIRED\"\n      ],\n      \"description\": \"Session-level encryption\
        \ setting.:\\n * `NONE` - Do not instruct clients to encrypt SMB traffic.,\\\
        n * `PREFERRED` - Instruct clients to encrypt SMB traffic if they support\
        \ encryption.,\\n * `REQUIRED` - Always instruct clients to encrypt SMB traffic.\
        \ Reject clients who do not support encryption.\"\n    },\n    \"supported_dialects\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"type\": \"\
        string\",\n        \"enum\": [\n          \"SMB2_DIALECT_2_002\",\n      \
        \    \"SMB2_DIALECT_2_1\",\n          \"SMB2_DIALECT_3_0\",\n          \"\
        SMB2_DIALECT_3_11\"\n        ],\n        \"description\": \"supported_dialects:\\\
        n * `SMB2_DIALECT_2_002` - API_SMB2_DIALECT_2_002,\\n * `SMB2_DIALECT_2_1`\
        \ - API_SMB2_DIALECT_2_1,\\n * `SMB2_DIALECT_3_0` - API_SMB2_DIALECT_3_0,\\\
        n * `SMB2_DIALECT_3_11` - API_SMB2_DIALECT_3_11\"\n      }\n    },\n    \"\
        hide_shares_from_unauthorized_users\": {\n      \"description\": \"If share\
        \ permissions deny a logged in user access to a share, that share will not\
        \ be visible in the share listing.\",\n      \"type\": \"boolean\"\n    },\n\
        \    \"hide_shares_from_unauthorized_hosts\": {\n      \"description\": \"\
        If share permissions deny a connected host access to a share, that share will\
        \ not be visible in the share listing.\",\n      \"type\": \"boolean\"\n \
        \   },\n    \"snapshot_directory_mode\": {\n      \"type\": \"string\",\n\
        \      \"enum\": [\n        \"VISIBLE\",\n        \"HIDDEN\",\n        \"\
        DISABLED\"\n      ],\n      \"description\": \"Whether the special .snapshot\
        \ directory should be visible or accessible.:\\n * `DISABLED` - .snapshot\
        \ directories will not be accessible via SMB.,\\n * `HIDDEN` - .snapshot directories\
        \ will not be visible in directory listings, but may be opened by name.,\\\
        n * `VISIBLE` - A .snapshot directory will be visible when listing the root\
        \ directory of a SMB share.\"\n    },\n    \"bypass_traverse_checking\": {\n\
        \      \"description\": \"Skip directory traversal checking for all users.\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"signing_required\": {\n    \
        \  \"description\": \"Requires messages from non-guest users to be signed.\"\
        ,\n      \"type\": \"boolean\"\n    }\n  }\n}"
  patch:
    summary: '[preview] Modify current tenant-specific SMB configuration.'
    parameters:
    - name: id
      description: The tenant ID of the SMB settings.
      required: true
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body:
      schema: "{\n  \"description\": \"api_smb_settings\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"session_encryption\": {\n      \"type\": \"\
        string\",\n      \"enum\": [\n        \"NONE\",\n        \"PREFERRED\",\n\
        \        \"REQUIRED\"\n      ],\n      \"description\": \"Session-level encryption\
        \ setting.:\\n * `NONE` - Do not instruct clients to encrypt SMB traffic.,\\\
        n * `PREFERRED` - Instruct clients to encrypt SMB traffic if they support\
        \ encryption.,\\n * `REQUIRED` - Always instruct clients to encrypt SMB traffic.\
        \ Reject clients who do not support encryption.\"\n    },\n    \"supported_dialects\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"type\": \"\
        string\",\n        \"enum\": [\n          \"SMB2_DIALECT_2_002\",\n      \
        \    \"SMB2_DIALECT_2_1\",\n          \"SMB2_DIALECT_3_0\",\n          \"\
        SMB2_DIALECT_3_11\"\n        ],\n        \"description\": \"supported_dialects:\\\
        n * `SMB2_DIALECT_2_002` - API_SMB2_DIALECT_2_002,\\n * `SMB2_DIALECT_2_1`\
        \ - API_SMB2_DIALECT_2_1,\\n * `SMB2_DIALECT_3_0` - API_SMB2_DIALECT_3_0,\\\
        n * `SMB2_DIALECT_3_11` - API_SMB2_DIALECT_3_11\"\n      }\n    },\n    \"\
        hide_shares_from_unauthorized_users\": {\n      \"description\": \"If share\
        \ permissions deny a logged in user access to a share, that share will not\
        \ be visible in the share listing.\",\n      \"type\": \"boolean\"\n    },\n\
        \    \"hide_shares_from_unauthorized_hosts\": {\n      \"description\": \"\
        If share permissions deny a connected host access to a share, that share will\
        \ not be visible in the share listing.\",\n      \"type\": \"boolean\"\n \
        \   },\n    \"snapshot_directory_mode\": {\n      \"type\": \"string\",\n\
        \      \"enum\": [\n        \"VISIBLE\",\n        \"HIDDEN\",\n        \"\
        DISABLED\"\n      ],\n      \"description\": \"Whether the special .snapshot\
        \ directory should be visible or accessible.:\\n * `DISABLED` - .snapshot\
        \ directories will not be accessible via SMB.,\\n * `HIDDEN` - .snapshot directories\
        \ will not be visible in directory listings, but may be opened by name.,\\\
        n * `VISIBLE` - A .snapshot directory will be visible when listing the root\
        \ directory of a SMB share.\"\n    },\n    \"bypass_traverse_checking\": {\n\
        \      \"description\": \"Skip directory traversal checking for all users.\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"signing_required\": {\n    \
        \  \"description\": \"Requires messages from non-guest users to be signed.\"\
        ,\n      \"type\": \"boolean\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: true
    request_body:
      schema: "{\n  \"description\": \"api_smb_settings_patch\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"session_encryption\": {\n      \"type\": \"\
        string\",\n      \"enum\": [\n        \"NONE\",\n        \"PREFERRED\",\n\
        \        \"REQUIRED\"\n      ],\n      \"description\": \"Session-level encryption\
        \ setting.:\\n * `NONE` - Do not instruct clients to encrypt SMB traffic.,\\\
        n * `PREFERRED` - Instruct clients to encrypt SMB traffic if they support\
        \ encryption.,\\n * `REQUIRED` - Always instruct clients to encrypt SMB traffic.\
        \ Reject clients who do not support encryption.\"\n    },\n    \"supported_dialects\"\
        : {\n      \"type\": \"array\",\n      \"items\": {\n        \"type\": \"\
        string\",\n        \"enum\": [\n          \"SMB2_DIALECT_2_002\",\n      \
        \    \"SMB2_DIALECT_2_1\",\n          \"SMB2_DIALECT_3_0\",\n          \"\
        SMB2_DIALECT_3_11\"\n        ],\n        \"description\": \"supported_dialects:\\\
        n * `SMB2_DIALECT_2_002` - API_SMB2_DIALECT_2_002,\\n * `SMB2_DIALECT_2_1`\
        \ - API_SMB2_DIALECT_2_1,\\n * `SMB2_DIALECT_3_0` - API_SMB2_DIALECT_3_0,\\\
        n * `SMB2_DIALECT_3_11` - API_SMB2_DIALECT_3_11\"\n      }\n    },\n    \"\
        hide_shares_from_unauthorized_users\": {\n      \"description\": \"If share\
        \ permissions deny a logged in user access to a share, that share will not\
        \ be visible in the share listing.\",\n      \"type\": \"boolean\"\n    },\n\
        \    \"hide_shares_from_unauthorized_hosts\": {\n      \"description\": \"\
        If share permissions deny a connected host access to a share, that share will\
        \ not be visible in the share listing.\",\n      \"type\": \"boolean\"\n \
        \   },\n    \"snapshot_directory_mode\": {\n      \"type\": \"string\",\n\
        \      \"enum\": [\n        \"VISIBLE\",\n        \"HIDDEN\",\n        \"\
        DISABLED\"\n      ],\n      \"description\": \"Whether the special .snapshot\
        \ directory should be visible or accessible.:\\n * `DISABLED` - .snapshot\
        \ directories will not be accessible via SMB.,\\n * `HIDDEN` - .snapshot directories\
        \ will not be visible in directory listings, but may be opened by name.,\\\
        n * `VISIBLE` - A .snapshot directory will be visible when listing the root\
        \ directory of a SMB share.\"\n    },\n    \"bypass_traverse_checking\": {\n\
        \      \"description\": \"Skip directory traversal checking for all users.\"\
        ,\n      \"type\": \"boolean\"\n    },\n    \"signing_required\": {\n    \
        \  \"description\": \"Requires messages from non-guest users to be signed.\"\
        ,\n      \"type\": \"boolean\"\n    }\n  }\n}"
  delete:
    summary: '[preview] Delete current SMB configuration, restoring the global settings
      for this tenant.'
    parameters:
    - name: id
      description: The tenant ID of the SMB settings.
      required: true
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: true
rest_endpoint: /v1/multitenancy/smb/settings/{id}
api_version: v1
permalink: /rest-api-guide/smb-multitenancy-methods-v1/multitenancy_smb_settings_id.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/smb-multitenancy-methods/multitenancy_smb_settings_id.html
deprecated: false
---
