output "public-ip-address" {
  value = ["${azurerm_public_ip.tf_demo.ip_address}"]
}
