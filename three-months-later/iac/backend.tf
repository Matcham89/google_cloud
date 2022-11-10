
terraform {
  backend "gcs" {
    bucket = "state-bucket-3-months-later-0192hate"
    prefix = "terraform/state"
  }
}
