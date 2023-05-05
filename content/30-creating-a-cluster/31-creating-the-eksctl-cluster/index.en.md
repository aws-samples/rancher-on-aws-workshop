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

### Create the setup.sh file:

The setup script will install (or update) a few tools and set environment variables in the Cloud9 IDE

* Copy and paste these lines in the Cloud9 terminal (notice the 'copy' button to the right of the window):

    ```bash
    cd
    cat <<EOF > /tmp/setup.sh
    #!/bin/bash

    echo '================= Update AWS CLI ================='
    sudo yum remove awscli -y
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    export PATH=/usr/local/bin:$PATH

    echo '================= Install Kubectl, EKSctl & Helm ================='
    curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.26.2/2023-03-17/bin/linux/amd64/kubectl
    chmod +x ./kubectl
    mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
    echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
    curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
    sudo mv /tmp/eksctl /usr/local/bin
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
    chmod 700 get_helm.sh
    sh get_helm.sh

    echo '================ Set some ENV variables ================='
    export AWS_REGION=us-east-1
    export EKS_CLUSTER_NAME="eks-cluster"
    export ClusterRoleArn=$(aws iam list-roles --query "Roles[?contains(RoleName, 'EKSClusterRole')].Arn" --output text)
    export NodeGroupRoleArn=$(aws iam list-roles --query "Roles[?contains(RoleName, 'EKSNodeGroupRole')].Arn" --output text)
    export rancherUser=$(aws iam get-user --user-name rancher-cloud-credential-user --query 'User.Arn' --output text)
    EOF
    ```

### Run the setup script

* Run **setup.sh** (Make sure you're in the ec2-user home directory):
    
    ```bash
    . /tmp/setup.sh
    ```

    ![Cloud9](/static/images/cloud9/startSetup_script.png)

### Create the cluster config:

The cluster config file defines the EKS cluster settings and permissions for the cluster.

* Copy and paste these lines in the Cloud9 terminal (notice the 'copy' button to the right of the window):

    ```bash
    cat <<EOF > eksctl-cluster.yml
    apiVersion: eksctl.io/v1alpha5
    kind: ClusterConfig

    #Only use these availability zones
    availabilityZones:
    - ${AWS_REGION}a
    - ${AWS_REGION}b
    - ${AWS_REGION}c

    metadata:
    name: ${EKS_CLUSTER_NAME}
    region: ${AWS_REGION}
    version: "1.25"
   
    iam:
    serviceRoleARN: ${ClusterRoleArn}
   
    managedNodeGroups:
    - name: nodeGrp-1
       instanceType: m5.large
       amiFamily: AmazonLinux2
       privateNetworking: True
       desiredCapacity: 3
       maxSize: 3
       minSize: 3
       volumeSize: 64
       iam:
          instanceRoleArn: ${NodeGroupRoleArn}
    addons:
    - name: vpc-cni # no version is specified so it deploys the default version
       attachPolicyARNs:
          - arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy
    - name: coredns
       version: latest # auto discovers the latest available
    - name: kube-proxy
       version: latest
    EOF
    ```

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

* Run **eksctl create cluster** and update the identity mapping:
    
    ```bash
    eksctl create cluster -f eksctl-cluster-actual.yml ; eksctl create iamidentitymapping --cluster $EKS_CLUSTER_NAME --region=$AWS_REGION --arn $rancherUser --group system:masters --username rancher
    ```

   ![Cloud9](/static/images/cloud9/eksctl-create.png)
> **Note: Cluster creation can takes up to 25 minutes**

   ![Cloud9](/static/images/cloud9/completeCluster.png)

   ![Cloud9](/static/images/cloud9/coupleKubeCmds.png)

### Done

We're Done! You've just created an EKS cluster using the AWS Cloud9 IDE.
