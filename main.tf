provider "fivetran" {
  api_key    = var.api_key
  api_secret = var.api_secret
}


# Create a Fivetran group
resource "fivetran_group" "my_group" {
  name = "my_fivetran_group"
}
