---
category: /Local Group Methods V1
methods:
  delete:
    summary: Remove a member from a group.
    parameters:
    - name: group_id
      description: The group's unique ID
      required: true
    - name: member_id
      description: The user's unique ID
      required: true
    response_body: {}
    responses:
    - code: '200'
      description: Return value on success
    preview: false
rest_endpoint: /v1/groups/{group_id}/members/{member_id}
api_version: v1
permalink: /rest-api-guide/local-group-methods-v1/groups_group_id_members_member_id.html
sidebar: rest_api_guide_sidebar
redirect_from: /rest-api-guide/local-group-methods/groups_group_id_members_member_id.html
deprecated: false
---
