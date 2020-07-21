variable "project" {
  description = "プロジェクトID"
  type        = string
  default     = "sample-283906"
}

variable "region" {
  description = "リージョン"
  type        = string
  default     = "asia-northeast1"
}


variable "revisions" {
  description = "Githubのコミットハッシュ値。そのコードがデプロイされる。"
  type        = string
  default     = "8e712c5a8a6fd3d311458dea1c5965d09c45be23"
}
