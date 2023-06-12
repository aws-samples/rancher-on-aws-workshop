---
title: "Kubernetes Applications"
weight: 23
---

In the following module, you will complete the outcomes listed below:

1. Use Rancher Fleet to deploy a Kubernetes application.
2. Explore the application lifecycle management of Kubernetes applications with the Rancher Multi-Cluster Manager.

---


# Deploying Kubernetes Applications

### Step 1:

![rancher-fleet-menu](/static/images/content/23-fleet-menu.png)

### Step 2:

![rancher-fleet-home](/static/images/content/23-fleet-home.png)

### Step 3:

![rancher-fleet-shell](/static/images/content/23-fleet-shell.png)

### Step 4:

```bash
kubectl apply -f https://raw.githubusercontent.com/aws-samples/rancher-on-aws-workshop/main/static/fleet/fleet-local.yaml
```

![rancher-fleet-deployed](/static/images/content/23-fleet-deployed.png)

### Step 5:


![rancher-fleet-deployed-detailed](/static/images/content/23-fleet-deployed-detailed.png)

### Step 6:

```bash
kubectl apply -f https://raw.githubusercontent.com/aws-samples/rancher-on-aws-workshop/main/static/fleet/fleet-navlink.yaml
```

![rancher-fleet-navlinks](/static/images/content/23-fleet-navlinks.png)

### Step 7:

![rancher-fleet-local-cluster](/static/images/content/23-fleet-local-cluster.png)

### Step 8:

![rancher-fleet-local-cluster-demo-app](/static/images/content/23-fleet-local-cluster-demo-app.png)

### Step 9:

![rancher-fleet-demo-app](/static/images/content/23-fleet-demo-app.png)

## Completed!

We're done! You've just deployed a Kubernetes application using the Rancher Multi-Cluster Manager. Let's move onto creating a Amazon EKS Cluster using `eksctl` and Cloud9!