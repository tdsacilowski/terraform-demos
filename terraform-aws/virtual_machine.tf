resource "aws_instance" "instance_demo" {
  count                       = "${var.instance_count}"
  ami                         = "${data.aws_ami.ubuntu.id}"
  instance_type               = "${var.instance_type}"
  subnet_id                   = "${module.vpc_demo.public_subnets[0]}"
  key_name                    = "${var.aws_key_name}"
  vpc_security_group_ids      = ["${aws_security_group.sg_demo.id}"]
  associate_public_ip_address = true

  tags {
    Name = "${var.environment_name}"
    Owner = "teddy@hashicorp.com"
  }

  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${var.aws_key_pem}"
    }

    source      = "../ansible"
    destination = "/home/ubuntu"
  }

  user_data = "${file("scripts/init.sh")}"
}
