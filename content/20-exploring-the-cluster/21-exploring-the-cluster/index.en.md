---
title: 'Exploring the Cluster'
weight: 21
---

In the following module, you will complete the outcomes listed below:

1. Access the AWS Console and AWS CloudFormation Console to find the Rancher cluster URL
2. Explore an RKE2 Cluster with the Rancher Manager

---

# Exploring the RKE2 Cluster

## AWS Console

### Step 1:

We will start by accessing the AWS Console.

At the top of the page, select the search bar and search for **`"CloudFormation"`** and click on it.

![aws-console-home](/static/images/content/21-aws-home.png)
![aws-console-home](/static/images/content/21-search-cfn.png)

### Step 2:

In the **`CloudFormation Console`**, click on the Rancher Manager **`Stack`**. If you are using AWS Workshop Studio at an AWS Event, the stack will be named **`rke2-eks-cluster-workshop`**. Outside AWS Workshop Studio, the stack will have a user-defined name you selected in the previous section.

On the stack detail page, click on the **`Outputs`** tab. You should see the **`RancherURL`**. Open the link in a new tab to bring up the Rancher Manager web interface. If your browser presents you with a certificate warning, you can safely proceed.

> The workshop environment uses self-signed certificates for learning purposes. In a production environment, always use certificates issued from a trusted public or private certificate authority. [AWS Certificate Manager (ACM)](https://aws.amazon.com/certificate-manager/) makes it easy to provision, manage, deploy, and renew SSL/TLS certificates.

![aws-console-cf-mgmt](/static/images/content/21-aws-cf-mgmt.png)
![aws-console-cf-mgmt](/static/images/content/21-aws-cf-mgmt-detail.png)

## Rancher Manager

### Step 1:

Next, we need to complete the bootstrap process in the Rancher Manager.

First, enter the bootstrap password that was set during installation: **`"Pa22w0rd"`**. Select **`Log in with Local User`**.

![rancher-bootstrapping-password](/static/images/content/21-rancher-bootstrap-pw.png)
![rancher-bootstrapping-password](/static/images/content/21-rancher-bootstrap-pw-detail.png)

### Step 2:

Next, verify a few items on the setup page and click **`Continue`**!

- **`Server URL`** (do not update)
- **`[ ] Allow collection of anonymous statistics to help us improve Rancher`**
- **`[X] By checking the box, you accept the End User License Agreement & Terms & Conditions`**

![rancher-bootstrapping-setup](/static/images/content/21-rancher-bootstrap-setup.png)
![rancher-bootstrapping-setup](/static/images/content/21-rancher-bootstrap-setup-detail.png)

### Step 3:

Welcome to the Rancher Manager! The starting page in the Rancher Manager provides an overview of the cluster(s) managed by this MCM cluster.

Under **`Clusters`**, you should see a cluster named **`local`**. This cluster is your **`management cluster`**. As we move through the workshop, we will be creating and importing additional clusters with the Rancher Manager. These are known as **`downstream cluster(s)`**. In most production enviroments, run workload and applications on downstream clusters and reserve the management cluster only for the Rancher Manager.

![rancher-manager-home](/static/images/content/21-rancher-home.png)
![rancher-manager-home-detail](/static/images/content/21-rancher-home-detail.png)

Go ahead and click on the **`local`** cluster and start to explore it.

This is the cluster homepage, where you can see a overview of the selected cluster. The overview has everything from node statistics to recent cluster events to various Kubernetes resources. (Collecting the same information with **`kubectl`** commands can take significantly more effort.)

![rancher-local-cluster-home](/static/images/content/21-rancher-local-home.png)

In the left menu under **`Cluster`**, click the **`Nodes`** menu item. Here we can see information related to each node in our **`management cluster`**.

One item to highlight here is the label on the **`Control Plane, Etcd`** nodes:

- **`Taints: CriticalAddons Only-true:NoExecute`**

In most production Kubernetes environments, you should have dedicated nodes for control plane and etcd to ensure stability and reserve resources for system workloads. In Kubernetes, that is done through Taints and Tolerations, as you can see here.

> You can learn more about best practices for production Kubernetes clusters here: https://kubernetes.io/docs/setup/production-environment/#production-control-plane

![rancher-manager-nodes](/static/images/content/21-rancher-nodes.png)

Let's dive a little deeper into workloads. Next we'll check out the system workloads running on this cluster.

In the menu, under **`Workload`**, click the **`Deployments`** menu item. Here are all the deployments running on our cluster. If you don't see any deployments, you may have the `default` Kubernetes namespace selected. By default there are no deployments in the Kubernetes default namespace of our brand-new cluster. Change the drop-down at the top of the screen to select `All Namespaces`. If you are familiar with RKE2 or Rancher, you will see that the only deployments are Rancher MCM-related workloads. As we move through the workshop, we can come back here to see the additional deployments.

_A Kubernetes **deployment** is a resource object that provides a declarative configuration to containerized applications and allows you to describe an applications lifecycle._

![rancher-manager-deployments](/static/images/content/21-rancher-deployments.png)

Under the same **`Workload`** menu, click the **`Pods`** menu item. Here you can see all the individual pods running on our cluster. If you were paying attention to the names of the deployments, you will see each deployment consists of pods. Select one of the pods to see more pod details.

_A Kubernetes **pod** is a resource object made up of one or more containers. Pods can contain a single container or multiple tightly coupled containers._

![rancher-manager-pods](/static/images/content/21-rancher-pods.png)

Next, navigate to **`Service Discovery`** and click the **`Services`** menu item. Here you can see all the services inside the cluster. Let's take a look at the **`rancher`** service. You will notice that some of the services have the same name as the pods they forward traffic to. The pods to forward traffic to are selected by the value in the `Selector` column.

_A Kubernetes **service** is a resource object for exposing a network application that is running as one or more Pods in your cluster by abstracting away manually configuration._

![rancher-manager-services](/static/images/content/21-rancher-services.png)

Next we will take a look at the application management feature of the Rancher Manager. On the left menu, click on the **`Apps`** menu item.

This is the Rancher App Catalog, which provides an interface for managing popular Kubernetes application via Helm Charts. You will likely recognize some of the popular products and projects. Developers can also add their own Helm Charts to the Rancher App Catalog so users and deployment teams can deploy them easily.

![rancher-manager-app-catalog](/static/images/content/21-rancher-app-catalog.png)

Rancher provides multiple ways for teams to deploy applications. From the console you can deploy from the App Catalog, use the included kubectl shell, or manually import a chart in yaml format. Additionally, you can use Fleet, a GitOps tool, which we will explore later in the workshop. You can see a few additional ways to deploy applications below:

![rancher-manager-kubectl-shell](/static/images/content/21-rancher-kubectl-shell.png)

![rancher-manager-import-yaml](/static/images/content/21-rancher-import-yaml.png)

## Completed!

We're done! We explored an RKE2 Cluster in AWS using the Rancher Manager. You can take a few more minutes to explore more of the cluster. Then click **Next** to move to the next section and deploy additional components of the Rancher Stack.
