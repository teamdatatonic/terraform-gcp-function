# ----------------------------------------------------------------------------------------------------------------------
# INIT: Enable Google Cloud API Services 
# ----------------------------------------------------------------------------------------------------------------------

resource "google_project_service" "enable_gcp_api_services" {
  for_each = toset(var.api_service_list)

  project                    = var.project_id
  service                    = "${each.value}.googleapis.com"
  disable_dependent_services = true
}

# ----------------------------------------------------------------------------------------------------------------------
# Secure Cloud Function Network 
# ----------------------------------------------------------------------------------------------------------------------
module "core_network" {
  source  = "teamdatatonic/network/gcp"
  version = "1.4.1"

  project_id              = var.project_id
  region                  = var.region
  network_name            = var.cf_network_name
  routing_mode            = var.routing_mode
  description             = var.description
  subnets                 = var.secure_subnet
  cloud_router_nat_config = var.cloud_router_nat_config
  environment_prefix      = var.environment
  depends_on = [
    google_project_service.enable_gcp_api_services
  ]
}

resource "google_vpc_access_connector" "cf-vpc-connector" {
  project       = var.project_id
  name          = "${var.vpc_connector_config.name}-${var.environment}"
  region        = var.region
  ip_cidr_range = var.vpc_connector_config.ip_cidr_range
  network       = module.core_network.network_name
  depends_on = [
    google_project_service.enable_gcp_api_services
  ]
}

# ----------------------------------------------------------------------------------------------------------------------
# Google Cloud Functions  
# ----------------------------------------------------------------------------------------------------------------------
module "cloud_functions" {
  for_each                = var.cloud_function_configs
  source                  = "./modules/cloud_functions"
  project_id              = var.project_id
  project_number          = var.project_number
  region                  = var.region
  environment             = var.environment
  function_name           = each.key
  description             = lookup(each.value, "description", null)
  entry_point             = lookup(each.value, "entry_point")
  runtime                 = lookup(each.value, "runtime", null)
  trigger_http            = lookup(each.value, "trigger_http")
  environment_variables   = lookup(each.value, "environment_variables", null)
  timeout                 = lookup(each.value, "timeout", null)
  ingress_settings        = lookup(each.value, "ingress_settings", null)
  egress_settings         = lookup(each.value, "egress_settings", null)
  vpc_connector           = lookup(each.value, "vpc_connector", null)
  available_memory_mb     = lookup(each.value, "available_memory_mb", null)
  app_dir_name            = lookup(each.value, "app_dir_name")
  source_code_bucket_name = lookup(each.value, "src_bucket_name")
  cf_service_account_name = lookup(each.value, "cf_service_account_name")
  cf_project_level_roles  = lookup(each.value, "cf_project_level_roles", null)
  event_trigger           = lookup(each.value, "event_trigger", null)

  depends_on = [
    module.core_network,
    google_vpc_access_connector.cf-vpc-connector,
    google_project_service.enable_gcp_api_services
  ]

}
