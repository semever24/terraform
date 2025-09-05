module "ec2_creation" {
  source = "./modules/ec2_creation"
  aws_ami = var.ami
  aws_instance_type = var.instance_type
  aws_key_name = var.key_name
}

module "file_location" {
  source = "./modules/file"
  user_name = var.user_name
  host_public_ip = module.ec2_creation.output_public_ip
  file_path = var.file_path
  source_path = var.source_path
  destination_path = var.destination_path
}

module "run_remote_exec" {
    source = "./modules/remote-exec"
    user_name = var.user_name
    host_public_ip = module.ec2_creation.output_public_ip
    file_path = var.file_path
    command = ["chmod +x /home/ubuntu/install.sh",
                "sudo bash /home/ubuntu/install.sh" ]
    depends_on = [ module.file_location ]
}

module "run_local_exec" {
  source = "./modules/local-exec"
  public_ip = module.ec2_creation.output_public_ip
}