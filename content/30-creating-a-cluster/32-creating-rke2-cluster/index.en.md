---
title: 'Creating the RKE2 Cluster'
weight: 32
---

In the following module, you will complete the outcomes listed below:

1. Use the Rancher Multi-Cluster Manager to create a 6 node RKE2 Cluster.
2. Access the manage the newly created RKE2 Cluster using the Rancher Multi-Cluster Manager.

---

# Creating the RKE2 Cluster

## Cluster Management

### Step 1:

Start in the Rancher Multi-Cluster Manager. Open the side menu by clicking the hamburger button
at the top left of the page. In the side menu, click **`Cluster Management`**.

![rancher-cluster-menu](/static/images/content/31-cluster-menu.png)

### Step 2:

**`Cluster Management`** is one the most powerful features of the Rancher Multi-Cluster Manager. You are able to create, import, and manage any type of Kubernetes cluster. We are going to start by creating an Rancher RKE2 Cluster. We will import an EKS Cluster later in the workshop.

For now, you can only view and access the `local` cluster. This cluster has the Rancher Multi-Cluster Manager deployed on it and is known as the `management` cluster. In production deployments, workloads should run only `downstream` clusters. This allows the two types of clusters to scale independently and prevents a workload from impacting the resources and operation of the Rancher Multi-Cluster Manager.

![rancher-cluster-home](/static/images/content/31-cluster-home.png)

## Cloud Credentials

### Step 1:

Next, we will add AWS credentials to allow Rancher Multi-Cluster Manager to create and manage Amazon EKS clusters. In the left menu, click `Cloud Credentials`. You will not see any credentials yet.

![rancher-cluster-creds-home](/static/images/content/31-cluster-creds-home.png)

### Step 2:

In the top right corner, click on **`Create`**. Here you will see all the cloud service providers that you can use with the Rancher Multi-Cluster Manager. We're going to use AWS, so click on **`Amazon`**.

![rancher-cluster-creds-options](/static/images/content/31-cluster-creds-options.png)

### Step 3:

AWS CloudFormation created an AWS Identity and Access Management (IAM) user when the workshop was provisioned. Next, we will retrieve the credentials for that user from CloudFormation. Just like when we were Exploring the Cluster, go to the AWS Console and navigate to **`Cloud Formation`**. Click on the **`rke2-eks-cluster`** stack and then click on **`Outputs`** tab.

In the **`Outputs`** tab, you should see the **`CloudCredentialKey`** and **`CloudCredentialSecret`**. Let's copy and paste both those values into the Rancher Multi-Cluster Manager. Below is the information you need to input before clicking **`"Create"`**. Ensure to update **Default Region** to **`us-east-1`**.

- **Name:** aws
- **Access Key:** _CloudCredentialKey_
- **Secret Key:** _CloudCredentialSecret_
- **Default Region:** us-east-1

![rancher-cluster-creds-cf](/static/images/content/31-cluster-creds-cf.png)

![rancher-cluster-creds-aws](/static/images/content/31-cluster-creds-aws.png)

> Note: Storing IAM User access keys in CloudFormation Outputs is convenient for a workshop environment, but it is NOT a good security practice. Manage your access keys carefully and use temporary security credentials instead whenever possible. For more information, see [Managing access keys for IAM users](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html).

## Creating the Cluster

### Step 1:

Now that we have a **`Cloud Credential`** added to the Rancher Multi-Cluster Manager, let's create a cluster. In the left menu, click **`Clusters`**, then click **`Create`**. Just like the Cloud Credential menu, you can see all the available Cloud Providers that you can use to create a cluster. Select **`Amazon EC2`**.

![rancher-cluster-create-options](/static/images/content/31-cluster-create-options.png)

### Step 2:

Here you can see all the available options you can use to configure cluster creation. We will use most of the default values, but feel free to explore as we move through the process. Make sure to include all the values below:

### Cluster Information:

- **Cloud Credential:** aws
- **Cluster Name:** rke2-cluster
- **Cluster Description:** rke2 downstream cluster

![rancher-cluster-create-ec2](/static/images/content/31-cluster-create-ec2.png)

### Machine Pools:

- **pool1 (default name)**
  - **Pool Name:** cp-nodes
  - **Machine Count**: 3
  - **Roles:** etcd && Control Plane
  - **Region:** us-east-1
  - **Zone:** A
  - **Instance Type:** m5.xlarge
  - **Root Disk Size:** 128
  - **VPC/Subnet:** ...-private-1
    - Use the Subnet ending with _private-1_
  - **Show Advanced Drop-Down:** Use only private address

Add a new pool with the plus sign on the left pool list panel.

- **pool2 (default name)**
  - **Pool Name:** wk-nodes
  - **Machine Count:** 3
  - **Roles:** Worker
  - **Region:** us-east-1
  - **Zone:** A
  - **Instance Type:** m5.xlarge
  - **Root Disk Size:** 128
  - VPC/Subnet: ...private-1
  - **VPC/Subnet:** ...-private-1
    - Use the Subnet ending with _private-1_
  - **Show Advanced Drop-Down:** Use only private address

![rancher-cluster-create-ec2-pools](/static/images/content/31-cluster-create-ec2-pools.png)

### Cluster Configuration:

No changes are required in this section, but feel free to explore the different configuration options.

Once you are ready to create the cluster, click on **`Create`**.

![rancher-cluster-create-ec2-config](/static/images/content/31-cluster-create-ec2-config.png)

### Step 3:

Here you will see the **`rke2-cluster`** listed in the menu we saw before with all the clusters under management of the Rancher Multi-Cluster Manager.

![rancher-cluster-create-ec2-success](/static/images/content/31-cluster-create-ec2-success.png)

### Step 4:

Select **`rke2-cluster`**. You will see that it is starting to create resources on AWS and each of the nodes are in different states. The cluster creation process will take roughly 5 to 10 minutes.

Feel free to continue exploring the Cluster Management feature while you wait for the cluster to create.

![rancher-cluster-create-ec2-success-details](/static/images/content/31-cluster-create-ec2-success-details.png)

### Step 5:

Once the cluster nodes have been provisioned, you will see each node and the cluster is marked as **`Running`**.

You can select the newly created cluster and explore it. Open the side menu and click on **`rke2-cluster`**.

![rancher-cluster-create-ec2-successful](/static/images/content/31-cluster-create-ec2-successful.png)

### Step 6:

Here you will notice this is the same view that we saw under Exploring the Cluster. You are able to do everything you were able to do before, but now in the created RKE2 cluster.

![rancher-cluster-create-ec2-detail](/static/images/content/31-cluster-create-ec2-details.png)

## Completed!

We're done! We created an RKE2 Cluster on EC2 using the Rancher Multi-Cluster Manager. Let's move on to import an Amazon EKS Cluster into Rancher.
