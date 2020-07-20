provider "google" {
  project = var.project
  region  = var.region
}


terraform {
  backend "gcs" {
    bucket = "sample-283906-tf-state-prod"
    prefix = "terraform/state"
  }
}

locals {
  enable_services = [
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "sourcerepo.googleapis.com",
    "cloudfunctions.googleapis.com",
  ]
}

resource "google_project_service" "services" {
  for_each = toset(local.enable_services)
  service  = each.value

  disable_dependent_services = true
}

# GitHubのミラーリングリポジトリがterraformで作れなかったため、ブラウザで手動で作ったものをterraform importした。
resource "google_sourcerepo_repository" "video2gif_repo" {
  name = "github_ezio1119_video2gif-sample"
}

resource "google_storage_bucket" "tf_state" {
  name               = "${var.project}-tf-state-prod"
  location           = "us-west1"
  storage_class      = "REGIONAL"
  bucket_policy_only = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      num_newer_versions = 5
    }
  }
}

resource "google_cloudfunctions_function" "video2gif_function" {
  name        = "video2gif-function"
  description = "video2gif Function"
  runtime     = "go113"

  available_memory_mb = 256

  trigger_http = true
  timeout      = 60
  entry_point  = "HelloHTTP"
  source_repository {
    url = "https://source.developers.google.com/projects/${var.project}/repos/github_ezio1119_video2gif-sample/revisions/${var.revisions}"
  }

  ingress_settings = "ALLOW_ALL"

  service_account_email = google_service_account.video2gif_function_account.email

}

