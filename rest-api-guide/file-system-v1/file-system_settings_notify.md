---
category: /File System V1
methods:
  get:
    summary: Get FS notify related settings.
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"fs_notify_config\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"recursive_mode\": {\n      \"type\": \"string\"\
        ,\n      \"enum\": [\n        \"DISABLED_ERROR\",\n        \"DISABLED_IGNORE\"\
        ,\n        \"ENABLED\"\n      ],\n      \"description\": \"recursive_mode:\\\
        n * `DISABLED_ERROR` - Recursive change-notify requests return errors immediately.,\\\
        n * `DISABLED_IGNORE` - The system accepts recursive change-notify requests\
        \ but sends notifications only for the top directory that it watches. In other\
        \ words, the system behaves as if the user doesn't specify the recursive flag.\
        \ You can use this setting to improve compatibility with applications that\
        \ request recursive behavior but don't actually depend on it. Important: For\
        \ scenarios that require recursive behavior, this setting can cause an application\
        \ to become unresponsive or exhibit other unexpected behavior.,\\n * `ENABLED`\
        \ - The ENABLED option is the default mode, unless you set a different one.\
        \ This option provides full support for recursive change-notify requests.\
        \ The system pushes notifications for all descendants of the watched directory\
        \ to the watcher. Important: This configuration can affect system performance\
        \ significantly. For example, watching the root of the file system creates\
        \ a notification for every change on the entire cluster.\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
  put:
    summary: Set FS notify related settings.
    parameters:
    - name: If-Match
      description: ETag for expected version
      required: false
    response_body:
      schema: "{\n  \"description\": \"fs_notify_config\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"recursive_mode\": {\n      \"type\": \"string\"\
        ,\n      \"enum\": [\n        \"DISABLED_ERROR\",\n        \"DISABLED_IGNORE\"\
        ,\n        \"ENABLED\"\n      ],\n      \"description\": \"recursive_mode:\\\
        n * `DISABLED_ERROR` - Recursive change-notify requests return errors immediately.,\\\
        n * `DISABLED_IGNORE` - The system accepts recursive change-notify requests\
        \ but sends notifications only for the top directory that it watches. In other\
        \ words, the system behaves as if the user doesn't specify the recursive flag.\
        \ You can use this setting to improve compatibility with applications that\
        \ request recursive behavior but don't actually depend on it. Important: For\
        \ scenarios that require recursive behavior, this setting can cause an application\
        \ to become unresponsive or exhibit other unexpected behavior.,\\n * `ENABLED`\
        \ - The ENABLED option is the default mode, unless you set a different one.\
        \ This option provides full support for recursive change-notify requests.\
        \ The system pushes notifications for all descendants of the watched directory\
        \ to the watcher. Important: This configuration can affect system performance\
        \ significantly. For example, watching the root of the file system creates\
        \ a notification for every change on the entire cluster.\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"fs_notify_config\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"recursive_mode\": {\n      \"type\": \"string\"\
        ,\n      \"enum\": [\n        \"DISABLED_ERROR\",\n        \"DISABLED_IGNORE\"\
        ,\n        \"ENABLED\"\n      ],\n      \"description\": \"recursive_mode:\\\
        n * `DISABLED_ERROR` - Recursive change-notify requests return errors immediately.,\\\
        n * `DISABLED_IGNORE` - The system accepts recursive change-notify requests\
        \ but sends notifications only for the top directory that it watches. In other\
        \ words, the system behaves as if the user doesn't specify the recursive flag.\
        \ You can use this setting to improve compatibility with applications that\
        \ request recursive behavior but don't actually depend on it. Important: For\
        \ scenarios that require recursive behavior, this setting can cause an application\
        \ to become unresponsive or exhibit other unexpected behavior.,\\n * `ENABLED`\
        \ - The ENABLED option is the default mode, unless you set a different one.\
        \ This option provides full support for recursive change-notify requests.\
        \ The system pushes notifications for all descendants of the watched directory\
        \ to the watcher. Important: This configuration can affect system performance\
        \ significantly. For example, watching the root of the file system creates\
        \ a notification for every change on the entire cluster.\"\n    }\n  }\n}"
rest_endpoint: /v1/file-system/settings/notify
api_version: v1
permalink: /rest-api-guide/file-system-v1/file-system_settings_notify.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/file-system/file-system_settings_notify.html
deprecated: false
---
