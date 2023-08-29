---
title: 'Rancher Applications'
weight: 22
---

In the following module, you will complete the outcomes listed below:

1. Use the Rancher App Catalog to deploy Longhorn and NeuVector
2. Explore features of Longhorn and NeuVector.

---

# Deploying the Rancher Applications

In Exploring the Cluster, we briefly looked at the Rancher App Catalog. Now, we are going dive deeper by installing two core Rancher Kubernetes applications: Longhorn and NeuVector.

## Deploying Longhorn

### Step 1 (Longhorn):

In the left side menu, under **`Apps`**, click **`Charts`**. On the right hand side, you will see a filter box. Search for **`longhorn`**. Click the blue box to select the **`Longhorn`** chart.

![rancher-app-catalog-longhorn](/static/images/content/22-app-longhorn-search.png)

### Step 2 (Longhorn):

Here are all the relevant details for the **`Longhorn`** chart, like the Current Version or the Helm Chart README.

![rancher-app-longhorn-setup](/static/images/content/22-app-longhorn-setup.png)

### Step 3 (Longhorn):

Before we install Longhorn, we have to make sure we have the prerequistes installed on each node in the cluster. Longhorn requires **`nfs`** and **`iscsi`**. Longhorn provides **`kubectl`** deployment manifests to install each package.

To install the dependencies, run these commnads using the kubectl shell provided by the Rancher Manager. On your keyboard, click the **`backtick`** key.

![rancher-app-longhorn-kubectl](/static/images/content/22-app-longhorn-kubectl.png)

Once the kubectl shell opens, copy and paste the two commands below. Once they complete, you can close the kubectl shell.

```bash
kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.4.2/deploy/prerequisite/longhorn-iscsi-installation.yaml

kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.4.2/deploy/prerequisite/longhorn-nfs-installation.yaml
```

![rancher-app-longhorn-kubectl-complete](/static/images/content/22-app-longhorn-kubectl-complete.png)

### Step 4 (Longhorn):

Once you close the kubectl shell and finish reviewing the chart, click on **`Install`**, then click **`Next`**, and finally click **`Install`** to complete the installation. You shouldn't need to change any configuration options.

If you are familiar with Helm, you may recognize the Helm commands running in the shell pane at the bottom of the page. Under the hood the App Catalog is deploying Longhorn with Helm using specific Helm Values. Feel free to close the shell pane as soon as it opens, or you can watch the install and close the shell when you see the **`SUCCESS`** message.

![rancher-app-longhorn-installed](/static/images/content/22-app-longhorn-installed.png)

### Step 5 (Longhorn):

In the left menu, you should now see **`Longhorn`**.

Click on it, and then click on the **`Longhorn`** box.

![rancher-app-longhorn-menu](/static/images/content/22-app-longhorn-menu.png)

### Step 6 (Longhorn):

Welcome to Longhorn! This overview page shows you storage metrics for your cluster.

![rancher-longhorn-home](/static/images/content/22-longhorn-home.png)

Click on the green circle surrounding **`Nodes`**. This will take us to a detailed view of all nodes in our cluster. In the node detail page you can view metrics for each node and update configuration options by clicking on the three line menu.

![rancher-longhorn-nodes](/static/images/content/22-longhorn-nodes.png)

You can manage and configure Longhorn by clicking on **`Setting`**, then **`General`**, on the top menu. Longhorn has a lot of configuration options, but we will leave them at default values for this workshop.

![rancher-longhorn-settings](/static/images/content/22-longhorn-settings.png)

Feel free to explore Longhorn more, and then continue on to deploy NeuVector.

## Deploying NeuVector

### Step 1 (NeuVector):

The Rancher App Manager installation process for NeuVector is very similar to the one for Longhorn. In the left side menu, under **`Apps`**, click **`Charts`**. On the right hand side, you will see a
filter box. Search for **`neuvector`**.

You will see two Neuvector chart options. Click on the **`blue`** box for the **`NeuVector`** Chart.

