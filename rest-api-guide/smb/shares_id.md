---
category: /smb
methods:
  delete:
    parameters:
    - description: The unique ID of the SMB share
      name: id
      required: true
    - description: ETag for expected version
      name: If-Match
      required: false
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Delete an SMB share. Not undoable.
  get:
    parameters:
    - description: The unique ID of the SMB share
      name: id
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_smb_share\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"id\": {\n      \"description\": \"The unique ID\
        \ of the SMB share\",\n      \"type\": \"string\"\n    },\n    \"share_name\"\
        : {\n      \"description\": \"The SMB share name\",\n      \"type\": \"string\"\
        \n    },\n    \"fs_path\": {\n      \"description\": \"The filesystem path\
        \ to SMB share\",\n      \"type\": \"string\"\n    },\n    \"description\"\
        : {\n      \"description\": \"Description of this SMB share\",\n      \"type\"\
        : \"string\"\n    },\n    \"read_only\": {\n      \"description\": \"Sets\
        \ the SMB share to read-only\",\n      \"type\": \"boolean\"\n    },\n   \
        \ \"allow_guest_access\": {\n      \"description\": \"Allows guest access\
        \ to this SMB share\",\n      \"type\": \"boolean\"\n    },\n    \"access_based_enumeration_enabled\"\
        : {\n      \"description\": \"Enable Access-based Enumeration on this SMB\
        \ share\",\n      \"type\": \"boolean\"\n    },\n    \"default_file_create_mode\"\
        : {\n      \"description\": \"Default POSIX file create mode bits on this\
        \ SMB share (octal, default 0644 if this field is empty)\",\n      \"type\"\
        : \"string\"\n    },\n    \"default_directory_create_mode\": {\n      \"description\"\
        : \"Default POSIX directory create mode bits on this SMB share (octal, default\
        \ 0755 if this field is empty)\",\n      \"type\": \"string\"\n    },\n  \
        \  \"tenant_id\": {\n      \"description\": \"The tenant ID of the tenant\
        \ that the SMB share is a part of\",\n      \"type\": \"number\"\n    }\n\
        \  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Retrieve the specified SMB share. Refer to the 'Modify SMB share' method
      for a description of the returned fields.
  put:
    parameters:
    - description: The unique ID of the SMB share
      name: id
      required: true
    - description: Specifies whether the file system path can be created if it does
        not already exist.
      name: allow-fs-path-create
      required: false
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"api_smb_share\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"id\": {\n      \"description\": \"The unique ID\
        \ of the SMB share\",\n      \"type\": \"string\"\n    },\n    \"share_name\"\
        : {\n      \"description\": \"The SMB share name\",\n      \"type\": \"string\"\
        \n    },\n    \"fs_path\": {\n      \"description\": \"The filesystem path\
        \ to SMB share\",\n      \"type\": \"string\"\n    },\n    \"description\"\
        : {\n      \"description\": \"Description of this SMB share\",\n      \"type\"\
        : \"string\"\n    },\n    \"read_only\": {\n      \"description\": \"Sets\
        \ the SMB share to read-only\",\n      \"type\": \"boolean\"\n    },\n   \
        \ \"allow_guest_access\": {\n      \"description\": \"Allows guest access\
        \ to this SMB share\",\n      \"type\": \"boolean\"\n    },\n    \"access_based_enumeration_enabled\"\
        : {\n      \"description\": \"Enable Access-based Enumeration on this SMB\
        \ share\",\n      \"type\": \"boolean\"\n    },\n    \"default_file_create_mode\"\
        : {\n      \"description\": \"Default POSIX file create mode bits on this\
        \ SMB share (octal, default 0644 if this field is empty)\",\n      \"type\"\
        : \"string\"\n    },\n    \"default_directory_create_mode\": {\n      \"description\"\
        : \"Default POSIX directory create mode bits on this SMB share (octal, default\
        \ 0755 if this field is empty)\",\n      \"type\": \"string\"\n    },\n  \
        \  \"tenant_id\": {\n      \"description\": \"The tenant ID of the tenant\
        \ that the SMB share is a part of\",\n      \"type\": \"number\"\n    }\n\
        \  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_smb_share\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"id\": {\n      \"description\": \"The unique ID\
        \ of the SMB share\",\n      \"type\": \"string\"\n    },\n    \"share_name\"\
        : {\n      \"description\": \"The SMB share name\",\n      \"type\": \"string\"\
        \n    },\n    \"fs_path\": {\n      \"description\": \"The filesystem path\
        \ to SMB share\",\n      \"type\": \"string\"\n    },\n    \"description\"\
        : {\n      \"description\": \"Description of this SMB share\",\n      \"type\"\
        : \"string\"\n    },\n    \"read_only\": {\n      \"description\": \"Sets\
        \ the SMB share to read-only\",\n      \"type\": \"boolean\"\n    },\n   \
        \ \"allow_guest_access\": {\n      \"description\": \"Allows guest access\
        \ to this SMB share\",\n      \"type\": \"boolean\"\n    },\n    \"access_based_enumeration_enabled\"\
        : {\n      \"description\": \"Enable Access-based Enumeration on this SMB\
        \ share\",\n      \"type\": \"boolean\"\n    },\n    \"default_file_create_mode\"\
        : {\n      \"description\": \"Default POSIX file create mode bits on this\
        \ SMB share (octal, default 0644 if this field is empty)\",\n      \"type\"\
        : \"string\"\n    },\n    \"default_directory_create_mode\": {\n      \"description\"\
        : \"Default POSIX directory create mode bits on this SMB share (octal, default\
        \ 0755 if this field is empty)\",\n      \"type\": \"string\"\n    },\n  \
        \  \"tenant_id\": {\n      \"description\": \"The tenant ID of the tenant\
        \ that the SMB share is a part of\",\n      \"type\": \"number\"\n    }\n\
        \  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Modify an SMB share's options.
rest_endpoint: /v1/smb/shares/{id}
permalink: /rest-api-guide/smb/shares_id.html
sidebar: rest_api_guide_sidebar
---
