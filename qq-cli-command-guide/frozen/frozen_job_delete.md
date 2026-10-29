---
category: frozen
command: frozen_job_delete
optional_options:
- alternate: []
  help: The job's ID, as frozen_freeze, frozen_thaw or frozen_job_list prints it.
  name: --id
  required: true
- alternate: []
  help: 'Cluster path of the Frozen bridge, or of any file or directory on it. (Default:
    the cluster''s only Frozen bridge, when it has exactly one)'
  name: --bridge-path
  required: false
permalink: /qq-cli-command-guide/frozen/frozen_job_delete.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq frozen_job_delete</code> command.
synopsis: Delete a freeze or thaw job that is FINISHED, CANCELED or FAILED, so it
  is no longer listed. Its files stay as they are. A job in progress is refused, including
  a thaw that is only waiting for Azure; cancel it first. A job canceled or failed
  partway is refused too until every request it already sent to Azure has returned
  and any upload it must finish has ended, which for a large file can take hours;
  retry later.
title: qq frozen_job_delete
usage: qq frozen_job_delete [-h] --id ID [--bridge-path BRIDGE_PATH]
zendesk_source: qq CLI Command Guide

---