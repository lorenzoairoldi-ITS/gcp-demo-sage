resource "google_storage_bucket" "instructions" {
  name                        = "${var.resource_prefix}-instructions" 
  location                    = var.region
  uniform_bucket_level_access = true
  force_destroy               = true
}

resource "google_storage_bucket_iam_member" "instructions_viewer" {
  bucket = google_storage_bucket.instructions.name
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:its-ict-sage-lore-bf3562f7-run@its-ict-sage-csp26.iam.gserviceaccount.com"
}