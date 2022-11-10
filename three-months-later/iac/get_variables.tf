# Load the config yaml from the root of the repo
locals {
  config = yamldecode(file("../config.yaml"))
}


locals {
project_id = local.config.project_id
default_region   = try(local.foundation_config.default_region.region, "europe_west1")

}