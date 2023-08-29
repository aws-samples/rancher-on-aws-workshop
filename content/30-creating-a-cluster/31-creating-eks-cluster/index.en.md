---
title: 'Creating the EKS Cluster'
weight: 31
---

In the following module, you will complete the outcomes listed below:

1. Access and Configure an AWS Cloud9 IDE
   - AWS Cloud9 is cloud-based integrated development environment (IDE) that lets you write, run, and debug code, all within the browser.
2. Create a 3 node Amazon EKS Cluster with a provided cluster config.

---

## Step 1: Access the Cloud9 IDE

Let's start by accessing the Cloud9 IDE.

If you are at an event using Workshp Studio, navigate to the AWS Console by clicking **Open AWS console** on the left
nav bar of the workshop page.

![workshop-studio-console](/static/images/content/cloud9/access-console.png)

Access the Cloud9 service by searching for it in the menu bar at the top of the screen:

![aws-console-search](/static/images/content/cloud9/search.png)

When the main Cloud9 screen opens, click on **Open** under **Cloud9 IDE**

![aws-console-cloud9](/static/images/content/cloud9/open.png)

Once the IDE has loaded, we recommend you use the **+** button and select **New Terminal** to open a new full screen terminal window.

![cloud9-dashboard](/static/images/content/cloud9/terminal-open.png)

You can close the smaller terminal window at the bottom if you'd like. Welcome to Cloud9!

![cloud9-new-terminal](/static/images/content/cloud9/terminal.png)

## Step 2: Set up your Cloud9 Environment

<details>
<summary>Using AWS Workshop Studio</summary>

::::expand{header="Using AWS Workshop Studio"}

### Download the env-setup.sh file:

The setup script will install (or update) a few tools and set environment variables in the Cloud9 IDE.

- Run **curl** command in the Cloud9 terminal:

```bash
cd
curl ':assetUrl{path="env-setup.sh" source=s3}' --output /tmp/setup.sh
```

![cloud9-setupScript-download](/static/images/content/cloud9/setupScript-download.png)

### Run the setup script

- Run **env-setup.sh**:

```bash
cd
. /tmp/setup.sh
```

![cloud9-setupScript-start](/static/images/content/cloud9/startSetup-script.png)

### Download the cluster config:

The cluster config file defines the EKS cluster settings and permissions for the cluster.

- Run the **curl** command in the Cloud9 terminal):

```bash
curl ':assetUrl{path="eksctl-cluster.yml" source=s3}' --output ~/eksctl-cluster.yml
```

![cloud9-eks-config-download](/static/images/content/cloud9/eks-conf-download.png)
::::

</details>

<details>
<summary>Using Personal AWS Account</summary>

::::expand{header="Using Personal AWS Account"}

### Upload the required files:

Upload the **env-setup.sh** and **eks-cluster.yml** files that were downloaded in the **Workshop Environment** section of the instructions to the Cloud9 environment

The setup script will install (or update) a few tools and set environment variables in the Cloud9 IDE.

- Upload the required files

You can upload files directly to your Cloud9 environment using drag and drop

- Click **File** in the top left of the Cloud9 environment
- Click **Upload Local Files...**

![cloud9-setupScript-download](/static/images/content/cloud9/upload-files.png)

- Drag and drop the eks-cluster.yml and env-setup.sh files into the **Upload Files** pop-up window

![cloud9-setupScript-download](/static/images/content/cloud9/drag-drop.png)

- Verify File upload

![cloud9-setupScript-download](/static/images/content/cloud9/confirm-upload.png)

Though files upload to the **environment** directory, it's somewhat more straightforward to work in the home directory.

- Run **copy** command in the Cloud9 terminal:

```bash
cd
cp environment/env-setup.sh /tmp/
cp environment/eksctl-cluster.yml .
```

![cloud9-setupScript-download](/static/images/content/cloud9/setupScripts.png)

### Run the setup script

- Run **env-setup.sh**:

```bash
cd
. /tmp/env-setup.sh
```

![cloud9-setupScript-start](/static/images/content/cloud9/startSetupPersonal-script.png)
::::

</details>

## Step 3: Update Cloud9 Instance

In order to give our Cloud9 IDE instance permission to create an EKS cluster we
must change the IAM role the instance is using to one with the correct permissions.

### Disable Cloud9 temporary credentials:

- Click the cog wheel in the upper right of the Cloud9 IDE

![cloud9-settings-button](/static/images/content/cloud9/cloud9-settings.png)

- Click the AWS Settings section on the left of the settings window

![cloud9-settings-creds](/static/images/content/cloud9/temp-creds.png)

- Switch **AWS Managed Temporary Credentials** to the **off** position

![cloud9-settings-creds-disable](/static/images/content/cloud9/temp-creds-off.png)

- Close the settings window

### Modify Cloud9 instance IAM Role

- Click the profile circle (for Workshop Stuio, it will be **W**) in the upper right of the Cloud9 IDE

![cloud9-submenu-button](/static/images/content/cloud9/open-submenu.png)

- Click **Manage EC2 Instance**

![cloud9-manage-ec2](/static/images/content/cloud9/manage-ec2.png)

- Select instance (only 1 showing)

![cloud9-manage-ec2-selection](/static/images/content/cloud9/select-instance.png)

- Open Submenus for **Modify IAM role** under **Actions**

![cloud9-manage-ec2-role](/static/images/content/cloud9/modify-role.png)

- Choose **eksctl-creator** from drop-down

![cloud9-manage-ec2-select-role](/static/images/content/cloud9/choose-eksctl-creator.png)

- Click **Update IAM Role**

![cloud9-manage-ec2-confirm-role](/static/images/content/cloud9/update-iam-role.png)

## Step 4: Create the cluster

```bash
envsubst < ~/eksctl-cluster.yml > ~/eksctl-cluster-actual.yml
eksctl create cluster -f eksctl-cluster-actual.yml ; eksctl create iamidentitymapping --cluster $EKS_CLUSTER_NAME --region=$AWS_REGION --arn $rancherUser --group system:masters --username rancher
```

![cloud9-eks-cluster-command](/static/images/content/cloud9/envsub.png)

![cloud9-eks-cluster-create](/static/images/content/cloud9/eksctl-create.png)

> **Note: Cluster creation can take up to 25 minutes**

![cloud9-eks-cluster-completed](/static/images/content/cloud9/completeCluster.png)

![cloud9-eks-cluster-kubectl](/static/images/content/cloud9/coupleKubeCmds.png)

## Completed!

We're done! We created an AWS EKS Cluster using `eksctl` and the AWS Cloud9 IDE. Let's move onto creating the RKE2 Cluster.
