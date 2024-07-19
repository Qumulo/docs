---
category: /replication
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"type\": \"array\",\n  \"items\": {\n    \"description\": \"\
        api_object_relationship_v3\",\n    \"type\": \"object\",\n    \"properties\"\
        : {\n      \"id\": {\n        \"description\": \"Unique identifier of the\
        \ replication relationship\",\n        \"type\": \"string\"\n      },\n  \
        \    \"direction\": {\n        \"type\": \"string\",\n        \"enum\": [\n\
        \          \"COPY_TO_OBJECT\",\n          \"COPY_FROM_OBJECT\"\n        ],\n\
        \        \"description\": \"The object relationship can either copy data to\
        \ or from the object store:\\n * `COPY_FROM_OBJECT` - COPY_FROM_OBJECT,\\\
        n * `COPY_TO_OBJECT` - COPY_TO_OBJECT\"\n      },\n      \"local_directory_id\"\
        : {\n        \"description\": \"File ID of the qumulo directory\",\n     \
        \   \"type\": \"string\"\n      },\n      \"object_store_address\": {\n  \
        \      \"description\": \"S3-compatible server address\",\n        \"type\"\
        : \"string\"\n      },\n      \"port\": {\n        \"description\": \"HTTPS\
        \ port to use when communicating with the object store\",\n        \"type\"\
        : \"number\"\n      },\n      \"ca_certificate\": {\n        \"description\"\
        : \"Public certificate of the certificate authority to trust for connections\
        \ to the object store, in PEM format. If empty, the built-in trusted public\
        \ CAs are used.\",\n        \"type\": \"string\"\n      },\n      \"bucket\"\
        : {\n        \"description\": \"Bucket in the object store to use\",\n   \
        \     \"type\": \"string\"\n      },\n      \"bucket_style\": {\n        \"\
        type\": \"string\",\n        \"enum\": [\n          \"BUCKET_STYLE_PATH\"\
        ,\n          \"BUCKET_STYLE_VIRTUAL_HOSTED\"\n        ],\n        \"description\"\
        : \"Addressing style for requests to the bucket. BUCKET_STYLE_PATH indicates\
        \ path-style addressing while BUCKET_STYLE_VIRTUAL_HOSTED indicates virtual\
        \ hosted-style.:\\n * `BUCKET_STYLE_PATH` - BUCKET_STYLE_PATH,\\n * `BUCKET_STYLE_VIRTUAL_HOSTED`\
        \ - BUCKET_STYLE_VIRTUAL_HOSTED\"\n      },\n      \"object_folder\": {\n\
        \        \"description\": \"Folder in the object store bucket to use\",\n\
        \        \"type\": \"string\"\n      },\n      \"region\": {\n        \"description\"\
        : \"Region the bucket is located in\",\n        \"type\": \"string\"\n   \
        \   },\n      \"access_key_id\": {\n        \"description\": \"Access key\
        \ ID to use when communicating with the object store\",\n        \"type\"\
        : \"string\"\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: List existing object replication relationships.
  post:
    parameters: []
    request_body:
      schema: "{\n  \"description\": \"api_object_create_request_v3\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"direction\": {\n      \"type\":\
        \ \"string\",\n      \"enum\": [\n        \"COPY_TO_OBJECT\",\n        \"\
        COPY_FROM_OBJECT\"\n      ],\n      \"description\": \"Whether data is to\
        \ be copied to, or from, the object store:\\n * `COPY_FROM_OBJECT` - COPY_FROM_OBJECT,\\\
        n * `COPY_TO_OBJECT` - COPY_TO_OBJECT\"\n    },\n    \"local_directory_id\"\
        : {\n      \"description\": \"File ID of the qumulo directory if local_directory_path\
        \ is not provided\",\n      \"type\": \"string\"\n    },\n    \"local_directory_path\"\
        : {\n      \"description\": \"Path of the qumulo directory if local_directory_id\
        \ is not provided\",\n      \"type\": \"string\"\n    },\n    \"object_store_address\"\
        : {\n      \"description\": \"S3-compatible server address. For Amazon S3,\
        \ use s3.<region>.amazonaws.com (e.g., s3.us-west-2.amazonaws.com).\",\n \
        \     \"type\": \"string\"\n    },\n    \"port\": {\n      \"description\"\
        : \"HTTPS port to use when communicating with the object store (default: 443)\"\
        ,\n      \"type\": \"number\"\n    },\n    \"ca_certificate\": {\n      \"\
        description\": \"Public certificate of the certificate authority to trust\
        \ for connections to the object store, in PEM format (defaults to built-in\
        \ trusted public CAs)\",\n      \"type\": \"string\"\n    },\n    \"bucket\"\
        : {\n      \"description\": \"Bucket in the object store to use for this relationship\"\
        ,\n      \"type\": \"string\"\n    },\n    \"bucket_style\": {\n      \"type\"\
        : \"string\",\n      \"enum\": [\n        \"BUCKET_STYLE_PATH\",\n       \
        \ \"BUCKET_STYLE_VIRTUAL_HOSTED\"\n      ],\n      \"description\": \"Addressing\
        \ style for requests to the bucket. Set to BUCKET_STYLE_PATH for path-style\
        \ addressing or BUCKET_STYLE_VIRTUAL_HOSTED for virtual hosted-style (the\
        \ default). For Amazon S3, virtual hosted-style is recommended as path-style\
        \ is deprecated. Bucket names containing dots ('.') or characters that are\
        \ not valid in domain names may require path-style. The object_store_address\
        \ should not include the bucket name, regardless of addressing style.:\\n\
        \ * `BUCKET_STYLE_PATH` - BUCKET_STYLE_PATH,\\n * `BUCKET_STYLE_VIRTUAL_HOSTED`\
        \ - BUCKET_STYLE_VIRTUAL_HOSTED\"\n    },\n    \"object_folder\": {\n    \
        \  \"description\": \"Folder to use in the object store bucket. A slash separator\
        \ is automatically used to specify a 'folder' in a bucket. For example, a\
        \ folder of 'example' and a file path (relative to the directory_path) of\
        \ 'dir/file' will result in key 'example/dir/file'. Use empty value '' or\
        \ '/' to replicate with the root of the bucket.\",\n      \"type\": \"string\"\
        \n    },\n    \"region\": {\n      \"description\": \"Region the bucket is\
        \ located in\",\n      \"type\": \"string\"\n    },\n    \"access_key_id\"\
        : {\n      \"description\": \"Access key ID to use when communicating with\
        \ the object store\",\n      \"type\": \"string\"\n    },\n    \"secret_access_key\"\
        : {\n      \"description\": \"Secret access key to use when communicating\
        \ with the object store\",\n      \"type\": \"string\",\n      \"format\"\
        : \"password\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_object_relationship_v3\",\n  \"type\":\
        \ \"object\",\n  \"properties\": {\n    \"id\": {\n      \"description\":\
        \ \"Unique identifier of the replication relationship\",\n      \"type\":\
        \ \"string\"\n    },\n    \"direction\": {\n      \"type\": \"string\",\n\
        \      \"enum\": [\n        \"COPY_TO_OBJECT\",\n        \"COPY_FROM_OBJECT\"\
        \n      ],\n      \"description\": \"The object relationship can either copy\
        \ data to or from the object store:\\n * `COPY_FROM_OBJECT` - COPY_FROM_OBJECT,\\\
        n * `COPY_TO_OBJECT` - COPY_TO_OBJECT\"\n    },\n    \"local_directory_id\"\
        : {\n      \"description\": \"File ID of the qumulo directory\",\n      \"\
        type\": \"string\"\n    },\n    \"object_store_address\": {\n      \"description\"\
        : \"S3-compatible server address\",\n      \"type\": \"string\"\n    },\n\
        \    \"port\": {\n      \"description\": \"HTTPS port to use when communicating\
        \ with the object store\",\n      \"type\": \"number\"\n    },\n    \"ca_certificate\"\
        : {\n      \"description\": \"Public certificate of the certificate authority\
        \ to trust for connections to the object store, in PEM format. If empty, the\
        \ built-in trusted public CAs are used.\",\n      \"type\": \"string\"\n \
        \   },\n    \"bucket\": {\n      \"description\": \"Bucket in the object store\
        \ to use\",\n      \"type\": \"string\"\n    },\n    \"bucket_style\": {\n\
        \      \"type\": \"string\",\n      \"enum\": [\n        \"BUCKET_STYLE_PATH\"\
        ,\n        \"BUCKET_STYLE_VIRTUAL_HOSTED\"\n      ],\n      \"description\"\
        : \"Addressing style for requests to the bucket. BUCKET_STYLE_PATH indicates\
        \ path-style addressing while BUCKET_STYLE_VIRTUAL_HOSTED indicates virtual\
        \ hosted-style.:\\n * `BUCKET_STYLE_PATH` - BUCKET_STYLE_PATH,\\n * `BUCKET_STYLE_VIRTUAL_HOSTED`\
        \ - BUCKET_STYLE_VIRTUAL_HOSTED\"\n    },\n    \"object_folder\": {\n    \
        \  \"description\": \"Folder in the object store bucket to use\",\n      \"\
        type\": \"string\"\n    },\n    \"region\": {\n      \"description\": \"Region\
        \ the bucket is located in\",\n      \"type\": \"string\"\n    },\n    \"\
        access_key_id\": {\n      \"description\": \"Access key ID to use when communicating\
        \ with the object store\",\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Create a new object replication relationship. Replication will automatically
      start after the relationship is created.
rest_endpoint: /v3/replication/object-relationships/
permalink: /rest-api-guide/replication/v3_object-relationships.html
sidebar: rest_api_guide_sidebar
---
