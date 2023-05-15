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

![rancher-cluster-menu](/static/images/content/31-cluster-menu.png)


### Step 2:

![rancher-cluster-home](/static/images/content/31-cluster-home.png)


## Cloud Credentials

### Step 1:

![rancher-cluster-creds-home](/static/images/content/31-cluster-creds-home.png)


### Step 2:

![rancher-cluster-creds-options](/static/images/content/31-cluster-creds-options.png)


### Step 3:

![rancher-cluster-creds-aws](/static/images/content/31-cluster-creds-aws.png)


### Step 4:

![rancher-cluster-creds-cf](/static/images/content/31-cluster-creds-cf.png)


## Creating the Cluster

### Step 1:

![rancher-cluster-create-options](/static/images/content/31-cluster-create-options.png)


### Step 2:

![rancher-cluster-create-ec2](/static/images/content/31-cluster-create-ec2.png)

<pre>
<b>Cloud Credential:</b> aws

<b>Cluster Name:</b> rke2-cluster

<b>Cluster Description:</b> rke2 downstream cluster
</pre>

### **Machine Pools**

<pre>
<b>pool1</b>

<b>Pool Name:</b> cp-nodes

<b>Machine Count:</b> 3

<b>Roles:</b> etcd and Control Plane

<b>Region:</b> us-east-1

<b>Zone:</b> A

<b>Instance Type:</b> m5.xlarge

<b>Root Disk Size:</b> 128

<b>VPC/Subnet:</b> mgmt-rke2-private-1

<i>Click <b>"Show Advanced"</b></i>

<b>Use only private address:</b> ✓
</pre>

<pre>
<b>pool2</b>

<b>Pool Name:</b> wk-nodes

<b>Machine Count:</b> 3

<b>Roles:</b> Worker

<b>Region:</b> us-east-1

<b>Zone:</b> A

<b>Instance Type:</b> m5.xlarge

<b>Root Disk Size:</b> 128

<b>VPC/Subnet:</b> mgmt-rke2-private-1

<i>Click <b>"Show Advanced"</b></i>

<b>Use only private address:</b> ✓
</pre>

![rancher-cluster-create-ec2-pools](/static/images/content/31-cluster-create-ec2-pools.png)

<pre>
<b>Cluster Configuration:</b> 
No changes required in this section, please free to explore the configuration options.
</pre>

![rancher-cluster-create-ec2-config](/static/images/content/31-cluster-create-ec2-config.png)


### Step 3:

![rancher-cluster-create-ec2-success](/static/images/content/31-cluster-create-ec2-success.png)


### Step 4:

![rancher-cluster-create-ec2-success-details](/static/images/content/31-cluster-create-ec2-success-details.png)


### Step 5:

![rancher-cluster-create-ec2-successful](/static/images/content/31-cluster-create-ec2-successful.png)


### Step 6:

![rancher-cluster-create-ec2-detail](/static/images/content/31-cluster-create-ec2-details.png)

## Completed!

We're Done! You've just created an RKE2 Cluster using the Rancher Multi-Cluster Manager. Let's move onto importing the Amazon EKS Cluster into Rancher!
