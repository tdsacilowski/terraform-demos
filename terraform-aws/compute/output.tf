output "ip-addresses" {
  value = ["${aws_instance.demo.*.public_ip}"]
}