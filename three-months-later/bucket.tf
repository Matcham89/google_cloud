provider "google" {
}

resource "google_storage_bucket" "state-bucket" {
  name = "state-bucket-3-months-later-0192hate"
  location = var.bucket_region
  uniform_bucket_level_access = true
}
