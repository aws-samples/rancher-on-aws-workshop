---
title: "Rancher Applications"
weight: 22
---

In the following module, you will complete the outcomes listed below:

1. Use the Rancher App Catalog to deploy Rancher Longhorn and Rancher NeuVector
2. Explore features inside of Rancher Longhorn and Rancher NeuVector.

---


# Deploying the Rancher Applications

In Exploring the Cluster, we briefly looked at the Rancher App Catalog, but now we are going dive deeper into it with two of the Rancher Kubernetes applications (Longhorn and NeuVector).

## Deploying Rancher Longhorn

### Step 1:

Under **`Apps`** In the left menu, click **`Charts`**. On the right hand side, you will see a filter box. Search for **`longhorn`**.

Select the **`Longhorn`** chart.

![rancher-app-catalog-longhorn](/static/images/content/22-app-longhorn-search.png)

### Step 2:

Here you will see all the relevant information related to **`Longhorn`** such as the Current Version or the Helm Chart README.

![rancher-app-longhorn-setup](/static/images/content/22-app-longhorn-setup.png)

### Step 3:

Before we install Longhorn, we have to make sure we have the prequistes installed on each node in the cluster. Longhorn requires **`nfs`** and **`iscsi`** and provides two **`kubectl`** commands to easily install both packages.

To run these commnads, let's use the kubectl shell provided by the Rancher Manager. On your keyboard, click the **`backtick`** key.

![rancher-app-longhorn-kubectl](/static/images/content/22-app-longhorn-kubectl.png)

Once the kubectl shell opens, copy and paste the two commands below and once they complete, you can close the kubectl shell.

```bash
kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.4.2/deploy/prerequisite/longhorn-iscsi-installation.yaml

kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.4.2/deploy/prerequisite/longhorn-nfs-installation.yaml
```

![rancher-app-longhorn-kubectl-complete](/static/images/content/22-app-longhorn-kubectl-complete.png)

### Step 4:

Once you close the kubectl shell and finish reviewing the chart, click on **`Install`**. Then click **`Next`** and **`Install`** to complete the 
installation. You shouldn't need to change any configuration options.

If you are familiar with Helm, you may recognize the Helm commands running in the shell pane at the bottom of the page. Under the hood the App Catalog is deploying Longhorn with Helm using specific Helm Values. Feel free to close the shell pane as soon as it opens or after you see the **`SUCCESS`** message. 

![rancher-app-longhorn-installed](/static/images/content/22-app-longhorn-installed.png)

### Step 5:

In the left menu, you should now see an item named **`Longhorn`**.

Let's click on it and then right click on the **`Longhorn`** box and **`Open in a New Tab`**.

![rancher-app-longhorn-menu](/static/images/content/22-app-longhorn-menu.png)

### Step 6:

Welcome to Rancher Longhorn! Here is the overview of anything and everything storage related on the cluster, including important storage metrics.

![rancher-longhorn-home](/static/images/content/22-longhorn-home.png)

Let's click on the green circle surrounding **`Nodes`**. This will take us to a detailed view of all nodes in our cluster. In this view you able to view metrics of each of the nodes and update configuration options by clicking on the three line menu.

![rancher-longhorn-nodes](/static/images/content/22-longhorn-nodes.png)

Additionally, we are able to manage and configure Longhorn by clicking on **`Setting`**, then **`General`**, on the top menu. There is a ton of settings and ways to configure Longhorn so don't worry too much about it now.

![rancher-longhorn-settings](/static/images/content/22-longhorn-settings.png)

Feel free to continue exploring Longhorn, but those who want to keep moving forward, let's deploy NeuVector!

## Deploying Rancher NeuVector

### Step 1:

Just like with Longhorn... in the left menu, let's click on **`Charts`**. On the right hand side, you will see a 
filter box. Search for **`neuvector`**.

You will see two Neuvector chart options. Click on the **`blue`** chart for **`NeuVector`**.

![rancher-app-catalog-neuvector](/static/images/content/22-app-neuvector-search.png)

### Step 2:

Here you will see all the relevant information related to **`NeuVector`** such as the Current Version or the Helm Chart README.

![rancher-app-neuvector-setup](/static/images/content/22-app-neuvector-setup.png)


### Step 3:

Once you finish reviewing the chart, click on **`Install`** and follow the steps listed. We will need to change one 
of the configuration options.

Under **`Container Runtime`**, check the box for **`k3s Container Runtime`** and confirm 
**`/run/k3s/containerd/containerd.sock`** is populated in the path box. Uncheck the Docker runtime.
Rancher RKE2 has a lot of components in common with Rancher's k3s distribution of Kubernetes.

Once you set the configuration option, click **`Install`**.

![rancher-app-neuvector-config](/static/images/content/22-app-neuvector-config.png)

### Step 4:

Neuvector should install in less than a minute. Just like with Longhorn, feel free to close the shell pane as 
soon as it opens or after you see the **`SUCCESS`** message.

![rancher-app-neuvector-installed](/static/images/content/22-app-neuvector-installed.png)

### Step 5:

In the left menu, you should now see an item named **`NeuVector`**.

Click on it and then right click on the **`NeuVector`** box and **`Open in a New Tab`**.

![rancher-app-neuvector-menu](/static/images/content/22-app-neuvector-menu.png)

### Step 6:

Once NeuVector opens in a new tab, accept the End User License Agreement if shown. If propmted for credentials, 
enter the default username **`"admin"`** and default password **`"admin"`** and click **`Login`**.

Be sure to change default passwords for NeuVector and throughout the system when deploying to production.

![rancher-neuvector-login](/static/images/content/22-neuvector-login.png)

### Step 7:

Welcome to Rancher NeuVector! You're greeted with the dashboard that provides an overview of your current security events, metrics, and risks. A really cool feature here is the Risk Score, which highlights security concerns and ways to improve it. Some are even single click changes!

![rancher-neuvector-home](/static/images/content/22-neuvector-home.png)

Head over to the Network Activity tool by clicking **`Network Activity`** on the the left side menu. 

Here you can see an complete picture of all nodes, namespaces, containers, and more inside of the cluster. If you 
right-click on any item, you can view more information related to that item.

![rancher-neuvector-network-activity](/static/images/content/22-neuvector-network-activity.png)

Another important aspect to NeuVector is Vulnerabilities scanning, detection, and mitigation. If you click on **`Security Risks`**, then **`Vulnerabilities`**, you will see a complete overview of all Vulnerabilities in the cluster. Including all nodes, namespaces, containers, and more!

![rancher-neuvector-vulnerabilities](/static/images/content/22-neuvector-vulnerabilities.png)


## Completed!

We're done! You've deployed and explored Rancher Longhorn and Rancher NeuVector using the Rancher Multi-Cluster Manager, all without a single line of code! Let's move onto deploying a few Kubernetes applications using Rancher.