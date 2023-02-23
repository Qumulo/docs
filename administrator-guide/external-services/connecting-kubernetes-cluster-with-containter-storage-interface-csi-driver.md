---
title: "Connecting Your Kubernetes Cluster to Your Qumulo Cluster by Using the Qumulo Container Storage Interface (CSI) Driver"
summary: "This section introduces the Qumulo Container Storage Interface (CSI) driver and explains how you can connect your Kubernetes cluster to your Qumulo cluster by using the Qumulo CSI driver."
permalink: /administrator-guide/external-services/connecting-kubernetes-cluster-with-containter-storage-interface-csi-driver.html
keywords: static, dynamic, expansion, persistent volume claim, PVC, container storage interface, CSI, Kubernetes
sidebar: administrator_guide_sidebar
---

To automate container storage, enable dynamic volumes, and help you scale your application container images based on usage and workflows, Qumulo uses its CSI driver to connect the Kubernetes orchestrator to Qumulo persistent storage. (In comparison, for example, the [NFS CSI Driver for Kubernetes](https://github.com/kubernetes-csi/csi-driver-nfs) requires unprivileged NFS access for dynamic volumes and doesn't support volume sizing and expansion.)

For general driver information, see the [Container Storage Interface (CSI) Specification](https://github.com/container-storage-interface/spec).


## Supported Features
The Qumulo CSI Driver supports:

* Static and dynamic (expansion) provisioning over NFSv3

* The following Persistent Volume Claim access modes:

  * `ReadOnlyMany`

  * `ReadWriteMany`

  * `ReadWriteOnce`

  * `ReadWriteOncePod`
 
{{site.data.alerts.important}}
<p>Currently, the driver doesn't support the following features:</p>
<ul>
  <li><a href="https://kubernetes-csi.github.io/docs/volume-cloning.html">Volume cloning</a></li>
  <li><a href="https://kubernetes-csi.github.io/docs/snapshot-restore-feature.html">Volume snapshot and restore</a></li>
  <li>NFSv4.1</li>
</ul>
{{site.data.alerts.end}}


## Requirements
* A Qumulo cluster
 
* Kubernetes 1.19 (and higher)


## Connecting Your Qumulo Cluster to Kubernetes
This section explains how you can configure, provision, and mount Qumulo storage for each _Pod_ (a logical wrapper for a container) on Kubernetes by using dynamic provisioning. This gives you more control over persistent volume capacity.

### Step 1: Install the Qumulo CSI Driver
1. Log in to a machine that has kubectl and can access your Kubernetes cluster.

1. [Download the `.zip` file](https://csi-driver-qumulo.s3.us-west-2.amazonaws.com/deploy_v1.1.0.zip) or use one of the following commands.

   * S3:

     ```bash
     aws s3 cp s3://csi-driver-qumulo/deploy_v1.1.0.zip ./
     ```
   
   * HTTP:

     ```bash
     wget https://csi-driver-qumulo.s3.us-west-2.amazonaws.com/deploy_v1.1.0.zip
     ```
     
1. Extract the contents of the `.zip` file.

1. Run the shell script and specify the current release version. For example:

   * Linux:

     ```bash
     cd deploy_v1.1.0
     chmod +x install_driver.sh
     ./install-driver.sh
     ```
   
   * Windows:
   
     ```bat
     cd deploy_v1.1.0
     install-driver.bat
     ```
     
   The script configures Qumulo's prebuilt Elastic Container Registry (ECR) image (from `public.ecr.aws/qumulo/csi-driver-qumulo:v1.1.0`) and installs it on your Kubernetes system.
   
### Step 2: Configure Volume and NFS Export Paths
To prepare your Qumulo cluster for connecting to your Kubernetes cluster, you must first configure your volume and NFS export paths on your Qumulo cluster by setting the following parameters for each storage class that you define.

{% include tip.html content="Note the paths for the following YAML keys for the `storageclass-qumulo.yaml` file that you use when you [create a storage class](#step-5-create-storage-class)." %}

1. For `storeRealPath`, from the root of the Qumulo file system, create a directory for storing volumes on your Qumulo cluster, for example `/csi/volumes1`.

   {% include note.html content="Because the CSI driver doesn't create the directory listed in the `storeRealPath` key automatically, this directory must exist above the NFS export and must not be the NFS export itself." %}

1. For `storeExportPath`, create the NFS export for hosting the persistent volume.

1. When you configure your cluster for multitenancy and the cluster's default tenant doesn't manage the NFS export, the optional `tenantId` parameter directs the driver to use the provided tenant. For more information, see [Configure Multi-Tenancy with Qumulo](https://care.qumulo.com/hc/en-us/articles/360054089954) on Qumulo Care.

   {% capture tenantId %}You must provide the value for `tenantId` as a string. For example: `"2"`.{% endcapture %}
   {% include note.html content=tenantId %}
   
### Step 3: Configure Credentials
To connect your Kubernetes cluster to your Qumulo cluster, you must either use an existing account or create a new account for the CSI driver to communicate with the Qumulo API.

1. Configure a username and password for a user on your Qumulo cluster.

1. The configured username must have the following permissions:

   * Lookup on `storeRealPath`
   
   * Create directories in `storeRealPath`
 
   * Create and modify quotas:
   
     * `PRIVILEGE_QUOTA_READ`
     
     * `PRIVILEGE_QUOTA_WRITE`
     
   * Read NFS exports: `PRIVILEGE_NFS_EXPORT_READ`
   
   * Perform `TreeDelete` operations on volume directories: `PRIVILEGE_FS_DELETE_TREE_WRITE`

For more information, see [Role-Based Access Control (RBAC) with Qumulo Core](https://care.qumulo.com/hc/en-us/articles/360036591633) on Qumulo Care.

<a id="step-4-create-configure-secrets"></a>
### Step 4: Create and Configure Secrets
To allow the CSI driver to operate with your Qumulo cluster, you must create and configure Secrets. You may use either Basic Authentication with a username and password, or an [Access Token](https://care.qumulo.com/hc/en-us/articles/360004600994). Depending on configuration, Basic Authentication may be disallowed and using an Access Token will be required.

1. Configure one of the following authentication types.

   * Basic Authentication:

     ```bash
     kubectl create secret generic cluster1-login \
       --type="kubernetes.io/basic-auth" \
       --from-literal=username=bill \
       --from-literal=password=SuperSecret \
       --namespace=kube-system
     ```
   
   * Access Token:

     ```bash
     TOKEN='access-v1:zNTc5D0zWTdNi/KsZo620fu71TweGh47u+S/5NbV...'
     kubectl create secret generic cluster1-login \
       --from-literal=access_token="$TOKEN" \
       --namespace=kube-system
     ```

1. Give the CSI driver access to the Secrets. For example:

   ```bash
   kubectl create role access-secrets \
     --verb=get,list,watch \
     --resource=secrets \
     --namespace kube-system
   kubectl create rolebinding \
     --role=access-secrets default-to-secrets \
     --serviceaccount=kube-system:csi-qumulo-controller-sa \
     --namespace kube-system
   ```

<a id="step-5-create-storage-class"></a>
### Step 5: Create a Storage Class
To link your Kubernetes cluster to your Qumulo cluster, you must create a storage class on your Kubernetes cluster.

1. Begin with the example Qumulo storage class configuration.

   ```yaml
   ---
   apiVersion: storage.k8s.io/v1
   kind: StorageClass
   metadata:
     name: cluster1
   provisioner: qumulo.csi.k8s.io
   parameters:
     server: 203.0.113.0
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
     - intr
     - proto=tcp
   allowVolumeExpansion: true
   ```

1. Edit the configuration for your Qumulo cluster.

   a. Name your storage class.
   
   b. Specify server and `storeRealPath`.

   c. Specify `storeExportPath`.

   d. (Optional) Specify `tenantId`.
   
   e. Configure the following parameters to point to [the Secrets that you have created and configured](#step-4-create-configure-secrets) in the namespace in which you installed the CSI driver:

      * `controller-expand-secret-name`

      * `controller-expand-secret-namespace`

      * `provisioner-secret-name`

      * `provisioner-secret-namespace`

   f. Specify the NFS `mountOptions`. For example:
   
   ```
   mountOptions:
     - nolock
     - intr
     - proto=tcp
     - vers=3
   ```
      
   g. To create the class, apply the configuration. For example:
   
   ```bash
   kubectl create -f storageclass-qumulo.yaml
   ```
      
### Step 6: Create a Persistent Volume Claim (PVC) and Apply it to a Pod
To apply a PVC claim to a Pod dynamically, you must first configure and create it.

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

1. Edit the configuration for your PVC claim.

   a. Name your claim.
   
   b. Change `storeClassName` to the name of your claim.
   
   c. Specify the capacity in `spec.resources.requests.storage`.

       This parameter lets you create a quota on your Qumulo cluster.
      
   d. To create the claim, apply the configuration. For example:
   
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
   
   {% include important.html content="When the PVC is released, a tree-delete is initiated on the Qumulo cluster for the directory that the PVC indicates. To prevent this behavior, set `reclaimPolicy` to `Retain`." %}
   
1. You can launch and use your container image.
