For an overview of {{site.gcp.cnqGCPshort}}, its prerequisites, and limits, see [How Cloud Native Qumulo Works](how-cloud-native-qumulo-works.html).

The {{page.varRepoLink}} contains comprehensive Terraform configurations that let you deploy GCS buckets and then create a {{site.cnqShort}} cluster with 1 or 3&ndash;24 instances that have fully elastic compute and capacity.

## Prerequisites
This section explains the prerequisites to deploying {{site.gcp.cnqGCPshort}}.

* To allow instances without external IP addresses to reach GCP APIs, you must enable Private Google Access.

* To allow your Qumulo cluster to report metrics to Qumulo, your VPC must have outbound Internet connectivity through a Cloud NAT gateway. Your instance shares no file data during this process.

  {{site.data.alerts.important}}
  Connectivity to the following endpoints is required for a successful deployment of a Qumulo instance and quorum formation:
  <ul>
    <li><code>api.missionq.qumulo.com</code></li>
    <li><code>api.nexus.qumulo.com</code></li>
  </ul>
  {{site.data.alerts.end}}

* To enable the following services for your Google Cloud project, use the `gcloud services enable` command:

  <ul class="two-columns">
    <li><code>cloudkms.googleapis.com</code></li>
    <li><code>compute.googleapis.com</code></li>
    <li><code>logging.googleapis.com</code></li>
    <li><code>monitoring.googleapis.com</code></li>
    <li><code>secretmanager.googleapis.com</code></li>
    <li><code>storage-api.googleapis.com</code>: Required only if you store your Terraform state in GCS buckets</li>
    <li><code>storage.googleapis.com</code></li>
  </ul>

* To configure IAM, add the least-privilege role configurations appropriate for your organization to separate service accounts:

  * **Terraform Deployment Service Account**

    <ul class="two-columns">
      <li><code>roles/cloudkms.crypto<wbr>Key<wbr>Encrypter<wbr>Decrypter</code>: Required only if you use customer-managed encryption keys (CMEKs)</li>
      <li><code>roles/compute.admin</code></li>
      <li><code>roles/iam.serviceAccountUser</code></li>
      <li><code>roles/logging.configWriter</code>: Required only for creating log sinks</li>
      <li><code>roles/monitoring.editor</code>: Required only for creating dashboards and alerts</li>
      <li><code>roles/resourcemanager.projectIamAdmin</code></li>
      <li><code>roles/secretmanager.admin</code></li>
      <li><code>roles/storage.admin</code></li>
    </ul>

  * **Virtual Machine (Node) Service Account**

    <ul>
      <li><code>roles/compute.viewer</code>: Required only for instance metadata introspection</li>
      <li><code>roles/secretmanager.secretAccessor</code></li>
      <li><code>roles/storage.objectViewer</code></li>
    </ul>

### How the {{site.cnqShort}} Provisioner Works {#how-the-provisioner-works}
The {{site.cnqShort}} Provisioner is a Google Compute Engine (GCE) instance that configures your Qumulo cluster and any additional GCP environment requirements.

<a id="monitor-provisioner-status"></a>
{% include content-reuse/cnq-guide-gcp/deployment-agnostic-monitor-provisioner-status.md %}
