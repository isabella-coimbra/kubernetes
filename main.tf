# Create Service Account
resource "google_service_account" "default" {
  account_id   = "service-account-id-cluster"
  display_name = "User for ${var.cluster_name}"
}

# Create VPC

resource "google_compute_network" "vpc" {
  name                    = "${var.project}-vpc"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.project}-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}

# GKE cluster
resource "google_container_cluster" "primary" {
  project            = var.project
  name               = var.cluster_name
  location           = var.location
  initial_node_count = var.initial_node_count
  network            = google_compute_network.vpc.name
  subnetwork         = google_compute_subnetwork.subnet.name
  node_config {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
  timeouts {
    create = "30m"
    update = "40m"
  }
  logging_config {
    enable_components = ["SYSTEM_COMPONENTS"]
  }
   monitoring_config {
     enable_components = ["SYSTEM_COMPONENTS"]
   }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = var.pool_name
  location   = var.location
  cluster    = google_container_cluster.primary.name
  node_count = var.node_count

  node_config {
    preemptible  = true
    machine_type = var.machine_type

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

