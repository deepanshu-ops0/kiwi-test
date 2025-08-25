module "example_s3_bucket" {
  source = "./5d1a38e8-e15a-450e-903c-562255e51faf/s3_bucket"

  bucket_name       = "example-globally-unique-bucket-name"
  enable_versioning = true
  
  tags = {
    Environment = "production"
    Project     = "openobserve-eks"
    ManagedBy   = "terraform"
  }
}

# Example of how to access the bucket outputs
output "example_bucket_id" {
  value = module.example_s3_bucket.bucket_id
}

output "example_bucket_arn" {
  value = module.example_s3_bucket.bucket_arn
}