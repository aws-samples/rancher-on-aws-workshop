---
title: "Importing the Cluster"
weight: 41
---

# Importing the EKS Cluster

## Cluster Management

### Step 1:

![rancher-cluster-menu](/static/images/content/41-cluster-menu.png)


### Step 2:

![rancher-cluster-home](/static/images/content/41-cluster-home.png)


## Cloud Credentials

### Step 1:

![rancher-cluster-creds-cf](/static/images/content/41-cluster-creds-cf.png)


### Step 2:

![rancher-cluster-creds-cloudshell](/static/images/content/41-cluster-creds-cloudshell.png)


### Step 3:

```
aws sts get-caller-identity
```

![rancher-cluster-creds-cloudshell-1](/static/images/content/41-cluster-creds-cloudshell-1.png)


### Step 4:

```
aws eks update-kubeconfig --region us-east-1 --name eks-cluster
```
```
kubectl get nodes -o wide
```

![rancher-cluster-creds-cloudshell-2](/static/images/content/41-cluster-creds-cloudshell-2.png)


### Step 5:

```
kubectl edit -n kube-system configmap/aws-auth
```

```bash
  mapUsers: |
    - groups:
      - system:masters
      userarn: arn:aws:iam::114708180921:user/rancher-cloud-credential-user
      username: rancher
```

![rancher-cluster-creds-cloudshell-3](/static/images/content/41-cluster-creds-cloudshell-3.png)

## Importing the Cluster

### Step 1:

![rancher-cluster-import-options](/static/images/content/41-cluster-import-options.png)


### Step 2:

![rancher-cluster-import-eks](/static/images/content/41-cluster-import-eks.png)

<pre>
<b>Cluster Configuration:</b>

<b>Cluster Name:</b> eks-cluster

<b>Region:</b> us-east-1

<b>Cloud Credentials:</b> aws

<b>Cluster To Register:</b> eks-cluster
</pre>

![rancher-cluster-import-eks-config](/static/images/content/41-cluster-import-eks-config.png)

![rancher-cluster-import-eks-cluster](/static/images/content/41-cluster-import-eks-cluster.png)


### Step 3:

![rancher-cluster-import-eks-success](/static/images/content/41-cluster-import-eks-success.png)


### Step 4:

![rancher-cluster-import-eks-success-details](/static/images/content/41-cluster-import-eks-success-details.png)


### Step 5:

![rancher-cluster-import-eks-successful](/static/images/content/41-cluster-import-eks-successful.png)


### Step 6:

![rancher-cluster-import-eks-success](/static/images/content/41-cluster-import-eks-details.png)