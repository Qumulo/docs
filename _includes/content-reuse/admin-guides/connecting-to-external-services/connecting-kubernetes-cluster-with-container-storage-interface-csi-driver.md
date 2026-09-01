{% capture currentVer %}1.2.0{% endcapture %}

To automate container storage, enable dynamic volumes, and help you scale your application container images based on usage and workflows, Qumulo uses the CSI driver to connect the Kubernetes orchestrator to Qumulo persistent storage. (In comparison, for example, the [NFS CSI Driver for Kubernetes](https://github.com/kubernetes-csi/csi-driver-nfs) requires unprivileged NFS access for dynamic volumes and doesn't support volume sizing and expansion.)

For general driver information, see the [Container Storage Interface (CSI) Specification](https://github.com/container-storage-interface/spec).


## Supported Features
The Qumulo CSI Driver supports:

* Static and dynamic (expansion) provisioning over NFSv3

* The following Persistent Volume Claim access modes:

  * `ReadOnlyMany`

  * `ReadWriteMany`

  * `ReadWriteOnce`

  * `ReadWriteOncePod`

    {% include note.html content="The `ReadWriteOncePod` access mode requires Kubernetes 1.27 (and higher). Earlier Kubernetes versions reject this access mode when you create a Persistent Volume Claim." %}

* NFSv4.1

  {% include important.html content="Even when you enable NFSv4.1 for your Qumulo cluster, you must explicitly [configure NFSv4.1 to work with Kerberos](../kerberos/kerberos-with-qumulo-core.html)." %}

## Unsupported Features
* [Volume cloning](https://kubernetes-csi.github.io/docs/volume-cloning.html)

* [Volume snapshot and restore](https://kubernetes-csi.github.io/docs/snapshot-restore-feature.html)


## Requirements
* A Qumulo cluster
 
* Kubernetes 1.22 (and higher)


## Connecting Your Qumulo Cluster to Kubernetes
This section explains how you can configure, provision, and mount Qumulo storage for each _Pod_ (a logical wrapper for a container) on Kubernetes by using dynamic provisioning. This gives you more control over persistent volume capacity.

### Step 1: Install the Qumulo CSI Driver

{% capture firewall %}If a firewall, HTTP proxy, or private registry mirror limits the registries from which your Kubernetes nodes can pull images, allow both registries (or mirror the images into your private registry) before installing the CSI driver.{% endcapture %}
{{site.data.alerts.note}}
<ul>
  <li>The installation pulls the CSI driver's sidecar containers from <code>registry.k8s.io</code> and the CSI driver's container from <code>public.ecr.aws</code>. {{ firewall }}</li>
  <li>For information about upgrading an existing installation, see <a href="#upgrading-csi-driver">Upgrading the Qumulo CSI Driver</a>.</li>
</ul>
{{site.data.alerts.end}}

1. Connect to a machine that has `kubectl` and can access your Kubernetes cluster.

1. [Download the `.zip` file](https://csi-driver-qumulo.s3.us-west-2.amazonaws.com/deploy_v{{ currentVer }}.zip) or use one of the following commands.

   * **S3**

     ```bash
     aws s3 cp s3://csi-driver-qumulo/deploy_v{{ currentVer }}.zip ./
     ```
   
   * **HTTP with `wget` (Linux)**

     ```bash
     wget https://csi-driver-qumulo.s3.us-west-2.amazonaws.com/deploy_v{{ currentVer }}.zip
     ```

   * **HTTP with `curl` (macOS)**

     ```bash
     curl -O https://csi-driver-qumulo.s3.us-west-2.amazonaws.com/deploy_v{{ currentVer }}.zip
     ```
     
1. Extract the contents of the `.zip` file.

1. Run the shell script and specify the current release version. For example:

   * Linux:

     ```bash
     cd deploy_v{{ currentVer }}
     chmod +x install-driver.sh
     ./install-driver.sh
     ```
   
   * Windows:
   
     ```batch
     cd deploy_v{{ currentVer }}
     install-driver.bat
     ```
     
   The script configures Qumulo's prebuilt Elastic Container Registry (ECR) image (from `public.ecr.aws/qumulo/csi-driver-qumulo:v{{ currentVer }}`) and installs it on your Kubernetes system.

### Step 2: Configure Volume and NFS Export Paths
To prepare your Qumulo cluster for connecting to your Kubernetes cluster, you must first configure your volume and NFS export paths on your Qumulo cluster by setting the following parameters for each storage class that you define.

{% include tip.html content="Write down the paths for the following YAML keys for the `storageclass-qumulo.yaml` file that you use when you [create a storage class in step 5](#step-5-create-storage-class)." %}

1. For `storeRealPath`, from the root of the Qumulo file system, create a directory for storing volumes on your Qumulo cluster, for example `/csi/volumes1`.

   {% include note.html content="Because the CSI driver doesn't create the directory listed in the `storeRealPath` key automatically, this directory must exist below the NFS export and must not be the NFS export itself." %}

1. For `storeExportPath`, create the NFS export for hosting the persistent volume.

1. If your cluster has more than one tenant, specify the tenant ID that contains your NFS export for the `tenantId` parameter.

   {{site.data.alerts.note}}
   <ul>
    <li>If you have only one tenant, it isn't necessary to specify the `tenantId` parameter.</li>
    <li>{{page.varTenantIdString}}</li>
   </ul>
   {{site.data.alerts.end}}
   
### Step 3: Configure Credentials
To connect your Kubernetes cluster to your Qumulo cluster, you must either use an existing account or create a new account for the CSI driver to communicate with the Qumulo API.

1. Configure a username and password for a user on your Qumulo cluster.

1. The configured username must have the following file permissions:

   * Lookup on `storeRealPath`
   
   * Create directories in `storeRealPath`
 
   * Create and modify quotas:
   
     * `PRIVILEGE_QUOTA_READ`
     
     * `PRIVILEGE_QUOTA_WRITE`
     
   * Read NFS exports: `PRIVILEGE_NFS_EXPORT_READ`
   
   * Perform `TreeDelete` operations on volume directories: `PRIVILEGE_FS_DELETE_TREE_WRITE`

For more information, see [Role-Based Access Control (RBAC) with Qumulo Core](../authorization-qumulo-core/managing-role-based-access-control-rbac.html) on Qumulo Care.

### Step 4: Create and Configure Secrets {#step-4-create-configure-secrets}
To allow the CSI driver to operate with your Qumulo cluster, you must create and configure Secrets. You can use one of the following methods:

* Basic authentication with a username and password

  For example:

  ```bash
  kubectl create secret generic cluster1-login \
    --type="kubernetes.io/basic-auth" \
    --from-literal=username=myusername \
    --from-literal=password=mypassword \
    --namespace=kube-system
  ```
   
* A bearer token (or access token)

  For example:

  ```bash
  TOKEN='access-v1:zNTc5D0zWTdNi/KsZo620fu71TweGh47u+S/5NbV...'
  kubectl create secret generic cluster1-login \
    --from-literal=access_token="$TOKEN" \
    --namespace=kube-system
  ```

  For more information, see [Creating and Using Bearer Tokens to Authenticate Qumulo REST API Calls](../authentication-qumulo-core/creating-using-bearer-tokens-to-authenticate-qumulo-rest-api-calls.html).


### Configuring the CSI Driver to Verify Your Cluster's TLS Certificate
The CSI driver communicates with your Qumulo cluster by using the Qumulo REST API over HTTPS. By default, the CSI driver accepts any TLS certificate, including self-signed certificates, without verifying the identity of the cluster that presents it.

{{site.data.alerts.important}}
<ul>
  <li>We strongly recommend configuring verification if your cluster's certificate allows it. Verifying your cluster's TLS certificate can help prevent someone from posing as your cluster in order to capture the CSI driver's credentials.</li>
  <li>Before you configure verification for a storage class in use, confirm that your certificate is current.</li>
  <li>When verification isn't configured, the CSI driver logs the informational warning <code>TLS certificate verification is DISABLED for the Qumulo cluster.</code> for each connection to your cluster.</li>
  <li>When verification is configured, it uses strict rules: If your cluster's certificate is expired, or the certificate's name doesn't match the <code>server</code> value specified for your storage class, provisioning stops with an <code>x509</code> error until you correct the certificate or relax your verification.</li>
</ul>
{{site.data.alerts.end}}

To configure verification, add one of the following optional keys to the Secret that you created. The following table outlines the CSI driver's behavior and key configuration process for each type of cluster certificate issuer.

{% include tip.html content="If your storage class names different Secrets for provisioning and for expansion, add the keys to both Secrets." %}

{% capture doNotDupe %}Don't specify a value for <code>ca_cert</code> and set <code>tls_insecure</code> to <code>true</code> at the same time.{% endcapture %}

<table>
  <thead>
    <tr>
      <th style="width:29%;">Cluster Certificate Issuer</th>
      <th style="width:19%;">CSI Driver Behavior</th>
      <th>Key Configuration</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><p>Public CA</p></td>
      <td><p>The CSI driver verifies the certificate against standard public CAs.</p></td>
      <td>
        <p>Set the <code>tls_insecure</code> key to <code>false</code>. For example:</p>
        <div class="language-bash highlighter-rouge"><div class="highlight"><pre class="highlight"><code>kubectl create secret generic cluster1-login <span class="se">\</span>
  <span class="nt">--type</span><span class="o">=</span><span class="s2">"kubernetes.io/basic-auth"</span> <span class="se">\</span>
  <span class="nt">--from-literal</span><span class="o">=</span><span class="nv">username</span><span class="o">=</span>myusername <span class="se">\</span>
  <span class="nt">--from-literal</span><span class="o">=</span><span class="nv">password</span><span class="o">=</span>mypassword <span class="se">\</span>
  <span class="nt">--from-literal</span><span class="o">=</span><span class="nv">tls_insecure</span><span class="o">=</span><span class="nb">false</span> <span class="se">\</span>
  <span class="nt">--namespace</span><span class="o">=</span>kube-system
</code></pre></div></div></td>
    </tr>
    <tr>
      <td>
        <p>Self-Signed or Your Organization's Internal CA</p>
        {% include note.html content="Because a self-signed certificate provides the same protection as a certificate from a public certificate authority (CA), it isn't necessary to replace a self-signed certificate to configure verification." %}
      </td>
      <td><p>The CSI driver verifies the certificate against only the <code>.pem</code> bundle that you supply.</p></td>
      <td>
        <p>Specify the <code>.pem</code> certificate by using the <code>ca_cert</code> key.</p>
        <p>If a certificate isn't available, you can retrieve it by using the <code>openssl</code> tool. For example:</p>
        <div class="language-bash highlighter-rouge"><div class="highlight"><pre class="highlight"><code>openssl s_client <span class="se">\</span>
  <span class="nt">-connect</span> cluster.example.com:8000 <span class="se">\</span>
  <span class="nt">-showcerts</span> &lt;/dev/null <span class="se">\</span>
  2&gt;/dev/null | openssl x509 <span class="o">&gt;</span> cluster1-ca.pem</code></pre></div></div>
        <p>When you create your Secret, specify a path to the certificate.</p>
        {{site.data.alerts.important}}
        <ul>
          <li>When you specify a <code>.pem</code> bundle for <code>ca_cert</code>, the CSI driver trusts only the specified bundle and rejects any certificates from a public CA that aren't included in the bundle.</li>
          <li>{{ doNotDupe }}</li>
        </ul>
        {{site.data.alerts.end}}
        <p>For example:</p>
        <div class="language-bash highlighter-rouge"><div class="highlight"><pre class="highlight"><code>kubectl create secret generic cluster1-login <span class="se">\</span>
  <span class="nt">--type</span><span class="o">=</span><span class="s2">"kubernetes.io/basic-auth"</span> <span class="se">\</span>
  <span class="nt">--from-literal</span><span class="o">=</span><span class="nv">username</span><span class="o">=</span>myusername <span class="se">\</span>
  <span class="nt">--from-literal</span><span class="o">=</span><span class="nv">password</span><span class="o">=</span>mypassword <span class="se">\</span>
  <span class="nt">--from-file</span><span class="o">=</span><span class="nv">ca_cert</span><span class="o">=</span>cluster1-ca.pem <span class="se">\</span>
  <span class="nt">--namespace</span><span class="o">=</span>kube-system
</code></pre></div></div>
      </td>
    </tr>
    <tr>
      <td>
        <p>Any Issuer</p>
        {% include note.html content="The system retains the current behavior without a log warning." %}
      </td>
      <td><p>The CSI driver skips verification and doesn't log the warning.</p></td>
      <td>
       <p>Set the <code>tls_insecure</code> key to <code>true</code>.</p>
       {{site.data.alerts.important}}{{ doNotDupe }}{{site.data.alerts.end}}
      </td> 
   </tr>
  </tbody>
</table>

### Step 5: Create a Storage Class {#step-5-create-storage-class}
To link your Kubernetes cluster to your Qumulo cluster, you must create a storage class on your Kubernetes cluster.

1. Begin with the example Qumulo storage class configuration.

   {{site.data.alerts.note}}
   <ul>
     <li>In the following example, it is possible to use a fully qualified domain name (FQDN) for the <code>parameters: server:</code> entry.</li>
     <li>For such a configuration, all Kubernetes nodes in the cluster must be able to resolve FQDNs.</li>
   </ul>
   {{site.data.alerts.end}}

   ```yaml
   ---
   apiVersion: storage.k8s.io/v1
   kind: StorageClass
   metadata:
     name: cluster1
   provisioner: qumulo.csi.k8s.io
   parameters:
     server: {{site.exampleIP0}}
     storeRealPath: "/regions/4234/volumes"
     storeExportPath: "/some/export"
     csi.storage.k8s.io/provisioner-secret-name: cluster1-login
     csi.storage.k8s.io/provisioner-secret-namespace: kube-system
     csi.storage.k8s.io/controller-expand-secret-name: cluster1-login
     csi.storage.k8s.io/controller-expand-secret-namespace: kube-system
   reclaimPolicy: Delete
   volumeBindingMode: Immediate
   mountOptions:
     - nolock
     - proto=tcp
     - vers=3
   allowVolumeExpansion: true
   ```

1. Edit the configuration for your Qumulo cluster.

   1. Name your storage class.
   
   1. Specify server and `storeRealPath`.

   1. Specify `storeExportPath`.

   1. (Optional) Specify `tenantId`.
  
      {% capture tenantId %}{{page.varTenantIdString}}{% endcapture %}
      {% include note.html content=tenantId %}
   
   1. Configure the following parameters to point to [the Secrets that you have created and configured](#step-4-create-configure-secrets) in the namespace in which you installed the CSI driver:

      * `controller-expand-secret-name`

      * `controller-expand-secret-namespace`

      * `provisioner-secret-name`

      * `provisioner-secret-namespace`

   1. Specify the NFS `mountOptions`. For example:
   
      ```yaml
      mountOptions:
        - nolock
        - proto=tcp
        - vers=3
      ```
      
   1. To create the class, apply the configuration. For example:
   
   ```bash
   kubectl create -f storageclass-qumulo.yaml
   ```
      
### Step 6: Create a Persistent Volume Claim (PVC) and Apply it to a Pod
To apply a PVC to a Pod dynamically, you must first configure and create it.

1. Begin with the example PVC configuration.

   ```yaml
   ---
   apiVersion: v1
   kind: PersistentVolumeClaim
   metadata:
     name: claim1
   spec:
     accessModes:
       - ReadWriteOnce
     storageClassName: cluster1
     resources:
       requests:
         storage: 1Gi
   ```

1. Edit the configuration for your PVC.

   1. Name your claim.
   
   1. Change `storageClassName` to the name of your storage class.
   
   1. Specify the capacity in `spec.resources.requests.storage`. This parameter lets you create a quota on your Qumulo cluster.
      
   1. To create the claim, apply the configuration. For example:
   
      ```bash
      kubectl apply -f dynamic-pvc.yaml
      ```

1. Use the claim in a Pod or a Deployment. For example:

   ```yaml
   ---
   apiVersion: v1
   kind: Pod
   metadata:
     name: claim1-pod
   spec:
     volumes:
       - name: cluster1
         persistentVolumeClaim:
           claimName: claim1
     containers:
       - name: claim1-container
         image: ...
         volumeMounts:
           - mountPath: "/cluster1"
             name: cluster1
   ```
   
   {% include important.html content="When the PVC is released, a tree-delete is initiated on the Qumulo cluster for the directory that the PVC indicates. To prevent this behavior, set `reclaimPolicy` to `Retain` in your `StorageClass` configuration." %}
   
1. You can launch and use your container image.


## Upgrading the Qumulo CSI Driver {#upgrading-csi-driver}
To upgrade the CSI driver, you can install a new version without removing the previous installation.

{{site.data.alerts.note}}
<ul>
  <li>The upgrade doesn't require changing your existing storage classes, Persistent Volume Claims, or Secrets and doesn't disrupt any running workloads.</li>
  <li>The CSI driver's components restart one at a time and any volumes that are already mounted remain mounted, readable, and writable throughout the upgrade.</li>
  <li>The process pauses new volume creation for a few seconds while the CSI driver's controller restarts.</li>
</ul>
{{site.data.alerts.end}}

### Prerequisites
Before you begin, confirm that your Kubernetes nodes can pull images from `registry.k8s.io`.

{{site.data.alerts.note}}
<ul>   
  <li>Driver versions 1.2.0 (and higher) pull their sidecar containers from <code>registry.k8s.io</code>. {{ firewall }}</li>
  <li>If the registry is unreachable, the new driver Pods remain in the <code>ImagePullBackOff</code> state until it becomes reachable and the previous driver version continues to run.</li>
</ul>
{{site.data.alerts.end}}

### To Upgrade the Qumulo CSI Driver
1. [Download the `.zip` file](https://csi-driver-qumulo.s3.us-west-2.amazonaws.com/deploy_v{{ currentVer }}.zip) for the new driver version and extract its contents.

1. Run the installation script.

   {{site.data.alerts.important}}
   <ul>
     <li>The script applies four manifests, including the CSI driver's role-based access control (RBAC) configuration.</li>
     <li>Updating only the container image references leaves the previous permissions in place and can prevent volume provisioning.</li>
     <li>If the CSI driver can't read Secrets, ensure that the current CSI driver's RBAC manifest has been applied and isn't being overridden by an older manifest.</li>
   </ul>
   {{site.data.alerts.end}}

   ```bash
   cd deploy_v{{ currentVer }}
   chmod +x install-driver.sh
   ./install-driver.sh
   ```

1. (Optional) To monitor the installation process, run the following commands. 

   ```bash
   kubectl -n kube-system rollout status \
     deployment/csi-qumulo-controller

   kubectl -n kube-system rollout status \
     daemonset/csi-qumulo-node
   ```

1. To verify the upgrade, create a test Persistent Volume Claim against one of your storage classes, confirm that it reaches the `Bound` state, and then delete it.

   Any `ReadWriteOncePod` claims that an earlier driver version left in the `Pending` state complete automatically after the upgrade.

1. (Optional) If you created the `access-secrets` role and the `default-to-secrets` role binding while [creating and configuring Secrets](#step-4-create-configure-secrets) for an earlier version of the CSI driver, you may remove them. Version 1.2.0 (and higher) grants this access within the CSI driver's own RBAC configuration.

   ```bash
   kubectl delete rolebinding \
     default-to-secrets --namespace kube-system

   kubectl delete role \
     access-secrets --namespace kube-system
   ```

To roll back to the previous driver version, run `install-driver.sh` from the previous version's deployment files.

{% include note.html content="The additional permissions that version 1.2.0 grants are backwards-compatible with earlier versions." %}
