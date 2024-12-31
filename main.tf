resource "google_project" "project" {
  project_id = var.project_id

  billing_account = var.billing_account_id

  auto_create_network = true
} 
