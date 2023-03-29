# Workshop Checklist

## Included in Introduction

- [ ] Topics Covered
- [ ] Expected Duration
- [ ] Workshop Outcomes
- [ ] Workshop Audience
- [ ] Workshop Prerequisites
- [ ] Workshop Costs

### "Included in Introduction" Notes

- Topics Covered
  - Deploying Rancher on EKS
  - Importing EC2 cluster using the Rancher Management Console
  - Creating EKS clusters from the Rancher Management Console
  - Deploying Longhorn and NeuVector using the Rancher Management Console
  - Cluster management best-practices with EKS and Rancher
- Expected Duration
  - Total (4 Hours)
  - Deploying Rancher on EKS (45m)
  - Importing EC2 cluster using the Rancher Management Console (30m)
  - Creating EKS clusters from the Rancher Management Console (45m)
  - Deploying Longhorn and NeuVector using the Rancher Management Console (30m)
  - Break (15m)
  - Deploying demo flask application using Rancher Fleet (60m)
  - Cluster management best-practices with EKS and Rancher (15m)
- Workshop Outcomes
  - Able to deploy and manage Kubernetes Clusters
  - Able to deploy EKS apps and Helm Charts from EKS/Rancher Management Console
  - Able to deploy Kubernetes applications from the Rancher Management Console
  - Understanding of best-practices when deploying and managing Kubernetes Clusters on AWS using Rancher
- Workshop Audience
  - Practitioners seeking solutions to manage Kubernetes workflows.
- Workshop Prerequisites
  - Basic understanding of Kubernetes, Kubernetes applications, AWS, and CLI maneuverability
- Workshop Costs
  - TBD

## Environment Set-Up

- [ ] Confirm Workshop Infrastructure works
- [x] Confirm Workshop works in customer account. If so, provide setup instructions. (N/A)
- [ ] Confirm Workshop has account login information and works
- [x] State if the Workshop only works with Event Engine (N/A)
- [x] State any computer hardware prerequisite setup information (laptops, etc.) (N/A)
- [x] State if the Workshop only works in specific regions (N/A)

## Environment Clean-Up

- [ ] Provide instructions to clean-up the environment
- [ ] Specify if the clean-up steps are specific to the resources created in the Workshop
- [x] Are deliberately retained resources explained? (N/A)
- [x] Are deliberately retained resources costs explained? (N/A)
- [ ] If clean-up instructions require the deletion of a cfn stack, does this delete all resources in the stack?
- [ ] Provide link to clean-up in the introduction/set-up chapters
- [ ] Is the clean-up obvious for customers who do not complete the workshop?

## Well-Architected Workshop Infrastructure

- [ ] Confirm well-architected principals are used
- [ ] Variance of instance types used (EC2, RDS, etc.)(or described)
- [ ] Resources deployed in multiple AZs
- [ ] Resources scale with demand
- [ ] Explanation provided for resources that are not redundant, scalable, or cost efficient

## External Links and Privacy

- [ ] Confirm workshop is self-contained
- [ ] Larger bundles of AWS-owned content stored in Event Engine S3 or AWS GitHub
- [x] Confirm YouTube videos use the video directive (N/A)
- [ ] Confirm workshop referenced 3rd party datasets allow for AWS use
- [ ] Confirm all images used have a CC0 license

## Security

- [ ] Confirm users and roles have appropriately scoped policies
- [ ] Confirm buckets restrict public access
- [ ] Confirm all services with an option to restrict public access are enabled
- [ ] Confirm security groups restrict access to specific IPs and ports
- [ ] Confirm RDS and EMR clusters have public access disabled
- [ ] Explain if a configuration doesn’t adhere to AWS well-architected practices
- [ ] Confirm sample code is run using a role that grants least privilege
- [ ] Confirm IAM Access Analyzer was ran and any findings were resolved
- [ ] Confirm attendees are NOT ASKED to enter information as part of the workshop
- [ ] Confirm workshop compiles with security best practices https://docs.aws.amazon.com/security/
- [ ] Confirm ScoutSuite, cfn_nag, and cfn-lint ran without resulting in any blockers (detail any high severity findings in the comments field, and confirm those items have been resolved) (https://github.com/nccgroup/ScoutSuite , https://github.com/stelligent/cfn_nag, https://github.com/aws-cloudformation/cfn-lint)
- [ ] Confirm review of all uploaded content for the threat of malicious uploads by scanning with tools such as ClamAV
- [ ] List any other scans of the workshop
- [ ] Confirm workshop does not contain confidential information
- [ ] Confirm workshop includes overall architecture diagram, depicting the associated resources and security controls in place

## Source Code, Sample Data, third party sources, and Open Source

- [ ] Confirm all AWS-created code includes a license
- [ ] Confirm 3rd party code is licensed to allow AWS use
- [ ] Confirm 3rd party code includes all required attributes
- [ ] Confirm 3rd party data sets include AWS rights to use
- [ ] Confirm code in Github is under the AWS organization
- [ ] Confirm 3rd party code is references rather than used where possible. If used, a license must allow AWS usage
- [ ] Confirm workshop is factually correct
- [ ] Confirm the workshop can be completed with steps included without error
- [ ] Confirm remediations included if errors are encounters
- [ ] Confirm diagrams and images are included where applicable
- [ ] Confirm language is clear, even to non-native-language speakers

## Accessibility and Inclusion

- [ ] Confirm all images have accurate and depictive alternate text
- [ ] Confirm images avoid red/green elements that could cause colorblindness issues
- [x] Confirm videos have subtitles (N/A)
- [ ] Confirm workshop adheres to Amazon’s Inclusive Tech Guidelines

## Internalization

- [x] Confirm all languages/translations listed in the left-hand dropdown menu (N/A)
