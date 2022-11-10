variable "cluster_region" {
  default = "europe-west2"
}

variable "zonal_regions" {
 type = list(string)
default = [ "europe-west2-a", "europe-west2-b", "europe-west2-c" ]
}