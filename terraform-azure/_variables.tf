variable azure_region {
  type    = "string"
  default = "East US"
}

variable environment_name {
  default = "tf-demo"
}

variable "azure_resource_group_name" {}

variable instance_count {
  default = 1
}

variable instance_type {
  default = "Standard_DS1_v2"
}

# variable aws_key_name {}
# variable aws_key_pem {}

