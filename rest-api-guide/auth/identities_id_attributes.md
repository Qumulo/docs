---
category: /auth
methods:
  delete:
    parameters:
    - description: URI parameter id
      name: id
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Delete the identity attributes for an identity.
  get:
    parameters:
    - description: URI parameter id
      name: id
      required: true
    response_body:
      schema: "{\n  \"description\": \"identity_attributes\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"home_directory\": {\n      \"description\":\
        \ \"home_directory\",\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Get the identity attributes for an identity.
  put:
    parameters:
    - description: URI parameter id
      name: id
      required: true
    request_body:
      schema: "{\n  \"description\": \"identity_attributes\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"home_directory\": {\n      \"description\":\
        \ \"home_directory\",\n      \"type\": \"string\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"identity_attributes\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"home_directory\": {\n      \"description\":\
        \ \"home_directory\",\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Set the identity attributes for an identity.
rest_endpoint: /v1/auth/identities/{id}/attributes
api_version: v1
permalink: /rest-api-guide/auth/identities_id_attributes.html
sidebar: rest_api_guide_sidebar
---
