fivetran_env_type   = "ppte"
fivetran_group_name = "DAP_PREPROD_SF_1"

snowflake_vault_path = "dev/general"

snowflake_config = {
  user            = "fivetran_user"
  role            = "FIVETRAN_ROLE"
  database        = "FIVETRAN_DATABASE"
  host            = "YMVBTXC-MC09868.snowflakecomputing.com"
  port            = 443
  region          = "AWS_AP_SOUTHEAST_2"
  timezone_offset = "+12"
  connection_type = "Directly"
  auth_type       = "KEY_PAIR"
  key_encryption  = true
}

