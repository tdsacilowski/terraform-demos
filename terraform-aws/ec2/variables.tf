variable aws_region {
    type = "string"
    default = "us-east-1"
}
variable environment_name {
    default = "demo"
}
variable instance_type {
    default = "t2.micro"
}
variable key_name {}

variable list_example {
    type = "list"
    default = ["foo","bar","bacon"]
}