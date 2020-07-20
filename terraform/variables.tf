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
  default     = "62bb790588154f7ebe217c2d15cdb0de1b71bc50"
}
