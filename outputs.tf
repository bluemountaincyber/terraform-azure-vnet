output "subnet_cidrs" {
  value       = local.subnet_cidrs
  description = "Subnet CIDR ranges"
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
  description = "Name of the Azure vnet"
}
