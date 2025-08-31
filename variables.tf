variable "fivetran_env_type" {
  description = "Environment/account type to select Vault path and provider alias (e.g., Lab,dev,ppte,syst, prod)"
  type        = string
}
variable "fivetran_group_name" {
  description = "Name of the Fivetran group"
  type        = string
}
 
variable "snowflake_user" {
  description = "Snowflake user used by Fivetran"
  type        = string
}
variable "snowflake_role" {
  description = "Role to assign in Snowflake"
  type        = string
}
variable "snowflake_database" {
  description = "Snowflake database name"
  type        = string
}
 
variable "snowflake_host" {
  description = "Snowflake host details"
  type        = string
}
 
variable "snowflake_region" {
  description = "Snowflake region details"
  type        = string
}
 
variable "snowflake_timezone_offset" {
  description = "Snowflake timezone offset details"
  type        = string
}
 
variable "snowflake_port" {
  description = "Port number for snowflake connection "
  type        = number
  default     = 443
}
 
variable "service_type" {
  description = "Required service type"
  type = string
}
 
variable "connection_type" {
  description = "Required type of connection"
  type = string
}
 
variable "auth_type" {
  description = "Required auth type"
  type = string
}

