variable "dynamodb_table_name" {
  type = string
  description = "Name of the DynamoDB table"
}

variable "billing_mode" {
  type = string
  description = "Billing mode for the DynamoDB table"  
}

variable "hash_key" {
  type = string
  description = "Hash key for the DynamoDB table"  
}