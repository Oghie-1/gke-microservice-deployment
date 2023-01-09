#Create the gkenet2 network
resource "google_compute_network" "gkenet2" {
  name = "gkenet2"
  # RESOURCE properties go here
  auto_create_subnetworks = "false"
}
# Add a firewall rule to allow HTTP, SSH, RDP and ICMP traffic on mynetwork
resource "google_compute_firewall" "gkenet2-allow-http-ssh-rdp-icmp" {
  name = "gkenet2-allow-http-ssh-rdp-icmp"
  # RESOURCE properties go here
  network = google_compute_network.gkenet2.self_link
  allow {
    protocol = "tcp"
    ports    = ["22", "80", "3389"]
  }
  allow {
    protocol = "icmp"
  }
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_subnetwork" "gke-subnet-europe" {
  name          = "gke-subnet-europe"
  ip_cidr_range = "164.0.0.0/16"
  network       = google_compute_network.gkenet2.self_link
  region        = "europe-west1"
}

resource "google_compute_subnetwork" "gke-subnet-us" {
  name          = "gke-subnet-us"
  ip_cidr_range = "10.0.0.0/16"
  network       = google_compute_network.gkenet2.self_link
  region        = "us-central1"
  secondary_ip_range {
    range_name    = "gke-pod-range1"
    ip_cidr_range = "10.4.0.0/20"
  }


}
