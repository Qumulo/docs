---
category: /ad
methods:
  get:
    parameters:
    - description: The sAMAccountName to use to look up AD users or groups.
      name: username
      required: true
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Return any AD account objects that have the given sAMAccountName.
rest_endpoint: /v1/ad/usernames/{username}/objects/
permalink: /rest-api-guide/ad/ad_usernames__username_objects.html
sidebar: rest_api_guide_sidebar
---
