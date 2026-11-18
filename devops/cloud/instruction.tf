resource "google_storage_bucket" "instructions" {
  name                        = "${var.resource_prefix}-instructions"
  location                    = var.region
  uniform_bucket_level_access = true
  force_destroy               = true
}

resource "google_storage_bucket_iam_member" "instructions_viewer" {
  bucket = google_storage_bucket.instructions.name
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.backend.email}" # Usa il riferimento al SA del tuo repo, oppure l'email esatta visibile su Cloud Run -> Sicurezza
}
}