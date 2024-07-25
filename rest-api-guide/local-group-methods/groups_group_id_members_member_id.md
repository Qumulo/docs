---
category: /Local Group Methods
methods:
  delete:
    parameters:
    - description: The group's unique ID
      name: group_id
      required: true
    - description: The user's unique ID
      name: member_id
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    summary: Remove a member from a group.
rest_endpoint: /v1/groups/{group_id}/members/{member_id}
api_version: v1
permalink: /rest-api-guide/local-group-methods/groups_group_id_members_member_id.html
sidebar: rest_api_guide_sidebar
---
