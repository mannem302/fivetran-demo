variable "fivetran_env_type" {
  description = "Environment/account type to select Vault path and provider alias (e.g., Lab,dev,ppte,syst,prod)"
  type        = string
}

variable "fivetran_group_name" {
  description = "Name of the Fivetran group"
  type        = string
}

variable "snowflake_vault_path" {
  description = "Name of the Fivetran group"
  type        = string
}

variable "snowflake_config" {
  description = "Snowflake destination configuration"
  type = object({
    user             = string
    role             = string
    database         = string
    host             = string
    region           = string
    timezone_offset  = string
    port             = number
    connection_type  = string
    auth_type        = string
    key_encryption   = bool
  })
}

