resource "google_compute_instance" "gke-us-vm" {
  provider     = google.us-central1
  count        = 1
  name         = "gke-us-vm-${count.index}"
  machine_type = "f1-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-10-buster-v20221206"
    }
  }

  network_interface {
    network = "gkenet2"
    subnetwork = "projects/ikolo-test/regions/us-central1/subnetworks/gke-subnet-us"
  
  }
}

resource "google_compute_instance" "gke-eu-vm" {
  provider     = google.europe-west1
  name         = "gke-eu-vm"
  machine_type = "f1-micro"
  zone         = "europe-west1-b"

  boot_disk {
    initialize_params {
      image = "debian-10-buster-v20221206"
    }
  }

  network_interface {
    network = "gkenet2"
    subnetwork = "projects/ikolo-test/regions/europe-west1/subnetworks/gke-subnet-europe"
  }
}