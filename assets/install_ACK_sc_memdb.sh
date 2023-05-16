#!/bin/bash

echo '================= Set Script Variables ================='
MEMORYDB_CLUSTER_NAME="workshop-memorydb-cluster"
MEMORYDB_SUBNETGROUP_NAME="subnet-workshop-memorydb-cluster"
AWS_REGION=us-east-1
SERVICE="memorydb"
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query "Account" --output text)
OIDC_PROVIDER=$(aws eks describe-cluster --name $EKS_CLUSTER_NAME --region $AWS_REGION --query "cluster.identity.oidc.issuer" --output text | sed -e "s/^https:\/\///")
ACK_K8S_NAMESPACE=ack-system

ACK_K8S_SERVICE_ACCOUNT_NAME=ack-$SERVICE-controller
SECURITY_GROUP_ID=$(aws --region $AWS_REGION eks describe-cluster --name $EKS_CLUSTER_NAME --query cluster.resourcesVpcConfig.clusterSecurityGroupId)

echo '================= Helm Install - MemoryDB Chart ================='
aws ecr-public get-login-password --region us-east-1 | helm registry login --username AWS --password-stdin public.ecr.aws
helm install --create-namespace -n ack-system oci://public.ecr.aws/aws-controllers-k8s/memorydb-chart --version=v1.0.0 --generate-name --set=aws.region=us-east-1

echo '================= IRSA Setup - MemoryDB ================='
eksctl utils associate-iam-oidc-provider --cluster $EKS_CLUSTER_NAME --region $AWS_REGION --approve

read -r -d '' TRUST_RELATIONSHIP <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::${AWS_ACCOUNT_ID}:oidc-provider/${OIDC_PROVIDER}"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "${OIDC_PROVIDER}:sub": "system:serviceaccount:${ACK_K8S_NAMESPACE}:${ACK_K8S_SERVICE_ACCOUNT_NAME}"
        }
      }
    }
  ]
}
EOF
echo "${TRUST_RELATIONSHIP}" > trust.json

ACK_CONTROLLER_IAM_ROLE="ack-${SERVICE}-controller"
ACK_CONTROLLER_IAM_ROLE_DESCRIPTION="IRSA role for ACK ${SERVICE} controller deployment on EKS cluster using Helm charts"
aws iam create-role --role-name "${ACK_CONTROLLER_IAM_ROLE}" --assume-role-policy-document file://trust.json --description "${ACK_CONTROLLER_IAM_ROLE_DESCRIPTION}"
ACK_CONTROLLER_IAM_ROLE_ARN=$(aws iam get-role --role-name=$ACK_CONTROLLER_IAM_ROLE --query Role.Arn --output text)

echo '============================================'
echo "${ACK_CONTROLLER_IAM_ROLE} IAM Role Created"
echo '============================================'

# Download the recommended managed and inline policies and apply them to the
# newly created IRSA role
BASE_URL=https://raw.githubusercontent.com/aws-controllers-k8s/${SERVICE}-controller/main
POLICY_ARN_URL=${BASE_URL}/config/iam/recommended-policy-arn
POLICY_ARN_STRINGS="$(wget -qO- ${POLICY_ARN_URL})"

INLINE_POLICY_URL=${BASE_URL}/config/iam/recommended-inline-policy
INLINE_POLICY="$(wget -qO- ${INLINE_POLICY_URL})"

while IFS= read -r POLICY_ARN; do
    echo -n "Attaching $POLICY_ARN ... "
    aws iam attach-role-policy \
        --role-name "${ACK_CONTROLLER_IAM_ROLE}" \
        --policy-arn "${POLICY_ARN}"
    echo "ok."
done <<< "$POLICY_ARN_STRINGS"

if [ ! -z "$INLINE_POLICY" ]; then
    echo -n "Putting inline policy ... "
    aws iam put-role-policy \
        --role-name "${ACK_CONTROLLER_IAM_ROLE}" \
        --policy-name "ack-recommended-policy" \
        --policy-document "$INLINE_POLICY"
    echo "ok."
fi

# Annotate the service account with the ARN
export IRSA_ROLE_ARN=eks.amazonaws.com/role-arn=$ACK_CONTROLLER_IAM_ROLE_ARN
kubectl annotate serviceaccount -n $ACK_K8S_NAMESPACE $ACK_K8S_SERVICE_ACCOUNT_NAME $IRSA_ROLE_ARN

# Note the deployment name for ACK service controller from following command
ACK_DEPLOYMENT_NAME=$(kubectl get deployments -n $ACK_K8S_NAMESPACE)
kubectl -n $ACK_K8S_NAMESPACE rollout restart deployment

# Check for:
# AWS_ROLE_ARN=arn:aws:iam::<AWS_ACCOUNT_ID>:role/<IAM_ROLE_NAME>
# AWS_WEB_IDENTITY_TOKEN_FILE=/var/run/secrets/eks.amazonaws.com/serviceaccount/token

kubectl get pods -n $ACK_K8S_NAMESPACE
kubectl describe pod -n $ACK_K8S_NAMESPACE | grep "^\s*AWS_"

# Create Amazon MemoryDB subnet group
echo '================= Create MemoryDB Subnet Group ================='

VPC_ID=$(aws --region $AWS_REGION eks describe-cluster --name $EKS_CLUSTER_NAME --query cluster.resourcesVpcConfig.vpcId)
SUBNET_IDS=$(aws --region $AWS_REGION ec2 describe-subnets \
  --filters "Name=vpc-id,Values=${VPC_ID}" \
  --query 'Subnets[*].SubnetId' \
  --output text
)

cat <<EOF > memorydb-subnetgroup.yaml
apiVersion: memorydb.services.k8s.aws/v1alpha1
kind: SubnetGroup
metadata:
  name: "${MEMORYDB_SUBNETGROUP_NAME}"
spec:
  name: "${MEMORYDB_SUBNETGROUP_NAME}"
  description: "MemoryDB cluster subnet group"
  subnetIDs:
$(printf "    - %s\n" ${SUBNET_IDS})
EOF

kubectl apply -f memorydb-subnetgroup.yaml ; kubectl describe subnetgroup "${MEMORYDB_SUBNETGROUP_NAME}"

# Create memoryDB cluster
echo '================= Create MemoryDB Cluster ================='

cat <<EOF > memorydb-cluster.yaml
apiVersion: memorydb.services.k8s.aws/v1alpha1
kind: Cluster
metadata:
  name: "${MEMORYDB_CLUSTER_NAME}"
spec:
  name: "${MEMORYDB_CLUSTER_NAME}"
  nodeType: db.t4g.small
  aclName: open-access
  securityGroupIDs:
    - ${SECURITY_GROUP_ID}
  subnetGroupName: ${MEMORYDB_SUBNETGROUP_NAME}
EOF

kubectl apply -f memorydb-cluster.yaml

# Check if cluster is creating
echo "================= kubectl describe cluster "${MEMORYDB_CLUSTER_NAME}" ================="
kubectl describe cluster "${MEMORYDB_CLUSTER_NAME}"

echo "================= kubectl describe cluster "${MEMORYDB_CLUSTER_NAME}" ================="