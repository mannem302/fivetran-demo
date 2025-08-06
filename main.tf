terraform {
  required_providers {
    fivetran = {
      source  = "fivetran/fivetran"
      version = ">= 1.0.0"
    }
  }
}

provider "fivetran" {
  api_key    = var.api_key
  api_secret = var.api_secret
}

variable "api_key" {}
variable "api_secret" {}
