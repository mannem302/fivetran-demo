terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "3.18.0"
    }
    fivetran = {
      source  = "fivetran/fivetran"
      version = "1.0.0"
    }
  }
}

# ---------------------------
# 1. Configure Vault Provider
# ---------------------------
provider "vault" {
#address = "https://vault-cluster-public-vault-a8cc621b.a0a1c1b6.z1.hashicorp.cloud:8200"
}

# ---------------------------
# 2. Fetch Fivetran API credentials
# ---------------------------
data "vault_kv_secret_v2" "fivetran_creds" {
  mount = "secret"
  name  = "nonprod/fivetran/destinations/snowflake/int/general/Cred"
}

# ---------------------------
# 3. Configure Fivetran Provider using fetched secrets
# ---------------------------
provider "fivetran" {
  api_key    = data.vault_kv_secret_v2.fivetran_creds.data["api_key"]
  api_secret = data.vault_kv_secret_v2.fivetran_creds.data["api_secret"]
}

# ---------------------------
# 4. Create a Test Group in Fivetran
# ---------------------------
resource "fivetran_group" "vault_test_group" {
  name = "vaultgroup"
}
