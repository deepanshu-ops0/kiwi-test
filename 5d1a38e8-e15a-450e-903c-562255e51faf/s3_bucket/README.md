# AWS S3 Bucket Module

This module provisions an AWS S3 bucket with security best practices and configurable options.

## Features

- Configurable bucket name
- Optional versioning
- Server-side encryption with AES256
- Public access blocking for security
- Optional lifecycle rules for cost optimization
- Proper resource tagging

## Usage

```hcl
module "s3_bucket" {
  source = "./5d1a38e8-e15a-450e-903c-562255e51faf/s3_bucket"

  bucket_name           = "my-unique-bucket-name"
  environment           = "prod"
  enable_versioning     = true
  enable_lifecycle_rules = true
  transition_days       = 60
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket_name | Name of the S3 bucket | `string` | n/a | yes |
| environment | Environment (e.g. dev, staging, prod) | `string` | `"dev"` | no |
| enable_versioning | Enable versioning for the S3 bucket | `bool` | `true` | no |
| enable_lifecycle_rules | Enable lifecycle rules for the S3 bucket | `bool` | `false` | no |
| transition_days | Number of days before transitioning objects to Standard-IA storage | `number` | `30` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket_id | The name of the bucket |
| bucket_arn | The ARN of the bucket |
| bucket_domain_name | The bucket domain name |
| bucket_regional_domain_name | The bucket regional domain name |

## Security Features

This module implements the following security best practices:

1. **Server-Side Encryption**: All objects are encrypted using AES256 by default.
2. **Public Access Blocking**: All public access is blocked at the bucket level.
3. **Versioning**: Optional versioning to protect against accidental deletion or overwrites.

## Cost Optimization

When enabled, lifecycle rules will transition objects to Standard-IA storage class after the specified number of days, reducing storage costs for infrequently accessed objects.