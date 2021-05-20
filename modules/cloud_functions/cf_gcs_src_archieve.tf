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

data "archive_file" "function_archive" {
  type       = "zip"
  source_dir = "${replace(abspath(path.module), "modules/cloud_functions", "")}${var.app_dir_name}"
  //"${replace(path.cwd, "env/${var.project_id}", "")}apps/${var.app_dir_name}"
  output_path = "${var.function_name}_${var.environment}"


}

resource "google_storage_bucket_object" "archive" {
  name   = "${data.archive_file.function_archive.output_path}_${data.archive_file.function_archive.output_md5}.zip"
  bucket = google_storage_bucket.cf_source_code_reg.name
  source = data.archive_file.function_archive.output_path

}
