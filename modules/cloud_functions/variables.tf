variable "project_id" {
  description = "(Required) The ID of the project where the cloud function will be deployed."
  type        = string
}

variable "environment" {
  description = "The GCP envioment where the cloud function will be created."
  type        = string
}

variable "project_number" {
  description = "(Required) The NUMBER of the project where the cloud function will be deployed."
  type        = string
}

variable "region" {
  description = "(Required) Region of function."
  type        = string
}

variable "function_name" {
  description = "(Required) A user-defined name of the function. Function names must be unique globally."
  type        = string
}

variable "description" {
  description = "(Optional) Description of the cloud function."
  type        = string
  default     = null
}

variable "entry_point" {
  description = " (Optional) Name of the function that will be executed when the Google Cloud Function is triggered."
  type        = string
}

variable "runtime" {
  description = "(Required) The runtime in which the function is going to run."
  type        = string
}

variable "trigger_http" {
  description = "(Optional) Boolean variable. Any HTTP request (of a supported type) to the endpoint will trigger function execution. Supported HTTP request types are: POST, PUT, GET, DELETE, and OPTIONS. Endpoint is returned as https_trigger_url. Cannot be used with trigger_bucket and trigger_topic."
  type        = bool
  default     = null
}

variable "environment_variables" {
  description = "(Optional) A set of key/value environment variable pairs to assign to the function."
  type        = map(string)
}

variable "timeout" {
  description = "(Optional) Timeout (in seconds) for the function. Default value is 60 seconds. Cannot be more than 540 seconds."
  type        = number
  default     = 60
}

variable "ingress_settings" {
  description = "String value that controls what traffic can reach the function. "
  type        = string
}

variable "egress_settings" {
  description = "The egress settings for the connector, controlling what traffic is diverted through it. Allowed values are ALL_TRAFFIC and PRIVATE_RANGES_ONLY. Defaults to PRIVATE_RANGES_ONLY. If unset, this field preserves the previously set value."
  type        = string
}

variable "vpc_connector" {
  description = "The VPC Network Connector that this cloud function can connect to. It should be set up as fully-qualified URI. The format of this field is projects/*/locations/*/connectors/*"
  type        = string
}

variable "available_memory_mb" {
  description = "(Optional) Memory (in MB), available to the cloud function."
  type        = number
  default     = 256
}

variable "app_dir_name" {
  description = "(Required) The directory name for the Cloud Function Application Code."
  type        = string
}

variable "source_code_bucket_name" {
  description = "(Required) The GCS bucket to create for  containing the zip archive which contains the function."
  type        = string
}

variable "cf_service_account_name" {
  description = "(Required) The account id that is used to generate the service account email address and a stable unique id for the Cloud Function."
  type        = string
}

variable "cf_project_level_roles" {
  description = "(Optional) The list of role(s) that should be applied to the Cloud Function ServiceAccount."
  type        = list(any)
  default     = []
}

variable "event_trigger" {
  description = "value"
  type = object({
    event_type           = string
    resource             = string
    retry_policy_enabled = bool
  })

  default = null
}
