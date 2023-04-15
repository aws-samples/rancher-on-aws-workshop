---
title: "Workshop Environment"
weight: 12
---

# Understanding the Environment of the Workshop

## The Workshop Environment

In order to successfully complete this workshop, you need to be at an official event by Rancher/AWS or complete additional steps to have the required infrastructure available to you. Under the hood, this workshop is built off of two AWS CloudFormation Templates and everything else in done inside of Rancher Manager! Please see the steps below to ensure you are completely set up for the workshop.


## For Official Event Workshops

If you're completing this workshop at an official event with Rancher and/or Amazon AWS, your AWS Account will be pre-configured with the required infrastructure. We are able to this by utilizing AWS Event Engine!

To access your generated AWS Account/AWS Infrastructure, please head over to the [AWS Event Engine Dashboard](https://dashboard.eventengine.run) and enter your email address and unique hash.


### Step 1: 

Enter your unique hash and click **Accept Terms & Login**!

![aws-event-engine-dashboard](/static/images/content/12-event-engine-dashboard.png)

Once you are logged into the AWS Event Engine Dashboard, you are able to view your account related information.


### Step 2: 

Click the **Open Console** button to launch the AWS Management Console to access your generated AWS Account.

![aws-event-engine-home](/static/images/content/12-event-engine-home.png)


### Step 3:

You're done! Now head over to the first workshop by clicking [here](/content/20-exploring-the-cluster/21-exploring-the-cluster/index.en.md)!


## For Outside Official Events

If you're completing this workshop outside an official event, you will need to configure the required infrastructure, before starting the workshop.

### Step 1:

Download the two required workshop CloudFormation templates.
* [Rancher RKE2 Management Cluster](/static/rke2-mgmt-cluster-ssm.yaml)
* [AWS EKS Downstream Cluster](/static/eks-import-cluster.yml)


### Step 2: 

Log into the [AWS Account Console](https://aws.amazon.com/console/) and open the [CloudFormation](https://console.aws.amazon.com/cloudformation/home) service.


### Step 3:

Click the **Create Stack** button and upload the Rancher RKE2 Management Cluster CloudFormation Template.

![aws-console-cf-home](/static/images/content/12-aws-cf-home.png)


### Step 4:

Complete all required configuration information and follow the instructions within the AWS CloudFormation Console. You should **NOT** have to change any information, unless you would like to change the configuration.


*While the first stack is being created and infrastructure is being provisioned, please repeat the same steps for the AWS EKS Downstream Cluster CloudFormation Template.*

### Step 5:

Once both CloudFormation Stacks have finished creating and all infrastructure is provisioned, head over to the first workshop by clicking [here](/content/20-exploring-the-cluster/21-exploring-the-cluster/index.en.md)!

![aws-console-cf-stacks](/static/images/content/12-aws-cf-stacks.png)