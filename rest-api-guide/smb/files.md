---
category: /smb
methods:
  get:
    parameters:
    - description: File ID (uint64). Limits result to handles on the specified file.
      name: file_number
      required: false
    - description: Includes the paths to each file in the results. Resolving many
        paths can be slow.
      name: resolve_paths
      required: false
    - description: Return entries after the given key (keys are returned in the paging
        object)
      name: after
      required: false
    - description: Return no more than this many entries; the system may choose a
        smaller limit.
      name: limit
      required: false
    response_body:
      schema: "{\n  \"description\": \"api_smb_files_get_response\",\n  \"type\":\
        \ \"object\",\n  \"properties\": {\n    \"file_handles\": {\n      \"type\"\
        : \"array\",\n      \"items\": {\n        \"description\": \"file_handles\"\
        ,\n        \"type\": \"object\",\n        \"properties\": {\n          \"\
        file_number\": {\n            \"description\": \"file_number\",\n        \
        \    \"type\": \"string\"\n          },\n          \"handle_info\": {\n  \
        \          \"description\": \"handle_info\",\n            \"type\": \"object\"\
        ,\n            \"properties\": {\n              \"location\": {\n        \
        \        \"description\": \"location\",\n                \"type\": \"string\"\
        \n              },\n              \"version\": {\n                \"description\"\
        : \"version\",\n                \"type\": \"number\"\n              },\n \
        \             \"num_byte_range_locks\": {\n                \"description\"\
        : \"num_byte_range_locks\",\n                \"type\": \"number\"\n      \
        \        },\n              \"access_mask\": {\n                \"description\"\
        : \"access_mask\",\n                \"type\": \"array\",\n               \
        \ \"items\": {\n                  \"type\": \"string\",\n                \
        \  \"enum\": [\n                    \"MS_ACCESS_FILE_READ_DATA\",\n      \
        \              \"MS_ACCESS_FILE_WRITE_DATA\",\n                    \"MS_ACCESS_FILE_APPEND_DATA\"\
        ,\n                    \"MS_ACCESS_FILE_EXECUTE\",\n                    \"\
        MS_ACCESS_FILE_LIST_DIRECTORY\",\n                    \"MS_ACCESS_FILE_ADD_FILE\"\
        ,\n                    \"MS_ACCESS_FILE_ADD_SUBDIRECTORY\",\n            \
        \        \"MS_ACCESS_FILE_TRAVERSE\",\n                    \"MS_ACCESS_FILE_READ_EA\"\
        ,\n                    \"MS_ACCESS_FILE_WRITE_EA\",\n                    \"\
        MS_ACCESS_FILE_DELETE_CHILD\",\n                    \"MS_ACCESS_FILE_READ_ATTRIBUTES\"\
        ,\n                    \"MS_ACCESS_FILE_WRITE_ATTRIBUTES\",\n            \
        \        \"MS_ACCESS_OBJECT_SPECIFIC_9\",\n                    \"MS_ACCESS_OBJECT_SPECIFIC_10\"\
        ,\n                    \"MS_ACCESS_OBJECT_SPECIFIC_11\",\n               \
        \     \"MS_ACCESS_OBJECT_SPECIFIC_12\",\n                    \"MS_ACCESS_OBJECT_SPECIFIC_13\"\
        ,\n                    \"MS_ACCESS_OBJECT_SPECIFIC_14\",\n               \
        \     \"MS_ACCESS_OBJECT_SPECIFIC_15\",\n                    \"MS_ACCESS_DELETE\"\
        ,\n                    \"MS_ACCESS_READ_CONTROL\",\n                    \"\
        MS_ACCESS_WRITE_DAC\",\n                    \"MS_ACCESS_WRITE_OWNER\",\n \
        \                   \"MS_ACCESS_SYNCHRONIZE\",\n                    \"MS_ACCESS_SYSTEM_SECURITY\"\
        ,\n                    \"MS_ACCESS_MAXIMUM_ALLOWED\",\n                  \
        \  \"MS_ACCESS_GENERIC_ALL\",\n                    \"MS_ACCESS_GENERIC_EXECUTE\"\
        ,\n                    \"MS_ACCESS_GENERIC_WRITE\",\n                    \"\
        MS_ACCESS_GENERIC_READ\",\n                    \"MS_ACCESS_FILE_ALL\"\n  \
        \                ],\n                  \"description\": \"access_mask:\\n\
        \ * `MS_ACCESS_DELETE` - MS_ACCESS_DELETE,\\n * `MS_ACCESS_FILE_ADD_FILE`\
        \ - MS_ACCESS_FILE_ADD_FILE,\\n * `MS_ACCESS_FILE_ADD_SUBDIRECTORY` - MS_ACCESS_FILE_ADD_SUBDIRECTORY,\\\
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
        n * `MS_ACCESS_WRITE_OWNER` - MS_ACCESS_WRITE_OWNER\"\n                }\n\
        \              },\n              \"owner\": {\n                \"description\"\
        : \"owner\",\n                \"type\": \"string\"\n              },\n   \
        \           \"path\": {\n                \"description\": \"path\",\n    \
        \            \"type\": \"string\"\n              }\n            }\n      \
        \    }\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Enumerate open file handles
rest_endpoint: /v1/smb/files/
api_version: v1
permalink: /rest-api-guide/smb/files.html
sidebar: rest_api_guide_sidebar
---
