resource "aws_security_group" "tf_demo" {
  name        = "${var.environment_name}-sg"
  description = "Terraform Demo SG"
  vpc_id      = "${aws_vpc.tf_demo.id}"

  tags {
    Name = "${var.environment_name}-instnace-${count.index}"
  }
}

resource "aws_security_group_rule" "allow_all_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.tf_demo.id}"
}

resource "aws_security_group_rule" "allow_all_ingress" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.tf_demo.id}"
}

# resource "aws_security_group_rule" "allow_ssh_ingress" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = "${aws_security_group.tf_demo.id}"
# }


# resource "aws_security_group_rule" "allow_http_ingress" {
#   type              = "ingress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = "${aws_security_group.tf_demo.id}"
# }

