output "ip-addresses" {
  value = <<EOF


Demo (public): ${aws_instance.demo.public_ip}
Demo (private): ${aws_instance.demo.private_ip}
EOF
}