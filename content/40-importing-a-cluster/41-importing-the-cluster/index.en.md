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

Once in **`Cluster Management`**, we can see the original **`local`** cluster and the created **`rke2-cluster`**. As we have mentioned previosuly in this workshop, the **`local`** cluster is our **`management`** cluster and the **`rke2-cluster`** is our **`downstream cluster`**./

![rancher-cluster-home](/static/images/content/41-cluster-home.png)

## Importing the Cluster

### Step 1:

Since we have an understanding of our current state, let's start the process of **`importing`** the EKS Cluster.

In the top right hand corner, click the **`Import Exisiting`** button. Since we created an EKS Cluster using **`eksctl`**, let's click on **`Amazon EKS`** as the type of cluster we want to **`import`** into Rancher!

![rancher-cluster-import-options](/static/images/content/41-cluster-import-options.png)

### Step 2:

### Cluster Configuration:

Here is our configuration view for **`importing`** a cluster. As you can see there is not much needed to get your cluster imported into Rancher.

Let's set a few of the configurations options. Take a look below:

- **Cluster Name:** eks-cluster
- **Region:** us-east-1
- **Cloud Credentials:** aws
- **Cluster To Register:** eks-cluster

![rancher-cluster-import-eks](/static/images/content/41-cluster-import-eks.png)

![rancher-cluster-import-eks-config](/static/images/content/41-cluster-import-eks-config.png)

![rancher-cluster-import-eks-cluster](/static/images/content/41-cluster-import-eks-cluster.png)

### Step 3:

Once we have set the few configuration options, you can now see the EKS cluster is showing as **`pending`**. With most clusters, all you need to do is wait a few seconds or possbily a minute and they will come online.

![rancher-cluster-import-eks-success](/static/images/content/41-cluster-import-eks-success.png)

### Step 4:

If we did want to check the status or if the cluster did not automatically **`import`** into the Rancher Multi-Cluster Manager. Here is where we can see the possible steps to **`import`** the cluster into Rancher!

![rancher-cluster-import-eks-success-details](/static/images/content/41-cluster-import-eks-success-details.png)

### Step 5:

Once the **`eks-cluster`** completes importing and provisioning the management resources, you should see the cluster as **`Active`** and all available nodes like below:

![rancher-cluster-import-eks-successful](/static/images/content/41-cluster-import-eks-successful.png)

### Step 6:

From the previous screenshot, let's click on the **`eks-cluster`** in the side menu. This will bring us to a similiar view that we saw earlier of the **`management cluster`**. Here we are able to interact with our EKS Cluster in the _exact_ same way as our **`management cluster`** and **`rke2-cluster`**. It's pretty cool to be able to have **n** number of clusters and have a true single pane of glass!

![rancher-cluster-import-eks-success](/static/images/content/41-cluster-import-eks-details.png)

## Completed!

We're done! You've just imported an EKS Cluster using the Rancher Multi-Cluster Manager. If you have the time, feel free to move onto installing and configuring the **Additional AWS Integrations**! Otherwise, wrap up with the **Conclusion**!
