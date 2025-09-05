output "private_ip" {
  value = data.aws_instance.ec2_instance_status.private_ip
}

output "instance_state" {
    value = data.aws_instance.ec2_instance_status.instance_state  
}

output "instance_type" {
    value = data.aws_instance.ec2_instance_status.instance_type
}

output "ami_id" {
    value = data.aws_ami.ami_id.image_location
}