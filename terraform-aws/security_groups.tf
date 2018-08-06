resource "aws_security_group" "sg_demo" {
  name        = "${var.environment_name}-sg"
  description = "Terraform Demo SG"
  vpc_id      = "${module.vpc_demo.vpc_id}"

  tags {
    Name = "${var.environment_name}"
  }
}

resource "aws_security_group_rule" "sg_rule_allow_all_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.sg_demo.id}"
}

# resource "aws_security_group_rule" "sg_rule_allow_all_ingress" {
#   type              = "ingress"
#   from_port         = 0
#   to_port           = 65535
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = "${aws_security_group.tf_demo.id}"
# }

resource "aws_security_group_rule" "sg_rule_allow_ssh_ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.sg_demo.id}"
}

resource "aws_security_group_rule" "sg_rule_allow_http_ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.sg_demo.id}"
}
