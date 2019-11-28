output "resource_group_id" {
  value       = azurerm_resource_group.this.id
  description = "The resource group ID. A container that holds related resources for an Azure solution. The resource group includes those resources that you want to manage as a group. You decide which resources belong in a resource group based on what makes the most sense for your organization."
}
