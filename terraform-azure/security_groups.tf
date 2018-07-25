resource "azurerm_network_security_group" "tf_demo" {
  name                = "${var.environment_name}-nsg"
  location            = "${azurerm_resource_group.tf_demo.location}"
  resource_group_name = "${azurerm_resource_group.tf_demo.name}"

  tags {
    environment = "${var.environment_name}"
  }
}

resource "azurerm_network_security_rule" "allow_all_egress" {
  name                        = "${var.environment_name}-allow-all-egress"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${azurerm_resource_group.tf_demo.name}"
  network_security_group_name = "${azurerm_network_security_group.tf_demo.name}"
}

resource "azurerm_network_security_rule" "allow_all_ingress" {
  name                        = "${var.environment_name}-allow-all-ingress"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${azurerm_resource_group.tf_demo.name}"
  network_security_group_name = "${azurerm_network_security_group.tf_demo.name}"
}

# resource "azurerm_network_security_rule" "allow_ssh_ingress" {
#   name                        = "${var.environment_name}-allow-ssh-ingress"
#   priority                    = 300
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "22"
#   destination_port_range      = "22"
#   source_address_prefix       = "*"
#   destination_address_prefix  = "*"
#   resource_group_name         = "${azurerm_resource_group.tf_demo.name}"
#   network_security_group_name = "${azurerm_network_security_group.tf_demo.name}"
# }


# resource "azurerm_network_security_rule" "allow_http_ingress" {
#   name                        = "${var.environment_name}-allow-http-ingress"
#   priority                    = 400
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "80"
#   destination_port_range      = "80"
#   source_address_prefix       = "*"
#   destination_address_prefix  = "*"
#   resource_group_name         = "${azurerm_resource_group.tf_demo.name}"
#   network_security_group_name = "${azurerm_network_security_group.tf_demo.name}"
# }

