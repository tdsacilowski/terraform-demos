resource "aws_s3_bucket" "demo_s3_bucket" {
  bucket = "${var.environment_name}-bucket"
  #acl    = "public-read"

  # acl    = "private"
  # server_side_encryption_configuration {
  #   rule {
  #     apply_server_side_encryption_by_default {
  #       sse_algorithm = "AES256"
  #     }
  #   }
  # }
}
