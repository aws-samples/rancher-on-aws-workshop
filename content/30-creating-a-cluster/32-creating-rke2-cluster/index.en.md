---
title: "Creating the RKE2 Cluster"
weight: 32
---

In the following module, you will complete the outcomes listed below:

1. Use the Rancher Multi-Cluster Manager to create a 6 node RKE2 Cluster.
2. Access the manage the newly created RKE2 Cluster using the Rancher Multi-Cluster Manager.

---


# Creating the RKE2 Cluster

## Cluster Management

### Step 1:

Let's start by heading back to the Rancher Multi-Cluster Manager. Open the side menu by clicking the hamburger button
at the top left of the page. In the side menu, click **`Cluster Management`**.

![rancher-cluster-menu](/static/images/content/31-cluster-menu.png)

### Step 2:

 **`Cluster Management`** is one the most powerful features of the Rancher Multi-Cluster Manager. You are able to create and import any type of Kubernetes cluster and manage the complete lifecycle. We are going to start off with **`creating`** an Rancher RKE2 Cluster, but will also be importing an EKS Cluster later in the workshop! 
 
 For now, you will only see your **`local`** cluster. This cluster is the cluster that the Rancher Multi-Cluster Manager is running on locally. Let's get started by adding our AWS Cloud Credentials so we can create our RKE2 Cluster on AWS.

![rancher-cluster-home](/static/images/content/31-cluster-home.png)


## Cloud Credentials

### Step 1:

In the left menu, let's click on **`Cloud Credentials`**. You shouldn't see any existing credentials at this time.

![rancher-cluster-creds-home](/static/images/content/31-cluster-creds-home.png)

### Step 2:

In the top right corner, click on the **`Create`**. Here you will see all the available Cloud Providers that you can use with the Rancher Multi-Cluster Manager. We're going to use AWS, so click on **`Amazon`**.

![rancher-cluster-creds-options](/static/images/content/31-cluster-creds-options.png)

### Step 3:

Now you may be curious how we are going to get the Cloud Credentials. Just like when we were Exploring the Cluster, we are going to go back to the AWS Console and **`Cloud Formation`**, then click on the **`rke2-eks-cluster`** stack and then click on **`Outputs`** tab.

In the **`Outputs`** tab, you should see the **`CloudCredentialKey`** and **`CloudCredentialSecret`**. Let's copy and paste both those values into the Rancher Multi-Cluster Manager. Below is the information you will need to input before clicking **`Create`**.

* **Name:** aws
* **Access Key:** *CloudCredentialKey*
* **Secret Key:** *CloudCredentialSecret*
* **Default Region:** us-east-1

![rancher-cluster-creds-cf](/static/images/content/31-cluster-creds-cf.png)

![rancher-cluster-creds-aws](/static/images/content/31-cluster-creds-aws.png)

## Creating the Cluster

### Step 1:

Now that we have our **`Cloud Credential`** added to the Rancher Multi-Cluster Manager, in the left menu, click on **`Clusters`**, then click on **`Create`**. Just like the Cloud Credential menu, you can see all the available Cloud Providers that you can use to create a cluster. Let's click on **`Amazon EC2`**.

![rancher-cluster-create-options](/static/images/content/31-cluster-create-options.png)

### Step 2:

Here you will see all the available options you can use to configure the creation of the cluster. We will be using most of the default values, but feel free to explore as we move through it. Make sure to use all the values below:

### Cluster Information:

* **Cloud Credential:** aws
* **Cluster Name:** rke2-cluster
* **Cluster Description:** rke2 downstream cluster

![rancher-cluster-create-ec2](/static/images/content/31-cluster-create-ec2.png)

### Machine Pools:

* **pool1 (default name)**
    * **Pool Name:** cp-nodes
    * **Machine Count**: 3
    * **Roles:** etcd && Control Plane
    * **Region:** us-east-1
    * **Zone:** A
    * **Instance Type:** m5.xlarge
    * **Root Disk Size:** 128
    * **VPC/Subnet:** ...-private-1
        * Use the Subnet ending with *private-1*
    * **Show Advanced Drop-Down:** Use only private address

Add a new pool with the plus sign on the left pool list panel.

* **pool2 (default name)**
    * **Pool Name:** wk-nodes
    * **Machine Count:** 3
    * **Roles:** Worker
    * **Region:** us-east-1
    * **Zone:** A
    * **Instance Type:** m5.xlarge
    * **Root Disk Size:** 128
    * VPC/Subnet: ...private-1
    * **VPC/Subnet:** ...-private-1
        * Use the Subnet ending with *private-1*
    * **Show Advanced Drop-Down:** Use only private address

![rancher-cluster-create-ec2-pools](/static/images/content/31-cluster-create-ec2-pools.png)

### Cluster Configuration:

No changes are required in this section, but feel free to explore the different configuration options.

Once you are ready to create the cluster, click on **`Create`**.

![rancher-cluster-create-ec2-config](/static/images/content/31-cluster-create-ec2-config.png)

### Step 3:

Here you will see the **`rke2-cluster`** listed in the menu we saw before with all the clusters under management of the Rancher Multi-Cluster Manager.

![rancher-cluster-create-ec2-success](/static/images/content/31-cluster-create-ec2-success.png)

### Step 4:

Let's click into the **`rke2-cluster`**. You will see that it is starting to create resources on AWS and each of the nodes are in different states. The cluster creation process will take roughly 5 to 10 minutes.

![rancher-cluster-create-ec2-success-details](/static/images/content/31-cluster-create-ec2-success-details.png)

### Step 5:

Once the nodes finished creating resources and provisioning, you will see each node and the cluster is marked as **`Running`**.

Let's go into the newly created cluster and explore it. Open the side menu and click on **`rke2-cluster`**.

![rancher-cluster-create-ec2-successful](/static/images/content/31-cluster-create-ec2-successful.png)

### Step 6:

Here you will notice this is the same view that we saw under Exploring the Cluster. You are able to do everything you were able to do before, but inside of this cluster.

![rancher-cluster-create-ec2-detail](/static/images/content/31-cluster-create-ec2-details.png)


## Completed!

We're Done! You've just created an RKE2 Cluster using the Rancher Multi-Cluster Manager. Let's move onto importing the Amazon EKS Cluster into Rancher!