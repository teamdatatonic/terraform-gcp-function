# ----------------------------------------------------------------------------------------------------------------------
# Cloud Function Source Code Bucket  
# ----------------------------------------------------------------------------------------------------------------------

resource "google_storage_bucket" "cf_source_code_reg" {
  #checkov:skip=CKV_GCP_62
  #checkov:skip=CKV_GCP_29
  project  = var.project_id
  name     = "${var.source_code_bucket_name}-${var.environment}"
  location = var.region
  versioning {
    enabled = true
  }
}
