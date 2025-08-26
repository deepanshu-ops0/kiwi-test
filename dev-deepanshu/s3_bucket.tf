provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "deepanshu_bucket" {
  bucket = "${var.bucket_base_name}-${formatdate("YYYYMMDD", timestamp())}"  # Unique bucket name with date suffix

  tags = {
    Name        = var.bucket_base_name
    Environment = var.environment
    Managed_by  = "Terraform"
    Creator     = "DeepanshuAI"
  }

  # Lifecycle rules can be added here if needed
  # lifecycle_rule {
  #   id      = "archive-after-90-days"
  #   enabled = true
  #   
  #   transition {
  #     days          = 90
  #     storage_class = "GLACIER"
  #   }
  # }
}

# Set ownership controls to disable ACLs (recommended security practice)
resource "aws_s3_bucket_ownership_controls" "deepanshu_bucket_ownership" {
  bucket = aws_s3_bucket.deepanshu_bucket.id

  rule {
    object_ownership = "BucketOwnerEnforced"  # This setting disables ACLs
  }
}

# Block all public access to the bucket for enhanced security
resource "aws_s3_bucket_public_access_block" "deepanshu_bucket_public_access" {
  bucket = aws_s3_bucket.deepanshu_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Enable server-side encryption by default if enabled
resource "aws_s3_bucket_server_side_encryption_configuration" "deepanshu_bucket_encryption" {
  count = var.enable_encryption ? 1 : 0
  
  bucket = aws_s3_bucket.deepanshu_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Enable versioning for data protection if enabled
resource "aws_s3_bucket_versioning" "deepanshu_bucket_versioning" {
  count = var.enable_versioning ? 1 : 0
  
  bucket = aws_s3_bucket.deepanshu_bucket.id
  
  versioning_configuration {
    status = "Enabled"
  }
}