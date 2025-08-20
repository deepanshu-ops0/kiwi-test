module "s3_bucket" {
  source = "../../s3_bucket_module"

  bucket_name = "example-bucket-name-123456" # Replace with your unique bucket name
  
  aws_region        = "us-east-1"
  enable_versioning = true
  
  tags = {
    Environment = "Development"
    Project     = "Example"
    Managed_by  = "Terraform"
  }
  
  # Lifecycle configurations
  enable_lifecycle_rules      = true
  standard_ia_transition_days = 30
  glacier_transition_days     = 90
  expiration_days             = 365
}

output "bucket_info" {
  value = {
    bucket_id                  = module.s3_bucket.bucket_id
    bucket_arn                 = module.s3_bucket.bucket_arn
    bucket_domain_name         = module.s3_bucket.bucket_domain_name
    bucket_regional_domain_name = module.s3_bucket.bucket_regional_domain_name
  }
}