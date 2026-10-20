---
category: frozen
command: frozen_job_get
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
permalink: /qq-cli-command-guide/frozen/frozen_job_get.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq frozen_job_get</code> command.
synopsis: 'Show a freeze or thaw job: what it covers, its state, and how many files
  and bytes it has started on and finished. A thaw''s started but unfinished files
  are waiting for Azure to bring them back online.'
title: qq frozen_job_get
usage: qq frozen_job_get [-h] --id ID [--bridge-path BRIDGE_PATH]
zendesk_source: qq CLI Command Guide

---