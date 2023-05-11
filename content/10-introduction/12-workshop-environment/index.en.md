---
title: "Workshop Environment"
weight: 12
---

# Understanding the Workshop Environment

In order to successfully complete this workshop, you need to either be at an event operated by
Rancher/AWS or complete additional steps to have the required infrastructure available to you. 
The infrastructure for this workshop is built with AWS CloudFormation templates. 

Please follow the steps below to set up for the workshop.


## For Workshops at AWS Events

If you're completing this workshop at an event operated by Rancher and AWS, an 
AWS Account will be provided that is pre-configured with the required 
infrastructure.

To access your AWS Account for the workshop, please visit the **[AWS Workshop Studio Dashboard](https://catalog.us-east-1.prod.workshops.aws)** and click **Get Started**.

![aws-event-engine-dashboard](/static/images/content/12-aws-ws-dashboard.png)

### Step 1:

Enter the event access code provided by your event organizer and click **Next**.

![aws-ws-hash](/static/images/content/12-aws-ws-hash.png)

Review the platform terms and conditions and click **Join Event**.

![aws-ws-terms](/static/images/content/12-aws-ws-terms.png)

Once you are logged into the AWS Workshop Studio Dashboard, you are able to view your account related information.


### Step 2:

Review the Workshop specific information provided for your account.

![aws-ws-home](/static/images/content/12-ws-home.png)


### Step 3:

You're done! Please head over and start the workshop by clicking the **"Welcome to Rancher on AWS"**


## For Use Outside AWS Events

If you're completing this workshop outside an official AWS event, you will need to 
configure the required infrastructure before starting the workshop content. 
Please be aware that this will incur costs to your AWS Account.

### Step 1:

* :button[RKE2/EKS Cloud Formation Template]{href='/static/rke2-eks-cluster.yaml' action=download variant='link'}
* :button[EKS cluster config file](href='/static/eksctl-cluster.yml' action=download variant='link')
* :button[Environmeent Setup script](href='/static/setup.sh' action=download variant='link')


### Step 2:
Log into the [AWS Management Console](https://aws.amazon.com/console/) and 
open the [CloudFormation Console](https://console.aws.amazon.com/cloudformation/home).

### Step 3:
Click the **Create Stack** button and upload the Rancher RKE2 Management Cluster 
CloudFormation Template (`rke2-eks-cluster.yaml`).

![aws-console-cf-home](/static/images/content/12-aws-cf-home.png)

### Step 4:
Complete all required configuration information and follow the instructions within 
the AWS CloudFormation Console. You should not have to change any information, 
unless you would like to deviate from the workshop configuration.

Here is an example of the CloudFormation stack deployed successfully:

![aws-console-cf-templates](/static/images/content/12-aws-cf-template.png)

### Step 5:

Once the CloudFormation Stack has moved to `CREATE_COMPLETE` status, please 
click **Next** to continue.
