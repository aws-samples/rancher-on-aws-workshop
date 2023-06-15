---
title: "Additional AWS Integrations"
weight: 50
---
In the following module, you will complete the outcomes listed below:

1. Create a managed Amazon MemoryDB for Redis Cluster using the ACK MemoryDB Controller
    * The ACK service controller for Amazon MemoryDB for Redis lets you manage Amazon MemoryDB Cluster directly from Kubernetes.
    * AWS Controllers for Kubernetes, or ACK, is a powerful tool that lets you directly manage AWS services from Kubernetes. ACK makes it simple to build scalable and highly-available Kubernetes applications that utilize AWS services, providing a consistent Kubernetes interface for AWS, regardless of the AWS service API.

---


# AWS Controllers for Kubernetes (ACK) - Amazon MemoryDB for Redis

## Prerequisites

* An EKS Cluster with Kubernetes version 1.18 or higher
* Setup the Amazon VPC Container Network Interface (CNI) plugin for Kubernetes for the EKS Cluster.
* AWS IAM permissions to create roles and attach policies to roles.
* Installed the following tools on the client machine used to access your Kubernetes cluster:
    * AWS CLI - A command line tool for interacting with AWS services.
    * kubectl - A command line tool for working with Kubernetes clusters.
    * eksctl - A command line tool for working with EKS clusters.
    * Helm 3.8+ - A tool for installing and managing Kubernetes applications.

If you've followed this workshop all the way through, all of the prerequisite have been met. From here, you will only need to use the Cloud9 IDE!

## Step 1: Access the Cloud9 IDE

Let's start by accessing the Cloud9 IDE.

In the menu on the left of this screen click **Open AWS console** to launch the AWS account for this workshop.

![workshop-studio-console](/static/images/content/cloud9/access-console.png)

Access the Cloud9 service by searching for it in the menu bar at the top of the screen:

![aws-console-search](/static/images/content/cloud9/search.png)

When the main Cloud9 screen opens, click on **Open** under **Cloud9 IDE**

![aws-console-cloud9](/static/images/content/cloud9/open.png)

Once the IDE has loaded, we recommend you use the **+** button and select 
**New Terminal** to open a new full screen terminal window.

![cloud9-dashboard](/static/images/content/cloud9/terminal-open.png)

You can close the smaller terminal window at the bottom if you'd like. Otherwise, 
welcome to Cloud9!

![cloud9-new-terminal](/static/images/content/cloud9/terminal.png)

## Step 2: Create the Amazon MemoryDB for Redis Cluster

<details>
<summary>Using AWS Workshop Studio</summary>

### Download the install-ack-sc-memdb.sh script

The install script will:
* Install the MemoryDB Helm chart
* Setup IAM Roles for Service Accounts (IRSA)
    * IRSA is a system that automates the provisioning and rotation of IAM temporary credentials (called a Web Identity) that a Kubernetes ServiceAccount can use to call AWS API
* Create the Amazon MemoryDB Subnet Group and Cluster

* Run the **curl** command in the Cloud9 terminal:

 ```bash
curl ':assetUrl{path="install-ack-sc-memdb.sh" source=s3}' --output ~/install-ack-sc-memdb.sh
```

![cloud9-ackScript-download](/static/images/content/cloud9/install-ACK-download.png)

</details>

<details>
<summary>Using Personal AWS Account</summary>

### Download the install-ack-sc-memdb.sh script

The install script will:
* Install the MemoryDB Helm chart
* Setup IAM Roles for Service Accounts (IRSA)
    * IRSA is a system that automates the provisioning and rotation of IAM temporary credentials (called a Web Identity) that a Kubernetes ServiceAccount can use to call AWS API
* Create the Amazon MemoryDB Subnet Group and Cluster

* Upload the required files

You can upload files directly to your Cloud9 environment using drag and drop

   * Click **File** in the top left of the Cloud9 environment
   * Click **Upload Local Files...**

![cloud9-setupScript-download](/static/images/content/cloud9/upload-files.png)

   * Drag and drop the eks-cluster.yml and env-setup.sh files into the **Upload Files** pop-up window

![cloud9-setupScript-download](/static/images/content/cloud9/drag-drop.png)

   * Verify File upload

![cloud9-setupScript-download](/static/images/content/cloud9/confirm-upload-ACK.png)

Though files upload to the **environment** directory, it's somewhat more straightforward to work in the home directory.

* Run **copy** command in the Cloud9 terminal:

```bash
cd
cp environment/install-acl-sc-memdb.sh .
```

![cloud9-setupScript-download](/static/images/content/cloud9/setupScripts-ACK.png)

</details>

### Run the install ACK script

* Run **install-ack-sc-memdb.sh**:
    
```bash
cd
. install-ack-sc-memdb.sh
```

![cloud9-ackScript-run](/static/images/content/cloud9/run-install-ACK.png)

![cloud-ackScript-completed](/static/images/content/cloud9/ACK-complete.png)

> **Note: Cluster creation can take up to 25 minutes**

## Completed!

We're done! You've just created a managed Amazon MemoryDB for a Redis Cluster using the ACK MemoryDB Controller! Let's wrap up with taking a look at the **Conclusion**.