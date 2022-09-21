variable "resource_group" {
  type        = string
  default     = ""
  description = "Name of the resource group to deploy network resources to."
}

variable "vnet_name" {
  type        = string
  default     = "vnet"
  description = "Name of the Azure virtual network."

  validation {
    condition     = can(regex("^[0-9a-zA-Z][0-9a-zA-Z_.-]*[0-9a-zA-Z_]$", var.vnet_name))
    error_message = "The vnet_name must begin with a letter or number, end with a letter, number or underscore, and may contain only letters, numbers, underscores, periods, or hyphens."
  }
}

variable "vnet_location" {
  type        = string
  default     = "East US"
  description = "Location of the Azure virtual network."
}

variable "vnet_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Network address space for the Azure virtual network."
}

variable "subnet_prefix" {
  type        = string
  default     = "subnet"
  description = "Prefix for Azure subnet names."
}

variable "num_subnets" {
  type        = number
  default     = 1
  description = "Number of Azure subnets."
}

variable "subnet_bits" {
  type        = number
  default     = 8
  description = "Number of bits associated to the hosts in each subnet."


  validation {
    condition     = var.subnet_bits < 9 && var.subnet_bits > 1
    error_message = "Number of bits must be greater than 1 and less than 9."
  }
}
