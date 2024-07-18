---
category: /files
methods:
  delete:
    parameters:
    - description: The file ID or the absolute path to the file system object. File
        IDs can be found in the id field of responses of APIs that return file attributes.
        You must URL-encode the paths. The APIs & Tools page in the Qumulo Core Web
        UI URL-encodes the paths.
      name: ref
      required: true
    - description: Offset of the range to release
      name: offset
      required: true
    - description: Size of range to release. Zero releases to the maximum file size.
      name: size
      required: true
    - description: Opaque, unique identifier for the process that owns the lock. This
        is the owner_id attribute on entries returned by GET.
      name: owner_id
      required: true
    - description: The snapshot ID that specifies the version of the filesystem to
        use. If not specified, use the head version.
      name: snapshot
      required: false
    response_body:
      description: Return value on success
      example_value: TO DO
      schema: TO DO
      status_code: '200'
    summary: Release an arbitrary lock range. This is dangerous, and should only be
      used after confirming that the owning process has leaked the lock, and only
      if there is a very good reason why the situation should not be resolved by terminating
      that process.
  get:
    parameters:
    - description: The file ID or the absolute path to the file system object. File
        IDs can be found in the id field of responses of APIs that return file attributes.
        You must URL-encode the paths. The APIs & Tools page in the Qumulo Core Web
        UI URL-encodes the paths.
      name: ref
      required: true
    - description: The snapshot ID that specifies the version of the filesystem to
        use. If not specified, use the head version.
      name: snapshot
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
    summary: Return a list of all NLM byte range locks currently granted on the specified
      file.
rest_endpoint: /v1/files/{ref}/locks/nlm/byte-range/
permalink: /rest-api-guide/files/files__ref_locks_nlm_byte-range.html
sidebar: rest_api_guide_sidebar
---
