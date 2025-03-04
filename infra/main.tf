# Configure the Google Cloud provider
provider "google" {
  project = var.project_id
  region  = var.region
}

# Call the GKE module to create a Kubernetes cluster
module "gke" {
  source       = "./modules/gke"
  project_id   = var.project_id
  region       = var.region
  cluster_name = var.cluster_name
  node_count   = var.node_count
}
