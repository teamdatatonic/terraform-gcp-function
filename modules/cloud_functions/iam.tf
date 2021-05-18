# ----------------------------------------------------------------------------------------------------------------------
# Cloud Function IAM 
# ----------------------------------------------------------------------------------------------------------------------

resource "google_service_account" "cloud_function_service_account" {
  #checkov:skip=CKV2_GCP_3
  project    = var.project_id
  account_id = var.cf_service_account_name
}

resource "google_project_iam_member" "project_iam" {
  for_each = toset(var.cf_project_level_roles)

  project = var.project_id
  role    = "roles/${each.value}"
  member  = "serviceAccount:${google_service_account.cloud_function_service_account.email}"

}

resource "google_service_account_iam_member" "cloud_build_permission" {
  service_account_id = google_service_account.cloud_function_service_account.id
  role               = "roles/iam.serviceAccountUser"
  // Using string interpolation than data sources  - they cause tf drifts
  member = "serviceAccount:${var.project_number}@cloudbuild.gserviceaccount.com"
}
