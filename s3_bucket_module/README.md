# S3 Bucket Module

This module provisions an AWS S3 bucket with enhanced configuration options.

## Features

- Basic S3 bucket creation
- Versioning configuration
- Server-side encryption (AES256)
- Public access blocking
- Configurable lifecycle rules for storage class transitions and object expiration
- Resource tagging

## Usage

```hcl
module "s3_bucket" {
  source = "./s3_bucket_module"

  bucket_name = "my-unique-bucket-name"
  
  # Optional configurations
  aws_region        = "us-west-2"
  enable_versioning = true
  
  tags = {
    Environment = "Production"
    Project     = "Data Lake"
  }
  
  # Lifecycle configurations
  enable_lifecycle_rules    = true
  standard_ia_transition_days = 30
  glacier_transition_days   = 90
  expiration_days           = 365
}
```

## Input Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| aws_region | The AWS region to deploy the S3 bucket | string | "us-east-1" | no |
| bucket_name | The name of the S3 bucket | string | n/a | yes |
| tags | A map of tags to assign to the bucket | map(string) | {} | no |
| enable_versioning | Enable versioning for the S3 bucket | bool | true | no |
| enable_lifecycle_rules | Enable lifecycle rules for the S3 bucket | bool | false | no |
| standard_ia_transition_days | Number of days before transitioning objects to STANDARD_IA storage | number | 30 | no |
| glacier_transition_days | Number of days before transitioning objects to GLACIER storage (0 to disable) | number | 60 | no |
| expiration_days | Number of days before expiring objects (0 to disable) | number | 0 | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket_id | The name of the bucket |
| bucket_arn | The ARN of the bucket |
| bucket_domain_name | The bucket domain name |
| bucket_regional_domain_name | The bucket region-specific domain name |

## Requirements

- AWS provider >= 4.0
- Terraform >= 1.0

## Notes

- Ensure your AWS credentials are properly configured
- The bucket name must be globally unique across all AWS accounts
- Public access is blocked by default for security
- Server-side encryption is enabled by default