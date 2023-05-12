---
title: "Exploring the Cluster"
weight: 21
---

In the following module, you will complete the outcomes listed below:

1. Access the AWS Console and AWS Cloud Formation
2. Explore an RKE2 Cluster with the Rancher Multi-Cluster Manager


---


# Exploring the RKE2 Cluster

## AWS Console

### Step 1:

Let's start by accessing the AWS Console.

At the top of the page, head over to search bar and search for **`"Cloud Formation"`** and click on it.

![aws-console-home](/static/images/content/21-aws-home.png)


### Step 2:

Once inside of **`Cloud Formation`**, click on the **`Stack`** named **`mgmt`**.

Inside of the **`mgmt`** stack, click on the **`Outputs`** tab. You should see the **`RancherURL`**, click the link in a new tab to bring up the Rancher Multi-Cluster Manager.

![aws-console-cf-mgmt](/static/images/content/21-aws-cf-mgmt.png)


## Rancher Multi-Cluster Manager

### Step 1:

Once the Rancher Multi-Cluster Manager opens, we will need to complete the bootstrapping steps.

First let's enter the bootstrap password (that was set during installation) of **`"Pa22word"`** and **`Log in with Local User`**.

![rancher-bootstrapping-password](/static/images/content/21-rancher-bootstrap-pw.png)


### Step 2:

Now let's verify the few items on the setup page and click **`Continue`**!
* **`Server URL`** (should not need any changes)
* **`[ ] Allow collection of anonymous statistics to help us improve rancher`**
* **`[X] By checking the box, you accept the End User License Agreement & Terms & Conditions`**

![rancher-bootstrapping-setup](/static/images/content/21-rancher-bootstrap-setup.png)


### Step 3:

Welcome to the Rancher Multi-Cluster Manager!! Here's your starting point in the Rancher Multi-Cluster Manager. As you can see, we are seeing an overview of the Multi-Cluster aspect of the Rancher Manager. 

Under **`Clusters`**, you should see a cluster named **`local`**. This cluster is what we consider your **`management cluster`**. As we move through the workshop, we will be creating and importing additional clusters into the Rancher Manager, known as **`downstream cluster(s)`**.

![rancher-manager-home](/static/images/content/21-rancher-home.png)

Let's go ahead and click on the **`local`** cluster and start to explore it.

As you can see this is the homepage for the cluster and you are able to see a overview of your entire cluster. Everything from node statistics to recent cluster events to various Kubernetes resources. Normally, you would have to run many **`kubectl`** commands to get this amount information about your cluster.

![rancher-local-cluster-home](/static/images/content/21-rancher-local-home.png)

To start off, in the menu under **`Cluster`**, click the **`Nodes`** menu item. Here we can see a lot of information related to each of the nodes that makes up our **`management cluster`**. 

One item to highlight here is the label on the **`Control Plane, Etcd`** nodes:
* **`Taints: CriticalAddons Only-true:NoExecute`**

In most Kubernetes environments, you should have dedicated nodes for control plane and etcd to conserve resources for system workloads. In Kubernetes, that is done through Taints and Tolerations, as you can see here.

![rancher-manager-nodes](/static/images/content/21-rancher-nodes.png)

Let's dive a little deeper into workloads. We mentioned system workloads, so let's check out everything we have running on this cluster.

In the menu, under **`Workload`**, click the **`Deployments`** menu item. Here we can see all the deployments running on our cluster. If you are familiar with RKE2 or Rancher, you will see that the only deployments are system related workloads. As we move through the workshop, we can come back here to see the additional deployments.

*If you are not familiar with Kubernetes, a **deployment** is a resource object that provides a declarative configuration to containerized applications and allows you to describe an applications lifecycle.*

![rancher-manager-deployments](/static/images/content/21-rancher-deployments.png)

Under the same **`Workload`** menu, let's click the **`Pods`** menu item. Here we are able to see all the individual pods running on our cluster. If you were paying attention to the names of the deployments, you will see there is related pods. Feel free to click on one of the pods and investigate all the information that Rancher provides you.

*If you are not familiar with Kubernetes, a **pod** is a resource object made up of one or more containers. Pods can contain a single container or multiple tightly coupled containers.*

![rancher-manager-pods](/static/images/content/21-rancher-pods.png)

Instead of going through all the **`Workload`** items in the menu, let's head over to **`Service Discovery`** and click the **`Services`** menu item. Here we are able to see all the services inside of your cluster. Let's take a look at the **`rancher`** service. You will notice that a few of the resources that we already viewed will be displayed. It's cool to see how easy Rancher helps you manage your clusters.

*If you are not familiar with Kubernetes, a **service** is a resource object for exposing a network application that is running as one or more Pods in your cluster by abstracting away manually configuration.*

![rancher-manager-services](/static/images/content/21-rancher-services.png)

Let's switch it up and take a look at one of the most popular features of the Rancher Multi-Cluster Manager. Head over to the menu and click on the **`Apps`** menu item. 

This is the Rancher App Catalog, which provides intergrated and improved Helm Charts aka "Rancher Charts" for the most popular Kubernetes applications. You will defintely recognize some of the products and projects. A really cool feature inside of the App Catalog is the ability to add your own Helm Charts so your teams are able to easily deploy their internal applications.

![rancher-manager-app-catalog](/static/images/content/21-rancher-app-catalog.png)

While we are on the topic of application lifecycle management, Rancher has a few ways for your teams is deploy applications. Right from the console, you are able to deploy from the App Catalog, use the included kubectl shell, or by manually importing a yaml. Additionally, you are able to use our GitOps tool, known as Fleet, which we will get into more later in the workshop. Let's take a look at some additional ways to deploy applications below:

![rancher-manager-kubectl-shell](/static/images/content/21-rancher-kubectl-shell.png)

![rancher-manager-import-yaml](/static/images/content/21-rancher-import-yaml.png)

## Completed!

We're Done! You've just explored an RKE2 Cluster using the Rancher Multi-Cluster Manager. Feel free to take a few minutes and explore more of the features inside of the console. Let's move onto deploying the rest of the Rancher Stack!