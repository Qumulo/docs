---
category: /smb
methods:
  post:
    parameters: []
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_file_handle\",\n    \"type\": \"object\",\n    \"properties\": {\n   \
        \   \"file_number\": {\n        \"description\": \"file_number\",\n      \
        \  \"type\": \"string\"\n      },\n      \"handle_info\": {\n        \"description\"\
        : \"handle_info\",\n        \"type\": \"object\",\n        \"properties\"\
        : {\n          \"location\": {\n            \"description\": \"location\"\
        ,\n            \"type\": \"string\"\n          },\n          \"version\":\
        \ {\n            \"description\": \"version\",\n            \"type\": \"number\"\
        \n          },\n          \"num_byte_range_locks\": {\n            \"description\"\
        : \"num_byte_range_locks\",\n            \"type\": \"number\"\n          },\n\
        \          \"access_mask\": {\n            \"description\": \"access_mask\"\
        ,\n            \"type\": \"array\",\n            \"items\": {\n          \
        \    \"type\": \"string\",\n              \"enum\": [\n                \"\
        MS_ACCESS_FILE_READ_DATA\",\n                \"MS_ACCESS_FILE_WRITE_DATA\"\
        ,\n                \"MS_ACCESS_FILE_APPEND_DATA\",\n                \"MS_ACCESS_FILE_EXECUTE\"\
        ,\n                \"MS_ACCESS_FILE_LIST_DIRECTORY\",\n                \"\
        MS_ACCESS_FILE_ADD_FILE\",\n                \"MS_ACCESS_FILE_ADD_SUBDIRECTORY\"\
        ,\n                \"MS_ACCESS_FILE_TRAVERSE\",\n                \"MS_ACCESS_FILE_READ_EA\"\
        ,\n                \"MS_ACCESS_FILE_WRITE_EA\",\n                \"MS_ACCESS_FILE_DELETE_CHILD\"\
        ,\n                \"MS_ACCESS_FILE_READ_ATTRIBUTES\",\n                \"\
        MS_ACCESS_FILE_WRITE_ATTRIBUTES\",\n                \"MS_ACCESS_OBJECT_SPECIFIC_9\"\
        ,\n                \"MS_ACCESS_OBJECT_SPECIFIC_10\",\n                \"MS_ACCESS_OBJECT_SPECIFIC_11\"\
        ,\n                \"MS_ACCESS_OBJECT_SPECIFIC_12\",\n                \"MS_ACCESS_OBJECT_SPECIFIC_13\"\
        ,\n                \"MS_ACCESS_OBJECT_SPECIFIC_14\",\n                \"MS_ACCESS_OBJECT_SPECIFIC_15\"\
        ,\n                \"MS_ACCESS_DELETE\",\n                \"MS_ACCESS_READ_CONTROL\"\
        ,\n                \"MS_ACCESS_WRITE_DAC\",\n                \"MS_ACCESS_WRITE_OWNER\"\
        ,\n                \"MS_ACCESS_SYNCHRONIZE\",\n                \"MS_ACCESS_SYSTEM_SECURITY\"\
        ,\n                \"MS_ACCESS_MAXIMUM_ALLOWED\",\n                \"MS_ACCESS_GENERIC_ALL\"\
        ,\n                \"MS_ACCESS_GENERIC_EXECUTE\",\n                \"MS_ACCESS_GENERIC_WRITE\"\
        ,\n                \"MS_ACCESS_GENERIC_READ\",\n                \"MS_ACCESS_FILE_ALL\"\
        \n              ],\n              \"description\": \"access_mask:\\n * `MS_ACCESS_DELETE`\
        \ - MS_ACCESS_DELETE,\\n * `MS_ACCESS_FILE_ADD_FILE` - MS_ACCESS_FILE_ADD_FILE,\\\
        n * `MS_ACCESS_FILE_ADD_SUBDIRECTORY` - MS_ACCESS_FILE_ADD_SUBDIRECTORY,\\\
        n * `MS_ACCESS_FILE_ALL` - MS_ACCESS_FILE_ALL,\\n * `MS_ACCESS_FILE_APPEND_DATA`\
        \ - MS_ACCESS_FILE_APPEND_DATA,\\n * `MS_ACCESS_FILE_DELETE_CHILD` - MS_ACCESS_FILE_DELETE_CHILD,\\\
        n * `MS_ACCESS_FILE_EXECUTE` - MS_ACCESS_FILE_EXECUTE,\\n * `MS_ACCESS_FILE_LIST_DIRECTORY`\
        \ - MS_ACCESS_FILE_LIST_DIRECTORY,\\n * `MS_ACCESS_FILE_READ_ATTRIBUTES` -\
        \ MS_ACCESS_FILE_READ_ATTRIBUTES,\\n * `MS_ACCESS_FILE_READ_DATA` - MS_ACCESS_FILE_READ_DATA,\\\
        n * `MS_ACCESS_FILE_READ_EA` - MS_ACCESS_FILE_READ_EA,\\n * `MS_ACCESS_FILE_TRAVERSE`\
        \ - MS_ACCESS_FILE_TRAVERSE,\\n * `MS_ACCESS_FILE_WRITE_ATTRIBUTES` - MS_ACCESS_FILE_WRITE_ATTRIBUTES,\\\
        n * `MS_ACCESS_FILE_WRITE_DATA` - MS_ACCESS_FILE_WRITE_DATA,\\n * `MS_ACCESS_FILE_WRITE_EA`\
        \ - MS_ACCESS_FILE_WRITE_EA,\\n * `MS_ACCESS_GENERIC_ALL` - MS_ACCESS_GENERIC_ALL,\\\
        n * `MS_ACCESS_GENERIC_EXECUTE` - MS_ACCESS_GENERIC_EXECUTE,\\n * `MS_ACCESS_GENERIC_READ`\
        \ - MS_ACCESS_GENERIC_READ,\\n * `MS_ACCESS_GENERIC_WRITE` - MS_ACCESS_GENERIC_WRITE,\\\
        n * `MS_ACCESS_MAXIMUM_ALLOWED` - MS_ACCESS_MAXIMUM_ALLOWED,\\n * `MS_ACCESS_OBJECT_SPECIFIC_10`\
        \ - MS_ACCESS_OBJECT_SPECIFIC_10,\\n * `MS_ACCESS_OBJECT_SPECIFIC_11` - MS_ACCESS_OBJECT_SPECIFIC_11,\\\
        n * `MS_ACCESS_OBJECT_SPECIFIC_12` - MS_ACCESS_OBJECT_SPECIFIC_12,\\n * `MS_ACCESS_OBJECT_SPECIFIC_13`\
        \ - MS_ACCESS_OBJECT_SPECIFIC_13,\\n * `MS_ACCESS_OBJECT_SPECIFIC_14` - MS_ACCESS_OBJECT_SPECIFIC_14,\\\
        n * `MS_ACCESS_OBJECT_SPECIFIC_15` - MS_ACCESS_OBJECT_SPECIFIC_15,\\n * `MS_ACCESS_OBJECT_SPECIFIC_9`\
        \ - MS_ACCESS_OBJECT_SPECIFIC_9,\\n * `MS_ACCESS_READ_CONTROL` - MS_ACCESS_READ_CONTROL,\\\
        n * `MS_ACCESS_SYNCHRONIZE` - MS_ACCESS_SYNCHRONIZE,\\n * `MS_ACCESS_SYSTEM_SECURITY`\
        \ - MS_ACCESS_SYSTEM_SECURITY,\\n * `MS_ACCESS_WRITE_DAC` - MS_ACCESS_WRITE_DAC,\\\
        n * `MS_ACCESS_WRITE_OWNER` - MS_ACCESS_WRITE_OWNER\"\n            }\n   \
        \       },\n          \"owner\": {\n            \"description\": \"owner\"\
        ,\n            \"type\": \"string\"\n          },\n          \"path\": {\n\
        \            \"description\": \"path\",\n            \"type\": \"string\"\n\
        \          }\n        }\n      }\n    }\n  }\n}"
    response_body:
      example_value: '"TO DO"'
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_smb2_file_close_result\",\n    \"type\": \"object\",\n    \"properties\"\
        : {\n      \"error_message\": {\n        \"description\": \"error_message\"\
        ,\n        \"type\": \"string\"\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: The request body must contain a list of file handles to close, as returned
      from GET /v1/smb/files. Fields other than 'location' are ignored.
rest_endpoint: /v1/smb/files/close
permalink: /rest-api-guide/smb/files_close.html
sidebar: rest_api_guide_sidebar
---
