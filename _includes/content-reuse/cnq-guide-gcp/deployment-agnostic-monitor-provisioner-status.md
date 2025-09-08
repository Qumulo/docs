You can monitor the Provisioner from the GCP Console or by using the `gcloud` CLI.

#### To Monitor the Provisioner's Status by Using the GCP Console

1. Log in to the GCP Console.

1. In your project, click **Compute Engine &gt; VM Instances**.

1. {{site.cnq.monitorGCPProvisionerShutdown}}

   The Provisioner stores all necessary state information in a Firestore database and shuts down automatically when it completes its tasks.

#### To Monitor the Provisioner's Status by using the gcloud CLI

<ol>
  <li>
    <p>To check whether the Provisioner is still running, use the <code>gcloud compute instances list</code> command and specify your deployment's name and the format. For example:</p>
    <div class="highlight">
      <pre class="highlight">gcloud compute instances \
  list --filter="{{site.cnq.deploymentUniqueNameExampleGCP}}" \
  --format="table(name,zone,status)"</pre>
    </div>
  </li>
  <li>
    <p>Do one of the following:</p>
    <ul>
      <li>
        <p>If the Provisioner's status is <code>RUNNING</code>, you can retrieve the last console logs for troubleshooting by using the <code>gcloud compute instances get-serial-port-output</code> command and specify your deployment's name and the availability zone. For example:</p>
        <div class="highlight">
          <pre class="highlight">gcloud compute instances
  get-serial-port-output "{{site.cnq.deploymentUniqueNameExampleGCP}}" \
  --zone us-central1-a \
  --port 1 | tail -n 100</pre>
        </div>
      </li>
      <li>If the Provisioner's status is <code>TERMINATED</code>, you can check the Firestore database named after the unique deployment name of your persistent storage.</li>
    </ul>
  </li>
</ol>
