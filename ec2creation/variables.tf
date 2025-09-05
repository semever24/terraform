/*
locals {
  aws_ami = "ami-00bb6a80f01f03502"
  aws_instance_type = "t2.micro"
  aws_key_pair = "my-demo-key"
}
*/

variable "aws_ami" {
  type = string
  default = "ami-00bb6a80f01f03502"
  description = "Enter the ami ID:"
}

variable "aws_instance_type" {
    type = string
    default = "t2.micro"
    description = "Enter the EC2 type:"
}

variable "aws_key_pair" {
  type = string
  default = "my-demo-key"
  description = "Enter the key-pair value"
}