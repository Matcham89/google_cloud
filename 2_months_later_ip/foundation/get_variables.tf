# Load the config yaml from the root of the repo
locals {
  foundation_config = yamldecode(file("./foundation_config.yaml"))
}

# Load individual values from the config yaml
locals {
  apply_org_priv   = local.foundation_config.apply_org_priv
  billing_account  = local.foundation_config.billing_account
  billing_admins   = local.foundation_config.billing_admins
  billing_creators = local.foundation_config.billing_creators
  customer_id      = local.foundation_config.customer_id
  default_region   = try(local.foundation_config.default_region, "europe_west1")
  foundation_name  = local.foundation_config.foundation_name
  org_domain       = local.foundation_config.org_domain
  org_id           = local.foundation_config.org_id
  other_regions    = try(local.foundation_config.other_regions, ["europe_west2"])
  parent_id        = local.foundation_config.parent_id
  repo_location    = local.foundation_config.repo_location
  repo_branch      = local.foundation_config.repo_branch
  sf_infra_labels  = try(local.foundation_config.sf_infra_labels, {})
  super_admins     = local.foundation_config.super_admins
}

# Calculate addional values based on config
locals {
  all_regions = concat([local.default_region], local.other_regions)
}
