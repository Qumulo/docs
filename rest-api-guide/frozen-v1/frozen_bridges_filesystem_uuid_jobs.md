---
category: /Frozen V1
methods:
  get:
    summary: '[preview] Lists the bridge''s freeze and thaw jobs, oldest first, each
      in the form getting one job returns. A job stays listed until it is deleted,
      including after it finishes, is canceled or fails. Results come in pages of
      up to 100 jobs. A page can hold fewer jobs than that, or none, and still not
      be the last, so keep requesting the next page until a response has no next page.
      Returns HTTP 404 if no Frozen bridge has this UUID.'
    parameters:
    - name: filesystem_uuid
      description: The Frozen bridge's filesystem UUID, as `GET /v1/frozen/bridges/`
        reports it.
      required: true
    - name: kind
      description: "Only list jobs of this kind: FREEZE or THAW.:\n * `FREEZE` - Moves\
        \ each file's data to the Azure Archive tier. From the moment the job reaches\
        \ a file, its data can't change until a thaw.,\n * `THAW` - Brings each frozen\
        \ file's data back online at the chosen tier, after which the file can be\
        \ read and written again."
      required: false
    - name: state
      description: "Only list jobs in this state.:\n * `CANCELED` - The job was canceled,\
        \ and starts on no more files. A freeze releases the files it started on and\
        \ didn't put in the Azure Archive tier, as canceling it describes. A file\
        \ whose upload may already have reached Azure is put in the Azure Archive\
        \ tier as the job winds down, and then stays frozen until a thaw.,\n * `FAILED`\
        \ - The job stopped, because Azure refused a request in a way that would fail\
        \ every file, or because the work on one file, or on the job's progress through\
        \ its files, kept failing after retries. `failure_message` says which. It\
        \ starts on no more files, and a freeze leaves its files as a canceled one\
        \ does.,\n * `FINISHED` - The job has gone through all its files, and every\
        \ file it started on is frozen, for a freeze, or back online, for a thaw,\
        \ or was deleted first.,\n * `IN_PROGRESS` - The job is going through its\
        \ files, or has gone through them and is waiting for Azure to finish moving\
        \ the files it started on."
      required: false
    - name: after
      description: Return entries after the given key (keys are returned in the paging
        object)
      required: false
    - name: limit
      description: Return no more than this many entries; the system may choose a
        smaller limit.
      required: false
    response_body:
      schema: "{\n  \"description\": \"api_frozen_jobs\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"entries\": {\n      \"type\": \"array\",\n \
        \     \"items\": {\n        \"description\": \"The jobs, oldest first.\",\n\
        \        \"type\": \"object\",\n        \"properties\": {\n          \"id\"\
        : {\n            \"description\": \"The job's ID. A bridge never gives two\
        \ jobs the same ID.\",\n            \"type\": \"string\"\n          },\n \
        \         \"kind\": {\n            \"type\": \"string\",\n            \"enum\"\
        : [\n              \"FREEZE\",\n              \"THAW\"\n            ],\n \
        \           \"description\": \"FREEZE or THAW.:\\n * `FREEZE` - Moves each\
        \ file's data to the Azure Archive tier. From the moment the job reaches a\
        \ file, its data can't change until a thaw.,\\n * `THAW` - Brings each frozen\
        \ file's data back online at the chosen tier, after which the file can be\
        \ read and written again.\"\n          },\n          \"tier\": {\n       \
        \     \"type\": \"string\",\n            \"enum\": [\n              \"HOT\"\
        ,\n              \"COOL\",\n              \"COLD\"\n            ],\n     \
        \       \"description\": \"The tier a thaw brings the data back to. Absent\
        \ for a freeze.:\\n * `COLD` - Azure's tier for data read very rarely, cheaper\
        \ to store than COOL. Azure charges an early-deletion fee for data that leaves\
        \ it within 90 days, such as by a later freeze.,\\n * `COOL` - Azure's tier\
        \ for data read rarely. Azure charges an early-deletion fee for data that\
        \ leaves it within 30 days, such as by a later freeze.,\\n * `HOT` - Azure's\
        \ tier for data read often, with the highest storage cost and the lowest cost\
        \ to read. Azure charges no early-deletion fee.\"\n          },\n        \
        \  \"priority\": {\n            \"type\": \"string\",\n            \"enum\"\
        : [\n              \"STANDARD\",\n              \"HIGH\"\n            ],\n\
        \            \"description\": \"How fast, and at what price, Azure brings\
        \ a thaw's files back online. Absent for a freeze.:\\n * `HIGH` - Azure can\
        \ bring a file smaller than 10 GB back online in under an hour, at a much\
        \ higher price than STANDARD. Azure limits HIGH to about 10 GiB per hour for\
        \ the bridge's storage account, shared by every HIGH thaw running on it, so\
        \ a HIGH thaw of more than about 150 GiB finishes no sooner than STANDARD\
        \ and costs more.,\\n * `STANDARD` - Azure brings each file back online within\
        \ about 15 hours. The default.\"\n          },\n          \"subtree\": {\n\
        \            \"description\": \"The directory, with everything under it, or\
        \ the one file the job covers, as a path relative to the bridge, such as `/projects/2025`.\
        \ Absent when the job has `files`.\",\n            \"type\": \"string\"\n\
        \          },\n          \"files\": {\n            \"type\": \"array\",\n\
        \            \"items\": {\n              \"description\": \"The paths the\
        \ job covers, relative to the bridge, in the order given. A directory covers\
        \ everything under it. Absent when the job has a `subtree`.\",\n         \
        \     \"type\": \"string\"\n            }\n          },\n          \"exclude\"\
        : {\n            \"type\": \"array\",\n            \"items\": {\n        \
        \      \"description\": \"The paths relative to the bridge, such as `/projects/2025/drafts`,\
        \ that the job leaves as they are. A directory covers everything under it.\
        \ Empty when the job excludes nothing.\",\n              \"type\": \"string\"\
        \n            }\n          },\n          \"state\": {\n            \"type\"\
        : \"string\",\n            \"enum\": [\n              \"IN_PROGRESS\",\n \
        \             \"FINISHED\",\n              \"CANCELED\",\n              \"\
        FAILED\"\n            ],\n            \"description\": \"The job's state.:\\\
        n * `CANCELED` - The job was canceled, and starts on no more files. A freeze\
        \ releases the files it started on and didn't put in the Azure Archive tier,\
        \ as canceling it describes. A file whose upload may already have reached\
        \ Azure is put in the Azure Archive tier as the job winds down, and then stays\
        \ frozen until a thaw.,\\n * `FAILED` - The job stopped, because Azure refused\
        \ a request in a way that would fail every file, or because the work on one\
        \ file, or on the job's progress through its files, kept failing after retries.\
        \ `failure_message` says which. It starts on no more files, and a freeze leaves\
        \ its files as a canceled one does.,\\n * `FINISHED` - The job has gone through\
        \ all its files, and every file it started on is frozen, for a freeze, or\
        \ back online, for a thaw, or was deleted first.,\\n * `IN_PROGRESS` - The\
        \ job is going through its files, or has gone through them and is waiting\
        \ for Azure to finish moving the files it started on.\"\n          },\n  \
        \        \"all_files_started\": {\n            \"description\": \"Whether\
        \ the job has started on all its files; always false for a canceled or failed\
        \ job. A job in progress that has started on them all is waiting only for\
        \ Azure, and finishes once each of its files is done, deleted or taken by\
        \ a later job.\",\n            \"type\": \"boolean\"\n          },\n     \
        \     \"failure_message\": {\n            \"description\": \"For a failed\
        \ job, what failed, on which file, and what to do next.\",\n            \"\
        type\": \"string\"\n          },\n          \"start_time\": {\n          \
        \  \"description\": \"When the job started, in RFC 3339 format.\",\n     \
        \       \"type\": \"string\"\n          },\n          \"end_time\": {\n  \
        \          \"description\": \"When the job finished, was canceled or failed,\
        \ in RFC 3339 format. Absent while it is in progress. For a finished thaw,\
        \ it is when the cluster recorded the last of its files back online or deleted,\
        \ which can be some time after Azure brought the data back.\",\n         \
        \   \"type\": \"string\"\n          },\n          \"estimate\": {\n      \
        \      \"description\": \"For a freeze, the estimate its POST answered, which\
        \ can leave out changes made before it started that the directory aggregates\
        \ hadn't yet counted. Absent for a thaw.\",\n            \"type\": \"object\"\
        ,\n            \"properties\": {\n              \"files\": {\n           \
        \     \"description\": \"Files the job covers, including any already frozen,\
        \ but not symbolic links.\",\n                \"type\": \"string\"\n     \
        \         },\n              \"cluster_bytes\": {\n                \"description\"\
        : \"Bytes of those files' data stored on the cluster, counted in whole 4 KiB\
        \ blocks, which the freeze uploads to Azure unless Azure already has it. Leaves\
        \ out the data of files of 1,351 bytes or less, which the cluster keeps with\
        \ their metadata rather than in blocks.\",\n                \"type\": \"string\"\
        \n              },\n              \"bucket_bytes\": {\n                \"\
        description\": \"Bytes of those files' data already in Azure but not in an\
        \ archive tier, which the freeze moves to the Azure Archive tier. Data both\
        \ on the cluster and in Azure counts in `cluster_bytes` too, so the two don't\
        \ add up to a total.\",\n                \"type\": \"string\"\n          \
        \    }\n            }\n          },\n          \"counts\": {\n           \
        \ \"description\": \"How many files the job has started on, finished, or seen\
        \ deleted.\",\n            \"type\": \"object\",\n            \"properties\"\
        : {\n              \"files_started\": {\n                \"description\":\
        \ \"Files the job has started on. This can be more than `files_done` plus\
        \ `files_deleted`, since a later job can take a file this one started on before\
        \ it reached this job's goal, and a canceled or failed freeze releases the\
        \ files it started on and didn't put in the Azure Archive tier.\",\n     \
        \           \"type\": \"string\"\n              },\n              \"bytes_started\"\
        : {\n                \"description\": \"Total size in bytes of the files the\
        \ job has started on, each as large as it was when the job started on it.\"\
        ,\n                \"type\": \"string\"\n              },\n              \"\
        files_done\": {\n                \"description\": \"Files the job has finished:\
        \ in the Azure Archive tier for a freeze, back online and writable for a thaw.\"\
        ,\n                \"type\": \"string\"\n              },\n              \"\
        bytes_done\": {\n                \"description\": \"Total size in bytes of\
        \ the finished files, measured as in `bytes_started`.\",\n               \
        \ \"type\": \"string\"\n              },\n              \"files_deleted\"\
        : {\n                \"description\": \"Files the job started on that were\
        \ deleted before it finished them.\",\n                \"type\": \"string\"\
        \n              },\n              \"bytes_deleted\": {\n                \"\
        description\": \"Total size in bytes of the deleted files, measured as in\
        \ `bytes_started`.\",\n                \"type\": \"string\"\n            \
        \  }\n            }\n          },\n          \"skipped\": {\n            \"\
        description\": \"Files the job left as they were, by reason. The audit log\
        \ has a `frozen_file_skipped` line for each skip, with the job's ID, the file's\
        \ path and, as its `reason`, the field here that counts it. Files a freeze\
        \ found already frozen or a thaw found already taking changes to their data\
        \ (`already_frozen`, `not_frozen`) get no line. A restart can repeat a file's\
        \ line; these counts are the reconciled numbers.\",\n            \"type\"\
        : \"object\",\n            \"properties\": {\n              \"symlinks\":\
        \ {\n                \"description\": \"Symbolic links, which a job leaves\
        \ as they are.\",\n                \"type\": \"string\"\n              },\n\
        \              \"busy\": {\n                \"description\": \"Files another\
        \ job in progress is still working on. Start a job for them again once that\
        \ one ends. A file a canceled or failed freeze hasn't released yet isn't skipped:\
        \ this job waits for it.\",\n                \"type\": \"string\"\n      \
        \        },\n              \"already_frozen\": {\n                \"description\"\
        : \"Files an earlier freeze already put in the Azure Archive tier.\",\n  \
        \              \"type\": \"string\"\n              },\n              \"not_frozen\"\
        : {\n                \"description\": \"Files a thaw found that already take\
        \ changes to their data: no freeze froze them and their objects are online,\
        \ or an earlier thaw already brought them back online.\",\n              \
        \  \"type\": \"string\"\n              },\n              \"key_too_long\"\
        : {\n                \"description\": \"Files whose name in Azure would be\
        \ over Azure's limits: the bridge's prefix in Azure followed by the file's\
        \ path is longer than 1,024 characters, or has more than 254 parts separated\
        \ by `/`. A character outside Unicode's Basic Multilingual Plane, such as\
        \ most emoji, counts as two. Shorten the path and freeze the file again.\"\
        ,\n                \"type\": \"string\"\n              },\n              \"\
        key_holds_archive\": {\n                \"description\": \"Files whose name\
        \ in Azure already holds an object in the Azure Archive tier that the cluster\
        \ didn't record for the file, usually one an earlier file at the same path\
        \ left behind. The freeze neither overwrites nor deletes it. To freeze the\
        \ file, rename or move it to a new path and freeze it there, or ask Qumulo\
        \ to remove the old object from the storage account and freeze the path again.\"\
        ,\n                \"type\": \"string\"\n              },\n              \"\
        changed_while_archived\": {\n                \"description\": \"Files in the\
        \ Azure Archive tier that hold a change the archived object lacks, such as\
        \ a write the cluster took just before the object was archived. The cluster\
        \ keeps the change, but can't send the whole file to Azure while its object\
        \ is archived. Thaw the file, then freeze it again: the freeze sends the file\
        \ to Azure with the change and archives it.\",\n                \"type\":\
        \ \"string\"\n              }\n            }\n          }\n        }\n   \
        \   }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: true
  post:
    summary: '[preview] Starts a freeze or thaw job over one directory or file (`subtree`)
      or a list of up to 256 (`files`), and returns the job''s ID and a URI to check
      its progress. Paths are relative to the bridge: on a bridge at `/archive`, the
      cluster path `/archive/projects/2025` is `/projects/2025`, and `/` is the whole
      bridge. A refusal gives paths as cluster paths, as qq and the web UI take them,
      except a path that doesn''t start with `/` or contains `..`, which it gives
      as sent. A freeze''s response also estimates the files and bytes it covers,
      which can miss very recent changes. A job goes through its files once, so a
      file created under its directory after the job reaches that directory isn''t
      covered. A job skips some files, leaving them as they are, and counts each by
      reason in `skipped`: symbolic links and files another running job is working
      on. A freeze also skips files an earlier freeze already put in the Azure Archive
      tier, files whose name in Azure is longer than Azure allows, files whose name
      in Azure already holds an archived object the cluster doesn''t record for them,
      and files in the Azure Archive tier that hold a change the archived object lacks.
      A thaw also skips files that already take changes to their data. A job fails,
      giving the file in `failure_message`, if Azure refuses a request in a way that
      would fail every file, or if the work on one file, or on the job''s progress
      through its files, keeps failing after retries. Returns HTTP 400 if the body
      has both `subtree` and `files` or neither; if `files` has more than 256 entries;
      if a path doesn''t start with `/`, contains `..`, is longer than a bridge allows,
      doesn''t exist, is listed twice or lies under another listed directory; if a
      freeze has a `tier` or `priority`; if `exclude` has more than 256 entries; or
      if a path in `exclude` fails any of those path checks or doesn''t lie inside
      `subtree` or inside a directory in `files`. Returns HTTP 409, giving the delete''s
      ID, while a delete that hasn''t ended covers any of these paths or lies under
      one of them, unless it lies within `exclude`. Returns HTTP 404 if no Frozen
      bridge has this UUID.'
    parameters:
    - name: filesystem_uuid
      description: The Frozen bridge's filesystem UUID, as `GET /v1/frozen/bridges/`
        reports it.
      required: true
    response_body: {}
    responses:
    - code: '202'
      description: Return value on success
    preview: true
    request_body:
      schema: "{\n  \"description\": \"api_frozen_job_request\",\n  \"type\": \"object\"\
        ,\n  \"properties\": {\n    \"kind\": {\n      \"type\": \"string\",\n   \
        \   \"enum\": [\n        \"FREEZE\",\n        \"THAW\"\n      ],\n      \"\
        description\": \"kind:\\n * `FREEZE` - Moves each file's data to the Azure\
        \ Archive tier. From the moment the job reaches a file, its data can't change\
        \ until a thaw.,\\n * `THAW` - Brings each frozen file's data back online\
        \ at the chosen tier, after which the file can be read and written again.\"\
        \n    },\n    \"subtree\": {\n      \"description\": \"One directory, with\
        \ everything under it, or one file, as a path relative to the bridge, such\
        \ as `/projects/2025`. `/` is the whole bridge. Give either `subtree` or `files`.\"\
        ,\n      \"type\": \"string\"\n    },\n    \"files\": {\n      \"type\": \"\
        array\",\n      \"items\": {\n        \"description\": \"1 to 256 paths relative\
        \ to the bridge, handled in the order given. A directory covers everything\
        \ under it. Give either `subtree` or `files`.\",\n        \"type\": \"string\"\
        \n      }\n    },\n    \"exclude\": {\n      \"type\": \"array\",\n      \"\
        items\": {\n        \"description\": \"Up to 256 paths relative to the bridge,\
        \ such as `/projects/2025/drafts`, that the job leaves as they are, each inside\
        \ `subtree` or inside a directory in `files`. A directory covers everything\
        \ under it, and a file that replaces an excluded file is left as it is too.\
        \ The job doesn't count what it leaves out in `skipped`. Each path must exist\
        \ when the job starts.\",\n        \"type\": \"string\"\n      }\n    },\n\
        \    \"tier\": {\n      \"type\": \"string\",\n      \"enum\": [\n       \
        \ \"HOT\",\n        \"COOL\",\n        \"COLD\"\n      ],\n      \"description\"\
        : \"The tier a thaw brings the data back to: HOT, COOL or COLD; HOT if omitted.\
        \ Refused for a freeze, which always moves data to the Azure Archive tier.:\\\
        n * `COLD` - Azure's tier for data read very rarely, cheaper to store than\
        \ COOL. Azure charges an early-deletion fee for data that leaves it within\
        \ 90 days, such as by a later freeze.,\\n * `COOL` - Azure's tier for data\
        \ read rarely. Azure charges an early-deletion fee for data that leaves it\
        \ within 30 days, such as by a later freeze.,\\n * `HOT` - Azure's tier for\
        \ data read often, with the highest storage cost and the lowest cost to read.\
        \ Azure charges no early-deletion fee.\"\n    },\n    \"priority\": {\n  \
        \    \"type\": \"string\",\n      \"enum\": [\n        \"STANDARD\",\n   \
        \     \"HIGH\"\n      ],\n      \"description\": \"How fast, and at what price,\
        \ Azure brings a thaw's files back online: STANDARD, the default, or HIGH.\
        \ Refused for a freeze.:\\n * `HIGH` - Azure can bring a file smaller than\
        \ 10 GB back online in under an hour, at a much higher price than STANDARD.\
        \ Azure limits HIGH to about 10 GiB per hour for the bridge's storage account,\
        \ shared by every HIGH thaw running on it, so a HIGH thaw of more than about\
        \ 150 GiB finishes no sooner than STANDARD and costs more.,\\n * `STANDARD`\
        \ - Azure brings each file back online within about 15 hours. The default.\"\
        \n    }\n  }\n}"
rest_endpoint: /v1/frozen/bridges/{filesystem_uuid}/jobs/
api_version: v1
deprecated: false
permalink: /rest-api-guide/frozen-v1/frozen_bridges_filesystem_uuid_jobs.html
sidebar: rest_api_guide_sidebar
---
