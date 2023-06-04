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

In the left menu, let's click on **`Charts`**. On the right hand side, you will see a search bar, let's search for **`longhorn`**.

Once you see it filter out, click on **`Longhorn`**.

![rancher-app-catalog-longhorn](/static/images/content/22-app-longhorn-search.png)

### Step 2:

Here you will see all the relevant information related to **`Rancher Longhorn`** such as the Current Version or the Helm Chart README.

![rancher-app-longhorn-setup](/static/images/content/22-app-longhorn-setup.png)

### Step 3:

Once you finish reviewing the chart, let's click on **`Install`** and follow the steps listed. You shouldn't need to change any configuration options.

Feel free to close the shell window as soon as it opens or after you see the **`SUCCESS`** message. If you are familiar with Helm, you will recongize the commands. Under the hood the App Catalog is deploying Longhorn with Helm using specific Helm Values.

![rancher-app-longhorn-installed](/static/images/content/22-app-longhorn-installed.png)

### Step 4:

In the left menu, you should now see an item named **`Longhorn`**.

Let's click on it and then right click on the **`Longhorn`** box and  **`Open in a New Tab`**.

![rancher-app-longhorn-menu](/static/images/content/22-app-longhorn-menu.png)

### Step 5:

Welcome to Rancher Longhorn! Here is the overview of anything and everything storage related on the cluster, including important storage metrics.

![rancher-longhorn-home](/static/images/content/22-longhorn-home.png)

Let's click on the green circle surrounding **`Nodes`**. This will take us to a detailed view of all nodes in our cluster. In this view you able to view metrics of each of the nodes and update configuration options by clicking on the three line menu.

![rancher-longhorn-nodes](/static/images/content/22-longhorn-nodes.png)

Additionally, we are able to manage and configure Longhorn by clicking on **`Setting`**, then **`General`**, on the top menu. There is a ton of settings and ways to configure Longhorn so don't worry too much about it now.

![rancher-longhorn-settings](/static/images/content/22-longhorn-settings.png)

Feel free to continue exploring Longhorn, but those who want to keep moving forward, let's deploy NeuVector!

## Deploying Rancher NeuVector

### Step 1:



![rancher-app-catalog-neuvector](/static/images/content/22-app-neuvector-search.png)

### Step 2:


![rancher-app-neuvector-setup](/static/images/content/22-app-neuvector-setup.png)


### Step 3:



![rancher-app-neuvector-config](/static/images/content/22-app-neuvector-config.png)

### Step 4:



![rancher-app-neuvector-installed](/static/images/content/22-app-neuvector-installed.png)

### Step 5:



![rancher-app-neuvector-menu](/static/images/content/22-app-neuvector-menu.png)

### Step 6:



![rancher-neuvector-home](/static/images/content/22-neuvector-home.png)

![rancher-neuvector-network-activity](/static/images/content/22-neuvector-network-activity.png)

![rancher-neuvector-containers](/static/images/content/22-neuvector-containers.png)

![rancher-neuvector-vulnerabilities](/static/images/content/22-neuvector-vulnerabilities.png)


## Completed!

We're done! You've deployed Rancher Longhorn and Rancher NeuVector using the Rancher Multi-Cluster Manager, all without a single line of code or using the terminal. Let's move onto deploying a few Kubernetes applications using Rancher!