
# ---------------------------
# Read Snowflake private key from Vault
# ---------------------------
data "vault_kv_secret_v2" "snowflake_private_key" {
  mount = "secrets"
  name  = "${var.fivetran_env_type}/fivetran/destinations/snowflake/${var.snowflake_vault_path}/cred"
}

# ---------------------------
# Create Fivetran Destination (Snowflake)
# ---------------------------
resource "fivetran_destination" "snowflake_destination" {
  group_id         = fivetran_group.my_group.id
  service          = "snowflake"
  time_zone_offset = var.snowflake_config.timezone_offset
  region           = var.snowflake_config.region 

  config {
    connection_type          = var.snowflake_config.connection_type
    host                     = var.snowflake_config.host
    port                     = var.snowflake_config.port
    database                 = var.snowflake_config.database
    user                     = var.snowflake_config.user
    role                     = var.snowflake_config.role
    auth                     = var.snowflake_config.auth_type
    private_key              = data.vault_kv_secret_v2.snowflake_private_key.data["private_key"]
    is_private_key_encrypted = var.snowflake_config.key_encryption
    passphrase               = data.vault_kv_secret_v2.snowflake_private_key.data["passphrase"]
  }
}

