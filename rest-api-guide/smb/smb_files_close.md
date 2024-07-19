---
category: /smb
methods:
  post:
    parameters: []
    request_body:
      example_value: TO DO
      schema: TO DO
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: The request body must contain a list of file handles to close, as returned
      from GET /v1/smb/files. Fields other than 'location' are ignored.
rest_endpoint: /v1/smb/files/close
permalink: /rest-api-guide/smb/smb_files_close.html
sidebar: rest_api_guide_sidebar
---