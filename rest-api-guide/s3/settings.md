---
category: /s3
methods:
  get:
    parameters: []
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_v1_s3_config\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"enabled\": {\n      \"description\": \"When\
        \ enabled, allows the cluster to make S3 connections.\",\n      \"type\":\
        \ \"boolean\"\n    },\n    \"base_path\": {\n      \"description\": \"The\
        \ default bucket directory prefix for all S3 buckets created without an explicitly\
        \ specified path, for example, by using the CreateBucket API action. You must\
        \ specify this directory as an absolute path.\",\n      \"type\": \"string\"\
        \n    },\n    \"multipart_upload_expiry_interval\": {\n      \"description\"\
        : \"The time period during which the system permits a multipart upload to\
        \ remain unmodified. When this time period elapses, the system considers the\
        \ multipart upload stale and cleans it up automatically. Specify the time\
        \ period in the <quantity><units> format (for example, 5days). Quantity must\
        \ be a positive integer less than 100 and units must be one of the following:\
        \ months, weeks, days, or hours. To disable automatic multipart upload cleanup,\
        \ specify never for quantity and do not specify any units.\",\n      \"type\"\
        : \"string\"\n    },\n    \"secure\": {\n      \"description\": \"If you specify\
        \ true, the S3 server accepts only HTTP connections. By default, the S3 server\
        \ accepts only HTTP connections.\",\n      \"type\": \"boolean\"\n    }\n\
        \  }\n}"
      status_code: '200'
    summary: Retrieve the current S3 server settings.
  patch:
    parameters: []
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_v1_s3_config_patch\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"enabled\": {\n      \"description\": \"When\
        \ enabled, allows the cluster to make S3 connections.\",\n      \"type\":\
        \ \"boolean\"\n    },\n    \"base_path\": {\n      \"description\": \"The\
        \ default bucket directory prefix for all S3 buckets created without an explicitly\
        \ specified path, for example, by using the CreateBucket API action. You must\
        \ specify this directory as an absolute path.\",\n      \"type\": \"string\"\
        \n    },\n    \"multipart_upload_expiry_interval\": {\n      \"description\"\
        : \"The time period during which the system permits a multipart upload to\
        \ remain unmodified. When this time period elapses, the system considers the\
        \ multipart upload stale and cleans it up automatically. Specify the time\
        \ period in the <quantity><units> format (for example, 5days). Quantity must\
        \ be a positive integer less than 100 and units must be one of the following:\
        \ months, weeks, days, or hours. To disable automatic multipart upload cleanup,\
        \ specify never for quantity and do not specify any units.\",\n      \"type\"\
        : \"string\"\n    },\n    \"secure\": {\n      \"description\": \"If you specify\
        \ true, the S3 server accepts only HTTP connections. By default, the S3 server\
        \ accepts only HTTP connections.\",\n      \"type\": \"boolean\"\n    }\n\
        \  }\n}"
    response_body:
      description: Return value on success
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"api_v1_s3_config\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"enabled\": {\n      \"description\": \"When\
        \ enabled, allows the cluster to make S3 connections.\",\n      \"type\":\
        \ \"boolean\"\n    },\n    \"base_path\": {\n      \"description\": \"The\
        \ default bucket directory prefix for all S3 buckets created without an explicitly\
        \ specified path, for example, by using the CreateBucket API action. You must\
        \ specify this directory as an absolute path.\",\n      \"type\": \"string\"\
        \n    },\n    \"multipart_upload_expiry_interval\": {\n      \"description\"\
        : \"The time period during which the system permits a multipart upload to\
        \ remain unmodified. When this time period elapses, the system considers the\
        \ multipart upload stale and cleans it up automatically. Specify the time\
        \ period in the <quantity><units> format (for example, 5days). Quantity must\
        \ be a positive integer less than 100 and units must be one of the following:\
        \ months, weeks, days, or hours. To disable automatic multipart upload cleanup,\
        \ specify never for quantity and do not specify any units.\",\n      \"type\"\
        : \"string\"\n    },\n    \"secure\": {\n      \"description\": \"If you specify\
        \ true, the S3 server accepts only HTTP connections. By default, the S3 server\
        \ accepts only HTTP connections.\",\n      \"type\": \"boolean\"\n    }\n\
        \  }\n}"
      status_code: '200'
    summary: Modify the current S3 server settings.
rest_endpoint: /v1/s3/settings
permalink: /rest-api-guide/s3/settings.html
sidebar: rest_api_guide_sidebar
---
