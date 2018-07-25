resource "azurerm_virtual_machine" "tf_demo" {
  name                  = "${var.environment_name}-vm"
  location              = "${azurerm_resource_group.tf_demo.location}"
  resource_group_name   = "${azurerm_resource_group.tf_demo.name}"
  network_interface_ids = ["${azurerm_network_interface.tf_demo.id}"]
  vm_size               = "${var.instance_type}"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  # Optional data disks
  storage_data_disk {
    name              = "datadisk_new"
    managed_disk_type = "Standard_LRS"
    create_option     = "Empty"
    lun               = 0
    disk_size_gb      = "1023"
  }

  #   storage_data_disk {
  #     name            = "${azurerm_managed_disk.test.name}"
  #     managed_disk_id = "${azurerm_managed_disk.test.id}"
  #     create_option   = "Attach"
  #     lun             = 1
  #     disk_size_gb    = "${azurerm_managed_disk.test.disk_size_gb}"
  #   }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags {
    environment = "${var.environment_name}"
  }
}

resource "azurerm_network_interface" "tf_demo" {
  name                      = "${var.environment_name}-nic"
  location                  = "${azurerm_resource_group.tf_demo.location}"
  resource_group_name       = "${azurerm_resource_group.tf_demo.name}"
  network_security_group_id = "${azurerm_network_security_group.tf_demo.id}"

  ip_configuration {
    name                          = "${var.environment_name}-ipconfig"
    subnet_id                     = "${azurerm_subnet.tf_demo.id}"
    public_ip_address_id          = "${azurerm_public_ip.tf_demo.id}"
    private_ip_address_allocation = "dynamic"
  }
}

resource "azurerm_public_ip" "tf_demo" {
  name                         = "${var.environment_name}-public-ip"
  location                     = "${azurerm_resource_group.tf_demo.location}"
  resource_group_name          = "${azurerm_resource_group.tf_demo.name}"
  public_ip_address_allocation = "static"
}
