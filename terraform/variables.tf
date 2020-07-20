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
  default     = "1283b29c07dd16a1cd37e34933fe5837777c1ec5"
}



