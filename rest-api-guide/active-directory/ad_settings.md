---
category: /Active Directory
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"ad_settings\",\n  \"type\": \"object\",\n \
        \ \"properties\": {\n    \"signing\": {\n      \"type\": \"string\",\n   \
        \   \"enum\": [\n        \"NO_SIGNING\",\n        \"WANT_SIGNING\",\n    \
        \    \"REQUIRE_SIGNING\"\n      ],\n      \"description\": \"Setting for DCERPC\
        \ signing; only use if sealing is not negotiated:\\n * `NO_SIGNING` - Do not\
        \ use DCERPC signing.,\\n * `REQUIRE_SIGNING` - Require the use of DCERPC\
        \ signing.,\\n * `WANT_SIGNING` - Prefer to use DCERPC signing; allow server\
        \ to decide.\"\n    },\n    \"sealing\": {\n      \"type\": \"string\",\n\
        \      \"enum\": [\n        \"NO_SEALING\",\n        \"WANT_SEALING\",\n \
        \       \"REQUIRE_SEALING\"\n      ],\n      \"description\": \"Setting for\
        \ DCERPC sealing.:\\n * `NO_SEALING` - Do not use sealing.,\\n * `REQUIRE_SEALING`\
        \ - Require the use of sealing.,\\n * `WANT_SEALING` - Prefer to use sealing;\
        \ allow server to decide.\"\n    },\n    \"crypto\": {\n      \"type\": \"\
        string\",\n      \"enum\": [\n        \"NO_AES\",\n        \"WANT_AES\",\n\
        \        \"REQUIRE_AES\"\n      ],\n      \"description\": \"Setting for authenticator\
        \ and sealing crypto.:\\n * `NO_AES` - Do not use AES.,\\n * `REQUIRE_AES`\
        \ - Require the use of AES.,\\n * `WANT_AES` - Prefer use of AES; allow server\
        \ to decide.\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Gets advanced Active Directory settings.
  put:
    parameters:
    - description: ETag for expected version
      name: If-Match
      required: false
    request_body:
      schema: "{\n  \"description\": \"ad_settings\",\n  \"type\": \"object\",\n \
        \ \"properties\": {\n    \"signing\": {\n      \"type\": \"string\",\n   \
        \   \"enum\": [\n        \"NO_SIGNING\",\n        \"WANT_SIGNING\",\n    \
        \    \"REQUIRE_SIGNING\"\n      ],\n      \"description\": \"Setting for DCERPC\
        \ signing; only use if sealing is not negotiated:\\n * `NO_SIGNING` - Do not\
        \ use DCERPC signing.,\\n * `REQUIRE_SIGNING` - Require the use of DCERPC\
        \ signing.,\\n * `WANT_SIGNING` - Prefer to use DCERPC signing; allow server\
        \ to decide.\"\n    },\n    \"sealing\": {\n      \"type\": \"string\",\n\
        \      \"enum\": [\n        \"NO_SEALING\",\n        \"WANT_SEALING\",\n \
        \       \"REQUIRE_SEALING\"\n      ],\n      \"description\": \"Setting for\
        \ DCERPC sealing.:\\n * `NO_SEALING` - Do not use sealing.,\\n * `REQUIRE_SEALING`\
        \ - Require the use of sealing.,\\n * `WANT_SEALING` - Prefer to use sealing;\
        \ allow server to decide.\"\n    },\n    \"crypto\": {\n      \"type\": \"\
        string\",\n      \"enum\": [\n        \"NO_AES\",\n        \"WANT_AES\",\n\
        \        \"REQUIRE_AES\"\n      ],\n      \"description\": \"Setting for authenticator\
        \ and sealing crypto.:\\n * `NO_AES` - Do not use AES.,\\n * `REQUIRE_AES`\
        \ - Require the use of AES.,\\n * `WANT_AES` - Prefer use of AES; allow server\
        \ to decide.\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"ad_settings\",\n  \"type\": \"object\",\n \
        \ \"properties\": {\n    \"signing\": {\n      \"type\": \"string\",\n   \
        \   \"enum\": [\n        \"NO_SIGNING\",\n        \"WANT_SIGNING\",\n    \
        \    \"REQUIRE_SIGNING\"\n      ],\n      \"description\": \"Setting for DCERPC\
        \ signing; only use if sealing is not negotiated:\\n * `NO_SIGNING` - Do not\
        \ use DCERPC signing.,\\n * `REQUIRE_SIGNING` - Require the use of DCERPC\
        \ signing.,\\n * `WANT_SIGNING` - Prefer to use DCERPC signing; allow server\
        \ to decide.\"\n    },\n    \"sealing\": {\n      \"type\": \"string\",\n\
        \      \"enum\": [\n        \"NO_SEALING\",\n        \"WANT_SEALING\",\n \
        \       \"REQUIRE_SEALING\"\n      ],\n      \"description\": \"Setting for\
        \ DCERPC sealing.:\\n * `NO_SEALING` - Do not use sealing.,\\n * `REQUIRE_SEALING`\
        \ - Require the use of sealing.,\\n * `WANT_SEALING` - Prefer to use sealing;\
        \ allow server to decide.\"\n    },\n    \"crypto\": {\n      \"type\": \"\
        string\",\n      \"enum\": [\n        \"NO_AES\",\n        \"WANT_AES\",\n\
        \        \"REQUIRE_AES\"\n      ],\n      \"description\": \"Setting for authenticator\
        \ and sealing crypto.:\\n * `NO_AES` - Do not use AES.,\\n * `REQUIRE_AES`\
        \ - Require the use of AES.,\\n * `WANT_AES` - Prefer use of AES; allow server\
        \ to decide.\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Sets advanced Active Directory settings.
rest_endpoint: /v1/ad/settings
api_version: v1
permalink: /rest-api-guide/active-directory/ad_settings.html
sidebar: rest_api_guide_sidebar
---
