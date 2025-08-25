resource "aws_s3_bucket" "rohan_bucket" {
  bucket = "rohan-78171"
  
  # Using the recommended settings with no ACLs
  # S3 now uses bucket policies and IAM policies instead of ACLs by default
  
  tags = {
    Name        = "rohan-78171"
    Environment = "Dev"
    Created     = "Terraform"
  }
}

# Explicitly disable ACLs for this bucket
resource "aws_s3_bucket_ownership_controls" "rohan_bucket_ownership" {
  bucket = aws_s3_bucket.rohan_bucket.id
  
  rule {
    object_ownership = "BucketOwnerEnforced"  # This setting disables ACLs
  }
}

# Block public access to the bucket for security
resource "aws_s3_bucket_public_access_block" "rohan_bucket_public_access" {
  bucket = aws_s3_bucket.rohan_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}