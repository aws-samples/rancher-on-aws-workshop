---
title: 'Workshop Conclusion'
weight: 60
---

![rgs-aws-banner](/static/images/rgs-aws-banner.png)

# Workshop Conclusion

## You've Completed the Workshop!
Thank you for completing the Rancher on AWS Workshop! We hope you were able to learn the ease of deploying and managing Kubernetes on AWS using Rancher.

Let's review what you've accomplished by completing this workshop:

- Ability to explore and manage RKE2/EKS Kubernetes Clusters.
- Ability to deploy Kubernetes clusters from the Rancher Management Console.
- Ability to deploy Kubernetes Applications from the Rancher Management Console.
- Ability to deploy EKS Applications and Helm Charts from EKS or Rancher Management Console.
- Understanding of best-practices for deploying and managing Kubernetes with AWS and Rancher.
- Understanding of best-practices for securing and managing Software Supply Chains with AWS and Rancher.

For any questions or to continue this conversation with the RGS team, please contact us via email at natsec@rancherfederal.com!

For any questions or to continue this conversation with the AWS team, please contact us via email at mpo-proserve@amazon.com!

## Workshop Cleanup
If you're completing this workshop at an event operated by Rancher and AWS, there is no environment cleanup required. All the resources in your workshop account will be automatically deleted at the conclusion of the workshop.

If you're completing this workshop outside an official event, please follow the steps below to clean up the workshop resources.

### Step 1:
From the Rancher Multi-Cluster Manager, delete the **`rke2-cluster`** and **`eks-cluster`**.

### Step 2:
From the AWS Console and Cloud Formation Console, delete the Cloudformation Templates Stack **`rke2-eks-cluster`**.

### Step 3:
Wait for the Cloud Formation Stack to delete then verify and remove any IAM roles or users created for this workshop.

**Note:** For any failures, review the **`Events`** tab of the failed stack to locate and delete any resources that failed to automatically delete.

### Additional Integrations Cleanup:
- From the MemoryDB Console, delete the MemoryDB Cluster and the Subnet Group.
- Verify and Remove any IAM roles or users created for this workshop.

### GitHub Repository
Visit our [GitHub repository](https://github.com/aws-samples/rancher-on-aws-workshop) to find the workshop assets and source code. We welcome your suggestions or improvements!
