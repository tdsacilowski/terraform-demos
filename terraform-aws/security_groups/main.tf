provider "aws" {
  region = "${var.aws_region}"
}


//----------------------------------
// Inline
resource "aws_security_group" "test-sg-inline" {
  name        = "teddy_allow_all"
  description = "Allow all inbound traffic"
  #vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.list_example}"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.list_example}"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks = ["${var.list_example}"]
  }
}

//----------------------------------
// Separate Rules

resource "aws_security_group" "test-sg-separate" {
  name        = "teddy_allow_all_2"
  description = "Allow all inbound traffic"
  #vpc_id      = "${aws_vpc.main.id}"

}
resource "aws_security_group_rule" "allow_all" {
  type            = "ingress"
  from_port       = 0
  to_port         = 65535
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.test-sg-separate.id}"
}

resource "aws_security_group_rule" "allow_ssh" {
  type            = "ingress"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.test-sg-separate.id}"
}
