# S3 Bucket Terraform Module

This module creates an AWS S3 bucket with secure defaults and configurable options.

## Features

- Creates an S3 bucket with customizable name
- Configurable versioning
- Server-side encryption with AES256
- Public access blocking for enhanced security
- Optional lifecycle rules for cost optimization
- Environment tagging

## Usage

```hcl
module "s3_bucket" {
  source = "./path/to/module"

  bucket_name          = "my-application-bucket"
  environment          = "production"
  enable_versioning    = true
  enable_lifecycle_rules = true
  transition_days      = 60
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| aws_region | AWS region to deploy the bucket | string | "us-east-1" | no |
| bucket_name | Name of the S3 bucket to create | string | "my-terraform-managed-bucket" | no |
| environment | Environment tag value | string | "dev" | no |
| enable_versioning | Whether to enable versioning | bool | true | no |
| enable_lifecycle_rules | Whether to enable lifecycle rules | bool | false | no |
| transition_days | Days before transitioning to STANDARD_IA | number | 30 | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket_id | The name of the bucket |
| bucket_arn | The ARN of the bucket |
| bucket_domain_name | The bucket domain name |
| bucket_regional_domain_name | The bucket region-specific domain name |

## Security Features

- Server-side encryption using AES256
- All public access blocked by default
- Versioning enabled by default for data protection

## Notes

- Remember to set a globally unique bucket name
- For production use, consider enabling additional security features like object lock