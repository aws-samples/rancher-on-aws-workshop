---
title: "Workshop Environment"
weight: 12
---

# Understanding the Environment of the Workshop

## The Workshop Environment

In order to successfully complete this workshop, you need to be at an official event by Rancher/AWS or complete additional steps to have the required infrastructure available to you. Under the hood, this workshop is built off of AWS CloudFormation Templates and everything else in done inside of Rancher Manager! 

Please see the steps below to ensure you are successfully set up for the workshop.


## For Official Event Workshops

If you're completing this workshop at an official event with Rancher and/or Amazon AWS, your AWS Account will be pre-configured with the required infrastructure. We are able to this by utilizing AWS Workshop Studio!

To access your generated AWS Account/AWS Infrastructure, please head over to the **[AWS Workshop Studio Dashboard](https://catalog.us-east-1.prod.workshops.aws)!**

![aws-event-engine-dashboard](/static/images/content/12-aws-ws-dashboard.png)

### Step 1:

Enter your unique hash and click **Accept Terms & Login**!

![aws-ws-hash](/static/images/content/12-aws-ws-hash.png)

![aws-ws-terms](/static/images/content/12-aws-ws-terms.png)

Once you are logged into the AWS Workshop Studio Dashboard, you are able to view your account related information.


### Step 2:

Review the Workshop specific information provided for your account.

![aws-ws-home](/static/images/content/12-ws-home.png)


### Step 3:

You're done! Please head over and start the workshop by clicking the **"Welcome to Rancher on AWS"**


## For Outside Official Events

If you're completing this workshop outside an official event, you will need to configure the required infrastructure, before starting the workshop content. Please be aware that this will incure costs to your AWS Account.

### Step 1:

Download the two required workshop CloudFormation templates, by clicking the link below and clicking *"download"*.

* [RKE2/EKS Cloud Formation Template](/static/rke2-eks-cluster.yaml)
* [EKS cluster config file](/static/eksctl-cluster.yml)
* [Environmeent Setup script](/static/setup.sh)


### Step 2:

Log into the [AWS Account Console](https://aws.amazon.com/console/) and open the [CloudFormation](https://console.aws.amazon.com/cloudformation/home) service.


### Step 3:

Click the **Create Stack** button and upload the Rancher RKE2 Management Cluster CloudFormation Template.

![aws-console-cf-home](/static/images/content/12-aws-cf-home.png)


### Step 4:

Complete all required configuration information and follow the instructions within the AWS CloudFormation Console. You should **NOT** have to change any information, unless you would like to change the configuration.

Here is a an example of the configuration options:

![aws-console-cf-templates](/static/images/content/12-aws-cf-template.png)

### Step 5:

Once the Cloud Formation Stack has finished provisioning the infrastructure, Please head over to the [Exploring the Cluster](/content/20-exploring-the-cluster/21-exploring-the-cluster/index.en.md)!
