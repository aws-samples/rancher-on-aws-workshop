---
title: 'Importing the Cluster'
weight: 41
---

In the following module, you will complete the outcomes listed below:

1. Use the Rancher Multi-Cluster Manager to import the newly created EKS Cluster.
2. Access the manage the imported EKS Cluster using the Rancher Multi-Cluster Manager.

---

# Importing the EKS Cluster

## Cluster Management

### Step 1:

We have successfully created an EKS Cluster and an RKE2 Cluster. Next, we'll **import** the EKS Cluster to be managed by the Rancher Multi-Cluster Manager. (Since we created the RKE2 Cluster from the Rancher Multi-Cluster Manager, it's already managed. We don't have to import it.)

Start by selecting **`Cluster Management`** from the left menu.

![rancher-cluster-menu](/static/images/content/41-cluster-menu.png)

### Step 2:

In **`Cluster Management`**, we can see the original **`local`** cluster and the created **`rke2-cluster`**. As we have mentioned previosuly in this workshop, the **`local`** cluster is our **`management`** cluster and the **`rke2-cluster`** is our **`downstream cluster`**.

![rancher-cluster-home](/static/images/content/41-cluster-home.png)

## Importing the Cluster

### Step 1:

Next we will start the process of **`importing`** the EKS Cluster.

In the top right hand corner, click the **`Import Exisiting`** button. Since we created an EKS Cluster using **`eksctl`**, click on **`Amazon EKS`** as the type of cluster we want to **`import`** into Rancher.

![rancher-cluster-import-options](/static/images/content/41-cluster-import-options.png)

### Step 2:

### Cluster Configuration:

This is the configuration step for the cluster **`import`** process.

Set a few of the configurations options to the following values:

- **Cluster Name:** eks-cluster
- **Region:** us-east-1
- **Cloud Credentials:** aws
- **Cluster To Register:** eks-cluster

![rancher-cluster-import-eks-config](/static/images/content/41-cluster-import-eks-config.png)

![rancher-cluster-import-eks-cluster](/static/images/content/41-cluster-import-eks-cluster.png)

### Step 3:

Once you have completed the configuration, click the **`Register Cluster`** button. On the next page, the EKS cluster will be in a **`pending`** state. Rancher will be provisioning resources in the cluster that is being imported. In most cases, the cluster import will complete in less than a minute, but can take a few minutes.

![rancher-cluster-import-eks-success](/static/images/content/41-cluster-import-eks-success.png)

### Step 4:

You can select the cluster to find more details about the `import` process or troubleshoot any issues.

![rancher-cluster-import-eks-success-details](/static/images/content/41-cluster-import-eks-success-details.png)

### Step 5:

Once the **`eks-cluster`** completes importing and provisioning the management resources, you will see the cluster as **`Active`**. The available downstream nodes will be listed.

![rancher-cluster-import-eks-successful](/static/images/content/41-cluster-import-eks-successful.png)

### Step 6:

Next, click on the **`eks-cluster`** in the side menu. This is the cluster detail view of our EKS `downstream cluster`. We can interact with our EKS Cluster in the _exact_ same way as our `management cluster` and RKE2 `downstream cluster`. Rancher Multi-Cluster Manager provides a single pane of glass to interact with and manage multiple clusters of different types.

![rancher-cluster-import-eks-success](/static/images/content/41-cluster-import-eks-details.png)

## Completed!

We're done! We imported an EKS Cluster using the Rancher Multi-Cluster Manager. If you have more time to learn, you can optionally move on to install and configure **Additional AWS Integrations**. Otherwise, wrap up with the **Conclusion** section.
