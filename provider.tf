provider "google" {
  alias   = "us-central1"
  project = "ikolo-test"
  region  = "us-central1"
}

provider "google" {
  alias   = "europe-west1"
  project = "ikolo-test"
  region  = "europe-west1"
}

resource "google_storage_bucket" "gke-storage" {
  name     = "ikolo-bit"
  location = "us"
}