![rancher-app-catalog-neuvector](/static/images/content/22-app-neuvector-search.png)

### Step 2 (NeuVector):

Here are all the relevant details for the **`NeuVector`** chart, like the Current Version or the Helm Chart README.

![rancher-app-neuvector-setup](/static/images/content/22-app-neuvector-setup.png)

### Step 3 (NeuVector):

Once you finish reviewing the chart, click **`Next`** and follow the steps listed. We will need to change two
configuration options. Before proceeding, be sure to check the box for **`Customize Helm options before install`**.

![rancher-app-neuvector-helm](/static/images/content/22-app-neuvector-helm.png)

Under **`Container Runtime`**, check the box for **`k3s Container Runtime`** and confirm
**`/run/k3s/containerd/containerd.sock`** is populated in the path box. Uncheck the Docker runtime.
Rancher RKE2 has a lot of components in common with Rancher's k3s distribution of Kubernetes, including the container runtime.

![rancher-app-neuvector-helm-config-1](/static/images/content/22-app-neuvector-helm-config-1.png)

Under **`PVC Configuration`**, check the box for **`PVC Status`**. Additionally, under **`Storage Class Name`** enter **`longhorn`**.

![rancher-app-neuvector-helm-config-2](/static/images/content/22-app-neuvector-helm-config-2.png)

Once you set the configuration option, click **`Next`** and then click **`Install`**.

### Step 4 (NeuVector):

Neuvector should install in less than a minute. Feel free to close the shell pane as soon as it opens, or you can watch the install and close the shell when you see the **`SUCCESS`** message.

![rancher-app-neuvector-installed](/static/images/content/22-app-neuvector-installed.png)

### Step 5 (NeuVector):

In the left menu, you should now see **`NeuVector`**.

Click on it, then click on the **`NeuVector`** box.

![rancher-app-neuvector-menu](/static/images/content/22-app-neuvector-menu.png)

### Step 6 (NeuVector):

Once NeuVector opens in a new tab, accept the End User License Agreement if shown. If prompted for credentials, enter the default username **`"admin"`** and default password **`"admin"`**, then click **`Login`**.

> **Note: Be sure to update the admin password from the default password of `admin` as soon as possible after completing the NeuVector install. Default passwords should never be used in any environment.**

![rancher-neuvector-login](/static/images/content/22-neuvector-eula.png)

### Step 7 (NeuVector):

Welcome to NeuVector! The initial dashboard provides an overview of your current security events, metrics, and risks. The Risk Score highlights specific security concerns and suggests ways to improve the cluster's security posture. Some issues can be resolved by simple, automated remediations.

![rancher-neuvector-home](/static/images/content/22-neuvector-home.png)

### Step 8 (NeuVector):

Before continuing to explore NeuVector, turn on automatic scanning of the cluster. In the top right hand corner of the dashboard, click on the **`Fourth Bubble`** and then click the slider for **`Auto Scan`**. Now NeuVector will automatically retrieve current scan results from the cluster.

![rancher-neuvector-home-autoscan](/static/images/content/22-neuvector-home-autoscan.png)

### Step 9 (NeuVector):

Now launch the Network Activity tool by clicking **`Network Activity`** on the the left side menu.

This tool provides a complete picture of all nodes, namespaces, containers, and other resources in the cluster. If you right-click on any item, you can view more information related to that item.

![rancher-neuvector-network-activity](/static/images/content/22-neuvector-network-activity.png)

Another important feature of NeuVector is vulnerability scanning, detection, and mitigation. If you click on **`Security Risks`**, then **`Vulnerabilities`**, you will see a complete overview of all detected vulnerabilities in the cluster.

![rancher-neuvector-vulnerabilities](/static/images/content/22-neuvector-vulnerabilities.png)

## Completed!

We're done! We deployed and explored Longhorn and NeuVector using the Rancher Multi-Cluster Manager using the Rancher App Manager. Click **Next** to move on to deploy additional Kubernetes applications using Rancher.
