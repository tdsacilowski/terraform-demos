output "public-ip-address" {
  value = ["${aws_instance.demo.*.public_ip}"]
}