locals {
  subnet_cidrs = [for index in range(var.num_subnets) : cidrsubnet(var.vnet_cidr, var.subnet_bits, index)]
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.vnet_location
  resource_group_name = var.resource_group
  address_space       = [var.vnet_cidr]
}

resource "azurerm_subnet" "subnet" {
  count                = var.num_subnets
  name                 = "${var.subnet_prefix}${count.index}"
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [local.subnet_cidrs[count.index]]
}
