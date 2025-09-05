terraform {
    backend "s3" {
        bucket = "my-tf-test-bucket-240354"
        key = "s3/terraform.tfstate"  #s3 state file        
        region = "ap-south-1"
        # key = "dynamodb/terraform.tfstate"  #dynamodb state file
        dynamodb_table = "my-tf-test-dynamodb-2025" #dynamodb table lock file
        encrypt = true
        use_lockfile = true  #s3 lock file
    }
}