provider "aws" {
  region = "us-east-1"  # You can change this to your preferred region
}

resource "aws_s3_bucket" "rohan_bucket" {
  bucket = "rohan-78171"

  tags = {
    Name        = "rohan-78171"
    Environment = "Dev"
    Managed_by  = "Terraform"
  }
}

# Set ownership controls to disable ACLs
resource "aws_s3_bucket_ownership_controls" "rohan_bucket_ownership" {
  bucket = aws_s3_bucket.rohan_bucket.id

  rule {
    object_ownership = "BucketOwnerEnforced"  # This setting disables ACLs
  }
}

# Block all public access to the bucket for enhanced security
resource "aws_s3_bucket_public_access_block" "rohan_bucket_public_access" {
  bucket = aws_s3_bucket.rohan_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}