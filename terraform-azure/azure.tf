provider "azurerm" {
  // Credentials set via env vars
}

resource "azurerm_resource_group" "tf_demo" {
  name     = "${var.azure_resource_group_name}"
  location = "${var.azure_region}"

  tags {
    environment = "${var.environment_name}"
  }
}
