---
category: /auth
methods:
  get:
    parameters:
    - description: The Windows NT security identifier to expand.
      name: id
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Given a Windows NT Security IDentifier, return all related identities
      (equivalents in other domains, and containing groups). This API is deprecated
      in favor of /v1/identity/expand
rest_endpoint: /v1/auth/sids/{id}/related-identities/
permalink: /rest-api-guide/auth/auth_sids__id_related-identities.html
sidebar: rest_api_guide_sidebar
---
