resource "aws_instance" "TF" {
  ami = var.aws_ami
  instance_type = var.aws_instance_type
  key_name = var.aws_key_pair
  tags = {
      Name = "Terraform"
    }
}

resource "aws_instance" "TF1" {
  ami = var.aws_ami
  instance_type = var.aws_instance_type
  key_name = var.aws_key_pair
  tags = {
    Name = "Terraform1"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "my-tf-test-bucket-1209"
  depends_on = [ aws_instance.TF ]
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
    bucket = aws_s3_bucket.s3_bucket.bucket
    versioning_configuration {
      status = "Enabled"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "sse_bucket" {
  bucket = aws_s3_bucket.s3_bucket.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}