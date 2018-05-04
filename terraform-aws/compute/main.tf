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

data "aws_security_group" "demo" {
  filter {
    name   = "tag:Name"
    values = ["${var.security_group_name}"]
  }
}

resource "aws_instance" "demo" {
  ami                         = "${data.aws_ami.ubuntu.id}"
  instance_type               = "${var.instance_type}"
  subnet_id                   = "${var.subnet_id}"
  key_name                    = "${var.key_name}"
  vpc_security_group_ids      = ["${data.aws_security_group.demo.id}"]
  associate_public_ip_address = true

  tags {
    Name     = "${var.environment_name}-instnace"
  }

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file(var.ec2_pem)}"
    }

    source      = "../../ansible"
    destination = "/home/ubuntu"
  }

  user_data = "${file("../../scripts/init.sh")}"
}