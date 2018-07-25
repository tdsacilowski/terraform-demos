resource "aws_s3_bucket" "mybucket" {
  bucket = "${var.environment_name}-bucket"

  # server_side_encryption_configuration {
  #   rule {
  #     apply_server_side_encryption_by_default {
  #       sse_algorithm = "AES256"
  #     }
  #   }
  # }
}
