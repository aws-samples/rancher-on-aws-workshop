---
title: "Kubernetes Applications"
weight: 23
---

In the following module, you will complete the outcomes listed below:

1. Use Rancher Fleet to deploy two Kuberenetes applications.
2. Explore the application lifecycle management of Kubernetes applications with the Rancher Multi-Cluster Manager.

---


# Deploying the Kubernetes Applications

### Step 1:



![rancher-fleet-menu](/static/images/content/23-fleet-menu.png)

### Step 2:



![rancher-fleet-home](/static/images/content/23-fleet-home.png)

### Step 3:



![rancher-fleet-shell](/static/images/content/23-fleet-shell.png)

### Step 4:



```bash
kubectl apply -f https://raw.githubusercontent.com/aws-samples/rancher-on-aws-workshop/main/static/fleet/fleet-default.yaml 
```

```bash
kubectl apply -f https://raw.githubusercontent.com/aws-samples/rancher-on-aws-workshop/main/static/fleet/fleet-local.yaml
```

### Step 5:



### Step 6:



## Completed!

We're done! You've just deployed two Kubernetes applications using the Rancher Multi-Cluster Manager. Let's move onto creating a Amazon EKS Cluster using `eksctl` and Cloud9!