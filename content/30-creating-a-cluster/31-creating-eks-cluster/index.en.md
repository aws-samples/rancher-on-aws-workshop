---
title: "Creating the EKS Cluster"
weight: 31
---

In the following module, you will complete the outcomes listed below:

1. Access and Configure an AWS Cloud9 IDE
   * AWS Cloud9 is cloud-based integrated development environment (IDE) that lets you write, run, and debug code all within the browser.
2. Create a 3 node Amazon EKS Cluster with a provided cluster config

---


## Step 1: Access the Cloud9 IDE

Let's start by accessing the Cloud9 IDE.

In the menu on the left of this screen click **Open AWS console** to launch the 
AWS account for this workshop.

![Studio](/static/images/content/cloud9/access_console.png)

Access the Cloud9 service by searching for it in the menu bar at the top of the screen:

![Cloud9](/static/images/content/cloud9/search.png)

When the main Cloud9 screen opens, click on **Open** under **Cloud9 IDE**

![Cloud9](/static/images/content/cloud9/open.png)

Once the IDE has loaded, we recommend you use the **+** button and select 
**New Terminal** to open a new full screen terminal window.

![Cloud9](/static/images/content/cloud9/terminal-open.png)

You can close the smaller terminal window at the bottom if you'd like. Otherwise, 
welcome to Cloud9!

![Cloud9](/static/images/content/cloud9/terminal.png)

## Step 2: Set up your Cloud9 Environment


### Download the setup.sh file:

The setup script will install (or update) a few tools and set environment 
variables in the Cloud9 IDE

* Run **curl** command in the Cloud9 terminal:

    ```bash
    cd
    curl ':assetUrl{path="/resources/setup.sh" source=s3}' --output /tmp/setup.sh
    ```

    ![Cloud9](/static/images/content/cloud9/setupScript-download.png)

### Run the setup script

* Run **setup.sh**:
    
    ```bash
    cd
    . /tmp/setup.sh
    ```

    ![Cloud9](/static/images/content/cloud9/startSetup_script.png)


### Download the cluster config:

The cluster config file defines the EKS cluster settings and permissions for the cluster.

* Run the **curl** command in the Cloud9 terminal):

    ```bash
    curl ':assetUrl{path="/resources/eksctl-cluster.yml" source=s3}' --output ~/eksctl-cluster.yml
    ```

    ![Cloud9](/static/images/content/cloud9/eks-conf-download.png)

## Step 3: Update Cloud9 Instance


### Disable Cloud9 temporary credentials:
* Click the cog wheel in the upper right of the Cloud9 IDE
    
    ![Cloud9](/static/images/content/cloud9/c9_settings.png)
    
* Click the AWS Settings section on the left of the settings window
    
    ![Cloud9](/static/images/content/cloud9/temp-creds.png)

* Switch **AWS Managed Temporary Credentials** to the **off** position

   ![Cloud9](/static/images/content/cloud9/temp-creds-off.png)

* Close the settings window

### Modify Cloud9 instance IAM Role

* Click the **W** in the upper right of the Cloud9 IDE

   ![Cloud9](/static/images/content/cloud9/open-submenu.png)

* Click **Manage EC2 Instance**

   ![Cloud9](/static/images/content/cloud9/manage_e2.png)

* Select instance (only 1 showing)

   ![Cloud9](/static/images/content/cloud9/select-instance.png)

* Open Submenus for **Modify IAM role** under **Actions**

   ![Cloud9](/static/images/content/cloud9/modify-role.png)

* Choose **eksctl-creator** from drop-down

   ![Cloud9](/static/images/content/cloud9/choose-eksctl-creator.png)

* Click **Update IAM Role**

   ![Cloud9](/static/images/content/cloud9/update-iam-role.png)

## Step 4: Create the cluster

   ```bash
    envsubst < ~/eksctl-cluster.yml > ~/eksctl-cluster-actual.yml
    eksctl create cluster -f eksctl-cluster-actual.yml ; eksctl create iamidentitymapping --cluster $EKS_CLUSTER_NAME --region=$AWS_REGION --arn $rancherUser --group system:masters --username rancher
   ```

   ![Cloud9](/static/images/content/cloud9/envsub.png)

   ![Cloud9](/static/images/content/cloud9/eksctl-create.png)
> **Note: Cluster creation can take up to 25 minutes**

   ![Cloud9](/static/images/content/cloud9/completeCluster.png)

   ![Cloud9](/static/images/content/cloud9/coupleKubeCmds.png)


## Completed!

We're done! You've just created an AWS EKS Cluster using `eksctl` and the AWS Cloud9 IDE. Let's move onto creating the RKE2 Cluster!
