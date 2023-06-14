---
title: "Workshop Environment"
weight: 12
---

# Understanding the Workshop Environment

In order to successfully complete this workshop, you need to either be at an event operated by Rancher and AWS or complete additional steps to have the required infrastructure available to you. The infrastructure for this workshop is built with AWS CloudFormation templates.

<details>
<summary>For Workshops at AWS Events</summary>

::::expand{header="For Workshops at AWS Events"}

To access your AWS Account for the workshop, please visit the **[AWS Workshop Studio Dashboard](https://catalog.us-east-1.prod.workshops.aws)**

### Step 1:

Once click **`Get Started`**.

![aws-event-engine-dashboard](/static/images/content/12-aws-ws-dashboard.png)

### Step 2:

Enter the event access code provided by your event organizer and click **`Next`**.

![aws-ws-hash](/static/images/content/12-aws-ws-hash.png)

Review the platform Terms and Conditions and click **`Join Event`**.

![aws-ws-terms](/static/images/content/12-aws-ws-terms.png)

### Step 3:

Once you are logged into the *AWS Workshop Studio Dashboard*, you are able to view your account related information. Please review the information provided for your account.

![aws-ws-home](/static/images/content/12-ws-home.png)

### Step 4:

In the menu on the left of this screen, click **`Open AWS Console`** to launch the AWS Account for this workshop.

Additionally, once the AWS Console opens, click **`Get Started`** to start the workshop!

![aws-ws-console](/static/images/content/12-ws-console.png)

::::
</details>

<details>
<summary>For Use Outside AWS Events</summary>

::::expand{header="For Use Outside AWS Events"}

If you're completing this workshop outside an official AWS event, you will need to configure the required infrastructure before starting the workshop content. 

Please be aware that this will incur costs to your AWS Account. Additionally, ensure you are deploying in the **`us-east-1`** region. After completetion of the workshop, verify all resources have been deleted. Cleanup Instructions are provided in the [Workshop Conclusion](/content/60-conclusion/index.en.md)!

### Step 1:

Download the required workshop files by clicking the link below and clicking **`download`** in your browser.
* :button[RKE2/EKS Cloud Formation Template]{href='https://github.com/aws-samples/rancher-on-aws-workshop/raw/main/static/rke2-eks-cluster.yaml' action=download variant='link'}
    * Cloudformation template to deploy the Rancher Cluster
* :button[EKS cluster config file]{href='https://github.com/aws-samples/rancher-on-aws-workshop/raw/main/assets/eksctl-cluster.yml' action=download variant='link'}
    * EKS Cluster Configuration file to easily create an EKS cluster using eksctl
* :button[Environment Setup script]{href='https://github.com/aws-samples/rancher-on-aws-workshop/raw/main/assets/env-setup.sh' action=download variant='link'}
    * A simple shell script to set environment variables, install software, etc. which will be done in a Cloud based IDE

### Step 2:

Log into the [AWS Management Console](https://aws.amazon.com/console/) and open the [CloudFormation Console](https://console.aws.amazon.com/cloudformation/home).

### Step 3:

Click the **Create Stack** button and click **Upload a template file** to upload the Rancher RKE2 Management Cluster CloudFormation Template (`rke2-eks-cluster.yaml`).

![aws-console-cf-home](/static/images/content/12-aws-cf-home.png)

### Step 4:

Complete all required configuration variables: 

1. Select a valid stack name (for example, **`"rke2-eks-stack"`**)
2. You should not have to change any additional variables or stack options, unless you would like to deviate from the workshop configuration.
3. On the review screen, check the box to acknowledge that AWS CloudFormation will create IAM resources with custom names and then click **Submit**.

Here is an example of the CloudFormation Stack deployed successfully. The **`mgmt`** stack is the one that was deployed with the uploaded CloudFormation Template and the **`aws-cloud9`** stack is deployed by the **`mgmt`** stack.

![aws-console-cf-templates](/static/images/content/12-aws-cf-template.png)

### Step 5:

The stack may take between 10 and 15 minutes to create and provision completely.

Once the CloudFormation Stack has moved to **`CREATE_COMPLETE`** status, please click **`Next`** to continue to the workshop!

::::
</details>