# Workshop Checklist

## Included in Introduction

- [x] Topics Covered
- [x] Expected Duration
- [x] Workshop Outcomes
- [x] Workshop Audience
- [x] Workshop Prerequisites
- [x] Workshop Costs

### "Included in Introduction" Notes

- Topics Covered
  - Deploying and Exploring the Rancher Ecosystem on AWS
  - Deploying Longhorn, NeuVector, and Monitoring using the Rancher Multi-Cluster Manager
  - Creating a EC2 RKE2 Cluster using the Rancher Multi-Cluster Manager
  - Creating a EKS Cluster using AWS Cloud9 and EKSCTL
  - Importing a EKS Cluster using the Rancher Multi-Cluster Manager
  - Kubernetes and Cluster Management Best Practices with AWS and Rancher
- Expected Duration
  - Total (3 Hours)
  - Exploring a Rancher RKE2 Kubernetes cluster on EC2 Instances. (30m)
  - Deploying Longhorn, NeuVector, and Monitoring using the Rancher Multi-Cluster Manager. (15m)
  - Deploying Kubernetes Demo Applications using the RRancher Multi-Cluster Manager. (15m)
  - Short Break! (15m)
  - Creating a AWS EKS Kubernetes cluster on EC2 Instances. (30m)
  - Creating a Rancher RKE2 Kubernetes cluster on EC2 Instances. (30m)
  - Importing an existing AWS EKS Kuberenetes cluster. (15m)
  - Cluster and Application Lifecycle Management best-practices with AWS and Rancher. (15m)
  - Supply Chain Security and Management with AWS and Rancher. (15m)
- Workshop Outcomes
  - Ability to explore and manage RKE2/EKS Kubernetes Clusters.
  - Ability to deploy Kubernetes clusters from the Rancher Management Console.
  - Ability to deploy Kubernetes Applications from the Rancher Management Console.
  - Ability to deploy EKS Applications and Helm Charts from EKS or Rancher Management Console.
  - Understanding of best-practices for deploying and managing Kubernetes with AWS and Rancher.
  - Understanding of best-practices for securing and managing Software Supply Chains with AWS and Rancher.
- Workshop Audience
  - Practitioners seeking solutions to easily and simply manage Kubernetes workloads with AWS and Rancher.
- Workshop Prerequisites
  - Basic understanding of AWS, Rancher, Kubernetes, and Terminal/CLI (Command Line Interface).
  - AWS Account - If you don't have one, it's easy and free to [create one now](https://aws.amazon.com/)!
  - AWS IAM Account with _elevated privileges_ allowing you to interact with various AWS Services.
- Workshop Costs
  - Total Cost of the Workshop is less than $10.
  - Infers running the workshop for the Expected Duration of 3 hours.

## Environment Set-Up

- [x] Confirm Workshop Infrastructure works
- [x] Confirm Workshop works in customer account. If so, provide setup instructions. (N/A)
- [x] Confirm Workshop has account login information and works
- [x] State if the Workshop only works with Event Engine - CFTs will be publicly available, allowing to be ran outside of Event Engine
- [x] State any computer hardware prerequisite setup information (laptops, etc.) An internet connected machine
- [x] State if the Workshop only works in specific regions - Only us-east-1 at the moment

## Environment Clean-Up

- [x] Provide instructions to clean-up the environment
- [x] Specify if the clean-up steps are specific to the resources created in the Workshop
- [x] Are deliberately retained resources explained? (N/A)
- [x] Are deliberately retained resources costs explained? (N/A)
- [x] If clean-up instructions require the deletion of a cfn stack, does this delete all resources in the stack? - it does not
- [x] Provide link to clean-up in the introduction/set-up chapters
- [x] Is the clean-up obvious for customers who do not complete the workshop?

## Well-Architected Workshop Infrastructure

- [x] Confirm well-architected principals are used
- [x] Variance of instance types used (EC2, RDS, etc.)(or described)
- [x] Resources deployed in multiple AZs
- [x] Resources scale with demand - (N/A)
- [x] Explanation provided for resources that are not redundant, scalable, or cost efficient - Fixed infra to support workshop features only. Solution does not call for scaling though using an ASG for provisioning

## External Links and Privacy

- [x] Confirm workshop is self-contained
- [x] Larger bundles of AWS-owned content stored in Event Engine S3 or AWS GitHub
- [x] Confirm YouTube videos use the video directive (N/A)
- [x] Confirm workshop referenced 3rd party datasets allow for AWS use - (N/A)
- [x] Confirm all images used have a CC0 license

## Security

- [x] Confirm users and roles have appropriately scoped policies
- [x] Confirm buckets restrict public access
- [x] Confirm all services with an option to restrict public access are enabled
- [x] Confirm security groups restrict access to specific IPs and ports
- [x] Confirm RDS and EMR clusters have public access disabled - (N/A)
- [x] Explain if a configuration doesn’t adhere to AWS well-architected practices
- [x] Confirm sample code is run using a role that grants least privilege
- [x] Confirm IAM Access Analyzer was ran and any findings were resolved
- [x] Confirm attendees are NOT ASKED to enter information as part of the workshop
- [x] Confirm workshop compiles with security best practices https://docs.aws.amazon.com/security/
- [x] Confirm ScoutSuite, cfn_nag, and cfn-lint ran without resulting in any blockers (detail any high severity findings in the comments field, and confirm those items have been resolved) (https://github.com/nccgroup/ScoutSuite , https://github.com/stelligent/cfn_nag, https://github.com/aws-cloudformation/cfn-lint)
- [x] Confirm review of all uploaded content for the threat of malicious uploads by scanning with tools such as ClamAV
- [x] List any other scans of the workshop
- [x] Confirm workshop does not contain confidential information
- [x] Confirm workshop includes overall architecture diagram, depicting the associated resources and security controls in place

## Source Code, Sample Data, third party sources, and Open Source

- [x] Confirm all AWS-created code includes a license
- [x] Confirm 3rd party code is licensed to allow AWS use
- [x] Confirm 3rd party code includes all required attributes
- [x] Confirm 3rd party data sets include AWS rights to use
- [x] Confirm code in Github is under the AWS organization
- [x] Confirm 3rd party code is references rather than used where possible. If used, a license must allow AWS usage
- [x] Confirm workshop is factually correct
- [x] Confirm the workshop can be completed with steps included without error
- [x] Confirm remediations included if errors are encounters
- [x] Confirm diagrams and images are included where applicable
- [x] Confirm language is clear, even to non-native-language speakers

## Accessibility and Inclusion

- [x] Confirm all images have accurate and depictive alternate text
- [x] Confirm images avoid red/green elements that could cause colorblindness issues
- [x] Confirm videos have subtitles (N/A)
- [x] Confirm workshop adheres to Amazon’s Inclusive Tech Guidelines

## Internalization

- [x] Confirm all languages/translations listed in the left-hand dropdown menu (N/A)
