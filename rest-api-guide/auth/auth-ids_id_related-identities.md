---
category: /auth
methods:
  get:
    parameters:
    - description: The auth_id to expand to all its related identities.
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Given an auth_id of any kind, return all related identities (equivalents
      in other domains, and containing groups). This API is deprecated in favor of
      /v1/identity/expand
rest_endpoint: /v1/auth/auth-ids/{id}/related-identities/
permalink: /rest-api-guide/auth/auth-ids_id_related-identities.html
sidebar: rest_api_guide_sidebar
---
