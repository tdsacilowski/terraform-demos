//--------------------------------------------------------------------
// Providers

provider "aws" {
  // Credentials set via env vars

  region = "${var.aws_region}"
}

//--------------------------------------------------------------------
// Data Sources

data "aws_route_table" "selected" {
  subnet_id = "vpc-972d08ec"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
