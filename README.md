# gke-microservice-deployment
This project demonstrates how to deploy a sample microservice to a Google Kubernetes Engine (GKE) cluster running on the Google Cloud Platform (GCP) using 
Terraform and Helm. It also shows how to expose the microservice using a DNS record and secure the connection with a Let's Encrypt SSL certificate.

<h3>Prerequisites</h3>

  <li>Terraform</li>
  <li>Helm</li>
  <li>Google Cloud SDK</li>


<h3>Getting Started</h3>

```
#Clone the repository
git clone https://github.com/Oghie-1/gke-microservice-deployment.git

#Navigate to the repository directory
cd gke-microservice-deployment

#Initialize Terraform
terraform init

#Create a Google Cloud Storage bucket for storing the Terraform state file
terraform apply -target=google_storage_bucket.tf_state

#Create the GKE cluster
terraform apply -target=google_container_cluster.k8s_cluster

Install the nginx microservice using Helm
#terraform apply -target=helm_release.nginx

#Expose the nginx service using a DNS record
terraform apply -target=google_dns_record_set.nginx

#Set up a Let's Encrypt certificate and enforce a secured connection:
terraform apply -target=helm_release.cert-manager
terraform apply -target=kubernetes_ingress.nginx

```





