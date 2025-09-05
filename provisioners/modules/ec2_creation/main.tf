resource "aws_instance" "terraform_instance" {
    ami = var.aws_ami
    instance_type = var.aws_instance_type
    key_name = var.aws_key_name
    tags = {
        Name = "Terraform"
    }  
}