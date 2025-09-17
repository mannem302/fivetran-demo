terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "5.2.1"
    }
    fivetran = {
      source  = "fivetran/fivetran"
      version = "1.9.5"
    }
  }
}

# ---------------------------
# 1. Configure Vault Provider
# ---------------------------
provider "vault" {
  # Auth-related info is passed from Terraform Cloud variables
}

# ---------------------------
# 2. Fetch Fivetran API credentials from Vault
# ---------------------------
data "vault_kv_secret_v2" "fivetran_creds" {
  mount = "secrets"
  name  = "${var.fivetran_env_type}/fivetran/system_key/cred"
}

# ---------------------------
# 3. Configure Fivetran Provider
# ---------------------------
provider "fivetran" {
  api_key    = data.vault_kv_secret_v2.fivetran_creds.data["api_key"]
  api_secret = data.vault_kv_secret_v2.fivetran_creds.data["api_secret"]
}
