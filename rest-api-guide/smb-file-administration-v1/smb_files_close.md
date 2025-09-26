---
category: /SMB File Administration V1
methods:
  post:
    summary: The request body must contain a list of file handles to close, as returned
      from GET /v1/smb/files. Fields other than 'location' are ignored.
    parameters: []
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_smb2_file_close_result\",\n    \"type\": \"object\",\n    \"properties\"\
        : {\n      \"error_message\": {\n        \"description\": \"error_message\"\
        ,\n        \"type\": \"string\"\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_smb2_close_file_handle\",\n    \"type\": \"object\",\n    \"properties\"\
        : {\n      \"handle_info\": {\n        \"description\": \"handle_info\",\n\
        \        \"type\": \"object\",\n        \"properties\": {\n          \"location\"\
        : {\n            \"description\": \"location\",\n            \"type\": \"\
        string\"\n          }\n        }\n      }\n    }\n  }\n}"
rest_endpoint: /v1/smb/files/close
api_version: v1
permalink: /rest-api-guide/smb-file-administration-v1/smb_files_close.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/smb-file-administration/smb_files_close.html
---
