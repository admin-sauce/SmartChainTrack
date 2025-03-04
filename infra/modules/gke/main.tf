resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  # Remove the default node pool and set an initial count (will be replaced)
  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    # Disable basic authentication
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "${var.cluster_name}-node-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = var.node_count

  node_config {
    # Use preemptible VMs for cost savings (optional)
    preemptible  = true
    machine_type = "n1-standard-1"

    # Disable legacy metadata endpoints
    metadata = {
      disable-legacy-endpoints = "true"
    }

    # Define OAuth scopes for logging and monitoring
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
