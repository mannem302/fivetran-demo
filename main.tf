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
  mount = "secrets"
  name  = "${var.fivetran_env_type}/fivetran/system_key/cred"
}

# ---------------------------
# 3. Configure Fivetran Provider using fetched secrets
# ---------------------------
provider "fivetran" {
  api_key    = data.vault_kv_secret_v2.fivetran_creds.data["api_key"]
  api_secret = data.vault_kv_secret_v2.fivetran_creds.data["api_secret"]
}

# Fivetran group (Destination name)
resource "fivetran_group" "my_group" {
  name = var.fivetran_group_name
}
 
# Read snowflake private key from vault 
data "vault_kv_secret_v2" "snowflake_private_key" {
  mount = "secrets"
  name  = "${var.fivetran_env_type}/fivetran/destinations/snowflake/dev/general/cred"
}
 
#Creation of fivetran destination (snowflake)
resource "fivetran_destination" "snowflake_destination" {
  group_id         = fivetran_group.my_group.id
  service          = var.service_type
  time_zone_offset = var.snowflake_timezone_offset
  region           = var.snowflake_region 
  config  {
    connection_type = var.connection_type
    host         = var.snowflake_host
    port         = var.snowflake_port
    database     = var.snowflake_database
    user         = var.snowflake_user
    role         = var.snowflake_role
    auth         = var.auth_type
	  private_key  = data.vault_kv_secret_v2.snowflake_private_key.data["private_key"]
    passphrase   = data.vault_kv_secret_v2.snowflake_private_key.data["passphrase"]
  }
}

