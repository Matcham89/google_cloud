resource "google_storage_bucket" "state-bucket" {
  name = "state-bucket-3-months-later"
  location = var.default_region
  uniform_bucket_level_access = true
}

terraform {
  backend "gcs" {
    prefix = "terraform/state"
  }
}
