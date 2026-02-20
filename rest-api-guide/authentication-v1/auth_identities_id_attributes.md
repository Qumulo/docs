---
category: /Authentication V1
methods:
  get:
    summary: Get the identity attributes for an identity.
    parameters:
    - name: id
      description: URI parameter id
      required: true
    response_body:
      schema: "{\n  \"description\": \"identity_attributes\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"home_directory\": {\n      \"description\":\
        \ \"home_directory\",\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
  put:
    summary: Set the identity attributes for an identity.
    parameters:
    - name: id
      description: URI parameter id
      required: true
    response_body:
      schema: "{\n  \"description\": \"identity_attributes\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"home_directory\": {\n      \"description\":\
        \ \"home_directory\",\n      \"type\": \"string\"\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: false
    request_body:
      schema: "{\n  \"description\": \"identity_attributes\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"home_directory\": {\n      \"description\":\
        \ \"home_directory\",\n      \"type\": \"string\"\n    }\n  }\n}"
  delete:
    summary: Delete the identity attributes for an identity.
    parameters:
    - name: id
      description: URI parameter id
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/auth/identities/{id}/attributes
api_version: v1
permalink: /rest-api-guide/authentication-v1/auth_identities_id_attributes.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/authentication/auth_identities_id_attributes.html
deprecated: false
---
