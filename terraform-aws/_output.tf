output "public-ip-address" {
  value = ["${aws_instance.instance_demo.*.public_ip}"]
}
