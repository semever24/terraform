module "pem_key_creation" {
    source = "./modules/pem_key_creation"
    key_name = var.key_name
    pem_file_path = var.pem_file_path
}

module "ec2_creation" {
    source = "./modules/ec2_creation"
    aws_ami = var.aws_ami
    aws_instance_type = var.aws_instance_type
    aws_instance_count = var.aws_instance_count
    aws_key_name = module.pem_key_creation.key_name 
}

module "s3_bucket_creation" {
    source = "./modules/s3_bucket_creation"
    bucket_name = var.bucket_name
}