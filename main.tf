# ---------------------------
# Create Fivetran Group
# ---------------------------
resource "fivetran_group" "my_group" {
  name = var.fivetran_group_name
}

# Optional output
output "fivetran_group_id" {
  value       = fivetran_group.my_group.id
  description = "ID of the Fivetran group"
}
