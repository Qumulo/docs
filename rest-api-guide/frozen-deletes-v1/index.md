---
layout: landing_page
sidebar: rest_api_guide_sidebar
summary: "[preview] Deletes files and directories on a Frozen bridge, whether their data is online or in the Azure Archive tier. File and directory permissions aren't checked. A delete removes a directory once everything under it is gone, so a file created there while the delete runs is deleted too. A delete can't start while a freeze or thaw is working on files under its paths, and no freeze or thaw can start over its paths until it ends. A failed delete says what to do in `failure_message`; what it already deleted stays deleted, and starting a delete of the paths that remain carries on. Azure charges for data in the Archive tier for at least 180 days after it was archived, even when it's deleted sooner."
title: Frozen Deletes V1 (frozen)
redirect_from:
- /rest-api-guide/frozen-deletes/
---
