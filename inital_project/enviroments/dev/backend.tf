#define the provider of the infrastructure
provider "google" {
    project = var.project
    region = var.region
    }

#backend storage
terraform {
    backend "gcs" {
        bucket = "dev-state-bucket-001"
        prefix = "dev/state"
    }

#version control
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "~> 4.0"
        }
    }
}