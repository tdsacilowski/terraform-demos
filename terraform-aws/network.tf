resource "aws_vpc" "tf_demo" {
  cidr_block = "10.0.0.0/16"

  tags {
    Name = "${var.environment_name}-vpc"
  }
}

resource "aws_subnet" "tf_demo" {
  vpc_id                  = "${aws_vpc.tf_demo.id}"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags {
    Name = "${var.environment_name}-subnet"
  }
}

resource "aws_internet_gateway" "tf_demo" {
  vpc_id = "${aws_vpc.tf_demo.id}"

  tags {
    Name = "${var.environment_name}-subnet"
  }
}

resource "aws_route_table" "tf_demo" {
  vpc_id = "${aws_vpc.tf_demo.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.tf_demo.id}"
  }

  tags {
    Name = "${var.environment_name}-subnet"
  }
}

resource "aws_route_table_association" "tf_demo" {
  subnet_id      = "${aws_subnet.tf_demo.id}"
  route_table_id = "${aws_route_table.tf_demo.id}"
}
