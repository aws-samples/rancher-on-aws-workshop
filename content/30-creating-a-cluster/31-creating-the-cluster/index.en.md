---
title: "Creating the Cluster"
weight: 31
---

# Creating the RKE2 Cluster

![rancher-cluster-menu](/static/images/content/31-cluster-menu.png)

![rancher-cluster-home](/static/images/content/31-cluster-home.png)


![rancher-cluster-creds-home](/static/images/content/31-cluster-creds-home.png)

![rancher-cluster-creds-options](/static/images/content/31-cluster-creds-options.png)

![rancher-cluster-creds-aws](/static/images/content/31-cluster-creds-aws.png)

![rancher-cluster-creds-cf](/static/images/content/31-cluster-creds-cf.png)


![rancher-cluster-create-options](/static/images/content/31-cluster-create-options.png)

![rancher-cluster-create-ec2](/static/images/content/31-cluster-create-ec2.png)

### **Cloud Credential:** aws

### **Cluster Name:** rke2-cluster

### **Cluster Description:** rke2 downstream cluster


### **Machine Pools**

**pool1**

**Pool Name:** cp-nodes

**Machine Count:** 3

**Roles:** etcd and Control Plane

**Region:** us-east-1

**Zone:** A

**Instance Type:** m5.xlarge

**Root Disk Size:** 128

**VPC/Subnet:** mgmt-private-1

*Click Show Advanced*

**Use only private address:** ✓


**pool2**

Pool Name: cp-nodes

**Machine Count:** 3

**Roles:** Worker

**Region:** us-east-1

**Zone:** A

**Instance Type:** m5.xlarge

**Root Disk Size:** 128

**VPC/Subnet:** mgmt-private-1

*Click "Show Advanced"*

**Use only private address:** ✓

![rancher-cluster-create-ec2-pools](/static/images/content/31-cluster-create-ec2-pools.png)

### **Cluster Configuration**

No changes required in this section, please free to explore the configuration options!

![rancher-cluster-create-ec2-config](/static/images/content/31-cluster-create-ec2-config.png)

![rancher-cluster-create-ec2-success](/static/images/content/31-cluster-create-ec2-success.png)

![rancher-cluster-create-ec2-success-details](/static/images/content/31-cluster-create-ec2-success-details.png)

![rancher-cluster-create-ec2-successful](/static/images/content/31-cluster-create-ec2-successful.png)

![rancher-cluster-create-ec2-detail](/static/images/content/31-cluster-create-ec2-details.png)