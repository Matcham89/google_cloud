###STORAGE BUCKET CREATION ####

module "gcs_buckets" {
  source          = "terraform-google-modules/cloud-storage/google"
  version         = "~> 2.2"
  project_id      = "prj-gke"
  names           = "first"
  prefix          = local.foundation_name
  set_admin_roles = true
  admins          = ["user:chris.matcham@appsbroker.com"]
  versioning = {
    first = true
  }
  bucket_admins = {
    second = "user:chris.matcham@appsbroker.com"
  }
}


### FOLDER CREATION ###

module "folders" {
  source  = "terraform-google-modules/folders/google"
  version = "~> 3.0"

  parent = local.parent_id

  names = [
    "dev",
    "prod",
  ]

  set_roles = true

  per_folder_admins = {
    dev  = ""
    prod = ""
  }

  all_folder_admins = [
    "user:chris.matcham@appsbroker.com"
  ]
}

### PROJECT CREATION ###

module "project_gke" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name                = "prj-gke"
  random_project_id   = true
  org_id              = local.org_id
  usage_bucket_name   = module.gcs_buckets.google_storage_bucket.buckets.name[0]
  usage_bucket_prefix = local.foundation_name
  billing_account     = local.billing_account
  #svpc_host_project_id = "shared_vpc_host_name"

  #   shared_vpc_subnets = [
  #     "projects/base-project-196723/regions/us-east1/subnetworks/default",
  #     "projects/base-project-196723/regions/us-central1/subnetworks/default",
  #     "projects/base-project-196723/regions/us-central1/subnetworks/subnet-1",
  #   ]
}


### API ACTIVATION ###

module "project-services" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "~> 13.0"

  project_id = "prj-gke"

  activate_apis = [
    "compute.googleapis.com",
    "iam.googleapis.com",
  ]
}