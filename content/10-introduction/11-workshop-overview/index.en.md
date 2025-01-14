---
title: 'Workshop Overview'
weight: 11
---

# Overview of the Workshop

## Workshop Topics

- Deploying and Exploring Rancher on AWS
- Deploying Longhorn, NeuVector, and Monitoring using the Rancher Manager
- Creating a EC2 RKE2 Cluster using the Rancher Manager
- Creating a EKS Cluster using AWS Cloud9 and `eksctl`
- Importing a EKS Cluster using the Rancher Manager
- Kubernetes and Cluster Management Best Practices with AWS and Rancher

## Requirements

- Basic Knowledge of Kubernetes and Containers.
- Basic Knowledge of AWS and Cloud Infrastructure.
- (Helpful) Basic Knowledge of Rancher, RKE2, EKS, and Cloud9.

<details>
<summary>For Workshops at AWS Events</summary>

::::expand{header="For Workshops at AWS Events"}

- No additional requirements.

::::

</details>

<details>
<summary>For Use Outside AWS Events</summary>

::::expand{header="For Use Outside AWS Events"}

- AWS Account - If you don't have one, it's easy and free to [create one now](https://aws.amazon.com/)!
  - AWS Account with the ability to deploy into _us-east-1_.
  - AWS Account IAM Role with _elevated privileges_ to interact with AWS Services.
  - AWS Service Quota with at least 1 VPC, 56 vCPUs, 220 GiB Memory, and 1750 Gi of Storage.
- _Note:_ The `AdministratorAccess` managed policy in IAM provides sufficient permissions, although your organization may choose to use a custom policy with more restrictions. For more information, see [AWS managed policies for job functions](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_job-functions.html).

::::

</details>

## Workshop Expected Duration

**Total Duration of the workshop is 3 Hours.**

- Exploring a Rancher RKE2 Kubernetes cluster on EC2 Instances. (30m)
- Deploying Longhorn, NeuVector, and Monitoring using the Rancher Manager. (15m)
- Deploying Kubernetes Demo Applications using the Rancher Manager. (15m)
- Short Break! (15m)
- Creating a Amazon EKS Kubernetes cluster on EC2 Instances. (30m)
- Creating a Rancher RKE2 Kubernetes cluster on EC2 Instances. (30m)
- Importing an existing Amazon EKS Kubernetes cluster. (15m)
- Cluster and Application Lifecycle Management best practices with AWS and Rancher. (15m)
- Supply Chain Security and Management with AWS and Rancher. (15m)

## Workshop Outcomes

- Ability to explore and manage RKE2/EKS Kubernetes Clusters.
- Ability to deploy Kubernetes clusters from the Rancher Management Console.
- Ability to deploy Kubernetes Applications from the Rancher Management Console.
- Ability to deploy EKS Applications and Helm Charts from EKS or Rancher Management Console.
- Understanding of best practices for deploying and managing Kubernetes with AWS and Rancher.
- Understanding of best practices for securing and managing Software Supply Chains with AWS and Rancher.

## Workshop Audience

- Practitioners seeking solutions to easily and simply manage Kubernetes workloads with AWS and Rancher.

## Workshop Costs

- For the expected 3 hour workshop duration, the total cost of the AWS resources is expected to be less than $10.

## Now Let's Get Started...

If you're completing this workshop at an official event with Rancher and AWS, your AWS Account will be pre-configured with the required infrastructure. To get started, click **Next** at the bottom of the screen.

If you're completing this workshop outside an official event, you will need to configure the infrastructure, before starting the workshop. Please be aware that this will incur costs to your AWS Account. To get started, follow the steps in the **Workshop Environment** section!

> **Note: Each sections in this workshop is built on top of the previous section.**
