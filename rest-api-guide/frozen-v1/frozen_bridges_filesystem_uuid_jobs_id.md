---
category: /Frozen V1
methods:
  get:
    summary: '[preview] Returns the job: what it covers, its state, and how many files
      and bytes it has handled. A job that was canceled or failed stays CANCELED or
      FAILED, and never becomes FINISHED. Returns HTTP 404 if no Frozen bridge has
      this UUID or the bridge has no job with this ID.'
    parameters:
    - name: filesystem_uuid
      description: The Frozen bridge's filesystem UUID, as `GET /v1/frozen/bridges/`
        reports it.
      required: true
    - name: id
      description: The job's ID, as starting or listing the job reports it.
      required: true
    response_body:
      schema: "{\n  \"description\": \"api_frozen_job\",\n  \"type\": \"object\",\n\
        \  \"properties\": {\n    \"id\": {\n      \"description\": \"The job's ID.\
        \ A bridge never gives two jobs the same ID.\",\n      \"type\": \"string\"\
        \n    },\n    \"kind\": {\n      \"type\": \"string\",\n      \"enum\": [\n\
        \        \"FREEZE\",\n        \"THAW\"\n      ],\n      \"description\": \"\
        FREEZE or THAW.:\\n * `FREEZE` - Moves each file's data to the bridge's archive:\
        \ the Azure Archive tier on Azure, or the bridge's `archive_class` on AWS.\
        \ From the moment the job reaches a file, its data can't change until a thaw.,\\\
        n * `THAW` - Brings each frozen file's data back. On Azure it comes back online\
        \ at the chosen tier, after which the file can be read and written again.\
        \ On AWS a temporary copy is restored for `restore_days`, during which the\
        \ file can be read but not written.\"\n    },\n    \"tier\": {\n      \"type\"\
        : \"string\",\n      \"enum\": [\n        \"HOT\",\n        \"COOL\",\n  \
        \      \"COLD\"\n      ],\n      \"description\": \"The tier a thaw on Azure\
        \ brings the data back to. Absent for a freeze and on AWS.:\\n * `COLD` -\
        \ Azure's tier for data read very rarely, cheaper to store than COOL. Azure\
        \ charges an early-deletion fee for data that leaves it within 90 days, such\
        \ as by a later freeze.,\\n * `COOL` - Azure's tier for data read rarely.\
        \ Azure charges an early-deletion fee for data that leaves it within 30 days,\
        \ such as by a later freeze.,\\n * `HOT` - Azure's tier for data read often,\
        \ with the highest storage cost and the lowest cost to read. Azure charges\
        \ no early-deletion fee.\"\n    },\n    \"priority\": {\n      \"type\": \"\
        string\",\n      \"enum\": [\n        \"STANDARD\",\n        \"HIGH\",\n \
        \       \"LOW\"\n      ],\n      \"description\": \"How fast, and at what\
        \ price, the provider brings a thaw's files back. Absent for a freeze.:\\\
        n * `HIGH` - Azure can bring a file smaller than 10 GB back online in under\
        \ an hour, at a much higher price than STANDARD. Azure limits HIGH to about\
        \ 10 GiB per hour for the bridge's storage account, shared by every HIGH thaw\
        \ running on it, so a HIGH thaw of more than about 150 GiB finishes no sooner\
        \ than STANDARD and costs more. On AWS, S3's Expedited retrieval restores\
        \ each file from GLACIER within 1 to 5 minutes, at a much higher price than\
        \ STANDARD, and suits up to a few hundred files. While AWS has no Expedited\
        \ capacity for a file, the thaw keeps trying for an hour, and then the job\
        \ fails, naming the file and suggesting STANDARD. Refused on a DEEP_ARCHIVE\
        \ bridge.,\\n * `LOW` - AWS only: S3's Bulk retrieval, the cheapest, restores\
        \ each file within 5 to 12 hours from GLACIER, and within 48 hours from DEEP_ARCHIVE.\
        \ Refused on Azure.,\\n * `STANDARD` - The default. Azure brings each file\
        \ back online within about 15 hours. On AWS, S3's Standard retrieval restores\
        \ each file within 3 to 5 hours from GLACIER, and within 12 hours from DEEP_ARCHIVE.\"\
        \n    },\n    \"restore_days\": {\n      \"description\": \"For a thaw on\
        \ AWS, how many days each file's restored copy stays readable. Absent for\
        \ a freeze and on Azure.\",\n      \"type\": \"number\"\n    },\n    \"subtree\"\
        : {\n      \"description\": \"The directory, with everything under it, or\
        \ the one file the job covers, as a path relative to the bridge, such as `/projects/2025`.\
        \ Absent when the job has `files`.\",\n      \"type\": \"string\"\n    },\n\
        \    \"files\": {\n      \"type\": \"array\",\n      \"items\": {\n      \
        \  \"description\": \"The paths the job covers, relative to the bridge, in\
        \ the order given. A directory covers everything under it. Absent when the\
        \ job has a `subtree`.\",\n        \"type\": \"string\"\n      }\n    },\n\
        \    \"exclude\": {\n      \"type\": \"array\",\n      \"items\": {\n    \
        \    \"description\": \"The paths relative to the bridge, such as `/projects/2025/drafts`,\
        \ that the job leaves as they are. A directory covers everything under it.\
        \ Empty when the job excludes nothing.\",\n        \"type\": \"string\"\n\
        \      }\n    },\n    \"state\": {\n      \"type\": \"string\",\n      \"\
        enum\": [\n        \"IN_PROGRESS\",\n        \"FINISHED\",\n        \"CANCELED\"\
        ,\n        \"FAILED\"\n      ],\n      \"description\": \"The job's state.:\\\
        n * `CANCELED` - The job was canceled, and starts on no more files. A freeze\
        \ releases the files it started on and didn't archive, as canceling it describes.\
        \ A file whose upload may already have reached the bucket is archived as the\
        \ job winds down, and then stays frozen until a thaw.,\\n * `FAILED` - The\
        \ job stopped, because the provider refused a request in a way that would\
        \ fail every file, or because the work on one file, or on the job's progress\
        \ through its files, kept failing after retries. `failure_message` says which.\
        \ It starts on no more files, and a freeze leaves its files as a canceled\
        \ one does. On AWS a HIGH thaw also fails when AWS has had no Expedited capacity\
        \ for one of its files for an hour.,\\n * `FINISHED` - The job has gone through\
        \ all its files, and every file it started on is frozen, for a freeze, or\
        \ back online or restored, for a thaw, or was deleted first. An AWS thaw finishes\
        \ once the restored copy of each of its files is ready to read. A file counts\
        \ as thawed once its copy was restored, even if the copy has expired since.,\\\
        n * `IN_PROGRESS` - The job is going through its files, or has gone through\
        \ them and is waiting for the provider to finish moving or restoring the files\
        \ it started on. A thaw still waiting long after its priority's usual time\
        \ can be canceled and run again.\"\n    },\n    \"all_files_started\": {\n\
        \      \"description\": \"Whether the job has started on all its files; always\
        \ false for a canceled or failed job. A job in progress that has started on\
        \ them all is waiting only for the provider, and finishes once each of its\
        \ files is done, deleted or taken by a later job.\",\n      \"type\": \"boolean\"\
        \n    },\n    \"failure_message\": {\n      \"description\": \"For a failed\
        \ job, what failed, on which file, and what to do next. For a HIGH thaw on\
        \ AWS that failed for want of Expedited capacity, it names the file and says\
        \ to thaw it again at STANDARD, which AWS doesn't refuse for capacity.\",\n\
        \      \"type\": \"string\"\n    },\n    \"failure_reason\": {\n      \"type\"\
        : \"string\",\n      \"enum\": [\n        \"OTHER\",\n        \"CAPACITY_UNAVAILABLE\"\
        \n      ],\n      \"description\": \"For a failed job, the kind of failure:\
        \ CAPACITY_UNAVAILABLE or OTHER. A program choosing what to offer reads this,\
        \ never the words of `failure_message`, and reads a value it doesn't know\
        \ as OTHER, since later releases can add reasons. Absent unless the job failed.:\\\
        n * `CAPACITY_UNAVAILABLE` - AWS had no Expedited retrieval capacity for one\
        \ of a HIGH thaw's files for too long. A thaw of the same files at STANDARD,\
        \ which AWS doesn't refuse for capacity, can succeed.,\\n * `OTHER` - Any\
        \ other failure; `failure_message` says what to do.\"\n    },\n    \"start_time\"\
        : {\n      \"description\": \"When the job started, in RFC 3339 format.\"\
        ,\n      \"type\": \"string\"\n    },\n    \"end_time\": {\n      \"description\"\
        : \"When the job finished, was canceled or failed, in RFC 3339 format. Absent\
        \ while it is in progress. For a finished thaw, it is when the cluster recorded\
        \ the last of its files back online, restored or deleted, which can be some\
        \ time after the provider brought the data back.\",\n      \"type\": \"string\"\
        \n    },\n    \"copies_readable_until\": {\n      \"description\": \"For a\
        \ thaw on AWS that has ended, about when its restored copies stop being readable,\
        \ in RFC 3339 format: `restore_days` after its last restore, rounded up to\
        \ midnight UTC. For a canceled or failed thaw, its last restore is assumed\
        \ to end S3's typical restore time for its `priority` after `end_time`. A\
        \ file's copy can expire somewhat sooner or later. Absent while the thaw is\
        \ in progress, for a freeze and on Azure.\",\n      \"type\": \"string\"\n\
        \    },\n    \"estimate\": {\n      \"description\": \"For a freeze, the estimate\
        \ its POST answered, which can leave out changes made before it started that\
        \ the directory aggregates hadn't yet counted. Absent for a thaw.\",\n   \
        \   \"type\": \"object\",\n      \"properties\": {\n        \"files\": {\n\
        \          \"description\": \"Files the job covers, including any already\
        \ frozen, but not symbolic links.\",\n          \"type\": \"string\"\n   \
        \     },\n        \"cluster_bytes\": {\n          \"description\": \"Bytes\
        \ of those files' data stored on the cluster, counted in whole 4 KiB blocks,\
        \ which the freeze uploads to the bucket unless the bucket already has it.\
        \ Leaves out the data of files of 1,351 bytes or less, which the cluster keeps\
        \ with their metadata rather than in blocks.\",\n          \"type\": \"string\"\
        \n        },\n        \"bucket_bytes\": {\n          \"description\": \"Bytes\
        \ of those files' data already in the bucket but not in an archive tier or\
        \ storage class. On Azure the freeze moves it to the archive tier. On AWS,\
        \ which archives only by uploading, the freeze skips a file whose data is\
        \ only in the bucket. Data both on the cluster and in the bucket counts in\
        \ `cluster_bytes` too, so the two don't add up to a total.\",\n          \"\
        type\": \"string\"\n        }\n      }\n    },\n    \"counts\": {\n      \"\
        description\": \"How many files the job has started on, finished, or seen\
        \ deleted.\",\n      \"type\": \"object\",\n      \"properties\": {\n    \
        \    \"files_started\": {\n          \"description\": \"Files the job has\
        \ started on. This can be more than `files_done` plus `files_deleted`, since\
        \ a later job can take a file this one started on before it reached this job's\
        \ goal, and a canceled or failed freeze releases the files it started on and\
        \ didn't archive.\",\n          \"type\": \"string\"\n        },\n       \
        \ \"bytes_started\": {\n          \"description\": \"Total size in bytes of\
        \ the files the job has started on, each as large as it was when the job started\
        \ on it.\",\n          \"type\": \"string\"\n        },\n        \"files_done\"\
        : {\n          \"description\": \"Files the job has finished: archived for\
        \ a freeze, back online and writable for a thaw.\",\n          \"type\": \"\
        string\"\n        },\n        \"bytes_done\": {\n          \"description\"\
        : \"Total size in bytes of the finished files, measured as in `bytes_started`.\"\
        ,\n          \"type\": \"string\"\n        },\n        \"files_deleted\":\
        \ {\n          \"description\": \"Files the job started on that were deleted\
        \ before it finished them.\",\n          \"type\": \"string\"\n        },\n\
        \        \"bytes_deleted\": {\n          \"description\": \"Total size in\
        \ bytes of the deleted files, measured as in `bytes_started`.\",\n       \
        \   \"type\": \"string\"\n        }\n      }\n    },\n    \"skipped\": {\n\
        \      \"description\": \"Files the job left as they were, by reason. The\
        \ audit log has a `frozen_file_skipped` line for each skip, with the job's\
        \ ID, the file's path and, as its `reason`, the field here that counts it.\
        \ Files a freeze found already frozen or a thaw found already taking changes\
        \ to their data (`already_frozen`, `not_frozen`) get no line. A restart can\
        \ repeat a file's line; these counts are the reconciled numbers.\",\n    \
        \  \"type\": \"object\",\n      \"properties\": {\n        \"symlinks\": {\n\
        \          \"description\": \"Symbolic links, which a job leaves as they are.\"\
        ,\n          \"type\": \"string\"\n        },\n        \"busy\": {\n     \
        \     \"description\": \"Files another job in progress is still working on.\
        \ Start a job for them again once that one ends. A file a canceled or failed\
        \ freeze hasn't released yet isn't skipped: this job waits for it.\",\n  \
        \        \"type\": \"string\"\n        },\n        \"already_frozen\": {\n\
        \          \"description\": \"Files an earlier freeze already archived.\"\
        ,\n          \"type\": \"string\"\n        },\n        \"not_frozen\": {\n\
        \          \"description\": \"Files a thaw found that already take changes\
        \ to their data: no freeze froze them and their objects are online, or an\
        \ earlier thaw already brought them back online.\",\n          \"type\": \"\
        string\"\n        },\n        \"key_too_long\": {\n          \"description\"\
        : \"Files whose name in Azure would be over Azure's limits: the bridge's prefix\
        \ in Azure followed by the file's path is longer than 1,024 characters, or\
        \ has more than 254 parts separated by `/`. A character outside Unicode's\
        \ Basic Multilingual Plane, such as most emoji, counts as two. Shorten the\
        \ path and freeze the file again.\",\n          \"type\": \"string\"\n   \
        \     },\n        \"key_holds_archive\": {\n          \"description\": \"\
        Files whose name in the bucket already holds an object in an archive tier\
        \ or storage class that the cluster didn't record for the file, usually one\
        \ an earlier file at the same path left behind. The freeze neither overwrites\
        \ nor deletes it. To freeze the file, rename or move it to a new path and\
        \ freeze it there, or ask Qumulo to remove the old object from the bucket\
        \ and freeze the path again.\",\n          \"type\": \"string\"\n        },\n\
        \        \"changed_while_archived\": {\n          \"description\": \"Files\
        \ holding a change their archived object lacks, such as a write the cluster\
        \ took just before the object was archived. This includes a file whose archived\
        \ object has a temporary restored copy. The cluster keeps the change, but\
        \ can't send the whole file to the bucket while its object is archived. On\
        \ Azure, thaw the file, then freeze it again: the freeze sends the file to\
        \ the bucket with the change and archives it. On AWS a thaw leaves the object\
        \ archived, so no freeze can yet send such a file.\",\n          \"type\"\
        : \"string\"\n        },\n        \"key_holds_online_object\": {\n       \
        \   \"description\": \"Files whose name in the bucket holds an object in an\
        \ online storage class, or held one that was since deleted. Only a write from\
        \ outside Qumulo leaves one there. The freeze neither overwrites nor archives\
        \ such an object. To freeze the file's data, copy it to a new path and freeze\
        \ the copy, then delete the original if it's no longer needed.\",\n      \
        \    \"type\": \"string\"\n        }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    preview: true
  delete:
    summary: '[preview] Removes a job that is FINISHED, CANCELED or FAILED, so it
      is no longer listed. Its files stay as they are. Returns HTTP 409 for a job
      in progress, including a thaw that is only waiting for the provider to bring
      its files back; cancel it first. A job canceled or failed partway through its
      files also returns HTTP 409 until every request it already sent to the provider
      has returned, such as an upload part in flight; a freeze also returns it until
      it has released its files, which for a large file can take hours. Retry then.
      While Azure refuses the cluster''s requests, as with a revoked credential, or
      is unavailable, a freeze can''t release its files, so its delete returns HTTP
      409 until Azure answers again. A file whose release keeps failing after retries
      stays frozen, and once several in a row keep failing, so do the files the freeze
      hasn''t released yet. A later freeze or thaw that reaches such a file tries
      its release again first. Returns HTTP 404 if no Frozen bridge has this UUID
      or the bridge has no job with this ID.'
    parameters:
    - name: filesystem_uuid
      description: The Frozen bridge's filesystem UUID, as `GET /v1/frozen/bridges/`
        reports it.
      required: true
    - name: id
      description: The job's ID, as starting or listing the job reports it.
      required: true
    response_body: {}
    responses:
    - code: '204'
      description: Return value on success
    preview: true
rest_endpoint: /v1/frozen/bridges/{filesystem_uuid}/jobs/{id}
api_version: v1
deprecated: false
permalink: /rest-api-guide/frozen-v1/frozen_bridges_filesystem_uuid_jobs_id.html
sidebar: rest_api_guide_sidebar
---
