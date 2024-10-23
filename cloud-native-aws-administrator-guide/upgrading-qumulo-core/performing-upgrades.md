---
title: "Performing Qumulo Core Upgrades"
summary: "This section explains the difference between Qumulo Core Instant Software Upgrades and Platform Upgrades and how to perform upgrades."
redirect_from:
  - /aws-administrator-guide/upgrading-qumulo-core/performing-upgrades.html
permalink: /cloud-native-aws-administrator-guide/upgrading-qumulo-core/performing-upgrades.html
sidebar: cloud_native_aws_administrator_guide_sidebar
varContactQumuloCare: If you perform multiple upgrades back to back, you might encounter one or more platform upgrades in one of the incremental releases; you must install these upgrades before you continue. Before performing back to back upgrades, <a href="https://docs.qumulo.com/contacting-qumulo-care-team.html">contact the Qumulo Care team</a> for guidance.
varViewUpgradeStatus: "To view your cluster's upgrade phase and status, run the `qq upgrade_status` command."
varRollingRebootRefresh: If you don't see a rolling reboot option for a platform upgrade, refresh the page in your browser.
varDisableProgressBar: "You can disable the CLI progress bar by adding the <code>--no-monitor</code> flag to your command. If you do this, it isn't possible to cancel the upgrade process after it begins."
varUploadUpgradeFile: "1. Upload the `qumulo_core_x.x.x.qimg` upgrade file to any directory on your cluster by using a client protocol such as NFS or SMB."
varUpgradeTwoPhase: "Run the [`qq upgrade_cluster`](https://docs.qumulo.com/qq-cli-command-guide/upgrade/upgrade_cluster.html) command first with the `prepare` subcommand and then with the `commit` subcommand."
varUpgrade5101Flags: "Use the `--rolling` flag to specify rolling reboot, and the `--path` flag to specify the path to the upgrade file."
varUpgrade506: "Run the [`qq upgrade_cluster`](https://docs.qumulo.com/qq-cli-command-guide/upgrade/upgrade_cluster.html) command and use the `--path` flag to specify the path to the upgrade file."
include_content: content-reuse/admin-guides/upgrading-qumulo-core/performing-upgrades.md
platform: aws
---
