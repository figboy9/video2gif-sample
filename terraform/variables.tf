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
  default     = "af3ba1153fc70bb8f6d9f76dde0fb067a05c1202"
}
