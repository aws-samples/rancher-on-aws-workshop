---
title: 'Kubernetes Applications'
weight: 23
---

In the following module, you will complete the outcomes listed below:

1. Use Rancher Fleet to deploy a Kubernetes application.
2. Explore the application lifecycle management of Kubernetes applications with the Rancher Multi-Cluster Manager.

---

# Deploying Kubernetes Applications

In the previous section, we deployed applications using the Rancher App Catalog. Next, we are going to use Rancher's built-in GitOps tool, Fleet. Fleet provides GitOps integration to create a bridge between development and infrastructure teams. We will use Fleet to deploy a simple sample application to demonstrate these concepts.

### Step 1:

Start back in the Rancher Multi-Cluster Manager. Click the the hamburger button (three lines) at the top left of the page. In the side menu, click **`Continuous Delivery`**.

![rancher-fleet-menu](/static/images/content/23-fleet-menu.png)

### Step 2:

Once Fleet opens, there should be no Git Repositories listed. Switch your namespace to **`fleet-local`** to prepare to deploying our application. In the top right corner, switch **`fleet-default`** to **`fleet-local`**.

In Fleet, the **`fleet-default`** namespace is used for all downstream clusters (both created and imported clusters) while the **`fleet-local`** namespace is reserved for the local cluster (the management cluster).

![rancher-fleet-home](/static/images/content/23-fleet-home.png)

### Step 3:

You can use the Rancher Multi-Cluster Manager to add Git Repos to Fleet. Fleet is configured with the `GitRepo` custom resource. You can use the user interface or provide a Kubernetes manifest, but we're going to use the **`kubectl`** shell to apply a simple provided `GitRepo` resource for this workshop.

Just like in Exploring the Cluster, to enter the kubectl shell press the **`backtick`** key on your keyboard.

![rancher-fleet-shell](/static/images/content/23-fleet-shell.png)

### Step 4:

Once the **`kubectl`** shell opens, copy and paste the following command. You will see a few resources create.

Keep the **`kubectl`** shell open for now.

```bash
kubectl apply -f https://raw.githubusercontent.com/aws-samples/rancher-on-aws-workshop/main/static/fleet/fleet-local.yaml
```

![rancher-fleet-deployed](/static/images/content/23-fleet-deployed.png)

### Step 5:

Under the **`name`** tab, click on **`flask`** to see more details about the demo application. Here you can see all the Kubernetes resources that are being created by Fleet for the application. You can obtain additional information from the other tabs.

![rancher-fleet-deployed-detailed](/static/images/content/23-fleet-deployed-detailed.png)

### Step 6:

Now that we have successfully deployed our demo application, navigate back to the **`local`** cluster by clicking the hamburger button at the top left of the page. In the side menu, click **`local`**.

![rancher-fleet-local-cluster](/static/images/content/23-fleet-local-cluster.png)

### Step 7:

In the side menu of the **`local`** cluster, you should see a new menu named **`Flask Demo App`**. This is a link to the demo application that we deployed using Fleet. When you select the new link, you have the option to access the application. Click on the **`Flask Demo App`** box to open the application.

In the Rancher Multi-Cluster Manager interface, users can add important applications or links to this side menu. Many administrators create links for enterprise applications to make them easily accesible to users via the Rancher Proxy. You can learn more about configuring the Rancher Multi-Cluster Manager interface [here](https://ranchermanager.docs.rancher.com/v2.7/how-to-guides/new-user-guides/authentication-permissions-and-global-configuration/custom-branding).

![rancher-fleet-local-cluster-demo-app](/static/images/content/23-fleet-local-cluster-demo-app.png)

### Step 8:

This is a view of our demo application. This demo application uses a Flask user interface to interact with a Redis database. The application stores a new key value pair each time the site is visted.

On the demo app interface, you are able to see both the total amount of hits on the site and the id of the pod serving the request.

![rancher-fleet-demo-app](/static/images/content/23-fleet-demo-app.png)

## Completed!

We're done! We deployed a Kubernetes application using Fleet and the Rancher Multi-Cluster Manager. In the next section, we will create an Amazon EKS Cluster using `eksctl` and AWS Cloud9.
