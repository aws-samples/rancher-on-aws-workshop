---
title: "Creating an EKS Cluster with eksctl"
weight: 31
---

In the following steps, you will:

1. Access and configure a AWS Cloud9 IDE, a cloud-based integrated development environment that lets you write, run, and debug code all within the browser.

2. Create a simple 3 node EKS Cluster with a provided cluster config

---

## Step 1: Access the Cloud9 IDE
---

Let's start with accessing the Cloud9 IDE and downloading some extras

In the menu on the left of this screen there should be an option named **Open AWS console**. Click this to launch the AWS account for this workshop.

![Studio](/static/images/cloud9/access_console.png)

Access the Cloud9 service by searching for it in the menu bar at the top of the screen:

![Cloud9](/static/images/cloud9/search.png)

When the main Cloud9 screen opens, click on **Open** under **Cloud9 IDE**

![Cloud9](/static/images/cloud9/open.png)

Once the IDE has loaded, we recommend you use the **+** button and select **New Terminal** to open a new full screen terminal window.

![Cloud9](/static/images/cloud9/terminal-open.png)

You can close the smaller terminal window at the bottom if you'd like. Otherwise, welcome to Cloud9!

![Cloud9](/static/images/cloud9/terminal.png)

## Step 2: Setup your Cloud9 Environment
---

### Download the setup.sh file:

The setup script will install (or update) a few tools and set environment variables in the Cloud9 IDE

* Copy the S3 link from the bottom of workshop event page:

    ![Cloud9](/static/images/cloud9/event-main.png)
    ![Cloud9](/static/images/cloud9/copy_setup_link.png)

* Run **aws s3 cp** command in the Cloud9 terminal:

    :::code{showCopyAction=true showLineNumbers=false language=bash} 
    cd
aws s3 cp <paste setup link> /tmp
    :::

    ![Cloud9](/static/images/cloud9/setupScript-download.png)

### Run the setup script

* Run **setup.sh** (Make sure you're in the ec2-user home directory):
    
    :::code{showCopyAction=true showLineNumbers=false language=bash} 
    . /tmp/setup.sh
    :::

    ![Cloud9](/static/images/cloud9/startSetup_script.png)

### Download the cluster config:

The cluster config file defines the EKS cluster settings and permissions for the cluster.

* Copy the link from the workshop welcome page:

    ![Cloud9](/static/images/cloud9/copy_eksConfig_link.png)

* Run the **aws s3 cp** command in the Cloud9 terminal (notice space between the link and the "**.**"):

    :::code{showCopyAction=true showLineNumbers=false language=bash} 
    aws s3 cp <paste setup link> .
    ::: 

    ![Cloud9](/static/images/cloud9/eks-conf-download.png)

## Step 3: Update Cloud9 Instance
---

### Disable Cloud9 temporary credentials:
* Click the cog wheel in the upper right of the Cloud9 IDE
    
    ![Cloud9](/static/images/cloud9/c9_settings.png)
    
* Click the AWS Settings section on the left of the settings window
    
    ![Cloud9](/static/images/cloud9/temp-creds.png)

* Switch **AWS Managed Temporary Credentials** to the **off** position

   ![Cloud9](/static/images/cloud9/temp-creds-off.png)

* Close the settings window

### Modify Cloud9 instance IAM Role

* Click the **W** in the upper right of the Cloud9 IDE

   ![Cloud9](/static/images/cloud9/open-submenu.png)

* Click **Manage EC2 Instance**

   ![Cloud9](/static/images/cloud9/manage_e2.png)

* Select instance (only 1 showing)

   ![Cloud9](/static/images/cloud9/select-instance.png)

* Open Submenus for **Modify IAM role** under **Actions**

   ![Cloud9](/static/images/cloud9/modify-role.png)

* Choose **eksctl-creator** from drop-down

   ![Cloud9](/static/images/cloud9/choose-eksctl-creator.png)

* Click **Update IAM Role**

   ![Cloud9](/static/images/cloud9/update-iam-role.png)

## Step 4: Create the cluster
---

Here, we're running the **eksctl create cluster** command as well as the **eksctl create iamidentitymapping** command to first create the cluster, then add the rancher user to the cluster's primary access group

* Run **eksctl create cluster** and update identity mapping:
    
    :::code{showCopyAction=true showLineNumbers=false language=bash} 
    envsubst < eksctl-cluster.yml > eksctl-cluster-actual.yml
eksctl create cluster -f eksctl-cluster-actual.yml ; eksctl create iamidentitymapping --cluster $EKS_CLUSTER_NAME --region=$AWS_REGION --arn $rancherUser --group system:masters --username rancher
    :::

   ![Cloud9](/static/images/cloud9/envsub.png)

   ![Cloud9](/static/images/cloud9/eksctl-create.png)
> **Note: Cluster creation can takes up to 25 minutes**

   ![Cloud9](/static/images/cloud9/completeCluster.png)

   ![Cloud9](/static/images/cloud9/coupleKubeCmds.png)

### Done

We're Done! You've just created an EKS cluster using the AWS Cloud9 IDE.
