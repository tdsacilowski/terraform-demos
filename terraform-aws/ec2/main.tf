provider "aws" {
  region = "${var.aws_region}"
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

resource "aws_instance" "demo" {
  count = "${length(var.list_example)}"
  ami                         = "${data.aws_ami.ubuntu.id}"
  instance_type               = "${var.instance_type}"
  #subnet_id                   = "${var.subnet_id}"
  key_name                    = "${var.key_name}"
  #vpc_security_group_ids      = ["${data.aws_security_group.demo.id}"]
  associate_public_ip_address = true

  tags {
    Name     = "${var.environment_name}-instnace-${element(var.list_example, count.index)}"
  }
}
