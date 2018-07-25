output "public-ip-address" {
  value = ["${aws_instance.tf_demo.*.public_ip}"]
}
