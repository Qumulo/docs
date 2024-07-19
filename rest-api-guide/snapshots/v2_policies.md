---
category: /snapshots
methods:
  get:
    parameters: []
    response_body:
      schema: "{\n  \"description\": \"api_snapshot_policies_v2\",\n  \"type\": \"\
        object\",\n  \"properties\": {\n    \"entries\": {\n      \"type\": \"array\"\
        ,\n      \"items\": {\n        \"description\": \"List of snapshot policy\
        \ information\",\n        \"type\": \"object\",\n        \"properties\": {\n\
        \          \"id\": {\n            \"description\": \"The unique identifier\
        \ for the snapshot policy.\",\n            \"type\": \"number\"\n        \
        \  },\n          \"policy_name\": {\n            \"description\": \"The snapshot\
        \ policy name.\",\n            \"type\": \"string\"\n          },\n      \
        \    \"snapshot_name_template\": {\n            \"description\": \"The naming\
        \ template for the snapshots that this policy creates.\",\n            \"\
        type\": \"string\"\n          },\n          \"source_file_id\": {\n      \
        \      \"description\": \"The source file ID of the directory to snapshot\
        \ under this policy.\",\n            \"type\": \"string\"\n          },\n\
        \          \"schedule\": {\n            \"description\": \"The schedule according\
        \ to which to take snapshots under this policy.\",\n            \"type\":\
        \ \"object\",\n            \"properties\": {\n              \"id\": {\n  \
        \              \"description\": \"Identifier for the snapshot policy's schedule.\
        \ Only unique within the scope of a snapshot policy.\",\n                \"\
        type\": \"number\"\n              },\n              \"creation_schedule\"\
        : {\n                \"description\": \"Structure defining when to take snapshots\"\
        ,\n                \"type\": \"object\",\n                \"properties\":\
        \ {\n                  \"timezone\": {\n                    \"description\"\
        : \"The timezone in which the schedule should be interpreted (e.g. America/Los_Angeles\
        \ or UTC).\",\n                    \"type\": \"string\"\n                \
        \  },\n                  \"frequency\": {\n                    \"type\": \"\
        string\",\n                    \"enum\": [\n                      \"SCHEDULE_MONTHLY\"\
        ,\n                      \"SCHEDULE_DAILY_OR_WEEKLY\",\n                 \
        \     \"SCHEDULE_HOURLY_OR_LESS\"\n                    ],\n              \
        \      \"description\": \"Coarse frequency (MONTHLY, DAILY_OR_WEEKLY, or HOURLY_OR_LESS)\
        \ at which to take snapshot:\\n * `SCHEDULE_DAILY_OR_WEEKLY` - SCHEDULE_DAILY_OR_WEEKLY,\\\
        n * `SCHEDULE_HOURLY_OR_LESS` - SCHEDULE_HOURLY_OR_LESS,\\n * `SCHEDULE_MONTHLY`\
        \ - SCHEDULE_MONTHLY\"\n                  },\n                  \"hour\":\
        \ {\n                    \"description\": \"For MONTHLY or DAILY_OR_WEEKLY\
        \ frequency: Hour of day [0, 23] at which to take snapshot\",\n          \
        \          \"type\": \"number\"\n                  },\n                  \"\
        minute\": {\n                    \"description\": \"For MONTHLY or DAILY_OR_WEEKLY\
        \ frequency: minute of hour [0, 59] at which to take snapshot\",\n       \
        \             \"type\": \"number\"\n                  },\n               \
        \   \"on_days\": {\n                    \"description\": \"For DAILY_OR_WEEKLY\
        \ or HOURLY_OR_LESS frequency: list of days of the week on which to take snapshots.\
        \ Choose from SUN, MON, TUE, WED, THU, FRI, and/or SAT. EVERY_DAY can be used\
        \ to specify all days. For MONTHLY frequency: LAST_DAY_OF_MONTH indicates\
        \ that the snapshot should be taken only on the last day of the month.\",\n\
        \                    \"type\": \"array\",\n                    \"items\":\
        \ {\n                      \"type\": \"string\",\n                      \"\
        enum\": [\n                        \"SUN\",\n                        \"MON\"\
        ,\n                        \"TUE\",\n                        \"WED\",\n  \
        \                      \"THU\",\n                        \"FRI\",\n      \
        \                  \"SAT\",\n                        \"EVERY_DAY\"\n     \
        \                 ],\n                      \"description\": \"For DAILY_OR_WEEKLY\
        \ or HOURLY_OR_LESS frequency: list of days of the week on which to take snapshots.\
        \ Choose from SUN, MON, TUE, WED, THU, FRI, and/or SAT. EVERY_DAY can be used\
        \ to specify all days. For MONTHLY frequency: LAST_DAY_OF_MONTH indicates\
        \ that the snapshot should be taken only on the last day of the month.:\\\
        n * `EVERY_DAY` - EVERY_DAY,\\n * `FRI` - FRI,\\n * `MON` - MON,\\n * `SAT`\
        \ - SAT,\\n * `SUN` - SUN,\\n * `THU` - THU,\\n * `TUE` - TUE,\\n * `WED`\
        \ - WED\"\n                    }\n                  },\n                 \
        \ \"day_of_month\": {\n                    \"description\": \"For MONTHLY\
        \ frequency: day of month on which to take snapshot. [1, 27] for specific\
        \ day, 128 for last day of month.\",\n                    \"type\": \"number\"\
        \n                  },\n                  \"window_start_hour\": {\n     \
        \               \"description\": \"For HOURLY_OR_LESS frequency: hour of day\
        \ [0, 23] for start of window during which to take snapshots\",\n        \
        \            \"type\": \"number\"\n                  },\n                \
        \  \"window_start_minute\": {\n                    \"description\": \"For\
        \ HOURLY_OR_LESS frequency: minute of hour [0, 59] for start of window during\
        \ which to take snapshots\",\n                    \"type\": \"number\"\n \
        \                 },\n                  \"window_end_hour\": {\n         \
        \           \"description\": \"For HOURLY_OR_LESS frequency: hour of day [0,\
        \ 23] for end of window during which to take snapshots)\",\n             \
        \       \"type\": \"number\"\n                  },\n                  \"window_end_minute\"\
        : {\n                    \"description\": \"For HOURLY_OR_LESS frequency:\
        \ minute of hour [0, 59] for end of window during which to take snapshots\"\
        ,\n                    \"type\": \"number\"\n                  },\n      \
        \            \"fire_every_interval\": {\n                    \"type\": \"\
        string\",\n                    \"enum\": [\n                      \"FIRE_IN_MINUTES\"\
        ,\n                      \"FIRE_IN_HOURS\"\n                    ],\n     \
        \               \"description\": \"For HOURLY_OR_LESS frequency: units for\
        \ interval (MINUTES or HOURS) at which to take snapshot during specified window:\\\
        n * `FIRE_IN_HOURS` - FIRE_IN_HOURS,\\n * `FIRE_IN_MINUTES` - FIRE_IN_MINUTES\"\
        \n                  },\n                  \"fire_every\": {\n            \
        \        \"description\": \"For HOURLY_OR_LESS frequency: value for interval\
        \ [1, 99] at which to take snapshot during specified window\",\n         \
        \           \"type\": \"number\"\n                  }\n                }\n\
        \              },\n              \"expiration_time_to_live\": {\n        \
        \        \"description\": \"Duration after which to expire snapshots created\
        \ by this policy, in format <quantity><units>, where <quantity> is a positive\
        \ integer less than 100 and <units> is one of [months, weeks, days, hours,\
        \ minutes], e.g. 5days or 1hours. Empty string or never indicates snapshots\
        \ should never expire.\",\n                \"type\": \"string\"\n        \
        \      }\n            }\n          },\n          \"enabled\": {\n        \
        \    \"description\": \"Specifies whether taking snapshots is enabled for\
        \ this policy.\",\n            \"type\": \"boolean\"\n          }\n      \
        \  }\n      }\n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Returns information about all snapshot policies.
  post:
    parameters: []
    request_body:
      schema: "{\n  \"description\": \"api_snapshot_policy_create_v2\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"policy_name\": {\n      \"description\"\
        : \"The snapshot policy name.\",\n      \"type\": \"string\"\n    },\n   \
        \ \"snapshot_name_template\": {\n      \"description\": \"The naming template\
        \ for snapshots that this policy creates. If null, Qumulo Core chooses {ID}_{Policy}\
        \ or {ID}_{Policy}_{Directory}.\",\n      \"type\": \"string\"\n    },\n \
        \   \"source_file_id\": {\n      \"description\": \"The source file ID of\
        \ the directory to snapshot under this policy.\",\n      \"type\": \"string\"\
        \n    },\n    \"schedule\": {\n      \"description\": \"The schedule according\
        \ to which to take snapshots under this policy.\",\n      \"type\": \"object\"\
        ,\n      \"properties\": {\n        \"id\": {\n          \"description\":\
        \ \"Identifier for the snapshot policy's schedule. Only unique within the\
        \ scope of a snapshot policy.\",\n          \"type\": \"number\"\n       \
        \ },\n        \"creation_schedule\": {\n          \"description\": \"Structure\
        \ defining when to take snapshots\",\n          \"type\": \"object\",\n  \
        \        \"properties\": {\n            \"timezone\": {\n              \"\
        description\": \"The timezone in which the schedule should be interpreted\
        \ (e.g. America/Los_Angeles or UTC).\",\n              \"type\": \"string\"\
        \n            },\n            \"frequency\": {\n              \"type\": \"\
        string\",\n              \"enum\": [\n                \"SCHEDULE_MONTHLY\"\
        ,\n                \"SCHEDULE_DAILY_OR_WEEKLY\",\n                \"SCHEDULE_HOURLY_OR_LESS\"\
        \n              ],\n              \"description\": \"Coarse frequency (MONTHLY,\
        \ DAILY_OR_WEEKLY, or HOURLY_OR_LESS) at which to take snapshot:\\n * `SCHEDULE_DAILY_OR_WEEKLY`\
        \ - SCHEDULE_DAILY_OR_WEEKLY,\\n * `SCHEDULE_HOURLY_OR_LESS` - SCHEDULE_HOURLY_OR_LESS,\\\
        n * `SCHEDULE_MONTHLY` - SCHEDULE_MONTHLY\"\n            },\n            \"\
        hour\": {\n              \"description\": \"For MONTHLY or DAILY_OR_WEEKLY\
        \ frequency: Hour of day [0, 23] at which to take snapshot\",\n          \
        \    \"type\": \"number\"\n            },\n            \"minute\": {\n   \
        \           \"description\": \"For MONTHLY or DAILY_OR_WEEKLY frequency: minute\
        \ of hour [0, 59] at which to take snapshot\",\n              \"type\": \"\
        number\"\n            },\n            \"on_days\": {\n              \"description\"\
        : \"For DAILY_OR_WEEKLY or HOURLY_OR_LESS frequency: list of days of the week\
        \ on which to take snapshots. Choose from SUN, MON, TUE, WED, THU, FRI, and/or\
        \ SAT. EVERY_DAY can be used to specify all days. For MONTHLY frequency: LAST_DAY_OF_MONTH\
        \ indicates that the snapshot should be taken only on the last day of the\
        \ month.\",\n              \"type\": \"array\",\n              \"items\":\
        \ {\n                \"type\": \"string\",\n                \"enum\": [\n\
        \                  \"SUN\",\n                  \"MON\",\n                \
        \  \"TUE\",\n                  \"WED\",\n                  \"THU\",\n    \
        \              \"FRI\",\n                  \"SAT\",\n                  \"\
        EVERY_DAY\"\n                ],\n                \"description\": \"For DAILY_OR_WEEKLY\
        \ or HOURLY_OR_LESS frequency: list of days of the week on which to take snapshots.\
        \ Choose from SUN, MON, TUE, WED, THU, FRI, and/or SAT. EVERY_DAY can be used\
        \ to specify all days. For MONTHLY frequency: LAST_DAY_OF_MONTH indicates\
        \ that the snapshot should be taken only on the last day of the month.:\\\
        n * `EVERY_DAY` - EVERY_DAY,\\n * `FRI` - FRI,\\n * `MON` - MON,\\n * `SAT`\
        \ - SAT,\\n * `SUN` - SUN,\\n * `THU` - THU,\\n * `TUE` - TUE,\\n * `WED`\
        \ - WED\"\n              }\n            },\n            \"day_of_month\":\
        \ {\n              \"description\": \"For MONTHLY frequency: day of month\
        \ on which to take snapshot. [1, 27] for specific day, 128 for last day of\
        \ month.\",\n              \"type\": \"number\"\n            },\n        \
        \    \"window_start_hour\": {\n              \"description\": \"For HOURLY_OR_LESS\
        \ frequency: hour of day [0, 23] for start of window during which to take\
        \ snapshots\",\n              \"type\": \"number\"\n            },\n     \
        \       \"window_start_minute\": {\n              \"description\": \"For HOURLY_OR_LESS\
        \ frequency: minute of hour [0, 59] for start of window during which to take\
        \ snapshots\",\n              \"type\": \"number\"\n            },\n     \
        \       \"window_end_hour\": {\n              \"description\": \"For HOURLY_OR_LESS\
        \ frequency: hour of day [0, 23] for end of window during which to take snapshots)\"\
        ,\n              \"type\": \"number\"\n            },\n            \"window_end_minute\"\
        : {\n              \"description\": \"For HOURLY_OR_LESS frequency: minute\
        \ of hour [0, 59] for end of window during which to take snapshots\",\n  \
        \            \"type\": \"number\"\n            },\n            \"fire_every_interval\"\
        : {\n              \"type\": \"string\",\n              \"enum\": [\n    \
        \            \"FIRE_IN_MINUTES\",\n                \"FIRE_IN_HOURS\"\n   \
        \           ],\n              \"description\": \"For HOURLY_OR_LESS frequency:\
        \ units for interval (MINUTES or HOURS) at which to take snapshot during specified\
        \ window:\\n * `FIRE_IN_HOURS` - FIRE_IN_HOURS,\\n * `FIRE_IN_MINUTES` - FIRE_IN_MINUTES\"\
        \n            },\n            \"fire_every\": {\n              \"description\"\
        : \"For HOURLY_OR_LESS frequency: value for interval [1, 99] at which to take\
        \ snapshot during specified window\",\n              \"type\": \"number\"\n\
        \            }\n          }\n        },\n        \"expiration_time_to_live\"\
        : {\n          \"description\": \"Duration after which to expire snapshots\
        \ created by this policy, in format <quantity><units>, where <quantity> is\
        \ a positive integer less than 100 and <units> is one of [months, weeks, days,\
        \ hours, minutes], e.g. 5days or 1hours. Empty string or never indicates snapshots\
        \ should never expire.\",\n          \"type\": \"string\"\n        }\n   \
        \   }\n    },\n    \"enabled\": {\n      \"description\": \"Specifies whether\
        \ snapshot taking is enabled for this policy (defaults to true).\",\n    \
        \  \"type\": \"boolean\"\n    }\n  }\n}"
    response_body:
      schema: "{\n  \"description\": \"api_snapshot_policy_info_v2\",\n  \"type\"\
        : \"object\",\n  \"properties\": {\n    \"id\": {\n      \"description\":\
        \ \"The unique identifier for the snapshot policy.\",\n      \"type\": \"\
        number\"\n    },\n    \"policy_name\": {\n      \"description\": \"The snapshot\
        \ policy name.\",\n      \"type\": \"string\"\n    },\n    \"snapshot_name_template\"\
        : {\n      \"description\": \"The naming template for the snapshots that this\
        \ policy creates.\",\n      \"type\": \"string\"\n    },\n    \"source_file_id\"\
        : {\n      \"description\": \"The source file ID of the directory to snapshot\
        \ under this policy.\",\n      \"type\": \"string\"\n    },\n    \"schedule\"\
        : {\n      \"description\": \"The schedule according to which to take snapshots\
        \ under this policy.\",\n      \"type\": \"object\",\n      \"properties\"\
        : {\n        \"id\": {\n          \"description\": \"Identifier for the snapshot\
        \ policy's schedule. Only unique within the scope of a snapshot policy.\"\
        ,\n          \"type\": \"number\"\n        },\n        \"creation_schedule\"\
        : {\n          \"description\": \"Structure defining when to take snapshots\"\
        ,\n          \"type\": \"object\",\n          \"properties\": {\n        \
        \    \"timezone\": {\n              \"description\": \"The timezone in which\
        \ the schedule should be interpreted (e.g. America/Los_Angeles or UTC).\"\
        ,\n              \"type\": \"string\"\n            },\n            \"frequency\"\
        : {\n              \"type\": \"string\",\n              \"enum\": [\n    \
        \            \"SCHEDULE_MONTHLY\",\n                \"SCHEDULE_DAILY_OR_WEEKLY\"\
        ,\n                \"SCHEDULE_HOURLY_OR_LESS\"\n              ],\n       \
        \       \"description\": \"Coarse frequency (MONTHLY, DAILY_OR_WEEKLY, or\
        \ HOURLY_OR_LESS) at which to take snapshot:\\n * `SCHEDULE_DAILY_OR_WEEKLY`\
        \ - SCHEDULE_DAILY_OR_WEEKLY,\\n * `SCHEDULE_HOURLY_OR_LESS` - SCHEDULE_HOURLY_OR_LESS,\\\
        n * `SCHEDULE_MONTHLY` - SCHEDULE_MONTHLY\"\n            },\n            \"\
        hour\": {\n              \"description\": \"For MONTHLY or DAILY_OR_WEEKLY\
        \ frequency: Hour of day [0, 23] at which to take snapshot\",\n          \
        \    \"type\": \"number\"\n            },\n            \"minute\": {\n   \
        \           \"description\": \"For MONTHLY or DAILY_OR_WEEKLY frequency: minute\
        \ of hour [0, 59] at which to take snapshot\",\n              \"type\": \"\
        number\"\n            },\n            \"on_days\": {\n              \"description\"\
        : \"For DAILY_OR_WEEKLY or HOURLY_OR_LESS frequency: list of days of the week\
        \ on which to take snapshots. Choose from SUN, MON, TUE, WED, THU, FRI, and/or\
        \ SAT. EVERY_DAY can be used to specify all days. For MONTHLY frequency: LAST_DAY_OF_MONTH\
        \ indicates that the snapshot should be taken only on the last day of the\
        \ month.\",\n              \"type\": \"array\",\n              \"items\":\
        \ {\n                \"type\": \"string\",\n                \"enum\": [\n\
        \                  \"SUN\",\n                  \"MON\",\n                \
        \  \"TUE\",\n                  \"WED\",\n                  \"THU\",\n    \
        \              \"FRI\",\n                  \"SAT\",\n                  \"\
        EVERY_DAY\"\n                ],\n                \"description\": \"For DAILY_OR_WEEKLY\
        \ or HOURLY_OR_LESS frequency: list of days of the week on which to take snapshots.\
        \ Choose from SUN, MON, TUE, WED, THU, FRI, and/or SAT. EVERY_DAY can be used\
        \ to specify all days. For MONTHLY frequency: LAST_DAY_OF_MONTH indicates\
        \ that the snapshot should be taken only on the last day of the month.:\\\
        n * `EVERY_DAY` - EVERY_DAY,\\n * `FRI` - FRI,\\n * `MON` - MON,\\n * `SAT`\
        \ - SAT,\\n * `SUN` - SUN,\\n * `THU` - THU,\\n * `TUE` - TUE,\\n * `WED`\
        \ - WED\"\n              }\n            },\n            \"day_of_month\":\
        \ {\n              \"description\": \"For MONTHLY frequency: day of month\
        \ on which to take snapshot. [1, 27] for specific day, 128 for last day of\
        \ month.\",\n              \"type\": \"number\"\n            },\n        \
        \    \"window_start_hour\": {\n              \"description\": \"For HOURLY_OR_LESS\
        \ frequency: hour of day [0, 23] for start of window during which to take\
        \ snapshots\",\n              \"type\": \"number\"\n            },\n     \
        \       \"window_start_minute\": {\n              \"description\": \"For HOURLY_OR_LESS\
        \ frequency: minute of hour [0, 59] for start of window during which to take\
        \ snapshots\",\n              \"type\": \"number\"\n            },\n     \
        \       \"window_end_hour\": {\n              \"description\": \"For HOURLY_OR_LESS\
        \ frequency: hour of day [0, 23] for end of window during which to take snapshots)\"\
        ,\n              \"type\": \"number\"\n            },\n            \"window_end_minute\"\
        : {\n              \"description\": \"For HOURLY_OR_LESS frequency: minute\
        \ of hour [0, 59] for end of window during which to take snapshots\",\n  \
        \            \"type\": \"number\"\n            },\n            \"fire_every_interval\"\
        : {\n              \"type\": \"string\",\n              \"enum\": [\n    \
        \            \"FIRE_IN_MINUTES\",\n                \"FIRE_IN_HOURS\"\n   \
        \           ],\n              \"description\": \"For HOURLY_OR_LESS frequency:\
        \ units for interval (MINUTES or HOURS) at which to take snapshot during specified\
        \ window:\\n * `FIRE_IN_HOURS` - FIRE_IN_HOURS,\\n * `FIRE_IN_MINUTES` - FIRE_IN_MINUTES\"\
        \n            },\n            \"fire_every\": {\n              \"description\"\
        : \"For HOURLY_OR_LESS frequency: value for interval [1, 99] at which to take\
        \ snapshot during specified window\",\n              \"type\": \"number\"\n\
        \            }\n          }\n        },\n        \"expiration_time_to_live\"\
        : {\n          \"description\": \"Duration after which to expire snapshots\
        \ created by this policy, in format <quantity><units>, where <quantity> is\
        \ a positive integer less than 100 and <units> is one of [months, weeks, days,\
        \ hours, minutes], e.g. 5days or 1hours. Empty string or never indicates snapshots\
        \ should never expire.\",\n          \"type\": \"string\"\n        }\n   \
        \   }\n    },\n    \"enabled\": {\n      \"description\": \"Specifies whether\
        \ taking snapshots is enabled for this policy.\",\n      \"type\": \"boolean\"\
        \n    }\n  }\n}"
    responses:
    - code: '200'
      description: Return value on success
    summary: Creates a new snapshot policy and returns its information.
rest_endpoint: /v2/snapshots/policies/
permalink: /rest-api-guide/snapshots/v2_policies.html
sidebar: rest_api_guide_sidebar
---
