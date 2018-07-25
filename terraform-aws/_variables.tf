variable aws_region {
  type    = "string"
  default = "us-east-1"
}

variable environment_name {
  default = "tf-demo"
}

variable instance_count {
  default = 1
}

variable instance_type {
  default = "t2.micro"
}

variable aws_key_name {}
variable aws_key_pem {}
