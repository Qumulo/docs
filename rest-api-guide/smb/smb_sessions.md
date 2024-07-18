---
category: /smb
methods:
  get:
    parameters:
    - description: 'List only sessions matching a user identity in the form of: [1]
        A name or a SID optionally qualified with a domain prefix (e.g local:name,
        S-1-1-0, name, world:Everyone, ldap_user:name, or ad:name), or [2] An ID type
        (e.g. uid:1001, auth_id:513, SID:S-1-1-0).)'
      name: identity
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
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Enumerate open sessions
rest_endpoint: /v1/smb/sessions/
permalink: /rest-api-guide/smb/smb_sessions.html
sidebar: rest_api_guide_sidebar
---
