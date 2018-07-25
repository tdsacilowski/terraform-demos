resource "azurerm_virtual_network" "tf_demo" {
  name                = "${var.environment_name}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.tf_demo.location}"
  resource_group_name = "${azurerm_resource_group.tf_demo.name}"

  tags {
    environment = "${var.environment_name}"
  }
}

resource "azurerm_subnet" "tf_demo" {
  name                 = "${var.environment_name}-subnet"
  resource_group_name  = "${azurerm_resource_group.tf_demo.name}"
  virtual_network_name = "${azurerm_virtual_network.tf_demo.name}"
  address_prefix       = "10.0.1.0/24"
}
