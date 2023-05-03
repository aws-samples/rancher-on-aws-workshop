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