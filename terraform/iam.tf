# プロジェクトレベルのロール
locals {
  video2gif_function_roles = [
    "roles/cloudfunctions.serviceAgent",
  ]
}

resource "google_service_account" "video2gif_function_account" {
  account_id   = "video2gif-function-account"
  display_name = "[Terraform] video2gif Function Account"
}

resource "google_project_iam_member" "video2gif_iam" {
  for_each = toset(local.video2gif_function_roles)
  role     = each.value
  member   = "serviceAccount:${google_service_account.video2gif_function_account.email}"
}

# Cloud ソースリポジトリにアクセスするために必要
resource "google_sourcerepo_repository_iam_member" "video2gif_iam" {
  project    = google_sourcerepo_repository.video2gif_repo.project
  repository = google_sourcerepo_repository.video2gif_repo.name
  role       = "roles/source.reader"
  member     = "serviceAccount:${google_service_account.video2gif_function_account.email}"
}

# cloud functionsにアクセスするために必要
resource "google_cloudfunctions_function_iam_member" "video2gif_invoker" {
  project        = google_cloudfunctions_function.video2gif_function.project
  region         = google_cloudfunctions_function.video2gif_function.region
  cloud_function = google_cloudfunctions_function.video2gif_function.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}