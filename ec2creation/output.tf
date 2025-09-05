output "aws_instance_id" {
  value = aws_instance.TF.id
}

output "aws_public_ip" {
  value = aws_instance.TF.public_ip  
}

output "aws_private_ip" {
  value = aws_instance.TF.private_ip
}

output "aws_security_groups" {
    value = aws_instance.TF.security_groups  
}