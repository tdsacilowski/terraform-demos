provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket-05042018"
  acl    = "private"

  tags {
    Name        = "My bucket"
    Environment = "Dev"
  }

  versioning {
    enabled = true
  }
}