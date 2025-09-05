module "s3_create" {
  source = "./modules/s3_create"
  bucket_name = var.bucket_name
}

module "dynamodb_create" {
  source = "./modules/dynamodb_create"
  dynamodb_table_name = var.dynamodb_table_name  
  billing_mode = var.billing_mode
  hash_key = var.hash_key
}