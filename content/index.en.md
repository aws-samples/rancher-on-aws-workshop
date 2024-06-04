---
title: 'Welcome to Rancher on AWS'
---

![rgs-aws-banner](/static/images/rgs-aws-banner.png)

# Welcome to the Rancher on AWS Workshop

Learn how to easily deploy and manage Kubernetes with Rancher on the AWS Cloud!

**Created together by [Rancher Government Solutions](https://ranchergovernment.com) and [Amazon Web Services](https://aws.amazon.com) under the MIT-0 and CC-BY-4.0 Licenses.**

**To get started, please review the information below and then start the workshop by clicking next!**

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

## Table of Contents

- [Introduction](/10-introduction)
  - [Workshop Overview](/10-introduction/11-workshop-overview)
  - [Workshop Environment](/10-introduction/12-workshop-environment)
  - [Documentation](/10-introduction/13-documentation)
- [Exploring the Cluster](/20-exploring-the-cluster)
  - [Exploring the Cluster](/20-exploring-the-cluster/21-exploring-the-cluster)
  - [Rancher Applications](/20-exploring-the-cluster/22-rancher-applications)
  - [Kubernetes Applications](/20-exploring-the-cluster/23-kubernetes-applications)
- [Creating a Cluster](/30-creating-a-cluster)
  - [Creating the EKS Cluster](/30-creating-a-cluster/31-creating-eks-cluster)
  - [Creating the RKE2 Cluster](/30-creating-a-cluster/32-creating-rke2-cluster)
- [Importing a Cluster](/40-importing-a-cluster)
  - [Importing the Cluster](/40-importing-a-cluster/41-importing-the-cluster)
- [Additional AWS Integrations](/50-additional-integrations)
- [Workshop Conclusion](/60-conclusion)

### GitHub Repository

Visit our [GitHub repository](https://github.com/aws-samples/rancher-on-aws-workshop) to find the workshop assets and source code. We welcome your suggestions or improvements!
