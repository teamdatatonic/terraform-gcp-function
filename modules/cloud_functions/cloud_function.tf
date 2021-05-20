/*
As of writing this, the official Google terraform provider does not support 
updating a cloud functions source code after its initial deployment.
As it does not check sha/md5 changes by itself and re-deploy new code.
Github issue(https://github.com/hashicorp/terraform-provider-google/issues/1938).
Thus, hacked it by adding the md5 sources as bucket file prefix.
*/

resource "google_cloudfunctions_function" "cloud_functions" {
  project                       = var.project_id
  region                        = var.region
  name                          = "${var.function_name}_${var.environment}"
  description                   = var.description
  runtime                       = var.runtime
  ingress_settings              = var.ingress_settings
  available_memory_mb           = var.available_memory_mb
  service_account_email         = google_service_account.cloud_function_service_account.email
  vpc_connector                 = var.vpc_connector
  vpc_connector_egress_settings = var.egress_settings
  timeout                       = var.timeout
  source_archive_bucket         = google_storage_bucket_object.archive.bucket
  source_archive_object         = google_storage_bucket_object.archive.output_name
  trigger_http                  = var.trigger_http


  dynamic "event_trigger" {
    for_each = var.event_trigger == null ? [] : [""]
    content {
      event_type = var.event_trigger.event_type
      resource   = var.event_trigger.resource
      failure_policy {
        retry = var.event_trigger.retry_policy_enabled
      }
    }
  }

  entry_point = var.entry_point

  environment_variables = var.environment_variables
  depends_on = [
    google_service_account_iam_member.cloud_build_permission,
    google_service_account.cloud_function_service_account,
    google_storage_bucket.cf_source_code_reg

  ]
}
