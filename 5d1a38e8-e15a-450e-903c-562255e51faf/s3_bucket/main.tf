resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  
  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

resource "aws_s3_bucket_versioning" "this" {
  count = var.enable_versioning ? 1 : 0
  
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_lifecycle_configuration" "this" {
  count = var.enable_lifecycle_rules ? 1 : 0
  
  bucket = aws_s3_bucket.this.id

  rule {
    id     = "transition-to-standard-ia"
    status = "Enabled"

    transition {
      days          = var.transition_days
      storage_class = "STANDARD_IA"
    }
  }
}