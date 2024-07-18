---
category: /web-ui
methods:
  get:
    parameters: []
    response_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"web_ui_settings\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"inactivity_timeout\": {\n      \"description\"\
        : \"When set, the Web UI logs out users after they are inactive for the specified\
        \ time duration.\",\n      \"type\": \"object\",\n      \"properties\": {\n\
        \        \"nanoseconds\": {\n          \"description\": \"nanoseconds\",\n\
        \          \"type\": \"string\"\n        }\n      }\n    },\n    \"login_banner\"\
        : {\n      \"description\": \"When set, the Web UI shows a banner with the\
        \ specified Markdown string on the login screen.\",\n      \"type\": \"string\"\
        \n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Return settings (such as the inactivity timeout) that the Web UI uses.
      Because the Web UI can apply these settings before the user logs in, this method
      doesn't require authentication.
  patch:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"web_ui_settings_patch\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"inactivity_timeout\": {\n      \"description\"\
        : \"When set, the Web UI logs out users after they are inactive for the specified\
        \ time duration.\",\n      \"type\": \"object\",\n      \"properties\": {\n\
        \        \"nanoseconds\": {\n          \"description\": \"nanoseconds\",\n\
        \          \"type\": \"string\"\n        }\n      }\n    },\n    \"login_banner\"\
        : {\n      \"description\": \"When set, the Web UI shows a banner with the\
        \ specified Markdown string on the login screen.\",\n      \"type\": \"string\"\
        \n    }\n  }\n}"
    response_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"web_ui_settings\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"inactivity_timeout\": {\n      \"description\"\
        : \"When set, the Web UI logs out users after they are inactive for the specified\
        \ time duration.\",\n      \"type\": \"object\",\n      \"properties\": {\n\
        \        \"nanoseconds\": {\n          \"description\": \"nanoseconds\",\n\
        \          \"type\": \"string\"\n        }\n      }\n    },\n    \"login_banner\"\
        : {\n      \"description\": \"When set, the Web UI shows a banner with the\
        \ specified Markdown string on the login screen.\",\n      \"type\": \"string\"\
        \n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Replace individual Web UI settings. These settings take effect immediately
      for new Web UI sessions.
  put:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"web_ui_settings\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"inactivity_timeout\": {\n      \"description\"\
        : \"When set, the Web UI logs out users after they are inactive for the specified\
        \ time duration.\",\n      \"type\": \"object\",\n      \"properties\": {\n\
        \        \"nanoseconds\": {\n          \"description\": \"nanoseconds\",\n\
        \          \"type\": \"string\"\n        }\n      }\n    },\n    \"login_banner\"\
        : {\n      \"description\": \"When set, the Web UI shows a banner with the\
        \ specified Markdown string on the login screen.\",\n      \"type\": \"string\"\
        \n    }\n  }\n}"
    response_body:
      example_value: '"TO DO"'
      schema: "{\n  \"description\": \"web_ui_settings\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"inactivity_timeout\": {\n      \"description\"\
        : \"When set, the Web UI logs out users after they are inactive for the specified\
        \ time duration.\",\n      \"type\": \"object\",\n      \"properties\": {\n\
        \        \"nanoseconds\": {\n          \"description\": \"nanoseconds\",\n\
        \          \"type\": \"string\"\n        }\n      }\n    },\n    \"login_banner\"\
        : {\n      \"description\": \"When set, the Web UI shows a banner with the\
        \ specified Markdown string on the login screen.\",\n      \"type\": \"string\"\
        \n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Replace all the settings that the Web UI uses. These settings take effect
      immediately for new UI sessions.
rest_endpoint: /v1/web-ui/settings
permalink: /rest-api-guide/web-ui/settings.html
sidebar: rest_api_guide_sidebar
---
