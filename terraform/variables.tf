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
  default     = "ebb10ef8fc1830fe4220b10017387591f60792d7"
}



