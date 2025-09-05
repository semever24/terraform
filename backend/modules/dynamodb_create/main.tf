resource "aws_dynamodb_table" "dynamodb_table_create" {
    name = var.dynamodb_table_name
    billing_mode = var.billing_mode
    hash_key = var.hash_key

    attribute {
        name = "LockID"
        type = "S"
    }

    lifecycle {
      prevent_destroy = false
    }
}