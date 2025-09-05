resource "aws_s3_bucket" "bucket_create" {
    bucket = var.bucket_name

    lifecycle {
      prevent_destroy = false
    }
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
    bucket = aws_s3_bucket.bucket_create.bucket
    versioning_configuration {
        status = "Enabled"
    }  

    lifecycle {
      prevent_destroy = false
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
    bucket = aws_s3_bucket.bucket_create.bucket
    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = "AES256"
        }
    }

    lifecycle {
      prevent_destroy = false
    }
}