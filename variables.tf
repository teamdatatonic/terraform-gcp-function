variable "project_id" {
  description = "The ID of the project where the Cloud Function will be created."
  type        = string
}

variable "project_number" {
  description = "The Number of the project where the Cloud Function will be created."
  type        = string
}

variable "region" {
  description = "The region in  which the Cloud Function will be created."
  type        = string
  default     = "europe-west2"
}


variable "environment" {
  description = "The GCP envioment where the Cloud Function will be created."
  type        = string
  default     = null
}

variable "api_service_list" {
  description = " (Optional) The service to enable."
  type        = list(any)
  default     = []
}

variable "description" {
  description = "(Optional) An optional description of the VPC Network. The resource must be recreated to modify this field."
  type        = string
  default     = null
}

variable "cloud_router_nat_config" {
  description = "(Required) Map of objects to config cloud nat & router."
  type        = map(any)
  default     = {}
}

variable "cf_network_name" {
  description = "(Required) The VPC Name to create for the Cloud Function."
  type        = string

}

variable "routing_mode" {
  type        = string
  default     = "REGIONAL"
  description = "The network routing mode (default 'REGIONAL')."
}


variable "secure_subnet" {
  description = "(Required) The list of subnet(s) to be created for the Cloud Function Network."
  type        = list(map(string))

}

variable "vpc_connector_config" {
  description = "(Required) Map of objects to configure VPC Access Connector."
  type        = map(any)

}

variable "cloud_function_configs" {
  description = "(Required) Map of objects to configure Cloud Function."
}
