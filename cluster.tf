

resource "google_container_cluster" "gke-cluster" {

  name = "primary"

  location                 = "us-central1-a"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.gkenet2.self_link
  subnetwork               = google_compute_subnetwork.gke-subnet-us.self_link
  logging_service          = "logging.googleapis.com/kubernetes"
  monitoring_service       = "monitoring.googleapis.com/kubernetes"
  networking_mode          = "VPC_NATIVE"


  addons_config {
    http_load_balancing {
      disabled = true
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
  }

  release_channel {
    channel = "REGULAR"
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "gke-pod-range1"
  }
}

