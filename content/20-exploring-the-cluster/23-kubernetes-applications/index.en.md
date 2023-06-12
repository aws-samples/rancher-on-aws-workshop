---
title: "Kubernetes Applications"
weight: 23
---

In the following module, you will complete the outcomes listed below:

1. Use Rancher Fleet to deploy a Kubernetes application.
2. Explore the application lifecycle management of Kubernetes applications with the Rancher Multi-Cluster Manager.

---


# Deploying Kubernetes Applications

In Rancher Applications, we saw how to deploy applications using the Rancher App Catalog. Now we are going to use Rancher's built in GitOps tool known as fleet. Fleet is geared to be your GitOps Intergration between your Pipelines and Infrastructure. It does a great job of being the bridge between Developers and Infrastructure folk. Let's take look on how we can use Fleet to deploy a sample demo application!

### Step 1:

Let's start by heading back to the Rancher Multi-Cluster Manager. Click the the hamburger button at the top left of the page. In the side menu, click **`Continuous Delivery`**.

![rancher-fleet-menu](/static/images/content/23-fleet-menu.png)

### Step 2:

Once the Fleet opens, there should be no Git Repositories listed, but let's switch our namespace to **`fleet-local`** to prepare for deploying our application. In the top right corner, switch **`fleet-default`** to **`fleet-local`**.

![rancher-fleet-home](/static/images/content/23-fleet-home.png)

### Step 3:

Fleet allows you to use the Rancher Multi-Cluster Manager to add Git Repos and it allows use to use a GitRepo Resource. We're going to use a preconfigured GitRepo Resource and the **`kubectl`** shell.


Just like in Exploring the Cluster, to use the kubectl shell, use your keyboard and click the **`backtick`** key.

![rancher-fleet-shell](/static/images/content/23-fleet-shell.png)

### Step 4:

Once the **`kubectl`** shell opens, copy and paste the following command and you should see a Git Repository added and resources start to create and provision. 

Make sure to keep the **`kubectl`** shell open for now.

```bash
kubectl apply -f https://raw.githubusercontent.com/aws-samples/rancher-on-aws-workshop/main/static/fleet/fleet-local.yaml
```

![rancher-fleet-deployed](/static/images/content/23-fleet-deployed.png)

### Step 5:

Under the **`name`** tab, let's click on **`flask`** to see more details about the demo application. Here you will see all the Kubernetes resources that are being created and provisioned by Fleet for the application. Feel free to click around more of the tabs!

![rancher-fleet-deployed-detailed](/static/images/content/23-fleet-deployed-detailed.png)

### Step 6:

Now that we have successfully deployed our demo application... let's head back to the **`local`** cluster, by clicking the hamburger button at the top left of the page. In the side menu, click **`local`**.

![rancher-fleet-local-cluster](/static/images/content/23-fleet-local-cluster.png)

### Step 7:

Once we are in the **`local`** cluster, in the side menu, you should see a new menu time named **`Flask Demo App`**! This is the demo application that we deployed using Fleet. Let's click on it so we can see how to access it. Just like with Longhorn and NeuVector, there is a box to click to open the application. Let's click on the **`Flask Demo App`** box to open the application.

![rancher-fleet-local-cluster-demo-app](/static/images/content/23-fleet-local-cluster-demo-app.png)

### Step 8:

Here you will see your demo application!! It is a fairly simple demo application that uses a Flask user interface to interact with a Redis database and stores the key value each time the site is visted by a user. 

Notice you are able to see the amount of hits on the site and the exact server (aka the pod)!

![rancher-fleet-demo-app](/static/images/content/23-fleet-demo-app.png)

## Completed!

We're done! You've just deployed a Kubernetes application using the Rancher Multi-Cluster Manager. Let's move onto creating a Amazon EKS Cluster using `eksctl` and Cloud9!
