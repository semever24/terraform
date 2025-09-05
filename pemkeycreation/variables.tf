variable "aws_ami" {
  type = string
  description = "Enter the ami id"
}

variable "aws_instance_type" {
    type = string
    description = "Enter the aws instance type"  
}

variable "aws_instance_count" {
  type = number
  description = "Enter the instance count to create"
}

variable "key_name" {
    type = string
    description = "Enter the key name"  
}

variable "pem_file_path" {
    type = string
}