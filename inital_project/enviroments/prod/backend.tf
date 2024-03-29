#define the provider of the infrastructure
provider "google" {
    project = var.project
    region = var.region
    }

#backend storage
terraform {
    backend "gcs" {
        bucket = "prod-state-bucket-001"
        prefix = "prod/state"
    }

#version control
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "~> 4.0"
        }
    }
}