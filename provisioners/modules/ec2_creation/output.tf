output "output_public_ip" {
  value = aws_instance.terraform_instance.public_ip
}